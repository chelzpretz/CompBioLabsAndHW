<<<<<<< HEAD
#Lab 3--Introduction to R
#Starwars watching party

#Lab Step #3
chips <- 5 #the number of flaming Hot Cheetos at the beginning of the party
guest <- 8 #the number of guest coming to the party

#Lab Step #5
consumption <- guest * .4 #we are guessing that guest are eating .4 bags of chips

#Lab step #7
leftover <- chips - (consumption + .4)
leftover
#This is how any bags of chips are leftover. Starting number of chip bags minus the consumption of chips from guest, plus consumption from yourself

#Lab step #8
#Ranking of the Starwars movie
self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#Lab step #9 
PennyIV <- Penny[4] #Penny's rank of the 4th starwars movie
LennyIV <- Lenny[4] #Lenny's rank of the 4th starwars movie

#Lab step #10 
movieRanks <- cbind(self, Penny, Jenny, Lenny, Stewie) #combinds all the ranks to on dataframe

#Lab step #11
structure(PennyIV) #The output is a single charactor of a number
structure(Penny) #The output is a vector of numbers
structure(movieRanks) #The output is a dataframe of numbers

#Lab step 12
#make the combinded "data frame" into a dataframe
dataFrame_ranks <- data.frame(self, Penny, Jenny, Lenny, Stewie)
df2 <- as.data.frame(movieRanks)

#Lab step 13
#The difference between is cbind is a matrix, and the columns are considered double,
#while data.frame is not a martix, columns are considered a list, and are stringed together.
#The similarities is the data is displaced the same way.

#Lab step 14
episode <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step 15
#Adding Row Names to matrix
row.names(movieRanks) <- episode
row.names(dataFrame_ranks) <- episode
row.names(df2) <- episode

#lab step 16
#Pulling out the thrid row from step 10
movieRanks[3, ]

#lab step 17
#Pulling out the forth row from step 12
dataFrame_ranks[4, ]

#Step 18
#Pulling out my ranking for Episode V
movieRanks[1, 5]

#Step 19
#Pulling out Penny's rank for Episode II
movieRanks[2, 2]

#Step 20
#Find everyone's ranking from episodes IV-VI
movieRanks[4:6, 1:5]

#Step 21
#Everyone's rank from II, V, VII
movieRanks[c(2, 4, 6), 1:5]

#Step 22
#Rank's from Penny, Jenny, Stewie for episodes IV and VI
movieRanks[c(4, 6), c(2, 3, 5)]

#Step 23
#Swaping Lenny's Episode II and V
NewII <- movieRanks[5, 4]
movieRanks[5, 4] <- movieRanks[2, 4]
movieRanks[2,4] <- NewII
movieRanks

#Step 24 
#Indexing with names
movieRanks["III", "Penny"]
dataFrame_ranks["III", "Penny"]

#Step 25 
#Redo the change is step 23 with names instead of numbers for indexing 
NewII <- movieRanks["V", "Lenny"]
movieRanks["V", "Lenny"] <- movieRanks["II", "Lenny"]
movieRanks["II", "Lenny"] <- NewII
movieRanks

#Step 26 re-do the step with same method Lenny's switch
NewV <- movieRanks["II", "Lenny"]
movieRanks["II", "Lenny"] <- movieRanks["V", "Lenny"]
movieRanks["V", "Lenny"] <- NewV
movieRanks
=======
#Lab 3--Introduction to R
#Starwars watching party

#Lab Step #3
chips <- 5 #the number of flaming Hot Cheetos at the beginning of the party
guest <- 8 #the number of guest coming to the party

#Lab Step #5
consumption <- guest * .4 #we are guessing that guest are eating .4 bags of chips

#Lab step #7
leftover <- chips - (consumption + .4)
leftover
#This is how any bags of chips are leftover. Starting number of chip bags minus the consumption of chips from guest, plus consumption from yourself

#Lab step #8
#Ranking of the Starwars movie
self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#Lab step #9 
PennyIV <- Penny[4] #Penny's rank of the 4th starwars movie
LennyIV <- Lenny[4] #Lenny's rank of the 4th starwars movie

#Lab step #10 
movieRanks <- cbind(self, Penny, Jenny, Lenny, Stewie) #combinds all the ranks to on dataframe

#Lab step #11
structure(PennyIV) #The output is a single charactor of a number
structure(Penny) #The output is a vector of numbers
structure(movieRanks) #The output is a dataframe of numbers

#Lab step 12
#make the combinded "data frame" into a dataframe
dataFrame_ranks <- data.frame(self, Penny, Jenny, Lenny, Stewie)
df2 <- as.data.frame(movieRanks)

#Lab step 13
#The difference between is cbind is a matrix, and the columns are considered double,
#while data.frame is not a martix, columns are considered a list, and are stringed together.
#The similarities is the data is displaced the same way.

#Lab step 14
episode <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step 15
#Adding Row Names to matrix
row.names(movieRanks) <- episode
row.names(dataFrame_ranks) <- episode
row.names(df2) <- episode

#lab step 16
#Pulling out the thrid row from step 10
movieRanks[3, 1:5]

#lab step 17
#Pulling out the forth row from step 12
dataFrame_ranks[4, 1:5]

#Step 18
#Pulling out my ranking for Episode V
movieRanks[1, 5]

#Step 19
#Pulling out Penny's rank for Episode II
movieRanks[2, 2]

#Step 20
#Find everyone's ranking from episodes IV-VI
movieRanks[4:6, 1:5]

#Step 21
#Everyone's rank from II, V, VII
movieRanks[c(2, 4, 6), 1:5]

#Step 22
#Rank's from Penny, Jenny, Stewie for episodes IV and VI
movieRanks[c(4, 6), c(2, 3, 5)]

#Step 23
#Swaping Lenny's Episode II and V
NewII <- movieRanks[5, 4]
movieRanks[5, 4] <- movieRanks[2, 4]
movieRanks[2,4] <- NewII
movieRanks

#Step 24 
#Indexing with names
movieRanks["III", "Penny"]
dataFrame_ranks["III", "Penny"]

#Step 25 
#Redo the change is step 23 with names instead of numbers for indexing 
NewII <- movieRanks["V", "Lenny"]
movieRanks["V", "Lenny"] <- movieRanks["II", "Lenny"]
movieRanks["II", "Lenny"] <- NewII
movieRanks

#Step 26 re-do the step with same method Lenny's switch
NewV <- movieRanks["II", "Lenny"]
movieRanks["II", "Lenny"] <- movieRanks["V", "Lenny"]
movieRanks["V", "Lenny"] <- NewV
movieRanks
>>>>>>> 350e09d8f0abe3c554445920424a22ac35b9cd45
