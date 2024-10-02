# Introduction to R for Life Sciences - Oct 2024
# R v 4.3.3

# This script contains some extra Bonus sections which you can 
# explore on your own time. 

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


### Part 1
## Let's follow the script !

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

# To set the current working directory to another location, eg to where
# you have saved the csv files we have provided for this course:
setwd("/Intro_R/course_datasets/") 
# ! Change to the folder organization you have on your computer!
# If the location of your working directory should be different from where your 
# script is saved, you need to set the working directory every time you close
# and re-open R. 

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
  

### Part 2
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


# Object name rules

# To name objects, only use letters, numbers, dots . , and underscores _
# Cannot start with a number !!! START WITH A LETTER !!!
# Cannot contain operators
# Cannot contain spaces
5days <- 5
# Error: unexpected input in "5days"



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



# More common object classes/types

# Vector: a series of data, all of the same type
# matrix: 2-dimensional, multiple columns of the same length and data type
# data frame: 2-dimensional, multiple columns of the same length, but each can be
#             of a different data type
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

# Access elements of a vector with the square brackets [ ]:
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
a*2 # Here we multiply each element of vector a by 2
a + c(12,10,12,10) # add the elements of 2 vectors
# Both have to be of the same length if they have multiple elements!

# Many functions take a vector as argument
# Some perform an element-wise operation
?log2 # see the Arguments section and the Value section
log2(a) # compute the logarithm in base 2 of eachelement
# Some return a single value
?mean # see the Arguments section and the Value section
mean(a) # compute the mean of the elements of a


# Bonus section ----
# COERCION

# All elements of a vector must be of the same type.
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

# End of Bonus section ----


######################
# LET'S PRACTICE !   #
######################

# Create two vectors:
# vector_a, containing the values from −5 to 5
# vector_b, from 0 to 1 by increment of 0.1

# Calculate the element-wise sum between the elements of vector_a and vector_b.
# For element-wise operations, both vectors have to be the same length!

# Calculate the sum of elements in vector_a.
# Hint: check out the help of the sum() function

# Identify the smallest and the largest value in vector_a
# Hint: check out the help of the min() and max() functions

# Compute the overall mean of all the values of both vector_a and vector_b
# Hint: remember that you can concatenate 2 vectors with the c() function
# and use the concatenation as an argument in a function
# Hint 2: what could be the name of a function that calculates the mean?




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

# Other: %in%
# Always returns logical values
# This operator allows us to compare the elements of 2 vectors (they don't
# have to be of the same length). The output will be logical for each
# element of the first vector in the comparison
c("Fred", "Marc", "Dan", "Ali") %in% c("Dan", "Geoff", "Ali")


# Bonus section ----

# Logical: ! (negation), & (and), | (or)
!TRUE # ! Reverses TRUE and FALSE
!(c(1,3,2) < 2) 
c(1,3,2) < 3 & c(1,3,2) != 1
# End of Bonus section ----


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

# NAs interfere with many functions:
mean(y)

# Arguments often exist to ignore the NAs before calculation
mean(y, na.rm=TRUE)

# Alternatively, use na.omit() to remove NAs from the data
y_cleaned <- na.omit(y)
mean(y_cleaned)

### !!! NA is different from NaN !!! 
x <- c(1, NA, 0/0) # 0/0 gives NaN = "Not a Number"


# Bonus section ----

# There are functions to detect either NAs and/or NaNs within a vector:
is.na(x) # detects both NAs and NaNs from x
is.nan(x) # detects only NaNs from x
x > 2 # what if we try to compare NA and NaN to a number?

x_clean <- x[!is.na(x)] # removes NAs and NaNs from x
x_clean <- na.omit(x) # equivalent to above

# End of Bonus section ----



#################
# DATAFRAMES    #
#################

# A data frame (df) is a table or a two-dimensional structure in which each column 
# contains values of one variable and each row contains one set of values from 
# each column.
# In biology, a data frame will contain variables measured in the
# columns (eg patient ID, age, disease status, etc), and individual 
# samples in the rows.

# A data frame can either be created within R by combining vectors which will
# become the columns, or by importing data from a csv file for example (see
# later). 

# We can create a dataframe from its individual column (each one is a vector)
name <- c("Joyce", "Chaucer", "Homer") # creates the vector "name"
status <- c("dead", "deader", "deadest") # creates the vector "status"
reader_rating <- c(55, 22, 100) # creates the vector "reader_rating"

# Here we use the data.frame function to create a data frame! Here you can 
# see that a data frame is a two-dimensional combination of vectors.
poets <- data.frame(name, status, reader_rating) # create the df
class(poets)
# [1] "data.frame"

# Explore the data.frame by calling its name:
poets
# You will see in the console:
#      name  status reader_rating
# 1   Joyce    dead            55
# 2 Chaucer  deader            22
# 3   Homer deadest           100


##################################################
# Accessing rows, columns, and individual elements 

# We can use the square brackets with data frames similarly to their use with 
# vectors. 
# However, because data frames are 2-dimensional, we need to use a 
# comma within the square brackets to specify either rows or columns.
# The syntax is [rows , columns]

