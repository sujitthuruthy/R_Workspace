##setwd("R_workspace")
## library(plyr)
## library(ggplot2)
## library(reshape2)
##vehicles <- read.csv("vehicles.csv",header=TRUE,sep=",",stringsAsFactors = F)
##head(vehicles)
##labels <- do.call(rbind,strsplit(readLines("variables.txt")," - "))
##nrow(vehicles)
##ncol(vehicles)
## names(vehicles)

## number of unique years of data in the dataset
## length(unique(vehicles[,"year"]))

## min and max values
##first_year <- min(vehicles[,"year"])
##first_year
##last_year <- max(vehicles[,"year"])
# length(unique(vehicles$year))
# table(vehicles$fuelType1)

## take care of missing data by setting it to NA. 
# vehicles$trany[vehicles$trany == ""] <- NA
# vehicles$trany

# substr and if-Else combination 
# vehicles$trany2 <- ifelse(substr(vehicles$trany,1,4)== "Auto", "Auto","Manual")
# vehicles$trany2 <- as.factor(vehicles$trany2)
# table(vehicles$trany2)
class(vehicles$trany2)

# with(vehicles, table(sCharger, year))
class(vehicles$sCharger)
unique(vehicles$sCharger)
class(vehicles$tCharger)
unique(vehicles$tCharger)
vehicles$tCharger[vehicles$tCharger == "T"] <- "Turbo"
vehicles$tCharger
summary(vehicles$year)
library(rpart)
?amelia
install.packages("Amelia")
library(Amelia)
?Amelia
y
