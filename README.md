# raps_by_example
Reproducible analytical pipelines capacity development materials

This repository contains materials on the topic of reproducible analytical pipelines.

The examples contained within use R and contain a shell script for Mac OS 12+

The shell script when run from the terminal executes the data_clean.R and data_transform.R scripts then builds a quarto report from the file rap_report.qmd in the specified format.

Use of this script requires the following to be installed
- R base
  - packages: quarto, rmarkdown, knitr
  - LaTeX: tinytex (for pdf render)
- quarto installed at the system level not just within R
