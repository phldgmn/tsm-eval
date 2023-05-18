x_cbsem <- function(model, pls) {
  sink(paste("output", model, "cb-sem.txt", sep = "/"))
  summary(pls$cb_sem)
  report::report_performance(pls$cb_sem$lavaan_output)
  sink()
  return()
}