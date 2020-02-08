
#London Dataset

setwd("C:/Users/x16347436/Desktop/Data App project/Data App Dev/Project/Project/Code R") #change this to where you downloaded the .csv
creditData <- read.csv("AB_LON_2019.csv") # will autoencode the text attributes to factors

# ok, now we need to make a dataset unique to you
set.seed(16347436) # <-- put your student number here WITHOUT the x!! Leave off a starting zero if you have one
# e.g.: set.seed(62345678)

index <- sample(1:nrow(creditData), 6000, replace=FALSE)
my_ca_dataset <- creditData[index, ] # here we're subsetting your part of the dataset


# Unfortunately, due to a technical error, 7 columns of the data were lost :(
# HR blamed IT, IT blamed HR, your manager will blame you, so let's just hope those columns weren't important!
#index2 <- sample(1:(ncol(my_ca_dataset)-4), 7, replace=FALSE)
#index2 <- index2 + 4 # the minus and then plus 3 protects the first 3 columns of the dataset

#print(paste("I lost:", names(my_ca_dataset)[index2]))

#my_ca_dataset <- my_ca_dataset[, -index2]


# Unfortunately, there was another incident. The intern split their coffee
# on your keyboard and may have deleted data from a number of the remaining columns

v <- round(runif(ncol(my_ca_dataset), min=1, max=6))
v <- cut(v, breaks = c(0,4,max(v)), labels = c("a","b"))
v[2] <- "a"

Pna <- runif(1000, min=0, max=0.18)
Pna <- Pna - .03
Pna[Pna < 0] <- 0

for (i in 1:length(v)) {
  if (v[i] == "b") {
    nadex <- sample(1:nrow(my_ca_dataset), nrow(my_ca_dataset) * Pna[sample(1:length(Pna), 1, replace=FALSE)], replace=FALSE)
    my_ca_dataset[nadex, i] <- NA
    v[i] <- "a"
  }
}


# Clean up
rm(v)
rm(Pna)
rm(creditData)
rm(index)
rm(index2)
rm(i)
rm(nadex)


###### Backup your data set

#In case anything goes wrong, we'll store a copy to disk.
write.csv(my_ca_dataset, file="AB_LON_2019.csv", row.names = F, na = " ")

#To reload it run (you will need to rerun your foundations code again)
#my_ca_dataset <- read.csv("AB_LON_2019.csv", stringsAsFactors = T, na.strings = " ")

str(my_ca_dataset)

sapply(my_ca_dataset, function(x) sum (is.na(x)))

na.omit(my_ca_dataset,cols = C("neighbourhoodgroup", "price", "calculatedhostlistingscount", "reviewspermonth"))

barplot(table(my_ca_dataset$roomtype))


barplot(table(my_ca_dataset$price))



##########################################

#f2
#Identify which attributes have missing values, and how many
#strictly speaking this would tell us
summary(my_ca_dataset)
#alternatively, we also do:
sapply(my_ca_dataset,function(x) sum(is.na(x)))



#f3
#Deal with an attribute that has missing values (show the outcome of your approach/ assigning the mean/median or mode (if categorical) value,
my_ca_dataset$neighbourhoodgroup[is.na(my_ca_dataset$neighbourhoodgroup)] <-
  mean(my_ca_dataset$neighbourhoodgroup, na.rm = T)
sapply(my_ca_dataset,function(x) sum(is.na(x)))




#b1
#Pick a numeric attribute and compute the mean, median, standard deviation, min, and max values
summary(my_ca_dataset$price) #min, max, mean, and median
sd(my_ca_dataset$price) #standard deviation




#I1b
#Propose a question concerning the average price and at least one attribute, and answer it. 
aggregate(price ~ minimumnights, mean, data = my_ca_dataset)




#i2a
#Visualise price against an interesting categorical attribute and interpret the results.
boxplot(price ~ minimumnights, data = my_ca_dataset)


hist(my_ca_dataset$price)

hist(my_ca_dataset$minimumnights)

boxplot(my_ca_dataset$id)


aggregate(price ~ minimumnights, median, data = my_ca_dataset)


id <- c(4927814, 23157012, 35929175)
hostname <- c("Matt", "Charlotte Nell Gwynn", "Chobe")
roomtype <-c("Entire home/apt", "Entire home/apt", "Private room")

user.df <- data.frame(id, hostname, roomtype)

str(user.df) 
my_ca_dataset$price <- as.numeric(my_ca_dataset$price)
my_ca_dataset$availability365 <- as.numeric(my_ca_dataset$availability365)
str(my_ca_dataset)

barplot(table(user.df$roomtype), xlab = "roomtype", ylab="Count")

boxplot(my_ca_dataset$price ~ my_ca_dataset$neighbourhood)



hist(my_ca_dataset$availability365)

roomtype <- c("Westminster", "Westminster", "Westminster" )
price <-c(395, 150, 22)

roomtype <- c("Brent", "Brent", "Brent" )
price <-c(25, 30, 39)



