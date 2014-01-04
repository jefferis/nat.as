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

#' Check to see if full AnalysisSuite codebase is installed under nat.as package
#' 
#' @details Specifically, checks for analysis_suite_dir('R','Code','Startup.R')
#' @return logical indicating presence of AnalysisSuite installation 
#' @export
is_analysis_suite_installed<-function(){
  # check to see if AnalysisSuite is actually installed
  file.exists(analysis_suite_dir('R','Code','Startup.R'))
}

#' Developer utility functions for hacking AnalysisSuite
#' 
#' These convenience functions should be useful for anyone working on the AnalysisSuite codebase.
#' \code{reload_analysis_suite} will unload the \code{nat.as} package and reload
#' it, thereby reloading the whole of AnalysisSuite. The expected use case is
#' when AnalysisSuite code is being modified by a developer and s/he wants to
#' quickly reload any changes.
#' 
#' \code{test_analysis_suite} will run a set of \code{RUnit} tests for the code.
#' @rdname analysis_suite_devtools
#' @export
#' @seealso \code{\link{test_analysis_suite}}
#' @examples
#' \dontrun{
#' library(nat.as)
#' # use
#' # spot a bug
#' # hack the code
#' reload_analysis_suite()
#' # test the fix
#' test_analysis_suite()
#' # repeat ...
#' }
reload_analysis_suite<-function(){
  unloadNamespace('nat.as')
  library('nat.as')
}

#' Run AnalysisSuite tests
#' 
#' @param testdirs Character vector of relative paths to test directory. 
#'   Defaults to running all tests when NULL.
#' @param browse Load html summary of test results in web browser.
#' @export
#' @rdname analysis_suite_devtools
test_analysis_suite<-function(testdirs=NULL, browse=is.null(testdirs)){
  if(!require("RUnit")) stop("Please install RUnit!")
  testroot=analysis_suite_dir('R','Tests')
  if(is.null(testdirs)){
    # TestDirs=list.dirs(testroot,recursive=FALSE)
    source(file.path(testroot,'runAllTests.R'),chdir=TRUE)
    if(browse) browseURL(paste0("file://",testroot,'/LatestTestResults.html'))
  } else {
    TestDirs=file.path(testroot,testdirs)
    MyTestSuites<-lapply(TestDirs,
                         function(x) defineTestSuite(
                           basename(x),x,testFileRegexp="^runit.+.[srR]{1}$"))
    TestResults=runTestSuite(MyTestSuites)
    print(TestResults)
  }
}
