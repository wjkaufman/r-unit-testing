test_that("factorial function works on expected domain", {
  expect_equal(factorial(0), 1)
  expect_equal(factorial(5), 120)
  expect_error(factorial(-1))
  expect_error(factorial(1/2))
  expect_error(factorial("hello"))
})
