# Introduction to R for Life Sciences - Oct 2024
# R v 4.3.3


## ---- Exploring the R console:

# In the console (bottom left window in RStudio) at the prompt (">"), 
# type the following commands followed by the "Enter" key after each one to view 
# the output printed on the console.

# R is a calculator:
1 + 1

# The assignment operator <-
# The nice part of R is that one can keep values in the memory, by using the
# "assignment operator": <- which is used to assign a value 
# and a name to a variable and store it in the session's memory.
# We can use either <- or = to assign values to an object
# Stick to one for consistency.


# What is the output of this command in the console?
x	<- 128.5
# The variable that we named "x" and that contains the value 128.5 is created and listed and 
# stored in the Environment/Workspace (top right window in RStudio).

# If you call the variable's name, the value stored within the "x" variable is
# printed in the console.
x

# The next command, with the use of the abs() function, prints the absolute value
# of -11 in the console.
abs(-11)

# Finally, the next command opens the help page for the p.adjust function 
# (bottom right "Help" window in RStudio). What does the p.adjust() function do?
?p.adjust

## ---- Create a script: 
# Create a new script using	File > New File > R script. 
# Don't forget  to save your script often.
# Notice the syntax highlighting: comments are in green, functions and variables are
# in black, numbers are in blue
2 + 3
# Run individual lines, one by one:
# In RStudio: put the cursor anywhere in a line, hit:
# Ctrl + enter (Windows)
# Cmd + return (Mac)
# or click the "Run" button
# Tips: 1. Run part of a line or multiple lines: Highlight the code, then proceed as  above.
#       2. Most of your code should be developed and saved in  scripts.
#       3. You can execute individual lines of code interactively while you are writing it.
#       4. You can run the entire script once it is ready and debugged.

### Exercise:
# Create a script, add some code in it and run it!
# First Steps and commands, ex. 1  
w <- 3
h <- 0.5
area <- w * h 
area

## Part 1 
## Let's follow the script

## ---- R key concepts:

# - Variable/object: A storage space in memory that has a name and can hold data.
temp <- -5.5	# Create a variable named temp, holding value -5.5, using the 
              # assignment operator

# A variable has a type (eg numeric or character), more on this later.

# In R, we can manipulate or compute variables with functions:
# - Function: pre-written code that performs a specific task and can be executed by 
# "calling" the function. 
#   To use a function, write the function's name, followed by parentheses. Inside 
# the parenthesis, pass variables or values to the function code (=function arguments). 
abs(temp)

# Find out the required arguments by looking up the help:
help(abs) # or ?abs

log2(16)
q() # quit R, no argument necessary
# - Operator: a special function for arithmetic, logical or other operations.
# Examples of arithmetic operators: +, -, *, /, ^
10^3 # 10 to the power of 3

## ---- Workspace
# The workspace is the internal memory where R stores the objects you created  
# during the session.
# Explore your workspace using the command line:
# To list what is in your workspace, type:
ls()
# To remove (delete) an object from the workspace, use function rm:
rm(x)
# To remove (delete) all objects from the workspace, type
rm(list=ls())
# This can be useful when the objects created are big, and not all necessary for 
# downstream analysis.

# When you close R, the workspace is emptied, so objects created are lost. 
# You have the option to save your workspace. This way, you can re-load the same
# objects when you re-open R on another day.
# See the upper right quadrant, tab "Environment": all objects are listed
# To remove all objects form the workspace, click the broom icon.
# To save all objects, use the "Disk" icon and save as an .RData file
# CAUTION: .Rdata files can be very large!
# Save only when you have space on your hard drive!


## ---- Working directory
# This is not the same concept as the workspace! The working directory is the location
# on your computer where R will look for files and save files, i.e. the current
# folder that is being used to load files.
# To view the current working directory:
getwd()

# To set the current working directory to another location:
setwd("/Users/tania/Documents/") # ! Change to the folder organization you have
# on your computer!

# Once you start using R to export files or figures in pdf for example, it is useful 
# to set your working directory and then you can simply specify the output's file name
# without having to specify the path to where you want to save the file.


