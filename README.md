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
  * easystats
  * lavaan
  * lavaanPlot
  * semTools
  * reader

Install dependencies:

```R
install.packages(c("conflicted", "dplyr", "tidyverse", "stringr", "readr", "seminr", "languageserver", "httpgd", "vscDebugger", "rsvg", "easystats", "lavaan", "lavaanPlot", "semTools", "reader"))
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

## Alternative: lavaan

TODO


## Kommentare Richard

> Das wir bei PU (bzw. ich hatte das mal PUI getauft meine ich ^^) und PUA ein Problem haben, wundert mich nicht. Die Items sind sehr ähnlich und beziehen sich nur auf einen anderen Aspekt (Automatisierung oder Informatisierung). Das ist im Grunde genommen im zweiten Card Sorting auch herausgekommen. Da hatten wir dann auch mal gesagt, dass bei Informatisierung viel mehr die Unterstützung (PS) im Vordergrund steht und bei Automatisierung PU. Daher könnte man PUI auch ganz herausnehmen.
>
> Bei** **SQR <-> RES wundert es mich tatsächlich etwas.
>
> Bei PS <-> PUA kann es auch sein, weil die Items recht ähnlich sind (wie bei PUI). Da könnte man schauen, ob man die Items, die in den Evaluierungsschritten eigentlich herausgeflogen sind hier auch mal herausnimmt. Am ehesten sind hier demnach PS 6,7,8, und 10 interessant. Grundsätzlich, weil das „nur“ im ersten Schritt rausgeflogen ist, weil es so viele Items gab, wäre PS 11 ggf. auch interessant. Ich frage mich, ob sich etwas ändert, wenn man nur diese Items nimmt. Gleiches gilt quasi auch für PU. Da könnte man sich erstmal nur auf die PU 2,3, und 5 konzentrieren, wenn man nur die höchsten ranks nimmt. Ansonsten alle PU items bis auf PU 6.
>
> PS <-> PUI wundert mich wegen der oben erwähnten Ähnlichkeit auch nicht. Das Problem wäre behoben, wenn man PUI herausnimmt.

## Citations

> Lüdecke, Patil, Ben-Shachar, Wiernik, Bacher, Thériault, & Makowski (2022). easystats: Framework for Easy Statistical Modeling, Visualization, and Reporting. CRAN. Available from https://easystats.github.io/easystats/

```BibTeX
@Article{,
  title = {easystats: Framework for Easy Statistical Modeling, Visualization, and Reporting},
  author = {Daniel Lüdecke and Mattan S. Ben-Shachar and Indrajeet Patil and Brenton M. Wiernik and Etienne Bacher and Rémi Thériault and Dominique Makowski},
  journal = {CRAN},
  year = {2022},
  note = {R package},
  url = {https://easystats.github.io/easystats/},
}
```
