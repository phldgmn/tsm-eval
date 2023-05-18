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
source("plots.R")
source("summaries.R")
source("effects.R")
source("cb_sem.R")

if (!dir.exists("output")) {
  dir.create("output")
}

compute_model <- function(model) {
  if (!dir.exists(paste("output", model, sep = "/"))) {
    dir.create(paste("output", model, sep = "/"))
  }

  pls <- calculate_pls(model, data, nboot = 5000)

  x_summaries(model, pls)
  x_effects(model, pls)
  x_plots(model, pls)
  x_cbsem(model, pls)
}

# report participants data
sink(paste("output", "participants.txt", sep = "/"))
print(report_participants(data, age = "Age", gender = "Gender",
  education = "Education", country = "Residence"))
sink()

num_data <- data %>% select(where(is.numeric))
sink("output/general.txt")
print(psych::describe(num_data))
print(report::report_sample(num_data, digits = 3))
print(correlation(data))
sink()

compute_model("all")
compute_model("plain")
compute_model("exPUI")
compute_model("exPS-PUI")