poets[2,2] # gets the element on row 2 in column 2
poets[,c(1,3)] # using vectors, we get all rows of columns 1 and 3
poets[,c("name", "reader_rating")] # using a vector of column names, we get
# all rows of columns "name" and "reader_rating"

# Another way to access a column by its name is to use the $ sign appended
# to the df name:
poets$name # gets column "name"

# We can perform operations with the columns of a data frame, just like with 
# regular vectors
poets$reader_rating/2

# Some of the  characteristics of a data frame are:
# - The column names should be non-empty.
# - The row names should be unique.
# - The data stored in a data frame can be of numeric, factor or character type.
# - Each column should contain the same number of data items (use NA if some
#   data measurments are missing).
# - A single column contains the same type of data (i.e. all numeric or all character)
#   but the different columns across the df can contain different types of data
#   e.g. one column can contain all numeric and another can contain all characters.

# Functions exist to extract or set the row names and column names of a data frame:
rownames(poets) # gets the row names
colnames(poets) # gets the column names

# We can set the row names by providing a vector that will replace
# the current row names. The same can be done for column names.
rownames(poets) <- c("J", "C", "H") # overwrites row names


#################
# MATRICES      #
#################

# A matrix is also 2-dimensional, but all elements within the matrix are of the 
# same data type (numeric, character, or logical).

# Creating matrices using `matrix()` function. 
# The first argument is the collection of elements to arrange in the matrix, then
# we specify the number of rows and columns (by default nrow=1 and ncol=1)
# By default the matrix is filled by columns.
my_matrix <- matrix(data = c(10, 0, 20, 5, 6, 1), nrow = 2, ncol = 3)

# If you want to fill the matrix by row, change byrow=TRUE
?matrix()
my_matrix2 <- matrix(data = c(10, 0, 20, 5, 6, 1), nrow = 2, ncol = 3, byrow = T)

# Add row and column names
colnames(my_matrix) <- c("Sample_1","Sample_2","Sample_3") 
rownames(my_matrix) <- c("EPCAM","PDGFRB") 
my_matrix

# To accessing rows, columns, and individual elements, we can also use the 
# square bracket syntax with matrices: 
# [rows , columns]
my_matrix[2,2] # gets the element on row 2 in column 2
my_matrix[,c(1,3)] # gets all rows of columns 1 and 3
my_matrix["EPCAM","Sample_2"] # using row names or column names

# ! Unlike with data frames, $ dosen't work with matrices!
# $ dosen't work
my_matrix$Sample_1

# Some R functions require the data to be formatted as a data frame, while 
# others require the data to be formatted as a matrix. 
# One can convert to / from a data frame:
my_df <- as.data.frame(my_matrix)
class(my_df)
my_matrix <- as.matrix(my_df)
class(my_matrix)

# Bonus section ----
# End of Bonus section ----



###################################
# Importing/exporting data into R #
###################################

##########################
# It is of course possible to import data that is located in a text file
# external to R, and to create a data frame.

# One of the most flexible function to read tabular data: read.table()
# Reads a table-formatted text file and imports it as a data frame.

# Two main arguments to provide to the read.table():
# - What is the name of the file and where is it stored in your computer
# - What are the formatting options of the file to be read.

?read.table

# Most important optional arguments of read.table(), read.csv(), read.delim() :

# header (TRUE/FALSE): specifies whether the first line in the file contains 
# column names to be used for the data frame
# - Default in read.table() is FALSE.
# - Default in read.csv() and read.delim() is TRUE.

# sep: specifies the field separator character (e.g. "," or tab "\t"), i.e. how
# the columns in the file to be imported are separated.
# - Default in read.table() is any white space characters (space, tab, newline and carriage return).
# - Default in read.csv() is comma (to import comma-separated values file)
# - Default in read.delim() is tab ("\t")

# Let's read a csv file
# ! Check your working directory with getwd() and change the path to where you have saved the file!
# Using the all purpose read.table() function, we need to specify some of the 
# arguments to import a csv file.
clinical_data <- read.table("example_clinical_data_03102024.csv",
                            header=TRUE, sep=",") 

# Of course, to import a csv file, we can use the read.csv() function
# Except from the "file" argument, all other arguments can be omitted because
# the defaults are adapted to .csv
clinical_data <- read.csv("example_clinical_data_03102024.csv") 

############################

# Checking the imported data
# It is good practice to always check the format of the imported data frame! 
# Are the column names correct? Do you obtain the expected number of 
# rows and columns?

# display first / last rows
head(clinical_data) # shows first 6 rows 
tail(clinical_data) # shows last 6 rows

# What are the dimensions of the df
dim(clinical_data) # number of rows and columns
nrow(clinical_data) # number of rows
ncol(clinical_data) # number of columns

# column names
colnames(clinical_data) 

# Structure of the data frame: what type is each column? character (chr)?
# integer (int)? numeric (num)? Factor?
str(clinical_data) 

# Getting a summary (some statistics)
summary(clinical_data)

