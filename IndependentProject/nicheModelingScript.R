### Niche Modeling Script ###

## Start the project! 
#set directory (everything for this project is in this folder)
setwd("/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")

#source the needed materials for this project:
  # Open libraries
source("librariesNeeded.R")


######################################################################
########### Part 1: Loading & Filtering Data #########################
#load in csv of raw data
wholeGenusRaw <- read.csv("WholePhysalisGenus.csv")

## make a vector of desired species (only using the species name and call from specificEpithet)
desiredSpp <- c("crassifolia", "heterophylla", "virginiana", "philadelphica")

## Subset data to only desired species


for( i in 1:length(desiredSpp)){ #start for-loop to loop through desiredSpp
  rowsIwant <- desiredSpp[i] == wholeGenusRaw$specificEpithet #Make a dataframe the takes in only ith desiredSpp
  data <- wholeGenusRaw[rowsIwant,] # make a vector with only desired spp of all rows
  print(dim(data)) # quality check for each 
  write.csv(data, paste(desiredSpp[i], ".csv"), row.names = FALSE) # write a csv for the ith desiredspp with all rows
## Subset data to only have lat/log colunm 
  newData <- data[,64:65]  # only takes the lat/long 
  newData <- na.omit(newData) #remove all the NA 
  print(dim(newData)) # quality check for each 
  write.csv(newData, paste(desiredSpp[i], "LongLat.csv"), row.names = FALSE )   # write a csv for the ith desiredspp with only long.lat
}


######################################################################
############  Part 2: Plot out location points #######################

for(i in 1:length(desiredSpp)){
  data <- read.csv(paste(desiredSpp[i], "LongLat.csv")) #Read in occurance points 
  pdf(paste(desiredSpp[i], ".pdf"), width=7, height=7)  # save map as a pdf
  plot(wrld_simpl, xlim = c(-110, -95), ylim=c(10, 48), main= (desiredSpp[i])) #plot points on map
  points(data[,2], data[,1], col="darkgreen", pch=1) #add points to the map
  dev.off()   # saves the above plot functions as a pdf
}

######################################################################
######### Part 3: Maxent Niche Modeling   ############################
###### Used Dismo and Julia Dupin for Coding #########################


##### STEP 1: Loading In the Data #####

## predictors_selected_RasterStack.R file

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

setwd("C:/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")

