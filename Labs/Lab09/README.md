## Lab 09 README

### In the r-script 

#### The data
In lab 09 r-script camera data is imported. This data is set up with the rows being a picture taken
each picture has six different data point to it. The six different data points are:

1. Reference -- this is simply a reference number for the picture.
2. Placement -- this decripts if the placement of the camera was either on the trail or randomly placed.
3. Season -- this has two differnt seasons-- dry and wet
4. Station -- is a unqiue number of the camera's location with 54 different sites
5. Species -- is a list of species that where captured by the camera
6. DateTime -- This is a time stamp of when the picture was taken month/day/year hour:minute (given in milatry time)

#### Time between pictures
The next part of the r-script runs through the a for loop the finds the difference between when photos where taken.

Then the next part makes a fuction that finds the difference in times.

The last function takes takes the date, placement, season, and station to determine just the difference a photo is taken 
from a specific camera. 