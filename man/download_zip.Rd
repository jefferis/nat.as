\name{download_zip}
\alias{download_zip}
\title{Download a specified zip file (even from https url)}
\usage{
  download_zip(zip_url, zip_dir = ".", zip_file = NULL)
}
\arguments{
  \item{zip_url}{URL for zip file}

  \item{zip_dir}{Directory to which zip file will be
  downloaded}

  \item{zip_file}{Name of downloaded zip file (will look at
  header if NULL)}
}
\value{
  Character vector of full path to downloaded file
}
\description{
  Download a specified zip file (even from https url)
}
\author{
  jefferis
}

