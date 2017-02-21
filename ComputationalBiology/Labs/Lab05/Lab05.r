#Lab 5: Loops and Conditionals 

#Step 1: make a vector of numbers, and make an if else statement if the number is greater of larger than 5

x <- c(2, 4, 5, 6, 3, 8, 9)

for(i in 1:length(x)){
  if(x[i] > 5) {
    cat(paste("Element #", i, "is greater than 5\n"))
} else {
  cat(paste("Element #",i, "is less than 5\n"))
  }
}

#Pull Vector1.csv from Sam's github folder and import data

vector1 <- read.csv("/Users/Chelsea/Documents/ComputationalBiology/CompBio_on_git/Labs/Lab05/Vector1.csv")

#2a. Using a for() loop, write code that checks each value in the imported data and replaces every negative value with NA.
for(i in seq(1,length(vector1$x))){
  if(vector1[i, 1] < 0){
    vector1[i, 1] <- NA
  }
}

#2b. Using a which() statement (not a loop), replace all those NA values with zeroes.
NAvectors <- which(is.na(vector1))
vector1[NAvectors, 1] <- 0

#2c. Using any method of your choice, create a new vector of data that has all the values from the imported data that fall in the range between 50 and 100.
vector50.100 <- which(vector1 > 50 & vector1 < 100)
newvector50_100 <- vector1[vector50.100, 1]

#3 Import the data on CO2 emissions from last week ("CO2_data_cut_paste.csv" from Lab04). Use code to answer the following questions. Hint: you do NOT need to use any loops here. Use which() and indexing:
emissions <- read.csv("/Users/Chelsea/Documents/ComputationalBiology/CompBio_on_git/Labs/Lab04/CO2_data_cut_paste.csv")

#3a. What was the first year for which data on "Gas" emissions were non-zero?
colnames(emissions)
notzero <- emissions$Year[which(emissions$Gas != 0)] #making a vector of years that gas emissions was not zero
notzero[1]

#3b. During which years were "Total" emissions between 200 and 300 million metric tons of carbon?
total200_300 <- emissions$Year[which(emissions$Total > 200 & emissions$Total < 300)]

#______________________________________________________________________________________
#Part 2

totalGenerations <- 1000
initPrey <- 100     # initial prey abundance
initPred <- 10      # initial predator abundance
a <- 0.01       # attack rate
r <- 0.2        # growth rate of prey
m <- 0.05       # mortality rate of predators
k <- 0.1        # conversion constant of prey into predators

#Make some vectors
t <- seq(1, totalGenerations)   #time
n <- rep(1, totalGenerations)   #over time
p <- rep(1, totalGenerations)   #stored values


for(i in seq(2, length(t))){
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
if(n[t] < 0){
    n[t] <- 0
  }
}
