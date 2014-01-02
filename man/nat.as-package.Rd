\docType{package}
\name{nat.as-package}
\alias{nat.as}
\alias{nat.as-package}
\title{Analyse 3D biological image data especially neurons}
\description{
  Before you can use the main functionality of this
  package, you must install the
  https://github.com/jefferis/AnalysisSuite codebase using
  \code{\link{install_analysis_suite}}.
}
\details{
  In future you can use \code{load_analysis_suite()} or
  \code{require_analysis_suite()} to load the codebase in
  your own code.

  Key functions within AnalysisSuite that you will want to
  look at include \itemize{ \item{read.neuron}
  \item{write.neuron} \item{plot.neuron}
  \item{plot3d.neuron} Objects of class \item{neuron}
  \item{neuronlist} }
}
\seealso{
  \code{\link{load_analysis_suite},\link{require_analysis_suite}}
  and \code{\link[rgl]{rgl-package}} which is used for
  visualisation.
}
\keyword{package}

