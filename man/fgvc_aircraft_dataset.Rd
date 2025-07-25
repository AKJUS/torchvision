% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-fgvc.R
\name{fgvc_aircraft_dataset}
\alias{fgvc_aircraft_dataset}
\title{FGVC Aircraft Dataset}
\usage{
fgvc_aircraft_dataset(
  root = tempdir(),
  split = "train",
  annotation_level = "variant",
  transform = NULL,
  target_transform = NULL,
  download = FALSE
)
}
\arguments{
\item{root}{Character. Root directory for dataset storage. The dataset will be stored under \verb{root/fgvc-aircraft-2013b}.}

\item{split}{Character. One of \code{"train"}, \code{"val"}, \code{"trainval"}, or \code{"test"}. Default is \code{"train"}.}

\item{annotation_level}{Character. Level of annotation to use for classification. Default is \code{"variant"}.
One of \code{"variant"}, \code{"family"}, \code{"manufacturer"}, or \code{"all"}. See \emph{Details}.}

\item{transform}{Optional function to transform input images after loading. Default is \code{NULL}.}

\item{target_transform}{Optional function to transform labels. Default is \code{NULL}.}

\item{download}{Logical. Whether to download the dataset if not found locally. Default is \code{FALSE}.}
}
\value{
An object of class \code{fgvc_aircraft_dataset}, which behaves like a torch-style dataset.
Each element is a named list with:
\itemize{
\item \code{x}: an array of shape (H, W, C) with pixel values in the range (0, 255). Please note that images have varying sizes.
\item \code{y}: for single-level annotation (\code{"variant"}, \code{"family"}, \code{"manufacturer"}): an integer class label.
for multi-level annotation (\code{"all"}): a vector of three integers \code{c(manufacturer_idx, family_idx, variant_idx)}.
}
}
\description{
The FGVC-Aircraft dataset supports the following official splits:
\itemize{
\item \code{"train"}: training subset with labels.
\item \code{"val"}: validation subset with labels.
\item \code{"trainval"}: combined training and validation set with labels.
\item \code{"test"}: test set with labels (used for evaluation).
}
}
\details{
The \code{annotation_level} determines the granularity of labels used for classification and supports four values:
\itemize{
\item \code{"variant"}: the most fine-grained level, e.g., \code{"Boeing 737-700"}. There are 100 visually distinguishable variants.
\item \code{"family"}: a mid-level grouping, e.g., \code{"Boeing 737"}, which includes multiple variants. There are 70 distinct families.
\item \code{"manufacturer"}: the coarsest level, e.g., \code{"Boeing"}, grouping multiple families under a single manufacturer. There are 30 manufacturers.
\item \code{"all"}: multi-label format that returns all three levels as a vector of class indices \code{c(manufacturer_idx, family_idx, variant_idx)}.
}

These levels form a strict hierarchy: each \code{"manufacturer"} consists of multiple \code{"families"}, and each \code{"family"} contains several \code{"variants"}.
Not all combinations of levels are valid — for example, a \code{"variant"} always belongs to exactly one \code{"family"}, and a \code{"family"} to exactly one \code{"manufacturer"}.

When \code{annotation_level = "all"} is used, the \verb{$classes} field is a named list with three components:
\itemize{
\item \code{classes$manufacturer}: a character vector of manufacturer names
\item \code{classes$family}: a character vector of family names
\item \code{classes$variant}: a character vector of variant names
}
}
\examples{
\dontrun{
# Single-label classification
fgvc <- fgvc_aircraft_dataset(transform = transform_to_tensor, download = TRUE)

# Create a custom collate function to resize images and prepare batches
resize_collate_fn <- function(batch) {
  xs <- lapply(batch, function(item) {
    torchvision::transform_resize(item$x, c(768, 1024))
  })
  xs <- torch::torch_stack(xs)
  ys <- torch::torch_tensor(sapply(batch, function(item) item$y), dtype = torch::torch_long())
  list(x = xs, y = ys)
}
dl <- torch::dataloader(dataset = fgvc, batch_size = 2, collate_fn = resize_collate_fn)
batch <- dataloader_next(dataloader_make_iter(dl))
batch$x  # batched image tensors with shape (2, 3, 768, 1024)
batch$y  # class labels as integer tensor of shape 2

# Multi-label classification
fgvc <- fgvc_aircraft_dataset(split = "test", annotation_level = "all")
item <- fgvc[1]
item$x  # a double vector representing the image
item$y  # an integer vector of length 3: manufacturer, family, and variant indices
fgvc$classes$manufacturer[item$y[1]]  # e.g., "Boeing"
fgvc$classes$family[item$y[2]]        # e.g., "Boeing 707"
fgvc$classes$variant[item$y[3]]       # e.g., "707-320"
}

}
\seealso{
Other classification_dataset: 
\code{\link{caltech_dataset}},
\code{\link{cifar10_dataset}()},
\code{\link{eurosat_dataset}()},
\code{\link{fer_dataset}()},
\code{\link{flowers102_dataset}()},
\code{\link{lfw_dataset}},
\code{\link{mnist_dataset}()},
\code{\link{oxfordiiitpet_dataset}()},
\code{\link{places365_dataset}()},
\code{\link{tiny_imagenet_dataset}()}
}
\concept{classification_dataset}
