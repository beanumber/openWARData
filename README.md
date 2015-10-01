[![Travis-CI Build Status](https://travis-ci.org/beanumber/openWARData.svg?branch=master)](https://travis-ci.org/beanumber/openWARData)

openWARData
===========

An R package consisting of data associated with [openWAR](https://github.com/beanumber/openWAR)

The following data is contained here:

#. Play-by-play data from MLBAM GameDay that has been processed by `openWAR` for 2012-2015
#. For each of those plays, the values necessary to compute `openWAR`
#. A table of `openWAR` values for those same years
#. A table of `fWAR` values from FanGraphs
#. A table of `rWAR` values from (http://baseball-reference.com)
#. An ID mapping from chadwickbureau

Install it from github with:
  
```{r}
devtools::install_github("beanumber/openWARData")
```