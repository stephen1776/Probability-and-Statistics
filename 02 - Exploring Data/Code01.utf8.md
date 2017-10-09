---
title: "Problem 01"
author: "Stephen Blatti"
date: "October 9, 2017"
output: pdf_document
---


1. Load the MASS package.
a) Enter the command help(package="MASS") and read about the functions and data contained in this package.

```r
library(MASS)
help(package="MASS")
```
b) What does the description in the help file say about the function lqs()? Enter help(lqs, package="MASS") to obtain info about the command lqs.

```r
help(lqs, package="MASS")
```

```
## starting httpd help server ... done
```

      Fit a regression to the good points in the dataset, thereby achieving a regression estimator with a high breakdown point. lmsreg and ltsreg are compatibility wrappers.
    
c) What command shows the loaded packages?

```r
library() # all installed
search() # all attached
```

```
##  [1] ".GlobalEnv"        "package:MASS"      "package:stats"    
##  [4] "package:graphics"  "package:grDevices" "package:utils"    
##  [7] "package:datasets"  "package:methods"   "Autoloads"        
## [10] "package:base"
```
