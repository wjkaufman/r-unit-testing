# Unit Testing in R

## RUnit

### Creating Unit Tests

1. Create a directory called `tests` where all test files will be stored.
2. Create a file named `runit01.r` (or any name that follows a pattern) to contain the first set of tests.
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

### Inspecting Code

Inspecting code using `tracker` and `inspect` allows basic profiling of code and functions. Below is a simple example.

```{r}
## example functions
foo <- function(x){
	y <- 0
	for(i in 1:100)
	{
		y <- y + i
	}
	return(y)
}

bar <- function(x){
	y <- 0
	for(i in 1:100)
	{
		y <- y - i
	}
	return(y)
}

## the object name track is 'fixed' (current implementation)
track <- tracker()
## initialize the tracker
track$init()

## inspect the function
## resFoo1 will contain the result of calling foo(50)
resFoo1 <- inspect(foo(50), track = track)
resFoo2 <- inspect(foo(20), track = track)
resBar1 <- inspect(bar(30), track = track)
## get the tracked function call info for all inspect calls
resTrack <- track$getTrackInfo()
## create HTML sites in folder ./results for all inspect calls
printHTML.trackInfo(resTrack, baseDir = ".")
```

# Sources
* [John White Tutorial](http://www.johnmyleswhite.com/notebook/2010/08/17/unit-testing-in-r-the-bare-minimum/)
* [RUnit Documentation](https://cran.r-project.org/web/packages/RUnit/RUnit.pdf)
