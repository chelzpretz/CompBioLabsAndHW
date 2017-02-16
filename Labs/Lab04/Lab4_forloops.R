#Lab 4: Learning for-loops

#Step 1- Write a for-loop that prints the word "hi" 10 times

for(i in 1:10){
  print("hi")
}

#Step 2- TIme currently has $10, each week he get $5 but pays two pack of gum with 
#costing $1.34. How much does he have after eight weeks?

piggybank <- 10
WeeklyIncome <- 5
gum <- 1.34

for(i in 1:8){
  week <- WeeklyIncome - (gum*2)
  piggybank <- week + piggybank
  print(piggybank)
}

#Step 3- A population size is 2000 and is shrinking 5% each year 
#what will it be after 7 years?

popsize <- 2000
shrinkingrate <- .05

for(i in 1:7){
  popsize <- popsize - (popsize*shrinkingrate)
  cat(i ) 
  pring(popsize)
}

#Step 4-modeling population growth  
#n[t] = n[t -1] + (r * n [t-1] * (K - n[t-1])/K))
#n[t] = abundance t= time r= rate K= carrying capacity 

K <- 10000
r <- 0.8
popabund <- rep(NA, 12)
popabund[1] <- 2500


for(i in 2:12){
  popabund[i] <- popabund[i-1] + (r * popabund[i-1] * (K - popabund[i-1])/K)
  print(popabund[i])
}

################################################
#Part 2: Practicing write loops and sorting data

#Step 1a: Rep a vector of zero 18 time
x <- rep(0, 18)

#Step 1b: For-loop muliplying each row by 3

for(i in 1:18){
  x[i] <- i * 3
}

#Step 1c: make first 1 with the rest zeros
y <- rep(0, 18)
y[1] <- 1
y

#Step 1d: using the vector above 1 + (2 * previousvalue)

for(i in 2:18){
  y[i] <- 1 +(2*y[i-1])
}

#Step 2: make a for loop that displays the first 20 Fibonacci numbers
fib <- rep(1, 20)

for(i in 2:20){
  fib[i+1] <- fib[i-1] + fib[i]
}

#Step 3: Re-do step 4 of 1 with storing values time and abundance and plot
popabund
time <- 1:12

plot(x=time, y=popabund, main="Growth Rate over Time", xlab="Generations", ylab="Population Size")
abline(a=1, b=12, h=K, col="red", lwd=3)

#Step 4: Downloaded file from Sam's github, lab 4 folder.  
#4a: Read data into r
setwd("/Users/Chelsea/Documents/ComputationalBiology/Labs/Lab04/")
emissions <- read.csv("/Users/Chelsea/Documents/ComputationalBiology/Labs/Lab04/CO2_data_cut_paste.csv")
colnames(emissions)

#4b: Find percent change between years of everything except year
percentMax <- matrix(NA, nrow=265, ncol= 8) 

for(i in 2:ncol(emissions)){
  for(j in 2:nrow(emissions)){
    percentMax[j, i] <- (((emissions[(j - 1), i])-emissions[j, i]) - emissions[j,i]) * 100
  }
}
