test.factorial <- function() {
  checkEquals(1, factorial(0))
  checkEquals(120, factorial(5))
  
  checkException(factorial(-1))
  checkException((factorial(1/2)))
  checkException(factorial("hello"))
}