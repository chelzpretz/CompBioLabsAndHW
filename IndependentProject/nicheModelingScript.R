### Niche Modeling Script

## The start of the project! 
#set directory (everything for this project is in this folder)
setwd("/Users/Chelsea/Documents/CompBioClass/ComputationalBiology/IndependentProject/")

#source the needed materials for this project:
  # Open libraries
source(librariesNeed.R)
  # Open home-made functions
source()

######################################################################
########### Part 1: Loading & Filtering Data #####################




######################################################################
############  Part 2: Plot out location points #######################


#Need map the shows US amd mexico 
data("wrld_simpl")
plot(wrld_simpl, xlim = c(-115, -95), ylim=c(15, 50))
axis(1)
axis(2)

#Read in occurance points 


#plot points on map

######################################################################
######### Part 3: Maxent Niche Modeling   ############################


# import polygons to delimit our maps to our region of interest
NAm <- extent(-115, -95, 15, 50) #This is just North America (minus Canada)