## ---- Packages
# A package contains a set of related functions (and sometimes data sets).
# A  number of packages are part of the basic R installation.
# You can view them in the "Packages" tab in the bottom right panel.
# Many, many packages are developed by the user community and can be installed 
# whenever needed. 

# Note: A package needs only to be installed once per R/RStudio installation/version.

# There are two (three) main repositories that provide R packages of interest for
# the life sciences. Their content can be browsed on the  web :
# - CRAN (Comprehensive R Archive Network, http://cran.r-project.org/) :
# The  main R repository, with over 18600 packages (June 2022).
# - Bioconductor (http://www.bioconductor.org) : 
# a separate repository specialized in the packages for the analysis of high-
# throughput genomics and data, with  2040 packages (June 2022).
# (Github (https://github.com/): not restricted to hosting R packages).

# Install packages from CRAN with the install.packages() function from the utils package
install.packages("stringi") # character string  manipulations
# Once a package is installed, its content needs to be made accessible to R.
library(stats) # loads the package for the current session.

# Install packages hosted on bioconductor: first install the BiocManager package 
# that is available on CRAN:
install.packages("BiocManager")

# Then use the install() function from the BiocManager package
# !! This may take time to complete, run it during coffee or lunch break!
# Install limma:
BiocManager::install("limma")

# It is good practice to load all needed packages at the top of a script.

### Exercise
# In the console, what is the output of the below commands? Why?
library(stringi)
library(DESeq2) 
library(MASS)  
library(ggplot2)

# Solution: 
# The stringi package is installed, so it loads. However, DESeq2 is not
# installed, "there is no package called ‘DESeq2’ "


### ---- Session Information
R.version.string	# prints the currently used R version.
sessionInfo() # prints version information about R and attached or loaded packages.
# Tip: Run sessionInfo() at the end of your data  analysis session and save the 
# output.
# This information is useful when you want to redo an analysis later, 
# generate a report, or post a question on an online forum, ...

# Print the version of a specific package:
packageVersion("stringi")

# Some tips and shortcuts to navigate within a script or Rstudio:
# - On the scripts file or within the console, use the tab key for auto-complete 
# suggestions
# The tab key works both for objects you have created or for functions.
# - Within the console, use the up and down arrows to scroll through the 
# previous commands used
# - Ctrl-l to erase console window
# - Ctrl-1 and Ctrl-2 to jump between the script and the console windows

# incomplete statement (+) (in the console, will wait), or Esc
# 1 + 1 +
  

# Part 2
###################################
# Basic Data Types and Structures #
###################################

###  ALMOST EVERYTHING IN R IS AN OBJECT #
# An object is a storage space that contains a value, a data structure, or some code
#   Variables are objects containing data
#   Functions are objects containing code


###################
# Basic variable types

# Numeric: Number, stored with decimal point (i.e integers or float)
# Examples: 0, 1, 55.2, -11.1111
number1 <- -11.1111
number2 <- 0 

# The class() function can be used to examine a variable's type (i.e its class)
class(number1) # numeric

# Character: Text sequence. Must be enclosed in quotes " " or ' '
# Examples: "1a++", 'Hello World', "s" , "99"
text1 <- 'Hello World'
text2 <-"99"
class(text2) # charater

# Logical: TRUE or FALSE (all upper case, or T or F)
logical1 <- TRUE
class(logical1) # logical

# Factor: used to represent categorical data.
genotype <- factor(c("WT", "WT", "Mut2", "Mut1", "Mut2"))
levels(genotype) # The available values in a factor are called levels
# Note that we have more than 1 element in our genotype object!
class(genotype) # factor

# By default factor levels are sorted alphabetically
# But we can specify them manually
genotype <- factor(c("WT", "WT", "Mut2", "Mut1", "Mut2"),
                   levels=c("WT","Mut1","Mut2")) # specify 
levels(genotype)
# This will be of interest when we plot values per factor level, or 
# if we perform differential gene expression analysis, the order of the levels
# in the factor will be used in a plot or to select levels to compare
# within the DE analysis, so it has its importance!


