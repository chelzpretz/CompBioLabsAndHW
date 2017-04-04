### Lab 08--The function 
This document is the second function from [Lab07](https://github.com/chelzpretz/ComputationalBiology/blob/master/Labs/Lab07/Lab07_BuildingFunctions.r). For more information about this code visit Lab08_Metadata.

Discrete-time logistic growth model function 
`decLogGrowth <- function(initsize=10, generations=10, r=.02, K=1000){ #start of funciton with defaults  
  abundance <- rep(initsize, generations)  #make empty abundance container  
  for(i in 2:length(abundance)){           #start for loop  
  abundance[i] = abundance[i-1] + ( r * abundance[i-1] * (K - abundance[i-1])/K ) #declog growht equation  
  }  
  plot(abundance, xlab="generations") #plot the results   
  return(abundance) #return the abundence data  
}`  

Run the defaults of the function.
`decLogGrowth()`

Make table 
`write.csv(abundance, file = "growthModel_init10_gen10_r.02_K1000.csv")`