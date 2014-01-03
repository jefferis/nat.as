#' nat.as internal functions
#' 
#' This function (which is designed for internal use only) will Start 
#' AnalysisSuite by sourcing all function definitions. Users should load the
#' code with \code{library(nat.as)} or \code{reload_analysis_suite()}.
#' 
#' @rdname nat.as-internal
#' @seealso \code{\link{reload_analysis_suite}}
.require_analysis_suite<-function(){
  startup=analysis_suite_dir('R','Code','Startup.R')
  if(!file.exists(startup)) return(FALSE)
  t=try(sys.source(startup,envir=topenv(),keep.source=TRUE),silent=TRUE)
  success<-!inherits(t,"try-error")
}

#' Return path to root of AnalysisSuite package
#' 
#' @param ... Additional arguments (typically path components) passed to file.path
#' @export
#' @seealso \code{\link{file.path}}
analysis_suite_dir<-function(...){
  file.path(system.file(package="nat.as"),"AnalysisSuite",...)
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
