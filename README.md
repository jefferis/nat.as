Introduction
============
This package is a thin wrapper around the [AnalysisSuite](https://github.com/jefferis/AnalysisSuite)
that I have been using for a number of years to analyse and visualise
3D biological image data, especially neuronal structures. The idea is that this
will immediately make it rather easier to install AnalysisSuite and that over
time it should be possible to migrate many of the AnalysisSuite functions 
(currently in a loose bundle of R source code files and associated data) into
a formal R package that I am incubating at [nat](https://github.com/jefferis/nat).

Installation
============
Standard Install
----------------
not yet available from CRAN

Easy Install
--------------
The easiest approach is to install the latest development version of the package+analysis suite code from github.
However see below for the Developer install if you become a regular user.

    install.packages('devtools') # install hadley's devtools
    library(devtools)
    install_github('nat.as','jefferis')
    
    # now use nat.as wrapper package to install AnalysisSuite
    library(nat.as)
    install_analysis_suite()
    reload_analysis_suite()
    
    # in future use nat.as wrapper package to load AnalysisSuite in your code
    library(nat.as)

Developer Install
-----------------
This is recommended both if you want to hack the AnalysisSuite code but also if 
you simply want to keep the code up to date regularly with git

First at the terminal:

    # or some other directory you like
    cd ~/projects
    git clone https://github.com/jefferis/AnalysisSuite.git

Then in R:

    library(nat.as)
    install_analysis_suite("~/projects/AnalysisSuite")

To update the AnalysisSuite code (which is under regular development):

    cd ~/projects/AnalysisSuite
    git pull

Back in R if you want to hack on the AnalysisSuite code

    library(nat.as)
    # spot a bug
    # hack code
    reload_analysis_suite()
    # test
    test_analysis_suite()

Package Development Install
---------------------------
In the rare case that you want to  checkout a version of the nat.as wrapper package
that can be used for development (e.g. with Rstudio)

    cd /some/suitable/dir
    git clone https://github.com/jefferis/nat.as.git
    # git clone jgit:nat.as # or local repository

    cd /some/suitable/dir
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