#import polygons to delimit our maps to our region of interest
for (i in 1:length(desiredSpp)){
  data <- read.csv(paste(desiredSpp[i], "LongLat.csv")) #Read in occurance points 
  # make occurance points long/lat
  data <-subset(data, select=c("decimalLongitude", "decimalLatitude"))
  #This is just the area for a species spp. 
  NAm <- extent(min(data[,1])-1, max(data[,1])+5, min(data[,2])-1, max(data[,2])+5) 
  #reading in environmental data 
  setwd("/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/layers/")
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
  writeRaster(bio21, "bio21.asc", format="ascii")
  bio22 <- crop(bio22_l, NAm)
  writeRaster(bio22, "bio22.asc", format="ascii")
  bio23 <- crop(bio23_l, NAm)
  writeRaster(bio23, "bio23.asc", format="ascii")
  bio24 <- crop(bio24_l, NAm)
  writeRaster(bio24, "bio24.asc", format="ascii")
  setwd("C:/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")
  ###This stacks all the non-corralated layers 
  layers <- stack(bio20, bio21, bio22, bio23, bio24)
  predictors_selected <- stack(bio1, bio2, bio5, bio12, bio16, bio18)
  
  predictors_selected_11 <- stack(layers, predictors_selected)
  
  
  #create a mask layer so the model knows which parts are to be used (land) and which aren't (water). It uses one (any) of the layers in the raster stack, in this case layer 1
  mask <- raster(predictors_selected_11)
  
  #object that will be used for plotting the maps with the mask, extent, background points and presence points
  r <- raster(predictors_selected)
  #extract varibale values for all locations
  presvals_sp <- extract(predictors_selected_11, data)
  #check if there are NAs, some percentage of the total is ok (less than 10%)
  #sum of both values (result from the next 2 commands) divided by the number of layers should give you the number of location points
  #this number should be the same as the one maxent will warn you about
  sum(is.na(presvals_sp))
  sum(!is.na(presvals_sp))
  presvals_sp <- na.omit(presvals_sp)
  #set seed for random point generator
  set.seed(1)
  # to avoid sampling bais -- select random points 
  bg <- randomPoints(mask, 200, ext=NAm, excludep=FALSE, extf=1)
  absvals_sp <- extract(predictors_selected_11, bg)
  pb_sp <- c(rep(1, nrow(presvals_sp)), rep(0, nrow(absvals_sp)))
  sdmdata_sp <- data.frame(cbind(pb_sp, rbind(presvals_sp, absvals_sp)))
  
  groups <- kfold(data, 4)
  pres_train_sp <- data[groups != 1, ]
  pres_test_sp <- data[groups == 1, ]
  colnames(bg) <- c('lon', 'lat')
  
  groups <- kfold(bg, 4)
  backg_train_sp <- bg[groups != 1, ]
  backg_test_sp <- bg[groups == 1, ]
  
  #Check that the mask and extent delimitations worked by plotting all points
  pdf(file=paste(desiredSpp[i], "CheckPointMap.pdf", sep="_"), width=9.99, height=10)
  plot(!is.na(r), col=c('white', 'light grey'), legend=FALSE, xlim=c(-120,-95),ylim=c(10,48))
  plot(NAm, add=TRUE, col='red', lwd=2)
  points(backg_train_sp, pch='-', cex=0.5, col='darkred')
  points(backg_test_sp, pch='-', cex=0.5, col='black')
  points(pres_train_sp, pch= '+', col='green')
  points(pres_test_sp, pch='+', col='blue')
  dev.off()
  
  
  print(paste("All objects have been loaded successfully for", desiredSpp[i], sep=" "))
  
  ##### STEP 2: MAXENT #####
  # the 'maxent.jar' file has to be placed in the package folder, in my case it is "/Users/Chelsea/Documents/R/win-library/3.1/rjava/maxent/maxent.jar "
  jar <- paste(system.file(package="dismo"), "C:/Users/Chelsea/Documents/R/win-library/3.1/dismo/java/maxent/maxent.jar", sep='')
  
  #estimate the model
  mx_sp <- maxent(predictors_selected_11, pres_train_sp, a=backg_train_sp) #, factors=NULL, removeDuplicates=TRUE)
  
  #plot variable contribution
  pdf(file=paste(desiredSpp[i], "VariableContribution.pdf", sep="_"))
  plot(mx_sp)
  dev.off()
  
  #plot variable response plots
  pdf(file=paste(desiredSpp[i], "VariableResponses.pdf", sep="_"), width=15, height=15)
  response(mx_sp)
  dev.off()
  
  #evaluate the model
  e <- dismo::evaluate(pres_test_sp, backg_test_sp, mx_sp, predictors_selected_11)
  #save evaluation results
  sink(paste(desiredSpp[i], "Maxent_ModelEval.txt", sep="_"))
  e
  sink()
  
  #apply model
  px_sp <- predict(predictors_selected_11, mx_sp, ext=NAm, progress='')
  
  #plot model results
  pdf(file=paste(desiredSpp[i], "Maxent_PredictionThreshold.pdf", sep="_"), width=17, height=10)
  par(mfrow=c(1,2))
  plot(px_sp, main='Maxent, raw values')
  plot(wrld_simpl, add=TRUE, border='dark grey',xlim=c(-115,-95),ylim=c(15,50))
  tr_sp <- threshold(e, 'spec_sens')
  plot(px_sp > tr_sp, main='presence/absence')
  plot(wrld_simpl, add=TRUE, border='dark grey',xlim=c(-115,-95),ylim=c(15,50))
  points(sp, pch='+')
  dev.off()
  
  save.image(file=paste(desiredSpp[i], "Maxent.RData", sep="_"))
  
  print(paste("MAXENT is done for", desiredSpp[i], sep=" "))
  
  ##### STEP 3: GLM #####
  train_sp <- rbind(pres_train_sp, backg_train_sp)
  pb_train_sp <- c(rep(1, nrow(pres_train_sp)), rep(0, nrow(backg_train_sp)))
  envtrain_sp <- extract(predictors_selected_11, train_sp)
  envtrain_sp <- data.frame(cbind(pa=pb_train_sp, envtrain_sp))
  head(envtrain_sp)
  
  testpres_sp <- data.frame(extract(predictors_selected_11, pres_test_sp))
  testbackg_sp <- data.frame(extract(predictors_selected_11, backg_test_sp))
  
  #estimate the model
  glm_sp <- glm(envtrain_sp$pa ~ 
                  Altitude + Annual.Mean.Temperature + Mean.Temperature.Warmest.Quarter + Annual.Precipitation + Precipitation.Seasonality + Precipitation.Driest.Quarter + Precipitation.Warmest.Quarter + Mean.Diurnal.Range + Soil.Organic.Carbon.0.3m + Soil.Organic.Carbon.0m + Soil.pH.0m , family = gaussian(link = "identity"), data=envtrain_sp)
  
  #save model results
  sink(paste(desiredSpp[i], "GLM_summary.txt", sep="_"))
  summary(glm_sp)
  sink()
  
  #evaluate the model
  glm_eval_sp <- dismo::evaluate(testpres_sp, testbackg_sp, glm_sp)
  sink(paste(desiredSpp[i], "GLM_ModelEval.txt", sep="_"))
  glm_eval_sp
  sink()
  
  #apply model
  pg_sp <- dismo::predict(predictors_selected_11, glm_sp, ext=NAm)
  
  #plot model results
  pdf(file=paste(desiredSpp[i], "GLM_PredictionThreshold.pdf", sep="_"), width=17, height=10)
  par(mfrow=c(1,2))
  plot(pg_sp, main="GLM/gaussian, raw values")
  plot(wrld_simpl, add=TRUE, border="dark grey")
  tr_sp <- threshold(glm_eval_sp, "spec_sens")
  plot(pg_sp > tr_sp, main="presence/absence")
  plot(wrld_simpl, add=TRUE, border="dark grey")
  points(sp, pch="+")
  dev.off()
  
  save.image(file=paste(desiredSpp[i], "GLM.RData", sep="_"))
  
  print(paste("GLM is done for", desiredSpp[i], sep=" "))
  
}

