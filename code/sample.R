c2f <- function(c) {
  return(9/5 * c + 32)
}

factorial <- function(n) {
  if (n == 0) return(1)
  else {
    return(n * factorial(n - 1))
  }
}