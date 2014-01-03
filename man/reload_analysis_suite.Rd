\name{reload_analysis_suite}
\alias{reload_analysis_suite}
\title{Reload nat.as and AnalysisSuite}
\usage{
  reload_analysis_suite()
}
\description{
  This is a simple convenience function to unload and
  reload the package. The expected use case is when
  AnalysisSuite code is being modified by a developer and
  s/he wants to quickly reload any changes.
}
\examples{
\dontrun{
library(nat.as)
# use
# spot a bug
# hack the code
reload_analysis_suite()
# test the fix
# repeat ...
}
}

