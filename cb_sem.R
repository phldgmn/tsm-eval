x_cbsem <- function(model, pls) {
  sink(paste("output", model, "cb-sem.txt", sep = "/"))
  print(summary(pls$cb_sem, fit.measures = TRUE, standardized = TRUE))
  print(effectsize::interpret(pls$cb_sem$lavaan_output))
  print(report::report_performance(pls$cb_sem$lavaan_output))
  sink()
  if (!is.null(pls$cfa) &&
    !is.atomic(pls$cfa) &&
    !is.null(pls$cfa$lavaan_output)) {
    sink(paste("output", model, "cfa.txt", sep = "/"))
    try(print(effectsize::interpret(pls$cfa$lavaan_output)))
    try(print(report::report_performance(pls$cfa$lavaan_output)))
    try(print(summary(pls$cfa, fit.measures = TRUE, standardized = TRUE)))
    sink()
  }
  return()
}