# Age has 1 missing value. We decide to remove this MISSING VALUE
# ! Note that this will remove the row with the NA completely!
clinical_data <- na.omit(clinical_data)
summary(clinical_data)
nrow(clinical_data) # number of columns


# Bonus section ----

# Reminder – Accessing parts of the data frame
clinical_data[2,] # 2nd row
clinical_data[, "Age"] # column named "Age"
clinical_data[1:3, c(1,3)] # 3 first rows, 1st and 3rd column
clinical_data$Sample_ID # equivalent to clinical_data[, 1]
clinical_data$Sex[29] # Sex of the last row

# End of Bonus section ----


# The table() function is 
# useful to get a summary of one or several categorical columns
table(clinical_data$Disease)
table(clinical_data$Disease, clinical_data$Sex) # rows are "Disease", columns are "Sex"


# Subsetting a df

# subset() allows you to subset your data by specific columns and values in those columns. 
# Logical operators can be used within the subset function to select the
# rows of interest. 

subset(clinical_data, Disease=="Tumor") 
# keeps only the clinical_data where Disease is "Tumor"

subset(clinical_data, Disease=="Tumor" & Sex=="female") 
# keeps only the clinical_data in "female" & "Tumor" samples

subset(clinical_data, Sex=="male" & (Age > 75 | Age < 60)) 
# keeps only the clinical_data of males with age < 60 or age > 75


########################
# Adding columns to a data frame

# Let's add a column
# There are 2 ways to add a column 
# 1. Create a new vector that has the same length as the number of rows of your
# data frame, then we use the cbind function to append the new vector to the 
# data frame:
grade <- c(NA,"IV",NA,"III",NA,NA,"IV","I","III","I","III","IV",NA,
           NA,"III","II","II",NA,"II",NA,NA, NA,"IV","II","III",NA,NA,  
           NA,NA ) # create new vector
length(grade) # 29

#clinical_data_mod <- cbind(clinical_data_updated, grade) # bind by column
clinical_data_mod <- cbind(clinical_data, grade) # bind by column

# 2. Use the $ sign with a new column name, and use the assignment operator to 
# create the new column:
clinical_data_mod$grade_2 <- grade 

# Convert "grade" to a factor, and order its levels according to 
# increasing severity (and not alphabetically)
clinical_data_mod$grade <- factor(clinical_data_mod$grade, levels = c("I","II","III","IV"))

# Removing a row or column

clinical_data_orig <- clinical_data_mod[,-1] # remove the first column
head(clinical_data_orig) # check resulting data

# extract all columns that you want to keep
clinical_data_orig <- clinical_data_mod[, 2:ncol(clinical_data_mod)] 
head(clinical_data_orig) # check resulting data


# Bonus section ----

# Let's add a row using the rbind function.
# The rbind function can append 2 data frames by rows. Therefore,
# the newly provided row has to be formatted as a data frame also!
# The 2 data frames to be appended by row must have the same number of columns!

### ! Long statements can be broken up over several lines of script !
clinical_data_updated <- rbind(clinical_data,
                               data.frame(Sample_ID="M207",
                                          Age=45,
                                          Sex="female",
                                          Disease="Tumor")) # bind by row

tail(clinical_data_updated)

# End of Bonus section ----


######################
# LET'S PRACTICE !   #
######################


# Create a matrix of gene expression data (3 genes in rows, 5 samples in columns)
# Suggestion:
#         M421 M229 M263 M230 M257
# ANKIB1    46   91   37   53   53
# OSBPL11    4   23   16   30   12
# CALY       0    0    1    0    0

# Hint: Use the matrix function and provide a vector of expression values, then
# edit the column names and the row names.

# Create a data frame containing clinical information (age, sex, disease, in columns)
# for the same samples (in rows)
# Suggestion
#        age  sex disease
# M421    35   M  Healthy
# M229    27   F  Cancer
# M263    43   M  Cancer
# M230    65   M  Cancer
# M257    72   F  Healthy

# Hint: use the data.frame() function to combine vectors, then edit the column
# and row names.

# Check that samples are in the same order in both objects
# Hint: use the == operator to compare 2 vectors.

# Do we have clinical data for samples "M421" and "M422" ?
# Hint: use the %in% operator to compare 2 vectors.

# What is the mean age of female patients ?
# Hint: use the mean function on a vector that contains the age values only
# of female patients. Use the square brackets.

# What is the max expression of OSBPL11 in patients with cancer?
# Hint: use the max function on a vector made of the OSBPL11's expression
# only of Cancer patients




########################
# Exporting a data frame

# Because objects within R are deleted once we close R (unless we save our Environment),
# we can save a data frame that we have manipulated and edited within R 
#  to a text file or csv file.

# We use write.table() or write.csv()
# Some important arguments (check ?write.table for more):
#   file: file path and name for the output file 
# !! Beware: if you give a file name that already exists, the file will be 
# over-written!! To make sure not to over-write an existing file, use a file
# name that doesn't exit yet !!
#   append: allows to append to an existing file (default is FALSE).
#   quote: whether the elements of type character or factor should be surrounded 
#           by double quotes in the printed output (default is TRUE !).
#   sep: field separator to be used, e.g., comma (",") or tab ("\t").
#   row.names: whether the row names are written (default is TRUE)
#   col.names: whether the column names are written (default is TRUE).

