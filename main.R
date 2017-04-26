probabilityOfUserPosting=0.9

performUserAction<-function()
{
  # generate a value from Uniform distribution ~U[0,1]
  
  # runif() generate numbers from a bernauli distribution
  bernauliRandom=rbern(1,probabilityOfUserPosting)
  print(bernauliRandom)
  if(bernauliRandom==1)
  {
    #the user will post
    postsGenerated[currentTimeClick]<<- postsGenerated[currentTimeClick]+1
  }
}


# userFeed represents users feed
# coming from his friends. We are keeping the length 
# of user feed to 10

userFeed=vector()

# NumberOfFriends represents number of friends in 
# a user's social network
NumberOfFriends=100

# currentTimeClick is the counter tick for the simulation
currentTimeClick=0
SIMULATION_INTERVAL=100



# postsGenerated represents total number of post generated
# by all users in the system
postsGenerated=rep(0,SIMULATION_INTERVAL)




while(TRUE)
{
  # update the time click
  currentTimeClick=currentTimeClick+1
  
  for (friend in 1:NumberOfFriends)
  {
    performUserAction()
  }
  
  
  # Stop the similation 
  if(currentTimeClick>=SIMULATION_INTERVAL)
  {
    break
  }
  
}

plot(postsGenerated,type = 'b',ylim = c(0,NumberOfFriends))
