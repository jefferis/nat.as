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
#' @return Character vector of path to downloaded file
#' @author jefferis
#' @importFrom httr GET stop_for_status config content
download_zip<-function(zip_url,zip_dir='.',zip_file=NULL){
  h=url_header(zip_url)
  message("Downloading ",zip_url,' of file size ',h$headers[['content-length']],' bytes')
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
  request=HEAD(url, config(ssl.verifypeer = FALSE))
  stop_for_status(request)
  request
}

#' Download/install AnalysisSuite codebase
#' 
#' This will download from github (or link an existing download) to a standard 
#' location. See easy and developer install sections for recomended use cases.
#' 
#' @section Easy install: With default parameters, this function will download 
#'   the current master of AnalysisSuite and install to a standard location. 
#'   This is the easy install form recommended for a typical end user.
#' @section Developer install: The alternative form will make a symbolic link 
#'   from an existing download / git checkout of AnalysisSuite to a path within 
#'   the nat.as package. This is the recommendation when you update
#'   AnalysisSuite frequently or are hacking on the main AnalysisSuite codebase
#'   (when you will also be interested in the \code{reload_analysis_suite()}
#'   function.)
#' @param path Optional non-standard path that will be symlinked to standard 
#'   location (see Developer install)
#' @param ref Github reference (defaults to 'master')
#' @param force Whether to overwrite an existing symlink (or directory) when 
#'   using the Developer install mode to symlink an existing path.
#' @return full path to AnalysisSuite root directory (invisibly)
#' @export
#' @seealso \code{\link{reload_analysis_suite}}
install_analysis_suite<-function(path=NULL, ref='master', force=FALSE){
  standard_path=file.path(system.file(package='nat.as'),'AnalysisSuite')
  if(is.null(path)) {
    zf=download_zip(paste0('https://github.com/jefferis/AnalysisSuite/zipball/',ref))
    install_from_zip(zf,standard_path)
  } else {
    message("Symlinking non-standard path")
    if(file.exists(path)) {
      if(file.exists(standard_path)){
        if(force){
          message("Removing existing install at: ",standard_path)
          unlink(standard_path,recursive=TRUE)
        } else {
          stop("There is already an AnalysisSuite checkout at:",standard_path,
               '\nUse force=TRUE to overwrite.')
        }
      }
      file.symlink(path,standard_path)
    } else {
      stop("Supplied path must refer to existing download/git checkout!")
    }
  }
  message("Start AnalysisSuite in future with library(nat.as)")
  invisible(standard_path)
}
