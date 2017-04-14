## Lab 11: Generating Pseduo-Random Number and Smaples

# This lab will over generating random numbers and sampling and how to 
#incorpate these tools into biological modeling.

## The function to used to make a ramdon binomial distribution 
  # rbinom(n, size, prob)

# Flipping a coin 10 differnet times with the successful trail being "tails"
rbinom(n = 1, size = 10, prob = 0.5) # simulating 10 coin flips (once)

#Flipping a coin 10 differetn times for 8 times 
rbinom(n = 8, size = 10, prob = 0.5) # simulating 10 coin flips (8 times)

# The next the next could questions the probability of getting the flu is 40% if you do NOT get the flu vaccine, and 15% if you vaccinated.

#Q1: In an R script, write a line of code that would simulate the number of people who get the flu in a sample of 20 vaccinated people.
rbinom(n = 1, size = 20, prob = 0.15)

#Q2: In the same R script, write a line of code that would simulate the number of people who get the flu in a sample of 20 unvaccinated people.
rbinom(n = 1, size = 20, prob = 0.4)

#Q3: Continuing in your script, write lines of code that would create 30 replicates of the scenario described above in Q1, 30 replicates of Q2, and make frequency histograms of the outcomes of each. 
#Hint: this should only take 4 lines of code total. 
#Hint: use hist(). Comparing these two histograms, does anything surprise you about them?
infectedVac <- rbinom(n = 30, size = 20, prob = 0.15) #this looks at 30 different sample sets of 20 people who are vaccinated and would be likely to still get the flu
infectedUNVac <- rbinom(n = 30, size = 20, prob = 0.4) #this looks at 30 different sample sets of 20 people who are unvaccinated and the probabilty of getting the flu
par(mfrow = c(1, 2))
hist(infectedVac, col = "blue", main="Vacinated People who get the Flu", ylab= "Number of Trails (total 30)", xlab= "# of people Infected (total 20 sampled)")
hist(infectedUNVac, col = "red", main="Unvacinated People who get the Flu", ylab= "Number of Trails (total 30)", xlab= "# of people Infected (total 20 sampled)")

#Q4: . Suppose you have a population of N = 500 individuals with a fixed size in each generation, and generations are non-overlapping. 
#Suppose further that individuals are haploid, and that, at a given (focal) locus, there are two alleles currently in the population. 
#At some initial time point, one allele is present in 275 (55%) of the individuals, and thus the other allele is present in 45% of the individuals. 
#Let's call the more common allele a and the less common allele b. Assuing that the two alleles are neutral, simulate going forward one generation in time. 
#What is the frequency of the a allele in the next generation in your results?
rbinom(n=1, size= 500, prob = 0.55) #the probabilty of getting a allele in the next generation 

#Q5: Using the information given in problem Q4, start from the same initial conditions, but go forward 1000 generations. 
#Hint: the prob parameter must be updated in each generation. 
#Hint: this will require a loop.

generations <- 1000 #number of generations
popsize <- 500  #fixed population size
Allele_a <- rep(NA, generations) #making an empty container for output of allele a in popualtion after each generations
Allele_a[1] <- 275 #the starting frequency of allele a

for(i in 1:generations){ #start for-loop to run though all the generations
  Allele_a[i + 1] <- rbinom(n = 1, size = popsize, prob = (Allele_a[i]/popsize)) #Finds the number of individuals in a population with probability of allele fequencey in the current generation
}

# Q6: Plot of the results from Q5. (x-axis = generations, y-axis = frequency of a allele)
par(mfrow = c(1,1))
plot(Allele_a, type = "l", lwd = 2, col = "purple", main = "Allele Fequencey in Population", xlab= "Generations", ylab= "frequency of allele a")

#Write additional code to create 100 replicates of the simulation in Q5. 
#Using the results from your 100 replicates, write code to (i) plot 10 replicates on one figure, 
#(ii) determine how many replicates ended with the a allele fixed, (iii) determine how many replicates ended with the b allele fixed, and 
#(iv) determine how many replicates ended with both alleles still present in the population.

numberReps <- 100
modelRep <- matrix(data = NA, nrow = numberReps, ncol = generations, byrow = TRUE) #creating a contianer for the replications 
modelRep[,1] <- 275

for(j in 1:numberReps){
  for(i in 1:(generations - 1)){ #start for-loop to run though all the generations
    modelRep[j, i + 1] <- rbinom(n = 1, size = popsize, prob = (modelRep[j, i]/popsize)) #Finds the number of individuals in a population with probability of allele fequencey in the current generation
  }
  print(j)
}

#Plot of the first 10 replications 
plot(modelRep[1,], type= "l", xlab= "generations", ylab = "Frequencey of Allele A", main = "Allele Frequencey")
  lines(modelRep[2,], col = "red")
  lines(modelRep[3,], col = "blue")
  lines(modelRep[4,], col = "green")
  lines(modelRep[5,], col = "purple")
  lines(modelRep[6,], col = "yellow")
  lines(modelRep[7,], col = "coral")
  lines(modelRep[8,], col = "chartreuse")
  lines(modelRep[9,], col = "darkgoldenrod")
  lines(modelRep[10,], col = "darkblue")
  