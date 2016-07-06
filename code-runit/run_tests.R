setwd("~/Google-Drive-UCAR/Will_Kaufman_NCAR/unit-testing/code-runit/")
library(RUnit)

source("sample.R")

testsuite.c2f <- defineTestSuite(name = "exampleSuite",
                                 dirs = file.path("tests"))

test.result <- runTestSuite(testsuite.c2f)
printTextProtocol(test.result)
