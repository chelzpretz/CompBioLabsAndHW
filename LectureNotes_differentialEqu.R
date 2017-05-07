#### Lecture April 24, 2017
## Differential equation

# Knows:
  #We know to the rate of change give a value of N

# Unknows:
  #the expliction funtion for N(t) for any time t

#This is super common in biology. Why? Becuaseu it is easier to describe the change than how.

#discrete time
 N[t +1] <- n[t] + r + n[t] * (k -n[t])/k
 
 #continous time 
 dn/ds <- r * n[t] * (k -n[t])/k
 
 #Note that they are very similar 
 
 #################################
#Using package function  
 ?ode()
  #oaranets and initial states
 r <- 2.8
 k <- 1000
 n0 <- 10
 endTime <- 25
 timeIncremetns <- 0.01
 
 #objects required by the solver
 times <- seq(from =0, to = endTime, by = timeIncremetns)
 params <- list(r,k)
 names(params) <- c("r", "k")
 
 #function requires specific requirements! stick to this format... 
 myLogisticODE <- function(t, y, parms){
    dydt <- y * params$r * ((params$k - y) / parms$k)
     return( list (dydt))
 }
 
 #call the solver
 solution <- ode(y = 0, times = times, func = myLogisticODE, parms = params)
 
 #plot 
 plot(solution[,1], solution[,2], type="l", xlab = "time", ylab = "abundance")
 
 
 ##############################################################################
 ##### Part 2 -- adding 2 - dimensions to the equation

# Lotka-Volterra 
 
#parametns:
K1 <- 1000
K2 <- K1
R1 <- 0.1 # 10% increase
R2 <- R1   #symetery 
a12 <- 0.8
a21 <- 0.7
n1 <- 10
n2 <- 85
time <- seq(0, 400, 0.01)

parms <- list(R1, R2, K1, K2, a12, a21)
names(parms) <- c("R1", "R2", "K1", "K2", "a12", "a21")

## like above but now we have 2 y becuase we have two dynamic factor 
myLogisticODE <- function(t, y, parms){
  dn1dt <- y[1] * parms$R1 * ((parms$K1 - y[1] - parms$a21*y[2]) / parms$K1)
  dn2dt <- y[2] * parms$R2 * ((parms$K2 - y[2] - parms$a12*y[1]) / parms$K2)
  return( list (c(dn1dt, dn2dt)))
}

#call the solver
solution <- ode(y = c(n1, n2), times = time, func = myLogisticODE, parms = parms)

#plot 
plot(solution[,1], solution[,2], type="l", col = "red", ylim = c(1, 1000), xlab = "time", ylab = "abundance")
lines(solution[,1], solution[,3], type="l", col = "blue")

 