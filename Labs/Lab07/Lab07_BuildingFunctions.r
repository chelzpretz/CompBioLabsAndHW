#Lab 07: Writing Your Own Functions

#Wrire a function that runs the fibonacci sequence

fibonacci <- function(firstNum=0, secNum=1, time=10){ #startNum is the starting number & t is how to to run
  n <- rep(1, time) #makes a container to hold all the numbers
  n[1] <- firstNum #assign the first number into vector
  n[2] <- secNum  #assign the second number into vector
  for(i in 2:length(n)){ #start a for loop 
    n[i +1] <- n[i] + n[i -1] #the fibonacci equation 
  }
  
  return(n) #return all numbers
}

fibonacci(1, 1, 10) #function starting with 1, 1
fibonacci(4, 5, 10)  #function starting with numbers greater than 3
fibonacci(-4, -5, 10)  #function starting with negative numbers 

fibonacci(0.1, 0.1, 10) #function starting with non-whole numbers 

#Problem 2-- Write an descrete-time logistic growth model
#Equation for model- 
#n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

#n[t] equal abundance; t = time; r= rate; k= carring capacity 

#a. Take parameters as arguments (inputs). This includes the following as parameters: 
#initial population size (n[1]), total number of generations, r, K.
#b. have default values for each of the arguments
#c. iterate the model
#d. make a plot with axes properly labeled.
#e. return the abundance data.

decLogGrowth <- function(initsize=10, generations=10, r=.02, K=1000){ #start of funciton with defaults
  abundance <- rep(initsize, generations)  #make empty abundance container
  for(i in 2:length(abundance)){           #start for loop
  abundance[i] = abundance[i-1] + ( r * abundance[i-1] * (K - abundance[i-1])/K ) #declog growht equation
  }
  plot(abundance, xlab="generations") #plot the results 
  return(abundance) #return the abundence data
}

decLogGrowth()


#Question 3-- write a function that turns a adjacency matrix into pairwise table

X <- matrix( c(0, 1, 1, 1, 0, 0, 1, 0, 0), nrow=3, ncol=3) #adjecency matrix


Matrix2Pairwise <- function(X){ #start of fuction, calls matrix
  NotZero <- which(X != 0)      #find all the non-zeros in matrix
  Pairwise <- matrix(rep(1, (length(NotZero)*3)), ncol=3) #makes new pairwise matrix container
  colnames(Pairwise) <- c("Row", "Column", "Value")   #Addes column names to pairwise matrix
  for(i in 1:ncol(X)){    #start for loop to run through all the cols of matrix
    for(j in 1:nrow(X)){  #continue down the runs
      if(X[i,j] != 0){    #if value is not zero add to pairwise matrix
      Pairwise[Column] <- i  #Takes i and add it to Column in pairwise
      Pairwise[Row] <- j     #Takes j and add it to Row in pairwise
      Pairwise[Value] <- [i, j] ##Takes value in i,j and adds it to pairwise
      }
    }
    
  }
  
  return(Pairwise) #returns pairwise matrix
}

