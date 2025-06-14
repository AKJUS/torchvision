% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-mnist.R
\name{mnist_dataset}
\alias{mnist_dataset}
\title{MNIST dataset}
\usage{
mnist_dataset(
  root = tempdir(),
  train = TRUE,
  transform = NULL,
  target_transform = NULL,
  download = FALSE
)
}
\arguments{
\item{root}{(string): Root directory of dataset where
\code{MNIST/processed/training.pt} and  \code{MNIST/processed/test.pt} exist.}

\item{train}{(bool, optional): If True, creates dataset from
\code{training.pt}, otherwise from \code{test.pt}.}

\item{transform}{(callable, optional): A function/transform that  takes in an
PIL image and returns a transformed version. E.g,
\code{\link[=transform_random_crop]{transform_random_crop()}}.}

\item{target_transform}{(callable, optional): A function/transform that takes
in the target and transforms it.}

\item{download}{(bool, optional): If true, downloads the dataset from the
internet and puts it in root directory. If dataset is already downloaded,
it is not downloaded again.}
}
\description{
Prepares the MNIST dataset and optionally downloads it.
}
