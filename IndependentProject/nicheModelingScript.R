### Niche Modeling Script

## Start the project! 
#set directory (everything for this project is in this folder)
setwd("/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")

#source the needed materials for this project:
  # Open libraries
source("librariesNeeded.R")
  # Open home-made functions
source()

######################################################################
########### Part 1: Loading & Filtering Data #####################
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

#Need map the shows US amd mexico 
data("wrld_simpl")


#Read in occurance points 
for(i in 1:length(desiredSpp)){
  data <- read.csv(paste(desiredSpp[i], "LongLat.csv")) 
  plot(wrld_simpl, xlim = c(-115, -95), ylim=c(15, 50))
  axis(1)
  axis(2)
  points(data[,1], data[,2], col="green", pch=2)
  }



#plot points on map

######################################################################
######### Part 3: Maxent Niche Modeling   ############################


# import polygons to delimit our maps to our region of interest
NAm <- extent(-115, -95, 15, 50) #This is just North America (minus Canada)
