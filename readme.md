# Unit Testing in R

## RUnit Package

### Writing Unit Tests

1. Create a directory called `tests` where all test files will be stored.
2. Create a file named `runit01.r` (or any name that starts with "runit") to contain the first set of tests.
3. Write the test functions (the function name must begin with "test", such as `test.c2f`). Remember that they are called *unit* tests for a reason, so make sure that each test function relates to only a single part of the package.
4. As new features are developed, new bugs are found, or new edge cases are discovered, continue creating new tests to account for these.

```{r}
test.c2f <- function() {
	# check functions...
}
```

#### Check Functions

* `checkEquals`: Are two objects equal, including named attributes?
* `checkEqualsNumeric`: Are two numeric values equal?
* `checkIdentical`: Are two objects exactly the same?
* `checkTrue`: Does an expression evaluate to TRUE?
* `checkException`: Does an expression raise an error?

### Defining a Test Suite

Create a file named `run_tests.r` outside of the `tests` directory. This file will invoke all of the unit tests from the `tests` directory. Below is an example of `run_tests.r`.

```{r}
library(runit)
# other packages required for testing

source(...) # other functions/code to test

testsuite.c2f <- defineTestSuite(name = "c2f",
	dirs = file.path("tests"))

test.result <- runTestSuite(testsuite.c2f)
printTextProtocol(test.result)
```

The `defineTestSuite` function takes the following arguments:

```{r}
defineTestSuite(name, dirs, testFileRegexp = "^runit.+\\.[rR]$",
	testFuncRegexp = "^test.+",
	rngKind = "Marsaglia-Multicarry",
	rngNormalKind = "Kinderman-Ramage")
```

`name` is the name of the test suite, and `dirs` is a vector of *absolute* directory names where the test files are located (absolute directory names are achieved by the `file.path` command).

When specifying `testFileRegexp` and `testFuncRegexp` for unique test file and test function naming schemes, use regular expressions.

* `^` represents the start of the current line.
* `$` represents the end of the current line.
* Specifying `testFileRegexp = "^runit.+\\.[rR]$"` in `defineTestSuite` means that all test files begin with "runit" and end with ".r".

Calling `printTextProtocol(test.result)` will print the test results to the console, outlining which tests passed or failed.

The structure of the unit testing directories should look like this:
```
code-runit
├── inspect-example.R
├── run_tests.R
├── sample.R
└── tests
    ├── runit01.R
    ├── runit02.R
    └── runit03.R
```

## testthat Package

The `testthat` package by Hadley Wickham is an alternative to the RUnit package. While `testthat` does not follow the syntax of xUnit variants, it is very flexible and easier to read and comprehend.

### Writing Unit Tests

1. Create a directory called `tests` where all test files will be stored.
2. Create a file named `test01.r` (or any name that starts with "test") to contain the first set of tests.
3. Write the tests, following the structure below. Each test begins with `test_that`, followed by a short description of the test and the "expectations" of the test.

```{r}
context("name of test")

test_that("str_length is number of characters", {
  expect_equal(str_length("a"), 1)
  expect_equal(str_length("ab"), 2)
  expect_equal(str_length("abc"), 3)
})

test_that("a second test", {
	...
})
```

#### Expectations

Similar to the `check` functions in RUnit, expectations all start with `expect_`.

* `expect_equal(actual, expected)`: equality within numerical tolerance
* `expect_identical(actual, expected)`: exact equivalence
* `expect_match(string, "Testing")`: matches a character vector against a regular expression. Below are variations on expect_match
	* `expect_output()`
	* `expect_message()`
	* `expect_warning()`
	* `expect_error()`
* `expect_is(object, "class")`: checks that object inherits from the specified class
* `expect_true()`: hopefully you get the pattern by now
* `expect_false()`: ditto above

## Defining Test Suite

Create a file named `run_tests.R` outside of `tests` directory.

```{r}
# run_tests.R
library(testthat)
# other packages/sources needed to test
source("sample.R")

test_dir("tests", reporter = "Summary")
```

Running `test_dir` will invoke all of the tests, and print a summary of the test results. The context is printed, then the success or failure of each expectation, represented by dots (".") for success or a number for failure. `testthat` then summarizes the failed test.

The structure of the unit testing directories should look like this:

```
code-testthat/
├── run_tests.R
├── sample.R
└── tests
    ├── test1.R
    ├── test2.R
    └── test3.R
```

# Sources
* [John White Tutorial](http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/)
* [RUnit Documentation](https://cran.r-project.org/web/packages/RUnit/RUnit.pdf)
* [testthat Documentation](http://r-pkgs.had.co.nz/tests.html)
* [More testthat Documentation](https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf)
