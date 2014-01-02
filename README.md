Introduction
============
This package is a thin wrapper around the [AnalysisSuite](https://github.com/jefferis/AnalysisSuite)
that I have been using for a number of years to analyse and visualise
3D bioogical image data, especially neuronal structures. The idea is that this
will immediately make it rather easier to install AnalysisSuite and that over
time it should be possible to migrate many of the AnalysisSuite functions 
(currently in a loose bundle of R source code files and associated data) into
this formal R package.

Installation
============
Standard Install
----------------
not yet available from CRAN

Github Install
--------------
To install the latest development version from github

    install.packages('devtools') # install hadley's devtools
    library(devtools)
    install_github('nat.as','jefferis','pub')
    # now use nat.as wrapper package to install AnalysisSuite
    library(nat.as)
    install_analysis_suite()
    
    # now use nat.as wrapper package to load AnalysisSuite in your code
    library(nat.as)
    load_analysis_suite()
    
    # or if you want to keep going even if loading fails
    if(!require_analysis_suite()) message("Failed to load AnalysisSuite")



Development Install
-------------------
To checkout a version that can be used for development (e.g. with StatET for Eclipse)

    cd /some/suitable/dir
    git clone https://github.com/jefferis/nat.as.git
    # git clone jgit:nat.as # or local repository

In R

    install.packages('devtools') # install hadley's devtools
    library(devtools)
    load_all('/some/suitable/dir/nat.as')
    test()
    #hack
    load_all()
    
    # ready for release
    check()
    build_win() # test for Windows
    release()

Details
=======
For further information about this package see:

  * https://github.com/jefferis/AnalysisSuite
  * http://flybrain.mrc-lmb.cam.ac.uk/dokuwiki/doku.php?id=warping_manual:start

