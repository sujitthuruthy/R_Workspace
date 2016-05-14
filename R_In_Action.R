# These are command sets from R in Action book.

# Baby Steps
# Scalars are one element vectors, usually used for Constants
pi <- 3.14

# Vectors - one dimensional arrays that can hold numeric, character or logical data
a <- c(1,2,3:7)
b <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
c <- c(TRUE, TRUE,FALSE,FALSE,TRUE)

# read vector elements
a[1] # single element
b[3:4] # range of elements
c[c(1,2,5)] # selection of elements 

# Matrices are two dimesional arrays in which element has the same mode (data type)
# myymatrix <- matrix(vector, nrow=number_of_rows, ncol=number_of_columns,
#                     byrow=logical_value, dimnames=list(char_vector_rownames, char_vector_colnames))
m1 <- matrix(1:20, nrow = 5, ncol = 2, byrow = TRUE, dimnames = list(c(1:5), c("C1", "C2")))
m1
m2 <- matrix(c(1:10),nrow=2)
m2
m2[2,] # select row 2
m2[,2] # select col 2
m2[1,c(4,5)] # select elements from row 1 and cols 4 & 5

# Arrays are similar to matrices but have more than 2 dimensions.
# myarray <- array(vector, dimensions, dimnames) 

dim1 <- c("A1", "A2")
dim2 <- c("B1","B2","B3")
dim3 <- c("C1","C2","C3","C4")
a1 <-  array(1:24, c(2,3,4), dimnames= list(dim1,dim2,dim3))
a1
a1[1,2,4] #array[dim1,dim2,dim3]

# Dataframe is more general than matrices and can contain columns with different modes (data types)
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID,age,diabetes,status)
patientdata

patientdata[1,2] # element in first row second column

patientdata[1:2] # outputs first 2 cols

patientdata[c("age", "status")] 
patientdata$age

# cross tablulate Diabetes type by age 
table(patientdata$diabetes,patientdata$age)

# Attach , detach and With for easy access to variables 
attach(mtcars)
summary(mpg)
plot(mpg, wt)
plot(mpg, disp)
detach(mtcars)

with(mtcars,
{
print (summary(mpg))
  plot(mpg, wt)
  plot(mpg, disp)
})

with(mtcars,
     {
       nokeepstats <- summary(mpg)
       keepstats <<-  summary(mpg)
     })
nokeepstats
keepstats


# Categorical (nominal) and ordered categorical (ordinal) variables in R are called factors.
diabetes <- factor(diabetes) 
diabetes
status <- factor(status, ordered = TRUE)
status
status <- factor(status, levels = c("Poor", "Improved", "Excellent"))
status

sex <- c(1,2,1,1)
sex <- factor(sex, levels=c(1,2), labels = c("Male", "Female"))
sex

patientdata <- data.frame(patientID, age, diabetes, status, sex)

summary(patientdata)

# Lists are important R structures for two reasons. First,
# they allow you to organize and recall disparate information in a simple way. Second,
# the results of many R functions return lists. It's up to the analyst to pull out the components
# that are needed.

g <- "my first List"
h <- c(25,26,18,28)
j <- matrix(1:10, nrow=5, byrow=TRUE)
k <- c("Foo","bar","pi")

mylist <- list(title=g, ages=h, rows=j, names=k)
mylist
mylist$ages
mylist$rows
# -----------------------------------------------------------------------------
# Importing data from files 

# Syntax to read from Delimited files is mydataframe <- read.table(file, options)
grades <- read.table("studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",",
                     colClasses=c("character", "character", "character",
                                  "numeric", "numeric", "numeric")) #  stringsAsFactors=FALSE turns off converting character to factors 

install.packages("xlsx")
install.packages("xlsx2")

library(xlsx)
workbook <- "c:/myworkbook.xlsx"
mydataframe <- read.xlsx(workbook, 1)
# imports the first worksheet from the workbook