####################
# Object name rules

# Only use letters, numbers, dots . , and underscores _
# Cannot start with a number !!! START WITH A LETTER !!!
# Cannot contain operators
# Cannot contain spaces
5days <- 5
# Error: unexpected input in "5_"

#################
# FUNCTIONS

# Functions are called with their name followed by parentheses ()
# Arguments are the input to functions, passed inside the ()

ls() # no arguments
sqrt(81) # one argument
round(5.5667, 2) # two arguments, separated by a comma ,

# To find out the number and types of arguments required, check the help!
# Use ?function_name to check R's help and see which arguments a function expects:
?sqrt

# Some functions have two or more arguments, some with default values
# Arguments have names which can be used when calling a function
#!!! MANY FUNCTIONS HAVE MORE THAN ONE ARGUMENT !!!
# If unnamed, arguments must be listed in the correct order (association by position)
# If named, arguments can be passed in arbitrary order (association by name)

?round # Usage: round(x, digits = 0)
# Arguments with default values can be omitted in the function call.
# Arguments without default values cannot be omitted.
round(2.011) # rounding to 0 digits, the default
round(x=2.011, digits=2) # rounding to 2 digits after the decimal point


######################
# LET'S PRACTICE !   #
######################

# Assign the values 6.7 and 56.3 to variable a and b, respectively
# Calculate (2*a)/b+(a*b) and assign the result to variable x. 
# Display the content of x
# Calculate the logarithm in base 2 of x. Hint: use the log() function

# Solution:
# Assign the values 6.7 and 56.3 to variable a and b, respectively
a <- 6.7 
b <- 56.3

# Calculate (2*a)/b+(a*b) and assign the result to variable x. 
# Display the content of x
x <- (2*a)/b + (a*b)
x

# Calculate the logarithm in base 2 of x
?log
log(x,base = 2) # same as log2(x)


#########################
# MORE COMMON OBJECT CLASSES #
#########################

# Vector: a series of data, all of the same type
# matrix: multiple columns of the same length and data type
# data frame: multiple columns of the same length, but each with their data type
# list: collection of objects; can be of different classes and sizes
# function: a command to perform a specific task


#########
# VECTORS
# It is a group of variables that are of the same type, and the simplest data structure in R.
# It is 1-dimensional and contains usually more than 1 element
# Create a vector using c():
height <- c(180, 167, 199) # c() is a function which concatenates

# Create a named vector:
height <- c(Mia=180, Paul=167, Ed=199)
names(height)
# This is for example encountered when we run GSEA

# Access elements within a vector with the square brackets [ ]:
height[1] # get the first element
height["Paul"] # get the element named Paul
height[ c(1,3) ] # get the 1st and 3rd element


# One can create a sequence of values, it will become a vector of
# numeric or integer class
a <- c(1:4) # The : operator allows us to go from 1 to 4 by increments of 1
class(a)
# We could easily create long sequences:
s <- seq(from=0, to=40, by=0.5) # seq: from 0 to 40 by increments of 0.5

# We can also create repetition, using the rep() function:
genotypes <- rep(x = c('WT','KO') , times = 3 ) 
# The x argument allows to specify which vector has to be repeated,
# and the times argument allow to specify how many times it has to 
# be repeated

# concatenate vectors
c(a,s) # c() can be used to concatenate 2 vectors

# We can perform operations with vectors
a*2 # Here we multiply each element of a by 2
a + c(12,10,12,10) # add the elements of 2 vectors
# Both have to be of the same length if they have multiple elements!

# Many functions take a vector as argument
# Some perform an element-wise operation
?log2 # see the Arguments section and the Value section
log2(a) # compute the logarithm in base 2 of eachelement
# Some return a single value
?mean # see the Arguments section and the Value section
mean(a) # compute the mean of the elements of a


##########
# COERCION

# All elements of a vector must be the same type
# When combining different types, they are coerced to the most flexible type
# Flexibility scale: logical < numeric < character
vec <- c(2,TRUE) # coerces to numeric
vec <- c(2,"twelve",TRUE) # coerces to character


