calculate_pls <- function(model, data,
  nboot = 2500, composite_fallback = TRUE) {
  # create the measurement model
  source(paste("input", model, "measure.model.R",
    sep = "/"), local = TRUE)
  if (is.null(mm)) {
    return()
  }
  if (composite_fallback == FALSE) {
    mm <- seminr::as.reflective(mm)
  }

  # create structural model
  source(paste("input", model, "struct.model.R",
    sep = "/"), local = TRUE)
  if (is.null(sm)) {
    sm <- NULL
    return()
  }

  # estimate PLS model
  estimate <- seminr::estimate_pls(data = data,
    measurement_model = mm,
    structural_model  = sm)

  # bootstrap the model
  boostrapped <- seminr::bootstrap_model(estimate, nboot = nboot, seed = 42)

  # prepare object to return
  ret_val <- list(
    estimation = estimate,
    boostrapped = boostrapped,
    structural_model = sm,
    measurement_model = mm,
    estimation_summary = summary(estimate),
    bootstrap_summary = summary(boostrapped,
      fit.measures = TRUE)
  )
  return(ret_val)
}