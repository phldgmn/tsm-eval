# Theoy of the Smart Machine

*Evaluation using Structural Equation Modeling in R*

## Preqrequisites

* R > 4.0.0
* Dependencies:
  * conflicted
  * dplyr
  * tidyverse
  * stringr
  * readr
  * seminr
  * languageserver
  * vscDebugger
  * rsvg

Install dependencies:

```R
install.packages(c("conflicted", "dplyr", "tidyverse", "stringr", "readr", "seminr", "languageserver", "httpgd", "vscDebugger", "rsvg"))
```

## IDE: Visual Studio Code

[Visual Studio Code]() has some additional information on how to use it with R: [R in Visual Studio Code](https://code.visualstudio.com/docs/languages/r)

Basically, you need to install the [R Extension](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r) and the [R Debugger](https://marketplace.visualstudio.com/items?itemName=RDebugger.r-debugger).

Also install radian, either via pip (`pip3 install -U radian`) or homebrew (`brew install radian`).

Finally, change some settings:

* R > Plot: Use httpgd (enabled)
* R > Rterm (set to path to radian; can be found via `which radian`)
* R > Rpath (set to path to R — not radian; can be found via `which R`)

## Core Package: SEMinR

See here: [sem-in-r/seminr](https://github.com/sem-in-r/seminr).

## Structural Model Specification

* [Documentation](https://cran.r-project.org/web/packages/seminr/vignettes/SEMinR.html#structural-model-description)
* [Example Code](https://github.com/sem-in-r/seminr/blob/master/demo/seminr-pls-interaction.R)
