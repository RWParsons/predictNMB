% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot.predictNMBscreen}
\alias{plot.predictNMBscreen}
\title{Create plots of from screened predictNMB simulations.}
\usage{
\method{plot}{predictNMBscreen}(
  x,
  x_axis_var = NULL,
  constants = list(),
  what = c("nmb", "inb", "cutpoints"),
  inb_ref_col = NA,
  plot_range = TRUE,
  plot_ci = TRUE,
  plot_line = TRUE,
  plot_alpha = 0.5,
  dodge_width = 0,
  ci = 0.95,
  methods_order = NULL,
  rename_vector,
  extra_theme = ggplot2::theme(panel.grid.minor = ggplot2::element_blank()),
  ...
)
}
\arguments{
\item{x}{A \code{predictNMBscreen} object.}

\item{x_axis_var}{The desired screened factor to be displayed along the
x axis. For example, if the simulation screen was used with many values for
event rate, this could be "event_rate". Defaults to the first detected,
varied input.}

\item{constants}{Named vector If multiple inputs were screened in this
object, this argument can be used to modify the selected values for all
those except the input that's varying along the x-axis. See the
\href{https://rwparsons.github.io/predictNMB/articles/summarising-results-with-predictNMB.html}{summarising methods vignette}.}

\item{what}{What to summarise: one of "nmb", "inb" or "cutpoints".
Defaults to "nmb".}

\item{inb_ref_col}{Which cutpoint method to use as the reference strategy
when calculating the incremental net monetary benefit.
See \code{do_nmb_sim} for more information.}

\item{plot_range}{\code{logical}. Whether or not to plot the range of the
distribution as a thin line. Defaults to TRUE.}

\item{plot_ci}{\code{logical}. Whether or not to plot the confidence region
of the distribution as a thicker line. Defaults to TRUE.}

\item{plot_line}{\code{logical}. Whether or not to connect the medians of
the distributions for each method along the x-axis. Defaults to TRUE.}

\item{plot_alpha}{Alpha value for all plot elements. Defaults to 0.5.}

\item{dodge_width}{The dodge width of plot elements. Can be used to avoid
excessive overlap between methods. Defaults to 0.}

\item{ci}{The confidence level.
Defaults to 0.95 (coloured area of distribution represents 95\% CIs).}

\item{methods_order}{The order (left to right) to display the cutpoint
methods.}

\item{rename_vector}{A named vector for renaming the methods in the summary.
The values of the vector are the default names and the names given are the
desired names in the output.}

\item{extra_theme}{Additional theme applied to plot. Defaults to remove
minor panel grid.}

\item{...}{Additional (unused) arguments.}
}
\value{
Returns a \code{ggplot} object
}
\description{
Create plots of from screened predictNMB simulations.
}
\details{
This plot method works with \code{predictNMBscreen} objects that are
created using \code{screen_simulation_inputs()}. Can be used to visualise
distributions from many different simulations and assign a varying input
to the x-axis of the plot.
}
\examples{

if (FALSE) {
  get_nmb <- function() c("TP" = -3, "TN" = 0, "FP" = -1, "FN" = -4)
  sim_screen_obj <- screen_simulation_inputs(
    n_sims = 50, n_valid = 10000, sim_auc = seq(0.7, 0.9, 0.1),
    event_rate = c(0.1, 0.2, 0.3),
    fx_nmb_training = get_nmb, fx_nmb_evaluation = get_nmb
  )

  plot(sim_screen_obj)
  plot(
    sim_screen_obj,
    x_axis_var = "event_rate",
    constants = c(sim_auc = 0.8),
    dodge_width = 0.02
  )
}
}
