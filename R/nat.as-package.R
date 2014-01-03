#' Analyse 3D biological image data especially neurons
#' 
#' Before you can use the main functionality of this package, you must install 
#' the https://github.com/jefferis/AnalysisSuite codebase using 
#' \code{\link{install_analysis_suite}}. The package README on github contains 
#' details:
#' 
#' https://github.com/jefferis/nat.as
#' 
#' In future you can simply use \code{library(nat.as)} or \code{require(nat.as)}
#' to load the full AnalysisSuite codebase. Note that the functions will loaded
#' into the nat.as namespace and then exported to avoid polluting the global
#' namespace. If you are hacking AnalysisSuite, you can use \code{ 
#' reload_analysis_suite() } to reload code.
#' 
#' @details Key functions within AnalysisSuite that you will want to look at
#'   include:
#' \itemize{
#' \item{read.neuron}
#' \item{write.neuron}
#' \item{plot.neuron}
#' \item{plot3d.neuron}

#' Objects of class
#' \item{neuron}
#' \item{neuronlist}
#' }
#' @name nat.as-package
#' @aliases nat.as
#' @seealso \code{\link{load_analysis_suite},\link{require_analysis_suite}} and
#'   \code{\link[rgl]{rgl-package}} which is used for visualisation.
#' @docType package
#' @keywords package
#' @exportPattern "^[^\\.]"
NULL
