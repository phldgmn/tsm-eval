mm <- constructs(
  # Introduction of IT
  composite("IMG", multi_items("IMG.IMG", 1:3)),  # Image
  composite("PEOU", multi_items("PEOU.PEOU", c(1:4, 6))), # P. Ease Of Use
  composite("VIS", multi_items("VIS.VIS", 1:3)),  # Visibility
  higher_composite("IoIT", c("IMG", "PEOU", "VIS")),
  # Effects of Automating
  composite("SQR", multi_items("SQR.SQR", 1:3)),  # Status-Quo Reproduction
  composite("SR", multi_items("SR.SR", 1:4)),     # Social Reduction
  higher_composite("EoA", c("SQR", "SR")),
  # Effects of Informating
  composite("LS", multi_items("LS.LS", 1:8)),     # Learning Support
  composite("PPC", multi_items("PPC.PPC", 1:6)),  # P. Process Control
  composite("PS", multi_items("PS.PS", 1:11)),    # P. Support
  composite("TKR", multi_items("TKR.TKR", 1:4)),  # Task-rel. Knowledge Red.
  composite("WEI", multi_items("WEI.WEI", 1:8)),  # Work Env. Improvement
  higher_composite("EoI", c("LS", "PPC", "PS", "TKR", "WEI"))
)