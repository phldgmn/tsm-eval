x_plots <- function(model, pls) {
  # Plot PLS model
  seminr::save_plot(paste("output", model, "mm.pdf", sep = "/"),
    plot = plot(pls$measurement_model))
  seminr::save_plot(paste("output", model, "sm.pdf", sep = "/"),
    plot = plot(pls$structural_model))
  seminr::save_plot(paste("output", model, "estimated.pdf", sep = "/"),
    plot = plot(pls$estimation))

  #seminr::save_plot(paste("output/", model, "/", "composite_reliability.pdf",
  #  sep = ""), plot = plot(pls$estimation_summary$reliability))

  # Plot bootstrapped PLS model
  seminr::save_plot(paste("output", model, "bootstrapped.pdf", sep = "/"),
    plot = plot(pls$boostrapped, title = "Bootstrapped Model"))

  seminr::save_plot(paste("output", model, "htmt.pdf", sep = "/"),
    plot = seminr::plot_htmt(pls$boostrapped))
  #seminr::save_plot(paste("output", model, "scores.pdf", sep = "/"),
  #  plot = seminr::plot_scores(pls$estimation))
  return()
}