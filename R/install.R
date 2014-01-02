#' Install source code from a zip file to a specified folder inside nat.as package 
#' 
#' @param zip_file Zip file containing source code to install
#' @param install_dir Name of subdirectory that will containing unzipped code
#' @return logical indicating success 
#' @author jefferis
install_from_zip<-function(zip_file,install_dir){
  zf=unzip(zip_file,exdir=dirname(install_dir))
  zip_out_dir=dirname(zf[1])
  if(file.exists(install_dir)){
   unlink(install_dir,recursive=TRUE)
  }
  file.rename(zip_out_dir,install_dir)
}

#' Install any required Biocondutcor packages
#' @param pkgs Character vector of packages 
#' @author jefferis
install_bioc<-function(pkgs="RBGL"){
  source("http://bioconductor.org/biocLite.R")
  for (pkg in pkgs) biocLite(pkg)
}

#' Download a specified zip file (even from https url)
#' @param zip_url URL for zip file
#' @param zip_dir Directory to which zip file will be downloaded 
#' @param zip_file Name of downloaded zip file (will look at header if NULL) 
#' @return Character vector of full path to downloaded file
#' @author jefferis
#' @importFrom httr GET stop_for_status config content
download_zip<-function(zip_url,zip_dir='.',zip_file=NULL){
  h=url_header(zip_url)
  message("Downloading ",zip_url,' of file size ',h$headers[['content-length']],' bytes')
  if(is.null(zip_file)){
    zip_file=sub(".*filename=",'',h$headers[['content-disposition']])
  }
  
  zip_path=normalizePath(file.path(zip_dir,zip_file))
  request=GET(zip_url, config(ssl.verifypeer = FALSE))
  stop_for_status(request)
  writeBin(content(request), zip_path)
  zip_path
}

#' Get header information from a file
#' @param url URL to fetch header
#' @importFrom httr HEAD config
#' @seealso \code{\link{HEAD}}
url_header<-function(url){
  request=HEAD(url, config(ssl.verifypeer = FALSE))
  stop_for_status(request)
  request
}

#' Download/install AnalysisSuite (or link prior download) to standard location
#' 
#' With default parameters, this function will download the current master of 
#' AnalysisSuite and install to a standard location
#' @param path Optional non-standard path that will be symlinked to standard locatio (see details)
#' @param ref Github reference (defaults to 'master')
#' @return full path to AnalysisSuite root directory (invisibly)
#' @export
install_analysis_suite<-function(path=NULL, ref='master'){
  zf=download_zip(paste0('https://github.com/jefferis/AnalysisSuite/zipball/',ref))
  standard_path=file.path(system.file(package='nat.as'),'AnalysisSuite')
  if(is.null(path)) {
    install_from_zip(zf,standard_path)
  } else {
    message("Symlinking non-standard path")
    if(file.exists(path)) {
      file.symlink(path,standard_path)
    } else {
      stop("Supplied path must refer to existing download/git checkout!")
    }
  }
  message("Start AnalysisSuite in future with nat.as::load_analysis_suite()")
  invisible(standard_path)
}

#' Start AnalysisSuite by sourcing all function definitions
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

#' @export
#' @rdname load_analysis_suite
require_analysis_suite<-function(){
  t=try(source(file.path(analysis_suite_dir(),'R','Code','Startup.R')))
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
