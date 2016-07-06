c2f <- function(c) {
  return(9/5 * c + 32)
}

factorial <- function(n) {
  if (n == 0) return(1)
  else {
    return(n * factorial(n - 1))
  }
}

is.prime <- function(n) {
  if (!is.numeric(n)) stop("Argument must be a number")
  if (n <= 1) return(F)
  if (n == 2) return(T)
  for (i in seq(2, n - 1, 1)) {
    if (n %% i == 0) {
      return(F)
    }
  }
  return(T)
}