setwd("~/Google-Drive-UCAR/Will_Kaufman_NCAR/unit-testing/code/")
library(RUnit)

source("sample.R")

testsuite.c2f <- defineTestSuite(name = "c2f",
                                 dirs = file.path("tests"),
                                 testFileRegexp = "\\d+\\.R")

test.result <- runTestSuite(testsuite.c2f)
printTextProtocol(test.result)
printHTMLProtocol(test.result)
