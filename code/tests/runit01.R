test.c2f <- function() {
  checkEquals(32, c2f(0))
  checkEquals(50, c2f(10))
  checkException(c2f("asdf"))
}