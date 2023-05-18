DEBUG <- FALSE # nolint: object_name_linter.
if (DEBUG == TRUE) { # nolint: object_name_linter.
  library(vscDebugger) # nolint: object_name_linter.
  .vsc.listen()
}

# There seems to be an issue with reflective measurement
# indicators. Therefore, we use composites.
COMPOSITE_FALLBACK <- TRUE # nolint: object_name_linter.

library(conflicted)
library(parallel)
library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(reader)
library(seminr)
library(httpgd)
library(semTools)
library(easystats)
library(correlation)
library(report)
options(es.use_symbols = TRUE)
set.seed(42)

# settings for plotting
thm <- seminr_theme_get()
thm$sm.edge.boot.show_t_value <- TRUE
thm$mm.edge.boot.show_p_stars <- TRUE
seminr_theme_set(thm)

source("data.R")
data <- prepare_data()

source("calculate.R")

compute_model <- function(model) {
  if (!dir.exists(paste("output", model, sep = "/"))) {
    dir.create(paste("output", model, sep = "/"))
  }

  pls <- calculate_pls(model, data)
  print(pls)

  sink(paste("output", model, "pls.txt", sep = "/"))
  cat("outer loadings\n")
  pls$estimation$outer_loadings
  cat("\n\nouter weights\n")
  pls$estimation$outer_weights
  cat("\n\npath coef\n")
  pls$estimation$path_coef
  sink()

  # generate summary
  sink(paste("output", model, "pls.summary.txt", sep = "/"))
  pls$estimation_summary
  sink()

  # Plot PLS model
  plot(pls$measurement_model)
  save_plot(paste("output", model, "mm.pdf", sep = "/"))
  plot(pls$structural_model)
  save_plot(paste("output", model, "sm.pdf", sep = "/"))
  plot(pls$estimation)
  save_plot(paste("output", model, "estimated.pdf", sep = "/")) 

  # Plot bootstrapped PLS model
  plot(pls$boostrapped, title = "Bootstrapped Model")
  save_plot(paste("output", model, "bootstrapped.pdf", sep = "/"))

  # gather paths and t-values
  paths <- pls$bootstrap_summary$bootstrapped_paths[, "Original Est."]
  tvalues <- pls$bootstrap_summary$bootstrapped_paths[, "T Stat."]

  # degrees of freedom will be the number of rows in the data sample
  df <- nrow(data)
  # calculate pvalues from tvalues and df; round to 3 decimal places
  pvalues <- round(pt(tvalues, df, lower.tail = FALSE), 3)

  # make a table of paths, tvalues, pvalues
  sink(paste("output", model, "pls.boot.sign.txt", sep = "/"))
  data.frame(paths, tvalues, pvalues)
  sink()

  # get a final summary of the bootstrapping
  sink(paste("output", model, "pls.boot.summary.txt", sep = "/"))
  pls$bootstrap_summary
  sink()

  # report effect sizes
  sink(paste("output", model, "pls.boot.effectsizes.txt", sep = "/"))
  # get Cohen's d from tvalues and interpret
  report::interpret(effectsize::t_to_d(tvalues, df), rules = "cohen1988")
  cat("\n\n")
  f_2 <- function(model, from, to) {
    cat(from, "->", to, ":\t",
    fSquared(pls$estimated, from, to), "\n", sep = "")
  }
  cat("f-squared\n")
  f_2(pls$estimated, "IoIT", "EoA")
  f_2(pls$estimated, "IoIT", "EoI")
  f_2(pls$estimated, "EoA", "EoI")
  sink()

  # report participants data
  sink(paste("output", model, "participants.txt", sep = "/"))
  report_participants(data, age = "Age", gender = "Gender",
    education = "Education", country = "Residence")
  sink()

  # interpretation
  sink(paste("output", model, "pls.r2.txt", sep = "/"))
  report::interpret_r2(pls$boostrapped$rSquared[1, ], rules = "hair2011")
  pls$boostrapped$rSquared
  sink()

  lavaan_model <- n.readLines(paste("input/", model, "/",
    "model.htmt.lavaan", sep = ""), n = 160,
    comment = "#", header = FALSE)
  sink(paste("output/", model, "/", "mm.txt", sep = ""))
  cat("indicator loadings (>.708)\n")
  pls$estimation_summary$loadings
  cat("\n\nindicator reliability (>.500)\n")
  pls$estimation_summary$loadings^2
  cat("\n\ncomposite reliability\n")
  pls$estimation_summary$reliability
  cat("\n\nHTMT (lavaan/semTools)\n")
  htmt(lavaan_model, data = data)
  sink()

  plot(pls$estimation_summary$reliability)
  save_plot(paste("output/", model, "/",
    "composite_reliability.pdf", sep = ""))

  sink(paste("output/", model, "/", "htmt.txt", sep = ""))
  htmt(lavaan_model, data = data)
  sink()
  sink(paste("output/", model, "/", "loadings.txt", sep = ""))
  pls$estimation_summary$loadings
  sink()
  sink(paste("output/", model, "/", "reliability.txt", sep = ""))
  pls$estimation_summary$loadings^2
  sink()
  sink(paste("output/", model, "/",
    "composite_reliability.txt", sep = ""))
  pls$estimation_summary$reliability
  sink()

  plt <- plot_htmt(pls$boostrapped)
  save_plot(paste("output", model, "htmt.pdf", sep = "/"),
    plot = plt)
  plt <- plot_scores(pls$estimated)
  save_plot(paste("output", model, "scores.pdf", sep = "/"),
    plot = plt)
}

sink("output/general.txt")
psych::describe(num_data)
report::report_sample(num_data, digits = 3)
correlation(data)
sink()

compute_model("all")
compute_model("plain")
compute_model("exPUI")
compute_model("exPS-PUI")
