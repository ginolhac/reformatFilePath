# reformatFilePath

[![Travis build status](https://travis-ci.org/konradedgar/reformatFilePath.svg?branch=master)](https://travis-ci.org/konradedgar/reformatFilePath)   [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/konradedgar/reformatFilePath?branch=master&svg=true)](https://ci.appveyor.com/project/konradedgar/reformatFilePath) [![codecov](https://codecov.io/gh/konradedgar/reformatFilePath/branch/master/graph/badge.svg)](https://codecov.io/gh/konradedgar/reformatFilePath)

The `reformatFilePath` RStudio Addin provides convenient mechanism replacing path string with a `file.path` call. 

## Installation

The package can be installed from GitHub using [`devtools`](https://devtools.r-lib.org) or [`remotes`](https://github.com/r-lib/remotes) package. Installation using [`devtools`](https://devtools.r-lib.org):

``` r 
if (!require("devtools")) {
    install.packages("devtools")
    devtools::install_github('konradedgar/reformatFilePath')
} else {
    devtools::install_github('konradedgar/reformatFilePath')
}
```

## Example

<img src="vignettes/sample_usage.gif" width="100%">

