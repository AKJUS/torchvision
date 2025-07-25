% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/models-vgg.R
\name{model_vgg}
\alias{model_vgg}
\alias{model_vgg11}
\alias{model_vgg11_bn}
\alias{model_vgg13}
\alias{model_vgg13_bn}
\alias{model_vgg16}
\alias{model_vgg16_bn}
\alias{model_vgg19}
\alias{model_vgg19_bn}
\title{VGG implementation}
\usage{
model_vgg11(pretrained = FALSE, progress = TRUE, ...)

model_vgg11_bn(pretrained = FALSE, progress = TRUE, ...)

model_vgg13(pretrained = FALSE, progress = TRUE, ...)

model_vgg13_bn(pretrained = FALSE, progress = TRUE, ...)

model_vgg16(pretrained = FALSE, progress = TRUE, ...)

model_vgg16_bn(pretrained = FALSE, progress = TRUE, ...)

model_vgg19(pretrained = FALSE, progress = TRUE, ...)

model_vgg19_bn(pretrained = FALSE, progress = TRUE, ...)
}
\arguments{
\item{pretrained}{(bool): If TRUE, returns a model pre-trained on ImageNet}

\item{progress}{(bool): If TRUE, displays a progress bar of the download
to stderr}

\item{...}{other parameters passed to the VGG model implementation.}
}
\description{
VGG models implementations based on
\href{https://arxiv.org/pdf/1409.1556}{Very Deep Convolutional Networks For Large-Scale Image Recognition}
}
\section{Functions}{
\itemize{
\item \code{model_vgg11()}: VGG 11-layer model (configuration "A")

\item \code{model_vgg11_bn()}: VGG 11-layer model (configuration "A") with batch normalization

\item \code{model_vgg13()}: VGG 13-layer model (configuration "B")

\item \code{model_vgg13_bn()}: VGG 13-layer model (configuration "B") with batch normalization

\item \code{model_vgg16()}: VGG 13-layer model (configuration "D")

\item \code{model_vgg16_bn()}: VGG 13-layer model (configuration "D") with batch normalization

\item \code{model_vgg19()}: VGG 19-layer model (configuration "E")

\item \code{model_vgg19_bn()}: VGG 19-layer model (configuration "E") with batch normalization

}}
\seealso{
Other models: 
\code{\link{model_alexnet}()},
\code{\link{model_efficientnet}},
\code{\link{model_efficientnet_v2}},
\code{\link{model_inception_v3}()},
\code{\link{model_mobilenet_v2}()},
\code{\link{model_resnet}},
\code{\link{model_vit}}
}
\concept{models}
