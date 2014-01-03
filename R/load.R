
#' @details
#' \describe{
#'  \item{load_analysis_suite}{load and error out on failure} 
#'  \item{require_analysis_suite}{try to load and return logical indicating
#'   success}
#'  \item{installnload_analysis_suite}{install if required, then load
#'   and error out on failure}
#' }
#' @export
load_analysis_suite<-function(){
  if(!require_analysis_suite()) stop("Unable to start AnalysisSuite")
}

#' Start AnalysisSuite by sourcing all function definitions
#' 
#' This is designed to be for developer use only.
#' @export
#' @rdname load_analysis_suite
require_analysis_suite<-function(){
  startup=file.path(analysis_suite_dir(),'R','Code','Startup.R')
  if(!file.exists(startup)) return(FALSE)
  t=try(sys.source(startup,envir=topenv(),keep.source=TRUE),silent=TRUE)
  success<-!inherits(t,"try-error")
}

#' @rdname load_analysis_suite
#' @param ... Additional arguments passed to install_analysis_suite
#' @seealso \code{\link{install_analysis_suite}}
installnload_analysis_suite<-function(...){
  if(!require_analysis_suite()) install_analysis_suite(...)
  if(!require_analysis_suite()) stop("Failed to install and load AnalysisSuite")
}

#' Return path to root of AnalysisSuite package
#' @export
analysis_suite_dir<-function(){
  file.path(system.file(package="nat.as"),"AnalysisSuite")
}

#' Reload nat.as and AnalysisSuite
#' 
#' This is a simple convenience function to unload and reload the package. The
#' expected use case is when AnalysisSuite code is being modified by a developer
#' and s/he wants to quickly reload any changes.
#' @export
#' @examples
#' \dontrun{
#' library(nat.as)
#' # use
#' # spot a bug
#' # hack the code
#' reload_analysis_suite()
#' # test the fix
#' # repeat ...
#' }
reload_analysis_suite<-function(){
  unloadNamespace('nat.as')
  library('nat.as')
}
