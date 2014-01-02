\name{load_analysis_suite}
\alias{installnload_analysis_suite}
\alias{load_analysis_suite}
\alias{require_analysis_suite}
\title{Start AnalysisSuite by sourcing all function definitions}
\usage{
  load_analysis_suite()

  require_analysis_suite()

  installnload_analysis_suite(...)
}
\arguments{
  \item{...}{Additional arguments passed to
  install_analysis_suite}
}
\description{
  Start AnalysisSuite by sourcing all function definitions
}
\details{
  \itemize{ \item{load_analysis_suite}{load and error out
  on failure} \item{require_analysis_suite}{try to load and
  return logical indicating success}
  \item{installnload_analysis_suite}{install if required,
  then load and error out on failure} }
}
\seealso{
  \code{\link{install_analysis_suite}}
}

