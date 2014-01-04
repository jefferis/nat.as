\name{install_analysis_suite}
\alias{install_analysis_suite}
\title{Download/install AnalysisSuite codebase}
\usage{
  install_analysis_suite(path = NULL, ref = "master",
    force = FALSE)
}
\arguments{
  \item{path}{Optional non-standard path that will be
  symlinked to standard location (see Developer install)}

  \item{ref}{Github reference (defaults to 'master')}

  \item{force}{Whether to overwrite an existing symlink (or
  directory) when using the Developer install mode to
  symlink an existing path.}
}
\value{
  full path to AnalysisSuite root directory (invisibly)
}
\description{
  This will download from github (or link an existing
  download) to a standard location. See easy and developer
  install sections for recomended use cases.
}
\section{Easy install}{
  With default parameters, this function will download the
  current master of AnalysisSuite and install to a standard
  location.  This is the easy install form recommended for
  a typical end user.
}

\section{Developer install}{
  The alternative form will make a symbolic link from an
  existing download / git checkout of AnalysisSuite to a
  path within the nat.as package. This is the
  recommendation when you update AnalysisSuite frequently
  or are hacking on the main AnalysisSuite codebase (when
  you will also be interested in the
  \code{reload_analysis_suite()} function.)
}
\seealso{
  \code{\link{reload_analysis_suite}}
}

