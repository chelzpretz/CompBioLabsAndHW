##Lab 09: Novel Problem Solving

#Goals for this lab:

#practice being resourceful to solve new challenges
#practice parsing input data and converting it to different data types
#practice writing your own functions

#Start of lab:
#Import camera data file from Sam's github
camData <- read.csv("/Users/Chelsea/Documents/CompBioClass/CompBio_on_git/exampleData/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv")

#Problem is to find the difference between time that pictures have been taken. Want to find time in minutes.

#create a for loop to got thourgh all dates and times and make a vector
#Start for loop inputing 
for(i in 1:length(camData$DateTime)){
#Parse out date/time with data, and time in their each row
  datetime <- camData$DateTime
  datetime <- strptime(as.character(datetime), format = "%d/%m/%Y %H:%M")
  #Can find the difference between dates
  difftime <- (datetime[i+1] - datetime[i])
}

#make this solution into a fuction so it can be repeated
calcTimeDiff <- function(starttime, secondtime){
  difftime <- (startime - secondtime)
}

#Write another function that takes four arguments: 
  #(i) the data (all the camera trap data), 
  #(ii) Placement, (iii) Season, and (iv) Station. 
#For a given Placement, Season, and Station, the function should return a vector of time intervals betweeen consecutive camera trappings.

locationsTimeDiff <- function(data, Placement, Season, Station){
  counter = 1 
  for(i in 1:length(data)){
    if(Placement[i] == Placement[i+1]){
      if(Season[i] == Season[i + 1]){
        if(Station[i] == Station[i + 1]){
        }else{
          counter <- counter + 1
        }
      }
    }
  }
    locationDiff <-matrix(data=1, nrow=counter, ncol=4)
    for(i in 1:length(data)){
      if(Placement[i] == Placement[i+1]){
        if(Season[i] == Season[i + 1]){
          if(Station[i] == Station[i + 1]){
            locationDiff <- calcTimeDiff(data[i+1], data[i])
          }
        }
      }
    }
      return(locationDiff)
  }
    