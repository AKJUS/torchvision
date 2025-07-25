% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ops-boxes.R
\name{generalized_box_iou}
\alias{generalized_box_iou}
\title{Generalized Box IoU}
\usage{
generalized_box_iou(boxes1, boxes2)
}
\arguments{
\item{boxes1}{(Tensor[N, 4])}

\item{boxes2}{(Tensor[M, 4])}
}
\value{
generalized_iou (Tensor[N, M]): the NxM matrix containing the pairwise generalized_IoU values
for every element in boxes1 and boxes2
}
\description{
Return generalized intersection-over-union  (Jaccard index) of boxes.
Both sets of boxes are expected to be in \eqn{(x_{min}, y_{min}, x_{max}, y_{max})} format with
\eqn{0 \leq x_{min} < x_{max}} and \eqn{0 \leq y_{min} < y_{max}}.
}
\details{
Implementation adapted from https://github.com/facebookresearch/detr/blob/master/util/box_ops.py
}
