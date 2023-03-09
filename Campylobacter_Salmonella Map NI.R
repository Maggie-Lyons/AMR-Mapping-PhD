rm (list = ls (all.names = TRUE))

library(rgdal)
library(rgeos)     
library(tmap)      
library(tmaptools) 
library(RColorBrewer)
library(sf)
library(dplyr)
library(sp)
library(raster)
library(rgdal)
library(maptools)
library(mapsf)
library(tidyverse)
library(ggplot2)
library(shinyjs)
library(sf)


TBFNI<-read.csv("C:/Users/magsm/OneDrive - Queen's University Belfast/R/TBF_NI.csv", fileEncoding = 'UTF-8-BOM')


# Thu Mar  9 10:21:22 2023 ------------------------------

##mapview
TBFNIMap <- st_as_sf(TBFNI, coords = c("long", "lat"))##transforming my coordinares to an sf object

st_crs(TBFNIMap) <- 4326

UnitedKingdom1<-st_read(dsn = "C:/Users/magsm/OneDrive - Queen's University Belfast/R/R Datasets", layer="GBR_adm2")

class(UnitedKingdom1)

NorthernIreland <- UnitedKingdom1 %>% filter (NAME_1=="Northern Ireland")

mapview(NorthernIreland) + mapview(TBFNIMap, zcol = "deer_species", layer.name = "Species")

mapview(NorthernIreland, alpha.regions = 0, col.regions = RColorBrewer::brewer.pal(11, "RdYlGn")) + mapview(TBFNIMap, zcol = "deer_species", layer.name = "Species", col.regions = c("dodgerblue4", "red", "yellow"), legend=TRUE, cex="count", size=0.5, alpha.regions= 0.8)