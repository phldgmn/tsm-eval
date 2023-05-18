DEBUG <- FALSE # nolint: object_name_linter.
CLEAN_DATA <- FALSE # nolint: object_name_linter.
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
options(es.use_symbols = TRUE)
set.seed(42)

# settings for plotting
thm <- seminr_theme_get()
thm$sm.edge.boot.show_t_value <- TRUE
thm$mm.edge.boot.show_p_stars <- TRUE
seminr_theme_set(thm)

# read column-prefixes of relevant items
items <- readRDS("data/item_prefixes.RData") # nolint: object_name_linter.

# read csv
data <- read.csv("data/results-survey116679.csv", # nolint: object_name_linter.
  na.strings = c("", "NA")) # nolint: object_name_linter.

if (CLEAN_DATA == TRUE) { # nolint: object_name_linter.
  # clean data
  data <- data %>%
    # extract only the selected value of likert scale
    mutate(across(starts_with(items),
      ~str_extract(., "\\d(?=\\s?\\-.*)"))) %>% # nolint: object_name_linter.
    # convert to integer if possible, numeric else
    type_convert(guess_integer = TRUE)
}

# filter out all cases, which have 30% or more missing data
data <- data %>%
  mutate(na_ratio = rowMeans(is.na(select(., starts_with(items))))) %>%
  dplyr::filter(na_ratio < 0.01)

# remove trailing dots from column names
colnames(data) <-  gsub("\\.$", "", colnames(data))
# PU. should be PUI.
colnames(data) <-  gsub("^PU\\.", "PUI\\.", colnames(data))
# remove leading zeros
colnames(data) <-  gsub("(?<=\\D)0{1}(?=\\d)", # nolint: object_name_linter.
  "", colnames(data), perl = TRUE)

compute_model <- function(model) {
  if (!dir.exists(paste("output", model, sep = "/"))) {
    dir.create(paste("output", model, sep = "/"))
  }
  # create the measurement model
  source(paste("input", model, "measure.model.R",
    sep = "/"), local = TRUE)
  if (COMPOSITE_FALLBACK == FALSE) {
    mm <- as.reflective(mm)
  }

  # create structural model
  source(paste("input", model, "struct.model.R",
    sep = "/"), local = TRUE)

  # estimate PLS model
  pls_model <- estimate_pls(data = data,
    measurement_model = mm,
    structural_model  = sm)

  pls_summary <- summary(pls_model)

  sink(paste("output", model, "pls.txt", sep = "/"))
  cat("outer loadings\n")
  pls_model$outer_loadings
  cat("\n\nouter weights\n")
  pls_model$outer_weights
  cat("\n\npath coef\n")
  pls_model$path_coef
  sink()

  # generate summary
  sink(paste("output", model, "pls.summary.txt", sep = "/"))
  pls_summary
  summary(pls_model, fit.measures = TRUE, standardized = TRUE)
  sink()

  # Plot PLS model
  plot(mm)
  save_plot(paste("output", model, "mm.pdf", sep = "/"))
  plot(sm)
  save_plot(paste("output", model, "sm.pdf", sep = "/"))
  plot(pls_model)
  save_plot(paste("output", model, "estimated.pdf", sep = "/"))

  # bootstrap the model
  pls_boot <- seminr::bootstrap_model(pls_model, nboot = 2500, seed = 42)

  # Plot bootstrapped PLS model
  plot(pls_boot, title = "Bootstrapped Model")
  save_plot(paste("output", model, "bootstrapped.pdf", sep = "/"))

  # gather paths and t-values
  boot_summary <- summary(pls_boot)
  paths <- boot_summary$bootstrapped_paths[, "Original Est."]
  tvalues <- boot_summary$bootstrapped_paths[, "T Stat."]

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
  boot_summary
  summary(pls_boot, fit.measures = TRUE, standardized = TRUE)
  sink()

  # report effect sizes
  sink(paste("output", model, "pls.boot.effectsizes.txt", sep = "/"))
  # get Cohen's d from tvalues and interpret
  interpret(t_to_d(tvalues, df), rules = "cohen1988")
  cat("\n\n")
  f_2 <- function(model, from, to) {
    cat(from, "->", to, ":\t", fSquared(pls_model, from, to), "\n", sep = "")
  }
  cat("f-squared\n")
  f_2(pls_model, "IoIT", "EoA")
  f_2(pls_model, "IoIT", "EoI")
  f_2(pls_model, "EoA", "EoI")
  sink()

  # report participants data
  sink(paste("output", model, "participants.txt", sep = "/"))
  report_participants(data, age = "Age", gender = "Gender",
    education = "Education", country = "Residence")
  sink()

  # interpretation
  sink(paste("output", model, "pls.r2.txt", sep = "/"))
  interpret_r2(pls_boot$rSquared[1, ], rules = "hair2011")
  pls_boot$rSquared
  sink()

  eval_model <- function(prefix = "") {
    if (str_length(prefix) > 0) {
      prefix <- paste(prefix, ".", sep = "")
    }

    lavaan_model <- n.readLines(paste("input/", model, "/",
      prefix, "model.htmt.lavaan", sep = ""), n = 160,
      comment = "#", header = FALSE)
    sink(paste("output/", model, "/", prefix, "mm.txt", sep = ""))
    cat("indicator loadings (>.708)\n")
    pls_summary$loadings
    cat("\n\nindicator reliability (>.500)\n")
    pls_summary$loadings^2
    cat("\n\ncomposite reliability\n")
    pls_summary$reliability
    cat("\n\nHTMT (lavaan/semTools)\n")
    htmt(lavaan_model, data = data)
    sink()

    plot(pls_summary$reliability)
    save_plot(paste("output/", model, "/", prefix,
      "composite_reliability.pdf", sep = ""))

    sink(paste("output/", model, "/", prefix, "htmt.txt", sep = ""))
    htmt(lavaan_model, data = data)
    sink()
    sink(paste("output/", model, "/", prefix, "loadings.txt", sep = ""))
    pls_summary$loadings
    sink()
    sink(paste("output/", model, "/", prefix, "reliability.txt", sep = ""))
    pls_summary$loadings^2
    sink()
    sink(paste("output/", model, "/", prefix,
      "composite_reliability.txt", sep = ""))
    pls_summary$reliability
    sink()
  }

  eval_model()

  plt <- plot_htmt(pls_boot)
  save_plot(paste("output", model, "htmt.pdf", sep = "/"),
    plot = plt)
  plt <- plot_scores(pls_model)
  save_plot(paste("output", model, "scores.pdf", sep = "/"),
    plot = plt)
}

compute_model("all")
compute_model("plain")
compute_model("exPUI")
compute_model("exPS-PUI")
