context("dataset-cifar")

t <- withr::local_tempdir()

test_that("cifar10", {

  expect_error(
    ds <- cifar10_dataset(root = tempfile(), train = TRUE),
    class = "runtime_error"
  )

  ds <- cifar10_dataset(root = t, train = TRUE, download = TRUE)
  expect_equal(length(ds), 50000)
  el <- ds[1]
  expect_equal(dim(el[[1]]), c(32, 32, 3))
  expect_equal(length(el[[2]]), 1)
  expect_named(el, c("x", "y"))
  expect_equal(ds$classes[el[[2]]], "frog")

  ds <- cifar10_dataset(root = t, train = FALSE, download = TRUE)
  expect_equal(length(ds), 10000)
  el <- ds[1]
  expect_equal(dim(el[[1]]), c(32, 32, 3))
  expect_equal(length(el[[2]]), 1)
  expect_named(el, c("x", "y"))

})

test_that("cifar100", {

  expect_error(
    ds <- cifar100_dataset(root = tempfile(), train = TRUE),
    class = "runtime_error"
  )

  ds <- cifar100_dataset(root = t, train = TRUE, download = TRUE)
  expect_equal(length(ds), 50000)
  el <- ds[2500]
  expect_equal(dim(el[[1]]), c(32, 32, 3))
  expect_equal(length(el[[2]]), 1)
  expect_named(el, c("x", "y"))
  expect_equal(ds$classes[el[[2]]], "motorcycle")

  ds <- cifar100_dataset(root = t, train = FALSE, download = TRUE)
  expect_equal(length(ds), 10000)
  el <- ds[502]
  expect_equal(dim(el[[1]]), c(32, 32, 3))
  expect_equal(length(el[[2]]), 1)
  expect_named(el, c("x", "y"))
  expect_equal(ds$classes[el[[2]]], "mouse")

})