# We export the clinical_data_updated data frame:
# If you don't specify the path to where it should be saved, it will be 
# saved in the working directory, which you can check with
getwd()
write.table(clinical_data_updated, 
            "example_clinical_data_updated_03102024.csv",
            quote=FALSE, 
            sep=",", 
            row.names=FALSE)


#############
### Part 3  #
#############


## Plotting
# Two main options are available within R for plotting. 
# Base R plotting functions from the graphics package (comes already pre-installed)
?graphics::plot
# Plotting - the basics
x <- 1:100
y <- log(x) + (x/100)^5
plot(x,y) # equivalent to plot(x, y, type="p")

# Customizing plots
plot(x, y, type="l", col="red",  lwd=3) # this gives a continuous line, of width 3
plot(x, y, type="p", col="cornflowerblue",  pch=17) # this gives blue triangles
abline(a=0, b=1) # adding a continuous line with intercept a=0 and slope b=1 
abline(h=3) # adding a horizontal  line with intercept y=3

# You will see the hist() function, as well as other base functions, later in
# the statistics section

#############
# ggplot2   #
#############

# In omics data analysis (eg bulk or single-cell RNAseq data analysis), we more 
# routinely use ggplot2, which has to be installed.
# Using ggplot2 allows you to obtain more customizable plots, and there
# are more plot options than with base R, eg violin plots. 

# Let's clear our Environment first:
rm(list = ls())

install.packages("ggplot2")
library(ggplot2)

# ggplot2 requires the data to be formatted in data frames!


# Using the data from Tsoi et al., let's explore the expression of genes between 
# subtypes of melanoma cell lines
# The genes to be compared are:
# SOX10 (reported as being differentially expressed between subtypes of melanoma)
# TMEM9 (not reported as differentially expressed)

# Read in the metadata of tumor cell lines (comes from the paper's supplementary
# files)
metadata <- read.csv("1-s2.0-S1535610818301223-mmc2.csv", 
  header = TRUE )

# Let's check the Subtypes available
table(metadata$Subtype)

# Convert Subtype to a factor (important for plotting order)
metadata$Subtype <- factor(metadata$Subtype, 
            levels = c("Undifferentiated", "Neural crest like","Transitory", "Melanocytic"))
class(metadata$Subtype)

# read in the expression data generated for each cell line:
expression_data <- read.table("example_gene_expression_03102024.txt",
                              header=T)
# Explore the data frame!
expression_data[1:5, 1:5]

# Add rownames to the metadata, based on the column "Gene"
rownames(expression_data) <- expression_data$Gene
expression_data[1:5, 1:5]

# Remove the column "Gene"
expression_data$Gene <- NULL
expression_data[1:5, 1:5]

# convert to a matrix
expression_data <- as.matrix(expression_data)

# are all values numeric?
is.numeric(expression_data) # TRUE

# Common plots in biological sciences show continuous data grouped by 
# categorical variables.
# In our case, the categorical variables are in the metadata df, separated 
# from the continuous gene expression data in expression_data. However, ggplot2
# requires a single data frame as input.
# We need to combine the continuous data with the categorical data into a 
# single data frame.

# We need to make sure the categorical df and the continuous gene expression
# df contain the same samples !
metadata$Cell.Line %in% colnames(expression_data)
table(metadata$Cell.Line %in% colnames(expression_data)) # All are TRUE


# We create a new column in the metadata that contains the gene expression
# values we are interested in, in the same order as the samples are organized
# in the metadata object.

# Add expression of TMEM9 and SOX10 to the metadata df, extracting the column names
# that correspond to the metadata$Cell.Line
metadata$TMEM9 <- expression_data["TMEM9", metadata$Cell.Line]
metadata$SOX10 <- expression_data["SOX10", metadata$Cell.Line]
str(metadata) # check the format


# We create a basic scatterplot that associates the gene expressions of TMEM9 (x axis) and SOX10 (x axis) and colors by subtype
?ggplot
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = TMEM9, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           color = Subtype)) + # how to group the y values
  geom_point()  # additional layer to choose a default scatter plot

# As you can see, we obtain a scatterplot with some default colors
# and even a legend!


# We create a basic boxplot that indicates the expression of SOX10 (y axis) per subtype (x axis)
ggplot(metadata, # the data frame that contains the values to plot
              aes(x = Subtype, # what will be on the x axis
                  y = SOX10, # what will be on the y axis
                  color = Subtype)) + # how to group the y values
  geom_boxplot()  # additional layer to choose a default boxplot


# Let's do some additional customization of a boxplot of SOX10
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = Subtype, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           fill = Subtype)) + # how to group the y values (note the difference
  # when using argument "color" above)
  geom_boxplot() +    # additional layer to choose a default box plot
  xlab("") +   # leave the x-axis name empty
  ylab("Expression level (FPKM)") +    # change the y-axis name
  ggtitle("SOX10") + # add a title
  theme(legend.position = "none")   # remove the legend

