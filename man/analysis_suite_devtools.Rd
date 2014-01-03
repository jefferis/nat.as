\name{reload_analysis_suite}
\alias{reload_analysis_suite}
\alias{test_analysis_suite}
\title{Developer utility functions for hacking AnalysisSuite}
\usage{
  reload_analysis_suite()

  test_analysis_suite(testdirs = NULL,
    browse = is.null(testdirs))
}
\arguments{
  \item{testdirs}{Character vector of relative paths to
  test directory.  Defaults to running all tests when
  NULL.}

  \item{browse}{Load html summary of test results in web
  browser.}
}
\description{
  These convenience functions should be useful for anyone
  working on the AnalysisSuite codebase.
  \code{reload_analysis_suite} will unload the
  \code{nat.as} package and reload it, thereby reloading
  the whole of AnalysisSuite. The expected use case is when
  AnalysisSuite code is being modified by a developer and
  s/he wants to quickly reload any changes.

  Run AnalysisSuite tests
}
\details{
  \code{test_analysis_suite} will run a set of \code{RUnit}
  tests for the code.
}
\examples{
\dontrun{
library(nat.as)
# use
# spot a bug
# hack the code
reload_analysis_suite()
# test the fix
test_analysis_suite()
# repeat ...
}
}
\seealso{
  \code{\link{test_analysis_suite}}
}

