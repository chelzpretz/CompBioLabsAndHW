#### Part 2: Final Exam ####

## Question 9: Create a variable and store the number 5 in it.
xx <- rep(NA, 5)
xx
## Question 10: Make a vector with 5 elements, where each element is the number 23. 
xx <- rep(23, 5)
xx

## Question 11: . For the vector created in question 10, make the fourth element be 27.2. 
xx[4] <- 27.2
xx

# Question 12: Compose a function, written in R syntax, that takes two numerical inputs, sums them, and (1) returns the sum if it is non-negative, and (2) returns 0 if the sum is negative.  Write two lines of code that test it with examples.

sumPostive <- function(x, y){
  e <- x + y
  if(e < 0){
    e = 0
  }
  return(e)
}

sumPostive(4, -5)
sumPostive(4, 4)

# Question 13: Which the data provide do the following steps.
## Read in the data
data <- read.csv("C://Users/Chelsea/Documents/CompBioClass/ComputationalBiology/Final/data.csv")

## Write code that counts and prints (to the console) the total number of rows of data that in which the value in the second column is negative
length(which(data[,2] < 0))

## Write code that finds the row indexes of all the rows satisfying the condition in part b (i.e., the row indexes of the total number of rows of data that in which the value in the second column is negative).
which(data[,2] < 0)

## Write code that creates a new object consisting of only those rows of data that satisfy the condition in part b
NegRows <- which(data[,2] < 0)
newData <- data[NegRows, ]
newData


# Question 14: .  Here are the equations for the discrete-time Lotka-Volterra predator-prey model.  Note, we did this for lab, so feel free to use the corresponding lab for guidance and code. 
 
    #n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1]) 
    #p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])


  # Write a function that (a) iterates this model for the parameters given below, (b) makes a figure plotting the abundances of both species over time, and (c) returns the time series of data on each species abundance over time.  Note: negative numbers are not allowed for species' abundances.

totalGenerations <- 1000
initPrey <- 100 		# initial prey abundance
initPred <- 10		# initial predator abundance
a <- 0.01 			# attack rate
r <- 0.2 			# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators


Lotka_VolterraDISCRETE <- function(totalGenerations, initPrey, initPred, a, r, m, k){
  time <- seq(1, totalGenerations)
  n <- rep(initPrey, totalGenerations)
  p <- rep(initPred, totalGenerations)
  
  for(t in seq(2, length(time))){
    n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1]) 
    p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
    if(n[t] < 0){
      n[t] <- 0
    }
  }
  
  #plot 
  plot(x = time, y = n, type="l", col = "red", ylim = c(1, 1000), xlab = "time", ylab = "abundance", main="Lotka-Volterra Predator-Prey Model")
  lines(x = time, y = p, type="l", col = "blue")
  legend("topright", c("Preditor", "Prey"), col=c("blue", "red"), lwd=10)
  
  return( list (c(n, p)))
}

Lotka_VolterraDISCRETE(totalGenerations= 1000, initPrey= 100, initPred=10, a = a, r= r, m= m, k=k)

# Question 15: Turn the predator-prey model above into a differential equation model (a system of two "ordinary" differential equations).  Numerically "solve" the model in R for the exact same parameters given above.  Make a plot of your solution analogous to the plot you made for question 14.
library(deSolve)

pars <- c(a, r, m, k)
names(pars) <- c("a", "r", "m", "k")
time <- seq(0, totalGenerations, by = 1)
y <- c(initPrey, initPred)
## like above but now we have 2 y becuase we have two dynamic factor 

myLogisticODE <- function(t, y, parms){
  prey <- y[1] * (parms[r] * y[1]) - (parms[a] - y[1] * y[2])
  pred <- y[2] * (parms * parms[a] * y[1]  * y[2]) - (parms[m] * y[2])
  return( list (c(prey, pred)))
}

#call the solver
solution <- ode(y = y, times = time, func = myLogisticODE, parms = pars)

#plot 
plot(solution[,1], solution[,2], type="l", col = "red", ylim = c(1, 1000), xlab = "time", ylab = "abundance")
lines(solution[,1], solution[,3], type="l", col = "blue")



#### Part 4: Stochastic processes ####

# Question 16:  A grocery store is having a promotional period during which every customer has a 1 in 250 chance of being selected to get their groceries for free. 

ProbWinningcustomer <- 1/250
freeGroceries <- 250
totalCustomers <- 2000
winner <- 1

  # (16a).  For a given (specific, fixed) number of customers on a given day, what statistical distribution would you use to describe the number of customers who receive free groceries on that day?  Explain your choice with regard to the general properties of your chosen distribution.  Write your answer as a "comment" in your R script above.

probs <- rep(ProbWinningcustomer, freeGroceries) #setting probabilities 
rmultinom(n = 1, size = winner, prob = probs)


  # I choose a random distribtion since it is equally like to win during the 250 customers. 

  # (16b).  Write one or two lines of code that would use a random number generator to give you a number drawn from the distribution you named in part 16a.   Pick a total number of customers of your own choosing.
totalWin <- rmultinom(n = 5, size = winner, prob = probs) # out of 1250 customers
which(totalWin == winner) #the winner customer checkout position 

  #(16c).  In contrast to part 16a, suppose that the number of customers per day is instead a random variable and that customers arrive at a rate of 40 per hour.  What statistical distribution would you use to model the number of customers that arrive during a 10 hour day (assuming the rate of arrival is constant)?  Explain your choice with regard to the general properties of your chosen distribution.  Write this answer as a "comment" in your R script.

rateOfCust <- 40/1 #rate of customers per hour
FullDay <- rateOfCust * 10 #if the store is open 10 hours a day 
FullDayWin <- rmultinom(n = round(FullDay/freeGroceries), size = winner, prob = probs)
which(FullDayWin == winner)

  #(16d).  Write one or two lines of code that would use a random number generator to give you a number from the distribution you named in part 16c.
xx <- matrix(0, nrow = 365, ncol = 2)

for(i in 1:365){
  FullDayWin <- rmultinom(n = round(FullDay/freeGroceries), size = winner, prob = probs)
  qq <- which(FullDayWin == winner)
  xx[i,] <- qq
  if(xx[i, 2] > FullDay){
    xx[i, 2] <- 0
  }
}

plot(x= 1:365, y = xx[,1], main = "Winner per Day in a Year", ylab = "Winners", xlab ="Days in a Year", ylim= c(1,400))
  points(xx[,2], col="black")

  # (16e).  Given the information in part 16c, and assuming that customer arrivals are all independent of one another, what is the expected time lag between consecutive arrivals of customers, and what statistical distribution do you expect these times to follow?  Write this answer as a comment in your R script.
  differ <- abs(xx[,2] - xx[,1]) #position difference between customers 
  timediff <- differ/rateOfCust
  avglag <- mean(timediff)  # this would be the average time lag (in hours) bewteen winner
  avglag
  #This expected this to follow poison distrubtion 
  pnorm(avglag)
  