# Convert between types: as.logical() , as.numeric(), as.character()
# Example: coerce a logical vector to numeric
x <- c(FALSE,FALSE,TRUE)
as.numeric(x) # FALSE becomes 0, TRUE becomes 1
sum(x) # mathematical functions automatically coerce to numeric
mean(x) # proportion of TRUE


######################
# LET'S PRACTICE !   #
######################

# Create two vectors:
# vector_a, containing the values from −5 to 5
# vector_b, from 0 to 1 by increment of 0.1

# Calculate the element-wise sum between the 
# elements of vector_a and vector_b.

# Calculate the sum of elements in vector_a.
# Hint: check out the help of the sum() function

# Identify the smallest and the largest value in vector_a
# Hint: check out the help of the min() and max() functions

# Compute the overall mean of all the values of both vector_a and vector_b
# Hint: remember that you can concatenate 2 vectors with the c() function
# and use the concatenation as an argument in a function
# Hint 2: what could be the name of a function that calculates the mean?

# Solution:
# Create two vectors:
# vector_a, containing the values from −5 to 5
# vector_b, from 0 to 1 by increment of 0.1
vector_a <- -5:5
vector_b <- seq(0,1,0.1)

# Calculate the element-wise sum between the 
# elements of vector_a and vector_b.
vector_a + vector_b

# Calculate the sum of elements in vector_a.
# Hint: check out the help of the sum function
sum(vector_a)

# Identify the smallest and the largest value in vector_a
min(vector_a)
max(vector_a)

# Compute the overall mean of the values among both vector_a and vector_b
# Hint: remember that you can concatenate 2 vectors with the c function
# and use the concatenation as an argument in a function
mean(c(vector_a, vector_b))


##############################
# Operators (most common ones)
# Operators are used to perform operations on variables and values.

# Arithmetic: + , - , * , / , ^
x <- 2^3

# Comparison: < , > , <= , >= , == (equal to), != (different from)
# Always return logical values
c(1,3,2) == 2 
# This tells me which of the vector's elements are equal to 2 (i.e. TRUE)
c(1,3,2) != 2 
# This tells me which of the vector's elements are NOT equal to 2 (i.e. TRUE)
c(1,3,2) < 2
# This tells me which of the vector's elements are smaller than 2 (i.e. TRUE)

# Logical: ! (negation), & (and), | (or)
!TRUE # ! Reverses TRUE and FALSE
!(c(1,3,2) < 2) 
c(1,3,2) < 3 & c(1,3,2) != 1

# Other: %in%
# Always returns logical values
# This operator allows us to compare the elements of 2 vectors (they don't
# have to be of the same length). The output will be logical for each
# element of the first vector in the comparison
c("Fred", "Marc", "Dan", "Ali") %in% c("Dan", "Geoff", "Ali")



######################################
# SUBSET VECTORS USING LOGICAL VECTORS

# The [ ] operator can also accept a logical vector and only the 
# elements that are "TRUE" will be selected from the vector.
a <- 1:4
a[c(FALSE,FALSE,TRUE,TRUE)] # select the elements which are TRUE
a[a>2] # the logical vector is provided by a logical expression



################
# MISSING VALUES

# Missing values are usually represented by NA:
y <- c(1,2,3,4,5,NA,NA)

# NA's interfer with many functions:
mean(y)

# Arguments often exist to ignore the NA's before calculation
mean(y, na.rm=TRUE)

# Alternatively, use na.omit() to remove NAs from the data
y_cleaned <- na.omit(y)
mean(y_cleaned)

### !!! NA is different from NaN !!! 
x <- c(1, NA, 0/0) # 0/0 gives NaN = "Not a Number"

is.na(x) #detects both NAs and NaNs from x
is.nan(x) # detects only NaNs from x
x > 2 # what if we try to compare NA and NaN to a number?

x_clean <- x[!is.na(x)] # removes NAs and NaNs from x




#################
# DATAFRAMES    #
#################


