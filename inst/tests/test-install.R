context("Verify install functions")
require(testthat)
require(tools)
require(nat.utils)

test_that("can download a github zip file", {
      tf=tempfile(fileext = '.zip')
      on.exit(unlink(tf))
      #browser()
      sample_url='https://github.com/jefferis/AnalysisSuiteBin/zipball/f75fadb4ba3b8fc3de6e990ff515952bb751cfaa'
      expect_that(
          zf<-download_zip(sample_url,zip_dir = dirname(tf),zip_file = basename(tf)),
          takes_less_than(10),
          info="Check that we can download a github zip file in < 10s")
      # need to normalise both input (tf) and output (zf) paths to be safe
      zf=normalizePath(zf)
      tf=normalizePath(tf)
      expect_that(zf,equals(tf))
      zf2=download_zip(sample_url,zip_dir = dirname(tf))
      expect_that(dirname(zf2),equals(dirname(tf)))
      expect_that(basename(zf2),equals('jefferis-AnalysisSuiteBin-f75fadb.zip'))
      expect_true(zipok(zf2))
    })
