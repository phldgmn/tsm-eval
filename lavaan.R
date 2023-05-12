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
library(httpgd)
set.seed(42)

library(lavaan)

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
  dplyr::filter(na_ratio < 0.3)

# remove trailing dots from column names
colnames(data) <-  gsub(".$", "", colnames(data))
# remove leading zeros
colnames(data) <-  gsub("(?<=\\D)0{1}(?=\\d)", "", colnames(data), perl = TRUE)

model <- '
  # measurement model
    IMG =~ IMG.IMG1 + IMG.IMG2 + IMG.IMG3
    PEOU =~ PEOU.PEOU1 + PEOU.PEOU2 + PEOU.PEOU3 + PEOU.PEOU4 + PEOU.PEOU5 + PEOU.PEOU6
    VIS =~ VIS.VIS1 + VIS.VIS2 + VIS.VIS3
    VOI =~ VOI.VOI1 + VOI.VOI2 + VOI.VOI3 + VOI.VOI4
    IoIT =~ IMG + PEOU + VIS + VOI
    PUA =~ PUA.PUA1 + PUA.PUA2 + PUA.PUA3 + PUA.PUA4 + PUA.PUA5 + PUA.PUA6 + PUA.PUA7 + PUA.PUA8
    RES =~ RES.RES1 + RES.RES2 + RES.RES3 + RES.RES4
    SQR =~ SQR.SQR1 + SQR.SQR2 + SQR.SQR3 + SQR.SQR4
    SR =~ SR.SR1 + SR.SR2 + SR.SR3 + SR.SR4
    EoA =~ PUA + RES + SQR + SR
    LS =~ LS.LS1 + LS.LS2 + LS.LS3 + LS.LS4 + LS.LS5 + LS.LS6 + LS.LS7 + LS.LS8
    PPC =~ PPC.PPC1 + PPC.PPC2 + PPC.PPC3 + PPC.PPC4 + PPC.PPC5 + PPC.PPC6
    PS =~ PS.PS1 + PS.PS2 + PS.PS3 + PS.PS4 + PS.PS5 + PS.PS6 + PS.PS7 + PS.PS8 + PS.PS9 + PS.PS10 + PS.PS11
    PU =~ PU.PUI1 + PU.PUI2 + PU.PUI3 + PU.PUI4 + PU.PUI5 + PU.PUI6 + PU.PUI7 + PU.PUI8
    TKR =~ TKR.TKR1 + TKR.TKR2 + TKR.TKR3 + TKR.TKR4
    WEI =~ WEI.WEI1 + WEI.WEI2 + WEI.WEI3 + WEI.WEI4 + WEI.WEI5 + WEI.WEI6 + WEI.WEI7 + WEI.WEI8
    EoI =~ LS + PPC + PS + PU + TKR + WEI
  # regressions
    EoA ~ IoIT
    EoI ~ IoIT
  # residual correlations
'

fit <- sem(model, data = data)
summary(fit, standardized = TRUE)