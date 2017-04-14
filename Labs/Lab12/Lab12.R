# Lab 12

#1. Write a function that simulates this stochastic model of population dynamics.
#   Your function should take three arguments: (i) r, (ii) k, (iii) the total number of generations to simulate, and (iv) the initial value of abundance. 
#   As default values of these parameters, I suggest using r = 0.1, k = 100, gens = 100, n_init = 10.

stochasticGrowth <- function(r, k, generations, intitualAbund){ #open up function with starting values
  #get an "empty" vector to store popultion abundance over time
  n <- rep(intitualAbund, generations) 
  #create a for-loop the runs through the code
  for(i in 2:generations){
    expected <- n[i -1] + r * n[i - 1] * (k - n[i - 1]) / k  #this caculates the fixed/average growth rate
    realized <- rpois(n = 1, expected) #the takes the expected value and addes stochasicity to it using the possion value
    n[i] <- realized
    }
 return(n) #the returns the value n
}

#Running the function with the values listed above
xx <- stochasticGrowth(.1, 100, 100, 10)

# 2. Make a plot of the resuls that your function returns with the defaults suggested above.
plot(xx, type = "l", xlab = "Time(generations)", ylab = "Aboundance", main = "Stochastic Growth Rate", lwd = 2)
  abline(100, 0, lwd = 3, col = "red")

# 3. Assuming n[1] = 10, using the default parameters given above, do the following:
  
r <- .1
generations <- 100
k <- 100
n_init <- 10

#make a vector of what the abundance of the 2nd population 
expected <- n_init + r * n_init * (k - n_init) / k  #this caculates the fixed/average growth rate
realized <- rep(NA, 1000) 
realized <- rpois(n = 1000, expected)
#  (i) Calculate the probability that the population size does not change from n[1] to n[2].
count <- length(which(realized == n_init))
Same <- count/ length(realized) #this is the rate of population size not changing be t1 and t2

#  (ii) Calculate the probability that the population shrinks from n[1] to n[2].
countLess <- length(which(realized > n_init))
Less <- countLess/ length(realized)

#  (iii) Calculate the probability that the population increases from n[1] to n[2].
countMore <- length(which(realized < 10))
More <- countMore/ length(realized)

#  Hint: your calculations from steps (i) - (iii) should sum to 1
Same + Less + More

#  (iv) Calculate the probability that n[2] is between 15 and 25 (inclusive of those numbers)
between <- length(which(realized > 15 & realized < 25))
between / length(realized)

#  (v) Calculate the probabilty that the population goes extinct at generation 2.
dead <- length(which(realized == 0))
dead / length(realized)
