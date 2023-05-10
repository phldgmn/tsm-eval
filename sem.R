DEBUG <- FALSE # nolint: object_name_linter.
CLEAN_DATA <- FALSE # nolint: object_name_linter.
if (DEBUG == TRUE) {
  library(vscDebugger)
  .vsc.listen()
}

library(conflicted)
library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(seminr)
library(httpgd)
set.seed(42)
hgd()

# read column-prefixes of relevant items
items <- readRDS("data/item_prefixes.RData")

# read csv
data <- read.csv("data/results-survey116679.csv", na.strings = c("", "NA"))

if (CLEAN_DATA == TRUE) {
  # clean data
  data <- data %>%
    # extract only the selected value of likert scale
    mutate(across(starts_with(items), ~str_extract(., "\\d(?=\\s?\\-.*)"))) %>%
    # convert to integer if possible, numeric else
    type_convert(guess_integer = TRUE)
}

data <- data %>%
  mutate(na_ratio = rowMeans(is.na(select(., starts_with(items))))) %>%
  dplyr::filter(na_ratio < 0.3)

# remove trailing dots from column names
colnames(data) <-  gsub(".$", "", colnames(data))
# remove leading zeros
colnames(data) <-  gsub("(?<=\\D)0{1}(?=\\d)", "", colnames(data), perl = TRUE)

# create the measurement model
mm <- constructs(
  # Introduction of IT
  composite("IMG", multi_items("IMG.IMG", 1:3)),  # Image
  composite("PEOU", multi_items("PEOU.PEOU", 1:6)), # P. Ease Of Use
  composite("VIS", multi_items("VIS.VIS", 1:3)),  # Visibility
  composite("VOI", multi_items("VOI.VOI", 1:4)),  # Voluntarity
  higher_composite("IoIT", c("IMG", "PEOU", "VIS", "VOI")),
  # Effects of Automating
  composite("PUA", multi_items("PUA.PUA", 1:8)),  # P. Usefulness of Automation
  composite("RES", multi_items("RES.RES", 1:4)),  # Results?
  composite("SQR", multi_items("SQR.SQR", 1:4)),  # Status-Quo Reproduction
  composite("SR", multi_items("SR.SR", 1:4)),     # Social Reduction
  higher_composite("EoA", c("PUA", "RES", "SQR", "SR")),
  # Effects of Informating
  composite("LS", multi_items("LS.LS", 1:8)),     # Learning Support
  composite("PPC", multi_items("PPC.PPC", 1:6)),  # P. Process Control
  composite("PS", multi_items("PS.PS", 1:11)),    # P. Support
  composite("PU", multi_items("PU.PUI", 1:8)),    # P. Usefulness of Informating
  composite("TKR", multi_items("TKR.TKR", 1:4)),  # Task-related Knowledge Red.
  composite("WEI", multi_items("WEI.WEI", 1:8)),  # Work Environment Improvement
  higher_composite("EoI", c("LS", "PPC", "PS", "PU", "TKR", "WEI"))
)

# create structural model
sm <- relationships(
  paths(from = c("IoIT"), to = c("EoA", "EoI"))
)

# estimate PLS model
pls_model <- estimate_pls(data = data,
  measurement_model = mm,
  structural_model  = sm,
  inner_weights = path_weighting,
  missing = mean_replacement,
  missing_value = NA)

# generate summary
summary(pls_model)

# Plot measurement model
#plot(mm)
# Plot structural model
#plot(sm)

# Plot PLS model
plot(pls_model)
save_plot("sem.pdf")

pls_boot <- bootstrap_model(pls_model,
  nboot = 1000, seed = 42)
boot_summary <- summary(pls_boot)

# See full summary of all the paths
boot_summary$bootstrapped_paths

# gather paths and t-values
paths <- boot_summary$bootstrapped_paths[, "Original Est."]
tvalues <- boot_summary$bootstrapped_paths[, "T Stat."]

plot(hist(tvalues))
save_plot("bootstrap.pdf")