# Note about the theme() layer in ggplot2:
# Themes are a powerful way to customize the non-data components of your plots: 
# i.e. titles, labels, fonts, background, gridlines, and legends. Themes can be 
# used to give plots a consistent customized look.  
# Some pre-made looks are avaibable: 
# theme_bw(), theme_minimal(), and more. 

# Let's try theme_bw()
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = Subtype, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           fill = Subtype)) + # how to group the y values (note the difference
  # when using argument "color" above)
  geom_boxplot() + 
  xlab("") + # leave the x-axis name empty
  ylab("Expression level (FPKM)") + # change the y-axis name
  ggtitle("SOX10") + # add a title
  theme_bw() # black/white look of plot

# Let's pick a manual color set and change the orientation of the tick labels
ggplot(metadata, # the data frame that contains the values to plot
         aes(x = Subtype, # what will be on the x axis
             y = SOX10, # what will be on the y axis
             fill = Subtype)) + # how to group the y values 
  geom_boxplot() + 
  scale_fill_manual(values=c("cornflowerblue", "coral", "purple", "lightgreen")) +
  xlab("") + # leave the x-axis name empty
  ylab("Expression level (FPKM)") + # change the y-axis name
  ggtitle("SOX10") +
  theme_bw()  + # black/white look of plot
  theme(legend.position = "none", axis.text.x= element_text(angle = 90)) # we
  # add the theme() function to remove the legend and turn the x axis tick labels
  
# Finally, we can easily separate the boxplot according to an
# additional categorical factor.
# We use the same plot as above:
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = Subtype, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           fill = Subtype)) + # how to group the y values 
  geom_boxplot() + 
  scale_fill_manual(values=c("cornflowerblue", "coral", "purple", "lightgreen")) +
  xlab("") + # leave the x-axis name empty
  ylab("Expression level (FPKM)") + # change the y-axis name
  ggtitle("SOX10") +
  theme_bw()  + # black/white look of plot
  theme(legend.position = "none", axis.text.x= element_text(angle = 90)) +
  facet_wrap(~Mutation.Status) # make facets according to mutation status


# Bonus section ----

### Multi panel of plots made with ggplot2 and arranged with cowplot.
# We use the same color scheme in both plots, so we can create a 
# vector with our colors of choice, and re-use the vector:
color <- c("cornflowerblue", "coral", "purple", "lightgreen")

p1 <- ggplot(metadata, 
         aes(x = Subtype, 
             y = SOX10, 
             fill = Subtype)) + 
  geom_boxplot() + 
  scale_fill_manual(values=color) + # use our colors of choice
  xlab("") + 
  ylab("Expression level (FPKM)") + 
  ggtitle("SOX10") +
  theme_bw()  + 
  theme(legend.position = "none", axis.text.x= element_text(angle = 90)) 

# Create a customized scatter plot of SOX10 vs TMEM9
p2 <- ggplot(data=metadata, aes(x=TMEM9, y=SOX10, color=Subtype)) +
  geom_point() +
  scale_color_manual(values=color) + 
  ggtitle("TMEM9 vs SOX10 expression") +
  xlab("TMEM9 (FPKM)") + ylab("SOX10 (FPKM)") +
  theme_bw() 

install.packages("cowplot")
library(cowplot)
# we can adapt the relative width of each plot, making one wider as the other:
plot_grid(p1, p2, nrow=1, rel_widths = c(1, 2))

# Note: when a ggplot is saved to an object, it is not in the RStudio plotting 
# window directly. If you want to view the ggplot object, just call its name 
# in the console, and it will appear in the plotting window. Try with the 2 
# ggplot objects we just created:
p1
p2

# Saving figures to files
# The ggsave functions allows to export a ggplot object to a pdf for example.
# It is used as an additional layer on a plot, just as done above:

# Example 1: boxplot of SOX10:
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = Subtype, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           fill = Subtype)) + 
  geom_boxplot() + 
  ggsave(filename = "SOX10_boxplot.pdf")

# Example 2: saving a ggplot object, eg p1 created above, and adding 
# size options:
ggsave(filename = "SOX10_boxplot_2.pdf", plot = p1, width = 3, height = 5 )

# Finally, a plot created with the base graphics package (i.e plot() function)
# or arranged with cowplot, can be exported with the pdf() and dev.off() 
# functions of the grDevices package
pdf(file = "SOX10_multiPanel.pdf", width = 6, height = 3)
plot_grid(p1, p2, nrow=1, rel_widths = c(1, 2))
dev.off()

# End of Bonus section ----


########################
# Let's practice.      #
########################

# With this code, we created a scatter plot of one gene versus the other
ggplot(metadata, # the data frame that contains the values to plot
       aes(x = TMEM9, # what will be on the x axis
           y = SOX10, # what will be on the y axis
           color = Subtype)) + # how to group the y values
  geom_point()  # additional layer to choose a default scatter plot

# Can you customize it to:
# - Add a title of your choice
# - Change it to a black/white theme
# - Match to the paper's color scheme which is similar to what we have used 
# for the boxplot.
# Hint for the color: the layer is called scale_color_manual() and the color names are:
# "cornflowerblue", "coral", "purple", "lightgreen"




