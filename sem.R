DEBUG <- FALSE # nolint: object_name_linter.
CLEAN_DATA <- FALSE # nolint: object_name_linter.
if (DEBUG == TRUE) {
  library(vscDebugger)
  .vsc.listen()
}

library(conflicted)
library(parallel)
library(dplyr)
library(tidyverse)
library(stringr)
library(readr)
library(seminr)
library(httpgd)
library(easystats)
options(es.use_symbols = TRUE)
set.seed(42)

# settings for plotting
thm <- seminr_theme_get()
thm$sm.edge.boot.show_t_value <- TRUE
thm$mm.edge.boot.show_p_stars <- TRUE
seminr_theme_set(thm)

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

# filter out all cases, which have 30% or more missing data
data <- data %>%
  mutate(na_ratio = rowMeans(is.na(select(., starts_with(items))))) %>%
  dplyr::filter(na_ratio < 0.01)

# remove trailing dots from column names
colnames(data) <-  gsub("\\.$", "", colnames(data))
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
  # basic paths from the introduction to the effects
  paths(from = "IoIT", to = c("EoA", "EoI")),
  # Automation to Informating; these do not have indicators
  # so we need to help us out by reusing the effects
  paths(from = "EoA", to = "EoI")
)

# estimate PLS model
pls_model <- estimate_pls(data = data,
  measurement_model = mm,
  structural_model  = sm)

# generate summary
sink("output/pls.summary.txt")
summary(pls_model)
sink()

# Plot PLS model
plot(mm)
save_plot("output/mm.pdf")
plot(sm)
save_plot("output/sm.pdf")
plot(pls_model)
save_plot("output/estimated.pdf")

# bootstrap the model
pls_boot <- seminr::bootstrap_model(pls_model, nboot = 5000, seed = 42)

# Plot bootstrapped PLS model
plot(pls_boot, title = "Bootstrapped Model")
save_plot("output/bootstrapped.pdf")

# gather paths and t-values
boot_summary <- summary(pls_boot)
paths <- boot_summary$bootstrapped_paths[, "Original Est."]
tvalues <- boot_summary$bootstrapped_paths[, "T Stat."]

# degrees of freedom will be the number of rows in the data sample
df <- nrow(data)
# calculate pvalues from tvalues and df; round to 3 decimal places
pvalues <- round(pt(tvalues, df, lower.tail = FALSE), 3)

# make a table of paths, tvalues, pvalues
sink("output/pls.boot.sign.txt")
data.frame(paths, tvalues, pvalues)
sink()

# get a final summary of the bootstrapping
sink("output/pls.boot.summary.txt")
summary(pls_boot, fit.measures = TRUE, standardized = TRUE)
sink()

# report effect sizes
sink("output/pls.boot.effectsizes.txt")
# get Cohen's d from tvalues and interpret
interpret(t_to_d(tvalues, df), rules = "cohen1988")
print("\n")
f_2 <- function(model, from, to) {
  cat(from, "->", to, ":\t", fSquared(pls_model, from, to), "\n", sep = "")
}
cat("f-squared\n")
f_2(pls_model, "IoIT", "EoA")
f_2(pls_model, "IoIT", "EoI")
f_2(pls_model, "EoA", "EoI")
sink()

# report participants data
sink("output/participants.txt")
report_participants(data, age = "Age", gender = "Gender",
  education = "Education", country = "Residence")
sink()

# interpretation
sink("output/pls.r2.txt")
interpret_r2(pls_boot$rSquared[1, ], rules = "hair2011")
sink()