# We can create a dataframe from its individual column (each one is a vector)
name <- c("Joyce", "Chaucer", "Homer") # creates the column "name"
status <- c("dead", "deader", "deadest") # creates the column "status"
reader_rating <- c(55, 22, 100) # creates the column "reader_rating"

poets <- data.frame(name, status, reader_rating) # creates the df
poets


##################################################
# Accessing rows, columns, and individual elements 


poets[2,2] # gets the element on row 2 in column 2
poets[,c(1,3)] # gets columns 1 and 3
poets[,c("name", "reader_rating")] # gets columns "name" and

# "reader_rating"
poets$name # gets column "name"

rownames(poets) # gets the row names
colnames(poets) # gets the column names

rownames(poets) <- c("J", "C", "H") # overwrites row names


#################
# MATRICES      #
#################



# Creating matrices using `matrix()` function. 
my_matrix <- matrix(data = c(10,0,20,5,6,1), nrow = 2, ncol = 3)

# Add row and column names
colnames(my_matrix) <- c("Sample_1","Sample_2","Sample_3") 
rownames(my_matrix) <- c("EPCAM","PDGFRB") 
my_matrix

# Accessing rows, columns, and individual elements 
# $ dosen't work
my_matrix[2,2] # gets the element on row 2 in column 2
my_matrix[,c(1,3)] # gets columns 1 and 3
my_matrix["EPCAM","Sample_2"]

# convert to / from a data frame
my_df <- as.data.frame(my_matrix)
my_matrix <- as.matrix(my_df)







###################################
# Importing/exporting data into R #
###################################

##########################
# Import a table into a df

# Most flexible function to read tabular data: read.table()
# Reads a formatted text file and imports it as a data frame

# Two main elements to give to read.table():
# • What/where is the file to read
# • What are the formatting options


# Most important optional arguments of read.table(), read.csv(), read.delim() :

# header (TRUE/FALSE): specifies whether the first line contains column names
# • Default in read.table() is FALSE.
# • Default in read.csv()and read.delim()is TRUE.

# sep: specifies the field separator character (e.g. "," or tab "\t").
# • Default in read.table() is any white space characters (space, tab, newline and carriage return).
# • Default in read.csv()is comma.
# • Default in read.delim()is tab.

# Let's read a csv file
clinical_data <- read.table("~/Documents/SIB/Teaching/Intro_to_R_for_Life_Sciences_Agora_03102024/course_datasets/example_clinical_data_03102024.csv",header=TRUE, sep=",") # all purpose function; we need to supply some arguments
clinical_data <- read.csv("~/Documents/SIB/Teaching/Intro_to_R_for_Life_Sciences_Agora_03102024/course_datasets/example_clinical_data_03102024.csv") # arguments can be omitted since defaults are adapted to .csv


############################
# Checking the imported data

# display first / last rows
head(clinical_data) # shows first 6 rows 
tail(clinical_data) # shows last 6 rows

# what are the dimensions of the df
dim(clinical_data) # number of rows and columns
nrow(clinical_data) # number of rows
ncol(clinical_data) # number of columns

# column names
colnames(clinical_data) 

# structure of the data frame
str(clinical_data) 


# Getting a summary (some statistics)
summary(clinical_data)

# MISSING VALUES
clinical_data <- na.omit(clinical_data)
summary(clinical_data)

# Reminder – accessing parts of the dataframe
clinical_data[2,] # 2nd row
clinical_data[, "Age"] # column named "minor"
clinical_data[1:3, c(1,3)] # 3 first rows, 1st and 3rd column
clinical_data$Sample_ID # equivalent to clinical_data[, 1]
clinical_data$Sex[30] # chromosome of the last row

# The table() function 
# useful to get a summary of one or several categorical columns
table(clinical_data$Disease)
table(clinical_data$Disease, clinical_data$Sex) # rows are "Disease", columns are "Sex"

##################
# Subsetting a df

# subset() allows you to subset your data by specific columns and values in those columns. 
# Logical operators can be used within the subset.

subset(clinical_data, Disease=="Tumor")# keeps only the clinical_data where Disease is "Tumor"

