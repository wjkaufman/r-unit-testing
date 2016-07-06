test_that("is.prime works on expected domain", {
  expect_true(is.prime(3))
  expect_false(is.prime(0))
  expect_false(is.prime(1))
  expect_false(is.prime(1.5))
  expect_error(is.prime("hello"))
})
