setwd("~/Google-Drive-UCAR/Will_Kaufman_NCAR/unit-testing/code-testthat/")
library(testthat)

source("sample.R")

test_dir("tests", reporter = "Summary")
