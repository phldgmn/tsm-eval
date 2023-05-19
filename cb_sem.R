x_cbsem <- function(model, pls) {
  sink(paste("output", model, "cb-sem.txt", sep = "/"))
  print(summary(pls$cb_sem))
  print(report::report_performance(pls$cb_sem$lavaan_output))
  sink()
  return()
}