### Part 4
###########################
# Basic Statistics in R   #                   
###########################

# clear the global environment
rm(list = ls())

# Using the data from Tsoi et al., let's compare the expression of genes between two subtypes of melanoma ("Undifferentiated" and "Melanocytic")
# The genes to be compared are:
# SOX10 (reported as being differentially expressed between subtypes of melanoma)
# TMEM9 (not reported as differentially expressed)


#################
# T test        #
# (Parametric)  #
#################


############################
# Read and format the data


# Read in the metadata (same as in the plotting section!)
metadata <- read.csv("1-s2.0-S1535610818301223-mmc2.csv", 
  header = TRUE )

# lets check the subtypes
table(metadata$Subtype)

# subset to "Melanocytic" and "Undifferentiated" subtypes
metadata.sub <- metadata[metadata$Subtype %in% c("Melanocytic","Undifferentiated"),]

# create a factor (important for plotting and in some test functions)
metadata.sub$Subtype <- factor(metadata.sub$Subtype, levels = c("Undifferentiated","Melanocytic"))
class(metadata.sub$Subtype)

# Read in the expression data (same as in the plotting section!)
expression_data <- read.table("example_gene_expression_03102024.txt",
                              header=T)

# Add rownames to the metadata, based on the column "Gene"
rownames(expression_data) <- expression_data$Gene

# Remove the column "Gene"
expression_data$Gene <- NULL

# convert from a data.frame to a matrix
expression_data <- as.matrix(expression_data)

# create separate vectors of expression of TMEM9 in Undifferentiated and Melanocytic
metadata.sub$Cell.Line %in% colnames(expression_data) # check if samples are present in matrix
Melanocytic_cell_lines <- metadata.sub$Cell.Line[metadata.sub$Subtype=="Melanocytic"]
Undifferentiated_cell_lines <- metadata.sub$Cell.Line[metadata.sub$Subtype=="Undifferentiated"]
TMEM9_expression_Melanocytic <- expression_data["TMEM9",Melanocytic_cell_lines] 
TMEM9_expression_Undifferentiated <- expression_data["TMEM9",Undifferentiated_cell_lines] 


##############################
# Check normality of data in plots
# We use histograms and QQplot to visually assess normality

# Histogram - Melanocytic
# hist() is a base graphics function. For customization of the plot, we change
# the arguments within the hist() function.
hist(TMEM9_expression_Melanocytic, # continuous values to be plotted on the histogram
     xlab="FPKM", # to change the x-axis name
     main="TMEM9 - Melanocytic") # to change the title


# Quantile-Quantile Plots - Melanocytic
qqnorm(TMEM9_expression_Melanocytic) # this function uses base graphics functions!
qqline(TMEM9_expression_Melanocytic) # the QQ line as added on top of the 
                                     # already created plot!

# Shapiro-Wilk test of normality - Melanocytic
shapiro.test(TMEM9_expression_Melanocytic)
# Shapiro-Wilk normality test
# 
# data:  TMEM9_expression_Melanocytic
# W = 0.95202, p-value = 0.4892

# Histogram - Undifferentiated
hist(TMEM9_expression_Undifferentiated,
     xlab="FPKM",
     main="TMEM9 - Undifferentiated")

# Quantile-Quantile Plots - Undifferentiated
qqnorm(TMEM9_expression_Undifferentiated)
qqline(TMEM9_expression_Undifferentiated)

# Shapiro-Wilk test of normality - Undifferentiated
shapiro.test(TMEM9_expression_Undifferentiated)
# Shapiro-Wilk normality test
# Shapiro-Wilk normality test
# 
# data:  TMEM9_expression_Undifferentiated
# W = 0.95378, p-value = 0.7133


###################
# Run t.test()

?t.test
t.test(TMEM9_expression_Melanocytic, 
       TMEM9_expression_Undifferentiated)

# Welch Two Sample t-test
# 
# data:  TMEM9_expression_Melanocytic and TMEM9_expression_Undifferentiated
# t = -0.41222, df = 20.909, p-value = 0.6844
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -17.89161  11.97341
# sample estimates:
#   mean of x mean of y 
# 47.67613  50.63523 

# t.test() and other tests return a list that can be assigned to a variable
test_res <- t.test(TMEM9_expression_Melanocytic, 
                   TMEM9_expression_Undifferentiated)

# View the names of the list’s slots using names().
names(test_res)

# Access the elements of a list using the $ or the [[ ]] operators.
test_res[['p.value']]


##################################
# Alternative: using a formula

# add expression of TMEM9 to the metadata df
metadata.sub$TMEM9 <- expression_data["TMEM9", metadata.sub$Cell.Line]
head(metadata.sub) # check

# run the t.test
t.test(TMEM9 ~ Subtype, data=metadata.sub) 

# Welch Two Sample t-test
# 
# data:  TMEM9 by Subtype
# t = 0.41222, df = 20.909, p-value = 0.6844
# alternative hypothesis: true difference in means between group Undifferentiated and group Melanocytic is not equal to 0
# 95 percent confidence interval:
#   -11.97341  17.89161
# sample estimates:
#   mean in group Undifferentiated      mean in group Melanocytic 
# 50.63523                       47.67613