subset(clinical_data, Disease=="Tumor" & Sex=="female") # keeps only the clinical_data in "female" & "Tumor" samples

subset(clinical_data, Sex=="male" & (Age > 75 | Age < 60)) # keeps only the clinical_data of males with age < 60 or age > 75


########################
# Adding rows or columns

# add a row
### !!! LONG STATEMENTS CAN BE WRITTEN IN SEVERAL LINES !!! ###
clinical_data_updated <- rbind(clinical_data,
                               data.frame(Sample_ID="M207",
                                          Age=45,
                                          Sex="female",
                                          Disease="Tumor")) # bind by row

tail(clinical_data_updated)


# Add a column
grade <- c(NA,"IV",NA,"III",NA,NA,"IV","I","III","I","III","IV",NA,
           NA,"III","II","II",NA,"II",NA,NA, NA,"IV","II","III",NA,NA,  
           NA,NA,"I" ) # create new column (as a vector)
clinical_data_mod <- cbind(clinical_data_updated, grade) # bind by column

# create factors for "Disease"
clinical_data_mod$grade <- factor(clinical_data_mod$grade, levels = c("I","II","III","IV"))

# Removing a row or column

clinical_data_orig <- clinical_data_mod[,-1] # remove the first column
head(clinical_data_orig) # check resulting data

clinical_data_orig <- clinical_data_mod[,2:ncol(clinical_data_mod)] # extract all columns that you want to keep
head(clinical_data_orig) # check resulting data


######################
# LET'S PRACTICE !   #
######################


# Create a matrix of gene expression data (3 genes, 5 samples)
# Suggestion:
#         M421  M228  M263  M229  M257
# ANKIB1  46    91    37    53    53
# OSBPL11  4    23    16    30    12
# CALY     0    0     1     0     0

matrix_gene_expression <- matrix(c(46,4,0,
                                   91,23,0,
                                   37,16,1,
                                   53, 30,0,
                                   53, 12, 0), nrow = 3, ncol = 5)
colnames(matrix_gene_expression) <- c("M421","M229","M263","M229AR","M257")
rownames(matrix_gene_expression) <- c("ANKIB1","OSBPL11","CALY")

# Create a data frame containing clinical information (age, sex, disease) for the samples
# Suggestion
#        age  sex disease
# M421    35   M  Healthy
# M229    27   F  Cancer
# M263    43   M  Cancer
# M229AR  65   M  Cancer
# M257    72   F  Healthy

age <- c(35,27,43,65,72)
sex <- c("M","F","M","M","F")
disease <- c("Healthy","Cancer","Cancer","Cancer","Healthy")

clinical_information <- data.frame(age,sex,disease)
rownames(clinical_information) <- c("M421","M229","M263","M229AR","M257")

# Check that samples are in the same order in both objects
colnames(matrix_gene_expression) == rownames(clinical_information)

# Do we have data for samples "M421" and "M422" ?
c("M421","M422") %in% rownames(clinical_information)

# What is the mean age of female patients ?
mean(clinical_information[clinical_information$sex=="F", "age"])

# What is the max expression of OSBPL11 in patients with cancer?
max(matrix_gene_expression["OSBPL11",clinical_information$disease=="Cancer"])


########################
# Exporting a data frame

# use write.table() or write.csv()
# Some important arguments (check ?write.table for more):
#   file: file path and name for the output file
#   append: allows to append to an existing file (default is FALSE).
#   quote: whether the elements of character or factor columns should be surrounded 
#           by double quotes in the printed output (default is TRUE !).
#   sep: field separator to be used, e.g., comma (",") or tab ("\t").
#   row.names: whether the row names are written (default is TRUE)
#   col.names: whether the column names are written (default is TRUE).


write.table(clinical_data_updated, 
            "~/Documents/SIB/Teaching/Intro_to_R_for_Life_Sciences_Agora_03102024/course_datasets/example_clinical_data_updated_03102024.csv",
            quote=FALSE, 
            sep=",", 
            row.names=FALSE)



