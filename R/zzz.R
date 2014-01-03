.onLoad <- function(libname, pkgname) {
  if(!.require_analysis_suite() && interactive())
    packageStartupMessage('Please use nat.as::install_analysis_suite()',
                          ' to install the main AnalysisSuite codebase!')
  invisible()
}
