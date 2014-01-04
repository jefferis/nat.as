.onLoad <- function(libname, pkgname) {
  .require_analysis_suite()
  invisible()
}

.onAttach <- function(libname, pkgname) {
  if(!is_analysis_suite_installed())
    packageStartupMessage('Please use nat.as::install_analysis_suite()',
                          ' to install the main AnalysisSuite codebase!')
  invisible()
}