#############################################
# Visualize group differences and add p-value

library(ggplot2)

ggplot(metadata.sub, aes(x=Subtype, y=TMEM9, fill=Subtype)) +
  geom_boxplot() +
  ylab("FPKM") +
  ggtitle("TMEM9") 


# add results of t.test
library(ggpubr)
ggplot(metadata.sub, aes(x=Subtype, y=TMEM9, fill=Subtype)) +
  geom_boxplot() +
  stat_compare_means(method = "t.test") + # this function comes from the
                                          # ggpubr package
  ylab("FPKM") +
  ggtitle("TMEM9") 


###############################################
# Non-parametric alternatives to the t-test   #
# Mann-Whitney’ test                          #
###############################################

# When the data deviates strongly from normality, 
# a non-parametric test can be used in place of a t-test.
# Non-parametric tests do not assume any particular distribution of the data.

# Add SOX10 expression to the metadata
metadata.sub$SOX10 <- expression_data["SOX10",metadata.sub$Cell.Line]
head(metadata.sub)


# Check normality - Melanocytic
SOX10_expression_Melanocytic <- metadata.sub$SOX10[metadata.sub$Subtype=="Melanocytic"]
hist(SOX10_expression_Melanocytic,
     xlab="FPKM",
     main="SOX10 - Melanocytic")

qqnorm(SOX10_expression_Melanocytic)
qqline(SOX10_expression_Melanocytic)

shapiro.test(SOX10_expression_Melanocytic)
# Shapiro-Wilk normality test
# 
# data:  SOX10_expression_Melanocytic
# W = 0.95783, p-value = 0.591

# Check normality - Undifferentiated
SOX10_expression_Undifferentiated <- metadata.sub$SOX10[metadata.sub$Subtype=="Undifferentiated"]
hist(SOX10_expression_Undifferentiated,
     xlab="FPKM",
     main="SOX10 - Undifferentiated")

# Quantile-Quantile Plots - Undifferentiated
qqnorm(SOX10_expression_Undifferentiated)
qqline(SOX10_expression_Undifferentiated)

# Shapiro-Wilk test of normality - Undifferentiated
shapiro.test(SOX10_expression_Undifferentiated)
# Shapiro-Wilk normality test
# 
# data:  SOX10_expression_Undifferentiated
# W = 0.37005, p-value = 1.126e-07


#####################
# Run wilcox.test()

?wilcox.test

test_res <- wilcox.test(SOX10 ~ Subtype, data=metadata.sub)

test_res
# Wilcoxon rank sum exact test
# 
# data:  SOX10 by Subtype
# W = 170, p-value = 2.371e-07
# alternative hypothesis: true location shift is not equal to 0

names(test_res)
test_res[["p.value"]]


#############################
# Visualize group differences

ggplot(metadata.sub, aes(x=Subtype, y=SOX10, color=Subtype)) +
  geom_boxplot() +
  stat_compare_means(method = "wilcox") + # function from the ggpubr package
  ylab("FPKM") +
  ggtitle("SOX10")



#####################
# LET'S PRACTICE !  #
#####################

# Compare the expression of the gene "MITF" between Undifferentiated and Melanocytic
# Also use the QQ plot and QQ line to check normality of the gene expression
# within each group.





#########################
# LINEAR CORRELATION    #
#########################

# Quantify the strength of a linear correlation between two continuous variables

# load Edgar Anderson's Iris Data
data(iris)
?iris

# check
head(iris)

# Create a scatter plot of Petal.Length x Petal.Width

ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width)) +
  geom_point() 

# add a trend line
?stat_smooth
ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width)) +
  geom_point() +
  stat_smooth(method="lm") # this function comes from the ggplot2 package

# remove the Standard error around the trend line and change color
?stat_smooth
ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width)) +
  geom_point() +
  stat_smooth(method="lm", se=FALSE, color="red")

# color the dots according to species
ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width, color=Species)) +
  geom_point() +
  stat_smooth(method="lm",se=FALSE, color="red")

# trend line and color per species
ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width, color=Species)) +
  geom_point() +
  stat_smooth(aes(color=Species), method="lm", se=FALSE)


#####################
# cor()

# computes a correlation between two variables.
# Default: method="pearson" (linear correlation)
# Other options: method="spearman", method="kendall" (rank-based correlations)

?cor

# correlation coefficient
cor(iris$Petal.Length,iris$Petal.Width, method = "pearson" )
# 0.9628654

##############
# cor.test()

# computes a correlation and performs a corresponding statistical test
# for Pearson correlation: p-value from linear regression, same as lm()

?cor.test
cor.test(iris$Petal.Length,iris$Petal.Width, method = "pearson" )

# Pearson's product-moment correlation
# 
# data:  iris$Petal.Length and iris$Petal.Width
# t = 43.387, df = 148, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#  0.9490525 0.9729853
# sample estimates:
#       cor 
# 0.9628654 

