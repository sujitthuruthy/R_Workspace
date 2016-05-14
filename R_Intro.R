# get current working directory
getwd()
# set currrent working Directory 
setwd("C:/Users/Administrator/Documents/R_workspace")
getwd()


# read csv file without any options, r will default the values
# income <- read.csv("data/ACS_13_5YR_S1903/ACS_13_5YR_S1903.csv")
# read csv file with options 
# Be more specific.
# income <- read.csv("data/ACS_13_5YR_S1903/ACS_13_5YR_S1903.csv",
#                   stringsAsFactors=FALSE, sep=",", colClasses=c("GEO.id2"="character"))

# read tab delimited file
# income <- read.csv("data/ACS_13_5YR_S1903/ACS_13_5YR_S1903.tsv",
#                   stringsAsFactors=FALSE, sep="\t", colClasses=c("GEO.id2"="character"))


# read csv file from URL
income <- read.csv("http://datasets.flowingdata.com/tuts/2015/load-data/ACS_13_5YR_S1903.csv",
                   stringsAsFactors=FALSE, sep=",", colClasses=c("GEO.id2"="character"))
income()
# Structure of Income data frame
str(income)
# column Names in Income 
names(income)

# Top 10 rows of Income
head(income,10)

# Statistical summary of each column in Income, this shows the count of NA as well. 
summary(income)

#subsetting Income , selecting all rows and first 7 columns 
income_total <- income[,1:7]
head(income_total)

# subsetting income_total to select only the records that are in the max quartile for a variable. 
income_upper <- subset(income_total, HC02_EST_VC02 >= 58985)
income_upper

# getting Summary stats for one column. 
summary(income_upper$HC01_EST_VC02)

summary(income$HC02_EST_VC08)

income_noNA <- na.omit(income$HC02_EST_VC08)
summary(income_noNA)

# change column names in the dataframe 
names(income_total)

names(income_total) <- c("Id", "FIPS", "State Names", "households", "households_moe","med_income", "med_inc_moe")
head(income_total)


# create new Columns as calculations from existing columns
income_total$med_min <- income_total$med_income - income_total$med_inc_moe
income_total$med_max <- income_total$med_income + income_total$med_inc_moe
head(income_total)

# change the value of an existing column
income_total$med_min <- income_total$med_min / 1000
income_total$med_max <- income_total$med_max / 1000

head(income_total)

#