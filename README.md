Introduction
============
This package is a thin wrapper around the [AnalysisSuite](https://github.com/jefferis/AnalysisSuite)
that I have been using for a number of years to analyse and visualise
3D biological image data, especially neuronal structures. The idea is that this
will immediately make it rather easier to install AnalysisSuite and that over
time it should be possible to migrate many of the AnalysisSuite functions 
(currently in a loose bundle of R source code files and associated data) into
a formal R package that I am incubating at [nat](https://github.com/jefferis/nat).

Quick Start
===========

For the impatient ...

    # install
    if(!require('devtools')) install.packages('devtools')
    devtools::install_github('jefferis/nat')
    devtools::install_github('jefferis/nat.as')
    nat.as::install_analysis_suite()
    nat.as::reload_analysis_suite()
    
    # now use it
    library(nat.as)
    plot3d(kcs20,col=type)
    ?nat.as
    ?nat


Installation Details
====================
There are 2 modes of installation increasing in order of difficulty and flexibility. If you just want to try things out, go with option 1. If you want to keep up to date regularly/hack on the AnalysisSuite code go with option 2, Developer Install (this is what I recommend for the lab).

  * devtools Install of Latest Version
  * Developer Install of Latest Version
  

devtools Install of Latest Version
------------------------------
The easiest approach to install the latest development version of the
package + AnalysisSuite code from github as described in the **Quick Start** section above. 
However see below for the Developer
install if you become a regular user and frequently update AnalysisSuite.

Developer Install of Latest Version
-----------------------------------
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

Developing the nat.as Package
=============================
In the rare case that you want to checkout a version of the **nat.as** wrapper package
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