test_res <- cor.test(iris$Petal.Length,iris$Petal.Width, method = "pearson" )

names(test_res)

# retrieve the correlation coefficient
test_res[["estimate"]]

# retrieve the p.value
test_res[["p.value"]]


# add to the scatterplot
ggplot(data = iris, aes(x= Petal.Length, y=Petal.Width)) +
  geom_point() +
  stat_smooth(method="lm", se=FALSE, color="red") + 
  annotate("text", x = 2, y = 2.5, 
           label = paste("r =", 
                         round(test_res[["estimate"]], 2)),
           hjust = 0.5, vjust = 0.5) +
  theme_classic()



########################
# Linear regression    #
########################

# In R, the linear regression model is specified by a model formula of the form:
# outcome ~ explanatory variables


# We are going to use Acute Lymphoblastic Leukemia Data from the Ritz Laboratory
# The data consist of microarrays from 128 different individuals with acute lymphoblastic leukemia (ALL). A number of additional covariates are available. The data have been normalized (using rma) and it is the jointly normalized data that are available here. The data are presented in the form of an exprSet object.
# Reference: Sabina Chiaretti, Xiaochun Li, Robert Gentleman, Antonella Vitale, Marco Vignetti, Franco Mandelli, Jerome Ritz, and Robin Foa Gene expression profile of adult T-cell acute lymphocytic leukemia identifies distinct subsets of patients with different response to therapy and survival. Blood, 1 April 2004, Vol. 103, No. 7.


# This was the code used to create the objects needed
# BiocManager::install("ALL")
# library("ALL")
# expression_data = exprs(ALL)
# clinical_data = pData(ALL)
# colnames(expression_data) <- clinical_data$cod
# # convert from probe IDs to symbols
# #BiocManager::install("hgu95av2.db")
# library("hgu95av2.db")
# rownames(expression_data) <- mapIds(hgu95av2.db, rownames(expression_data), "SYMBOL", "PROBEID")
# rownames(expression_data) <- make.unique(rownames(expression_data))
# expression_data <- expression_data[!is.na(rownames(expression_data)),]
# write.table(expression_data, file = "ALL_expression_matrix.txt", quote = FALSE, row.names = T, col.names = T)
# write.csv(clinical_data, file = "ALL_clinical_data.csv", quote = FALSE, row.names = F)

# Read the expression and the clinical data
expression_data <- read.table("ALL_expression_matrix.txt", header = T)
expression_data <- as.matrix(expression_data)
clinical_data <- read.csv("ALL_clinical_data.csv")

# check the clinical data
summary(clinical_data)

# We want to test if the levels of expression of a gene, STOM (Stomatin) is determined by age

# Add expression of STOM to the clinical_data df
clinical_data$STOM <- expression_data["STOM", clinical_data$cod]
head(clinical_data)

# Create a scatter plot
ggplot(clinical_data, aes(x=age,y=STOM)) +
  geom_point()


###################
# The lm() function

# fits a linear model.
# Creates an R object which contains the regression result
# Just printing the result provides only the regression coefficients

my_model <- lm(STOM~age, data=clinical_data)
my_model
# Call:
#   lm(formula = STOM ~ age, data = clinical_data)
# 
# Coefficients:
#   (Intercept)          age  
# 7.55853      0.02507  

# representation of the fit
ggplot(clinical_data, aes(x=age,y=STOM)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE) + xlim(0,60)


###############################
# Check model assumptions

# Residuals
residuals(my_model) # extracts a vector containing the residuals (error)

# Several plots
par(mfrow=c(2,2)) # this function prepares the plotting window to receive 4
# plots generated with base graphics and to organize them into a panel of 2
# rows and 2 columns. The par() function is usually called just before calling
# the plot() functions. 
plot(my_model) # the base plot() function can also take as argument a linear 
# regression model in addition to vectors to plot on the x/y axes. 

# Commentaries on these plots:
# https://library.virginia.edu/data/articles/diagnostic-plots

#########################
# Model summary

summary(my_model)
# Call:
#   lm(formula = STOM ~ age, data = clinical_data)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -2.0982 -0.5423  0.1147  0.5837  1.5934 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 7.558530   0.182982  41.307  < 2e-16 ***
#   age         0.025067   0.005203   4.818 4.24e-06 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.7932 on 121 degrees of freedom
# (5 observations deleted due to missingness)
# Multiple R-squared:  0.161,	Adjusted R-squared:  0.154 
# F-statistic: 23.22 on 1 and 121 DF,  p-value: 4.244e-06


#######################
# LET'S PRACTICE      #
#######################

# The data set "Pima" comes from a study on diabetes in women of Pima Indian heritage.
# We are using a subset (Pima.tr)
# Load the package MASS using library()
# Load the dataset Pima.tr using data(Pima.tr)
# Use ? to get an idea which variables it contains

# Hypothesis: Blood glucose level (glu) is associated with diastolic blood pressure (bp). 
# Run a linear model to test the hypothesis
# Visualize the fit with a scatter plot and a trend line
# Check assumptions of the model graphically



sessionInfo()
# R version 4.3.3 (2024-02-29) 
# ...