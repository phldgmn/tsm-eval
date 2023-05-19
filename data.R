library(conflicted)
library(parallel)
library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(reader)

prepare_data <- function(
  needs_cleaning = FALSE,
  use_complex_import = FALSE,
  acceptable_lastpage = 36,
  na_limit = 0.1) {
  # read column-prefixes of relevant items
  items <- readRDS("data/item_prefixes.RData") # nolint: object_name_linter.

  if (use_complex_import == TRUE) {
    source("data/survey_116679_R_syntax_file.R")
    data <- data %>% dplyr::filter(
      lastpage >= acceptable_lastpage # nolint: object_usage_linter.
    )
  } else {
    # read csv
    data <- read.csv("data/results-survey116679.csv",
      na.strings = c("", "NA")) # nolint: object_name_linter.
  }

  if (needs_cleaning == TRUE) { # nolint: object_name_linter.
    # clean data
    data <- data %>%
      # extract only the selected value of likert scale
      mutate(across(starts_with(items),
        ~str_extract(., "\\d(?=\\s?\\-.*)"))) %>%
      # convert to integer if possible, numeric else
      type_convert(guess_integer = TRUE)
  }

  # filter out all cases, which have 1% or more missing data
  data <- data %>%
    mutate(na_ratio = rowMeans(is.na(select(., starts_with(items))))) %>%
    dplyr::filter(na_ratio < na_limit) # nolint: object_usage_linter.

  # remove trailing dots from column names
  colnames(data) <-  gsub("\\.$", "", colnames(data))
  # PU. should be PUI.
  colnames(data) <-  gsub("^PU\\.", "PUI\\.", colnames(data))
  # remove leading zeros
  colnames(data) <-  gsub("(?<=\\D)0{1}(?=\\d)", # nolint: object_name_linter.
    "", colnames(data), perl = TRUE)

  return(data)
}