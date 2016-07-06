context("c2f function")

test_that("c2f function works for numeric and non-numeric input", {
  expect_equal(c2f(0), 32)
  expect_equal(c2f(10), 50)
  expect_error(c2f("hello"))
})
