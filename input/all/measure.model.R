mm <- constructs(
  # Introduction of IT
  composite("IMG", multi_items("IMG.IMG", 1:3)),  # Image
  composite("PEOU", multi_items("PEOU.PEOU", 1:6)), # P. Ease Of Use
  composite("VIS", multi_items("VIS.VIS", 1:3)),  # Visibility
  composite("VOI", multi_items("VOI.VOI", 1:3)),  # Voluntarity 4
  higher_composite("IoIT", c("IMG", "PEOU", "VIS", "VOI")),
  # Effects of Automating
  composite("PUA", multi_items("PUA.PUA",
    c(1:5, 7:8))), # P. Usefulness of Automation
  composite("RES", multi_items("RES.RES", 1:3)),  # Results? 4
  composite("SQR", multi_items("SQR.SQR", 1:3)),  # Status-Quo Reproduction 4
  # composite("SR", multi_items("SR.SR", 1:4)),     # Social Reduction
  higher_composite("EoA", c("PUA", "RES", "SQR")), #, "SR")),
  # Effects of Informating
  composite("LS", multi_items("LS.LS", 1:8)),     # Learning Support
  composite("PPC", multi_items("PPC.PPC", 1:6)),  # P. Process Control
  composite("PS", multi_items("PS.PS", 1:11)),    # P. Support
  composite("PUI", multi_items("PUI.PUI",
    c(1:5, 7:8))), # P. Usefulness of Informating
  composite("TKR", multi_items("TKR.TKR", 1:4)),  # Task-rel. Knowledge Red.
  composite("WEI", multi_items("WEI.WEI", 1:8)),  # Work Env. Improvement
  higher_composite("EoI", c("LS", "PPC", "PS", "PUI", "TKR", "WEI"))
)