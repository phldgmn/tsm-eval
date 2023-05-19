calculate_pls <- function(model, data, skip_bootstrap = FALSE,
  nboot = 2500, composite_fallback = TRUE, estimate_cbsem = TRUE) {
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

  bootstrap_summary <- NULL
  boostrapped <- NULL
  if (skip_bootstrap == FALSE) {
    # bootstrap the model
    boostrapped <- seminr::bootstrap_model(estimate, nboot = nboot, seed = 42)
    bootstrap_summary <- summary(boostrapped, fit.measures = TRUE)
  }

  if (estimate_cbsem == TRUE) {
    cb_sem <- seminr::estimate_cbsem(data = data,
      measurement_model = seminr::as.reflective(mm),
      structural_model  = sm, check.gradient = FALSE)
  } else {
    cb_sem <- NULL
  }

  # prepare object to return
  ret_val <- list(
    estimation = estimate,
    boostrapped = boostrapped,
    cb_sem = cb_sem,
    structural_model = sm,
    measurement_model = mm,
    estimation_summary = summary(estimate),
    bootstrap_summary = bootstrap_summary
  )
  return(ret_val)
}