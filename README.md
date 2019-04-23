# TumorRate

This package provides a function to perform the chi-squared test for carcinogen studies as described in Peto 1974.

Data should be input as two matrices with the number of rows corresponding to the number of treatments and the number of columns correspond to each time period observed. In the case of incidental tumors discovered at necropsy Matrix A should contain the counts of the number of necropsies at which a tumor was found. Matrix B should contain the number of necropsies of animals which did not have a tumor diagnosed before death and which did not die of a tumor. 

In the case of comparing the rates of tumors diagnosed during life or which caused the death of the animal data should be entered again as two matrices. Matrix A should containn the number of animals which died of a tumor or had a tumor diagnosed during the week. Matrix B should contain the number of animals still alive without a diagnosed tumor at the beginning of the week.

# Installation

```
devtools::install_github("jstansfield0/TumorRate")
```

# Usage

Input data from Peto 1974.

```
# Using example data from paper
t1 <- matrix(c(0, 0, 0,
               1, 0, 1,
               2, 0, 5,
               2, 1, 11,
               3, 1, 3,
               1, 0, 0), nrow = 3, ncol = 6, 
             byrow = FALSE)
t2 <- matrix(c(4, 7, 12,
               5, 5, 10,
               7, 8, 15,
               10, 12, 28,
               9, 8, 3,
               2, 3, 0), nrow = 3, ncol = 6, 
             byrow = FALSE)

```

Perform the chi-squared test.

```
TumorRate(t1, t2)
```

# Reference

Peto R. Editorial: Guidelines on the analysis of tumour rates and death rates in experimental animals. Br J Cancer. 1974;29(2):101–105.
