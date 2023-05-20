sm <- relationships(
  # basic paths from the introduction to the effects
  paths(from = "IoIT", to = c("EoA", "EoI")),
  # Automation to Informating; these do not have indicators
  # so we need to help us out by reusing the effects
  paths(from = "EoA", to = "EoI")
)