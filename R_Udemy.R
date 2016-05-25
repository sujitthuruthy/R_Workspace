# Section 1 - Read csv file by allowing user to select file from directory
# using the explorer 
myfile <- read.csv(file.choose())

# Get the structure of the data loaded
str(myfile)

# Get statistical summary on each of the variables in the data
summary(myfile)

# Load the ggplot2 package
library(ggplot2)

# Plot scatter plot - filter carats more that 2.5 
ggplot(data=myfile[myfile$carat<2.5,],
       aes(x=carat, y=price, color=clarity)) + 
  geom_point(alpha=0.1) +
  geom_smooth()

# Section 3 - R Fundamentals 
A <- 10
B <- 5

C <- A+B
C

var1 <- 2.5
var2 <- 4

result <- var1 / var2

squareroot <- sqrt(var2)

greeting <- "Hello"
name <- "dude"

message <- paste(greeting, "mone", name)

