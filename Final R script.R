setwd("~/Desktop/Final GIS Project Data")

library(raster)
library(tidyverse)
library(sf)
library(plotly)
library(tmap)
library(sjPlot)
library(sjmisc)
library(sjlabelled)
library(ggplot2)
library(readr)
library(dplyr)
library(spdep)
library(spatstat)
library(ncf)
library(maptools)
library(spgwr)

zonal <- st_read("Zonal_AverageTract.shp")
zonal
model <- lm(X_mean ~ X2018Medi_1, data = zonal, na.action = na.omit)
summary(model)
tab_model(model, show.se = TRUE, show.stat = TRUE, p.style = "stars", file = "table.doc")

install.packages("ggpubr")
library("ggpubr")
ggscatter(zonal, x ="X2018Medi_1", y ="X_mean", add = "reg.line", conf.int= TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Median Income per Census Tract", ylab = "Average Density Value per Census Tract")



