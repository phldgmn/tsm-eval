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
options(digits = 3)
set.seed(42)

# settings for plotting
thm <- seminr_theme_get()
thm$sm.edge.boot.show_t_value <- TRUE
thm$mm.edge.boot.show_p_stars <- TRUE
seminr_theme_set(thm)

source("data.R")
#data <- prepare_data(use_complex_import = TRUE)
data <- prepare_data()

if (!dir.exists("output")) {
  dir.create("output")
}

compute_model <- function(model, nboot = 2000) {
  if (!dir.exists(paste("output", model, sep = "/"))) {
    dir.create(paste("output", model, sep = "/"))
  }

  pls <- calculate_pls(model, data, nboot = nboot)

  x_summaries(model, pls)
  x_effects(model, pls)
  x_plots(model, pls)
  x_cbsem(model, pls)
}

# report participants data
desc <- data %>% select(Age, Gender, Gender.other, Residence, Residence.other, Education, Education.other, Employment, Employment.other)
desc <- desc %>% mutate(across(c(2:9), as.factor))
sink(paste("output", "participants.txt", sep = "/"))
print(report_participants(data, age = "Age", gender = "Gender",
  education = "Education", country = "Residence", digits = 3))
cat("\n\n")
print(summary(desc))
cat("\n\n")
print(psych::describe(desc %>% select(where(is.numeric))))
sink()

corr <- correlation(data) %>% dplyr::filter(p < 0.05)
num_data <- data %>% select(where(is.numeric))
sink("output/general.txt")
print(psych::describe(num_data))
print(report::report_sample(num_data, digits = 3))
print(corr)
sink()

source("calculate.R")
source("plots.R")
source("summaries.R")
source("effects.R")
source("cb_sem.R")

compute_model("0-default")
compute_model("1-indicators")
compute_model("2-RES")
compute_model("3-RES-PU")
compute_model("4-RES-PU-VOI")
compute_model("5-RES-PU-VOI-TKR")
