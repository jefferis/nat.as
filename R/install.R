#' Install source code from a zip file to a specified folder inside nat.as package 
#' 
#' @param zip_file Zip file containing source code to install
#' @param install_dir Subdirectory of nat.as package 
#' @return logical indicating success 
#' @author jefferis
install_from_zip<-function(zip_file,install_dir="AnalysisSuite"){
  install_dir=system.file(install_dir,package='nat.as')
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
#' @export
#' @importFrom httr GET stop_for_status config content
download_zip<-function(zip_url,zip_dir=NULL,zip_file=NULL){
  if(is.null(zip_dir) && is.null(zip))
    zip_dir="."
  h=url_header(zip_url)
  
  message("Downloading ",zip_url,' of file size ',h$headers[['content-length']])
  if(is.null(zip_file)){
    zip_file=sub(".*filename=",'',h$headers[['content-disposition']])
  }
    
  zip_path=file.path(zip_dir,zip_file)  
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
  HEAD(url, config(ssl.verifypeer = FALSE))
}

#' Download/install AnalysisSuite (or link prior download) to standard location
#' 
#' With default parameters, this function will download the current master of 
#' AnalysisSuite and install to a standard location
#' @param path Optional non-standard path that will be symlinked to standard locatio (see details)
#' @param ref Git reference ()
install_analysis_suite<-function(path=NULL, ref='master'){
  zf=download_zip(paste0('https://github.com/jefferis/AnalysisSuite/zipball/',ref))
  standard_path=file.path(system.file(package='nat.as'),'AnalysisSuite')
  if(is.null(path)) {
    message("Symlinking non-standard path")
    if(file.exists(path)) {
      file.symlink(path,standard_path)
    } else {
      stop("Supplied path must refer to existing download/git checkout!")
    }
  } else {
    install_from_zip(zf,standard_path)
  }
  message("Start AnalysisSuite in future with nat.as::load_analysis_suite()")
  full_path<-system.file('AnalysisSuite','Startup.R',package='nat.as')
}

#' Start AnalysisSuite by sourcing all function definitions
#' @details
#' \itemize{
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
  t=try(source(system.file('AnalysisSuite','Startup.R',package='nat.as',
                           mustWork=TRUE)))
  success<-!inherits(t,"try-error")
}

#' @rdname load_analysis_suite
#' @param ... Additional arguments passed to install_analysis_suite
#' @seealso \code{\link{install_analysis_suite}}
installnload_analysis_suite<-function(...){
  if(!require_analysis_suite()) install_analysis_suite(...)
  if(!require_analysis_suite()) stop("Failed to install and load AnalysisSuite")
}