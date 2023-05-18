x_summaries <- function(model, pls) {
  sink(paste("output", model, "pls.txt", sep = "/"))
  cat("outer loadings\n")
  print(pls$estimation$outer_loadings)
  cat("\n\nouter weights\n")
  print(pls$estimation$outer_weights)
  cat("\n\npath coef\n")
  print(pls$estimation$path_coef)
  sink()

  # generate summary
  sink(paste("output", model, "pls.summary.txt", sep = "/"))
  print(pls$estimation_summary)
  sink()

  # get a final summary of the bootstrapping
  sink(paste("output", model, "pls.boot.summary.txt", sep = "/"))
  print(pls$bootstrap_summary)
  sink()

  return()
}