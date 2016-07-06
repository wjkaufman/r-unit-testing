test.is.prime <- function() {
  checkEquals(T, is.prime(3))
  checkEquals(F, is.prime(0))
  checkEquals(F, is.prime(1))
  # checkEquals(F, is.prime(1.5))
  checkException(is.prime("hello"))
}