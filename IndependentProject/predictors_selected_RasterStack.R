#predictors_selected_RasterStack.R file


#set the working directory
setwd("/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/layers/")

bio1_l <- raster("bio_1.bil")
bio2_l <- raster("bio_2.bil")
bio5_l <- raster("bio_5.bil")
bio12_l <- raster("bio_12.bil")
bio16_l <- raster("bio_16.bil")
bio18_l <- raster("bio_18.bil")
bio20_l <- raster("BLDFIE_M_sl1_1km_ll.tif")
bio21_l <- raster("CLYPPT_M_sl1_1km_ll.tif")
bio22_l <- raster("CRFVOL_M_sl1_1km_ll.tif")
bio23_l <- raster("SLTPPT_M_sl1_1km_ll.tif")
bio24_l <- raster("SNDPPT_M_sl1_1km_ll.tif")

#import polygons to delimit our maps to our region of interest
NAm <- extent(-120, -95, 10, 48) #This is just North America (minus Canada)

bio1 <- crop(bio1_l, NAm) #crops the imported raster
writeRaster(bio1, "bio1.asc", format="ascii") #this writes the raster
bio2 <- crop(bio2_l, NAm)
writeRaster(bio2, "bio2.asc", format="ascii")
bio5 <- crop(bio5_l, NAm)
writeRaster(bio5, "bio5.asc", format="ascii")
bio12 <- crop(bio12_l, NAm)
writeRaster(bio12, "bio12.asc", format="ascii")
bio16 <- crop(bio16_l, NAm)
writeRaster(bio16, "bio16.asc", format="ascii")
bio18 <- crop(bio18_l, NAm)
writeRaster(bio18, "bio18.asc", format="ascii")
bio20 <- crop(bio20_l, NAm)
writeRaster(bio20, "bio20.asc", format="ascii")
bio21 <- crop(bio21_l, NAm)
writeRaster(bio21, "bio18.asc", format="ascii")
bio22 <- crop(bio22_l, NAm)
writeRaster(bio22, "bio18.asc", format="ascii")
bio23 <- crop(bio23_l, NAm)
writeRaster(bio23, "bio18.asc", format="ascii")
bio24 <- crop(bio24_l, NAm)
writeRaster(bio24, "bio18.asc", format="ascii")

###This stacks all the non-corralated layers 
layers <- stack(bio20, bio21, bio22, bio23, bio24)
predictors_selected <- stack(bio1, bio2, bio5, bio12, bio16, bio18)

predictors_selected_11 <- stack(layers, predictors_selected)

setwd("C:/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")
