# Demo using ISLR's hitters dataset

library(ISLR)

source("bss.R")
source("fss.R")

hitters <- Hitters

fss(hitters[, -19], hitters[, 19], plot = TRUE)

bss(hitters[, -19], hitters[, 19], plot = TRUE)