### Afternoon - Part 1
### Plotting
# Two main options are available within R for plotting. 
# Base R plotting functions from the graphics package (comes already pre-installed)
?graphics::plot
# Plotting - the basics
x <- 1:100
y <- log(x) + (x/100)^5
plot(x,y) # equivalent to plot(x, y, type="p")

# Customizing plots
plot(x, y, type="l", col="red",  lwd=7)
# You will see the hist() function later in the statistics section


### In omics data analysis, we more routinely use ggplot2, which has to be
# installed (eg scRNAseq data analysis)
# Using ggplot2 allows you to have more customizable plots, and there
# are more plot options than with base R, eg violin plots. 
install.packages("ggplot2")
library(ggplot2)

# TMEM79
# LYN

# Bonus ggplot2
library(ggplot2)

# Boxplot of BMI vs stage, coloring according to stage
# With legend:
ggplot(data=clinical_data, aes(x=stage, y=BMI, color=stage)) + 
  geom_boxplot() 

# Boxplot of BMI vs stage, coloring according to stage, flipping orientation
ggplot(data=clinical_data, aes(x=stage, y=BMI, color=stage)) + 
  geom_boxplot() + 
  coord_flip()  

# Without legend:
ggplot(data=clinical_data, aes(x=BMI, y=stage, color=stage)) + 
  geom_boxplot() + 
  coord_flip() + 
  theme(legend.position = "none")

# Scatter plot of weight vs height, coloring by gender
ggplot(data=clinical_data, aes(x=weight, y=height, color=gender)) +
  geom_point()


# Compare plot generated earlier with base R with ggplot2:
# Reproduce Plot 2 of exercise 8
plot(clinical_data$weight,clinical_data$height, 
     pch=19,
     main="Weight vs Height in Patients",
     xlab="Weight [kg]", ylab="Height [m]",
     col=c("orange", "blue")[clinical_data$gender])
legend("bottomright",
       legend=levels(clinical_data$gender),
       col=c("orange","blue"),
       pch=19)
abline(lm(clinical_data$height ~ clinical_data$weight),
       col="black", lwd=1.5)

# Customizing with ggplot2
# Scatter plot of weight vs height, coloring by gender
ggplot(data=clinical_data, aes(x=weight, y=height, color=gender)) +
  geom_point() +
  scale_color_manual(values=c("female"="orange", "male"="blue")) + 
  ggtitle("Weight vs Height in Patients") +
  xlab("Weight [kg]") + ylab("Height [m]") +
  theme_bw() +
  geom_smooth(method = "lm",
              formula = y ~ x,
              se=TRUE) # display confidence interval around smoothed curve

# Create a separate plot for males and females:
# Facet wrap: separate the plots according to a categorical (factor) variable
ggplot(data=clinical_data, aes(x=weight, y=height, color=gender)) +
  geom_point() +
  scale_color_manual(values=c("female"="orange", "male"="blue")) + 
  ggtitle("Weight vs Height in Patients") +
  xlab("Weight [kg]") + ylab("Height [m]") +
  theme_bw() +
  geom_smooth(method = "lm",
              formula = y ~ x,
              se=TRUE) +
  facet_wrap(~gender)


### Multi panel figures with ggplot2
p1 <- ggplot(data=clinical_data, aes(x=weight, y=height, color=gender)) +
  geom_point() +
  scale_color_manual(values=c("female"="orange", "male"="blue")) + 
  ggtitle("Weight vs Height in Patients") +
  xlab("Weight [kg]") + ylab("Height [m]") +
  theme_bw() 

# Create a separate plot for males and females:
# Facet wrap: separate the plots according to a categorical (factor) variable
p2 <- ggplot(data=clinical_data, aes(x=weight, y=height, color=gender)) +
  geom_point() +
  scale_color_manual(values=c("female"="turquoise", "male"="plum")) + 
  ggtitle("Weight vs Height in Patients") +
  xlab("Weight [kg]") + ylab("Height [m]") +
  theme_bw() 

# install.packages("cowplot")
library(cowplot)
plot_grid(p1, p2, nrow=1)




### Afternoon - Part 2
### Statistics





