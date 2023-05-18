f_2 <- function(model, from, to) {
  cat(from, "->", to, ":\t", seminr::fSquared(
    model, from, to), "\n", sep = "")
}

x_effects <- function(model, pls) {
  # gather paths and t-values
  paths <- pls$bootstrap_summary$bootstrapped_paths[, "Original Est."]
  tvalues <- pls$bootstrap_summary$bootstrapped_paths[, "T Stat."]

  # degrees of freedom will be the number of rows in the data sample
  # calculate pvalues from tvalues and df; round to 3 decimal places
  pvalues <- round(pt(tvalues, nrow(data), lower.tail = FALSE), 3)

  # make a table of paths, tvalues, pvalues
  sink(paste("output", model, "pls.boot.sign.txt", sep = "/"))
  print(data.frame(paths, tvalues, pvalues))
  sink()

  # interpretation
  sink(paste("output", model, "pls.r2.txt", sep = "/"))
  print(effectsize::interpret_r2(pls$boostrapped$rSquared[1, ],
    rules = "hair2011"))
  print(pls$boostrapped$rSquared)
  sink()

  # report effect sizes
  sink(paste("output", model, "pls.boot.effectsizes.txt", sep = "/"))
  # get Cohen's d from tvalues and interpret
  print(effectsize::interpret_cohens_d(effectsize::t_to_d(tvalues, nrow(data)),
    rules = "cohen1988"))
  cat("\n\n")
  cat("f-squared\n")
  print(f_2(pls$estimation, "IoIT", "EoA"))
  print(f_2(pls$estimation, "IoIT", "EoI"))
  print(f_2(pls$estimation, "EoA", "EoI"))
  sink()

  lavaan_model <- reader::n.readLines(paste("input/", model, "/",
    "model.htmt.lavaan", sep = ""), n = 160,
    comment = "#", header = FALSE)
  sink(paste("output/", model, "/", "mm.txt", sep = ""))
  cat("indicator loadings (>.708)\n")
  print(pls$estimation_summary$loadings)
  cat("\n\nindicator reliability (>.500)\n")
  print(pls$estimation_summary$loadings^2)
  cat("\n\ncomposite reliability\n")
  print(pls$estimation_summary$reliability)
  cat("\n\nHTMT (lavaan/semTools)\n")
  print(semTools::htmt(lavaan_model, data = data))
  sink()

  sink(paste("output/", model, "/", "htmt.txt", sep = ""))
  print(semTools::htmt(lavaan_model, data = data))
  sink()
  sink(paste("output/", model, "/", "loadings.txt", sep = ""))
  print(pls$estimation_summary$loadings)
  sink()
  sink(paste("output/", model, "/", "reliability.txt", sep = ""))
  print(pls$estimation_summary$loadings^2)
  sink()
  sink(paste("output/", model, "/",
    "composite_reliability.txt", sep = ""))
  print(pls$estimation_summary$reliability)
  sink()
}