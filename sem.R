DEBUG <- FALSE # nolint: object_name_linter.
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
set.seed(42)

# read column-prefixes of relevant items
items <- readRDS("data/item_prefixes.RData")

# read csv
data <- read.csv("data/results-survey116679.csv")

# clean data
data <- data %>%
  # extract only the selected value of likert scale
  mutate(across(starts_with(items), ~str_extract(., "\\d(?=\\s?\\-.*)"))) %>%
  # convert to integer if possible, numeric else
  type_convert(guess_integer = TRUE)

# remove trailing dots from column names
colnames(data) <-  gsub(".$", "", colnames(data))
# remove leading zeros
colnames(data) <-  gsub("(?<=\\D)0{1}(?=\\d)", "", colnames(data), perl = TRUE)

# create the measurement model
mm <- constructs(
  composite("IMG", multi_items("IMG.IMG", 1:3)),
  composite("PEOU", multi_items("PEOU.PEOU", 1:6)),
  composite("VIS", multi_items("VIS.VIS", 1:3)),
  composite("VOI", multi_items("VOI.VOI", 1:4)),
  composite("PUA", multi_items("PUA.PUA", 1:8)),
  composite("RES", multi_items("RES.RES", 1:4)),
  composite("SQR", multi_items("SQR.SQR", 1:4)),
  composite("SR", multi_items("SR.SR", 1:4)),
  composite("LS", multi_items("LS.LS", 1:8)),
  composite("PPC", multi_items("PPC.PPC", 1:6)),
  composite("PS", multi_items("PS.PS", 1:11)),
  composite("PU", multi_items("PU.PUI", 1:8)),
  composite("TKR", multi_items("TKR.TKR", 1:4)),
  composite("WEI", multi_items("WEI.WEI", 1:8))
  )

# create structural model
# TODO: PLACEHOLDER ONLY; see README.md

sm <- relationships(
  paths(from = c("IMG", "PEOU"), to = c("VIS", "VOI")),
  paths(from = c("VIS"), to = c("VOI")))

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
plot(mm)
# Plot structural model
plot(sm)
# Plot PLS model
plot(pls_model)
