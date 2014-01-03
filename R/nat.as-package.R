#' Analyse 3D biological image data especially neurons
#' 
#' This packages provides a thin wrapper for the extensive neuroanatomical image
#' analysis functionality in the AnalysisSuite package that has been developed
#' and used in a number of publications from my lab (see references for key
#' examples).
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
#' namespace. If you are hacking AnalysisSuite, you can use 
#' \code{reload_analysis_suite()} to reload code.
#' 
#' @details Key functions within AnalysisSuite that you will want to look at 
#'   include: \itemize{ \item{read.neuron} \item{write.neuron} 
#'   \item{plot.neuron} \item{plot3d.neuron}

#' Objects of class \item{neuron} \item{neuronlist} }
#' @name nat.as-package
#' @aliases nat.as
#' @seealso \code{\link{install_analysis_suite}, \link{reload_analysis_suite}} 
#'   and \code{\link[rgl]{rgl-package}} which is used for visualisation.
#' @docType package
#' @keywords package
#' @exportPattern "^[^\\.]"
#' @references
#' [1] Grosjean Y., Rytz R., Farine J.P., Abuin L., Cortot J., Jefferis G.S.X.E., and Benton R. (2011). An olfactory receptor for food-derived odours promotes male courtship in Drosophila. Nature 478 (7368), 236--40.
#' \href{http://dx.doi.org/10.1038/nature10428}{doi:10.1038/nature10428}
#' 
#' [2] Cachero S., Ostrovsky A.D., Yu J.Y., Dickson B.J., and Jefferis G.S.X.E. (2010). Sexual dimorphism in the fly brain. Curr Biol 20 (18), 1589--601.
#' \href{http://dx.doi.org/10.1016/j.cub.2010.07.045}{doi:10.1016/j.cub.2010.07.045}
#' 
#' [3] Jefferis G.S.X.E., Potter C.J., Chan A.M., Marin E.C., Rohlfing T., Maurer C.R.J., and Luo L. (2007). Comprehensive maps of Drosophila higher olfactory centers: spatially segregated fruit and pheromone representation. Cell 128 (6), 1187--1203.
#' \href{http://dx.doi.org/10.1016/j.cell.2007.01.040}{doi:10.1016/j.cell.2007.01.040}
NULL
