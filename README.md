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
    install_github('nat.as','jefferis')
    # now use nat.as wrapper package to install AnalysisSuite
    library(nat.as)
    # easy install - downloads latest AnalysisSuite code from github
    install_analysis_suite()
    # or developer install if you have a git checkout that you want to keep up to date / hack.
    # NB adjust to your preferred path
    install_analysis_suite("~/projects/AnalysisSuite")
    
    # now use nat.as wrapper package to load AnalysisSuite in your code
    library(nat.as)
    
    # to hack on the AnalysisSuite code
    library(nat.as)
    # spot a bug
    # hack code
    reload_analysis_suite()
    # test
    test_analysis_suite()

Development Install
-------------------
To checkout a version of the pacakage that can be used for development (e.g. with Rstudio)

    cd /some/suitable/dir
    git clone https://github.com/jefferis/nat.as.git
    # git clone jgit:nat.as # or local repository

    cd /some/other/suitable/dir
    git clone https://github.com/jefferis/AnalysisSuite
    # git clone jgit:AnalysisSuite # or local repository

In R

    install.packages('devtools') # install hadley's devtools
    library(devtools)
    load_all('/some/suitable/dir/nat.as')
    #hack
    check()
    test()
    load_all()
    
    # check interaction with AnalysisSuite
    document(); install()
    install_analysis_suite('~/projects/AnalysisSuite/'); reload_analysis_suite()
    
    # ready for release
    check()
    build_win() # test for Windows
    release()
    # or
    library(gjdevtools)
    gjrelease()

Details
=======
For further information about this package see:

  * https://github.com/jefferis/AnalysisSuite
  * http://flybrain.mrc-lmb.cam.ac.uk/dokuwiki/doku.php?id=warping_manual:start

