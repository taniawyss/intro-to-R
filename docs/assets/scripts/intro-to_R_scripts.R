# Introduction to R for Life Sciences - Oct 2024
# R v 4.3.3


## ---- Exploring the R console:

# In the console (bottom left window in RStudio) at the prompt (">"), 
# type the following commands followed by the "Enter" key after each one to view 
# the output printed on the console.

# R is a calculator:
1 + 1

# The nice part of R is that one can keep values in the memory, by using the
# "assignment operator": <- (or you can also use =), which is used to assign a value 
# and a name to a variable

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
help(abs)

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

## ---- R key concepts:

# - Variable: A storage space in memory that has a name and can hold data.
temp <- -5.5	# Create a variable named temp, holding value -5.5, using the 
              # assignment operator

# - Numeric constant:	a number (integer or decimal (float)), such as 128.5
# - Character constant: a text sequence, such a "Hello" (enclosed in quotes)
# - Function: pre-written code that performs a specific task and can be  executed by 
# "calling" the function.
# -  Write the function's name, followed by parentheses. Inside the parenthesis,  
# pass variables or values to the function code (=function arguments). 
abs(temp)
log2(16)
q() # quit R, no argument necessary
# - Operator: a special function for arithmetic, logical or other operations.
# Examples of arithmetic operators: +, -, *, /, ^
10^3 # 10 to the power of 3


## ---- Working directory
# This is not the same concept as the workspace! The working directory is the location
# on your computer where R will look for files and save files, i.e. the current
# folder that is being used to load files.
getwd()



