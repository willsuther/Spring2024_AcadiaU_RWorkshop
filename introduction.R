# ---- 1. Running Code ----

# if a line starts with #, R will not try to run any code
# Any line starting with # is called a "comment"
# Comments are important to help use organize and document our code

# On windows, Ctrl+Enter to run a line of code
# On Mac Cmd+Enter

# You should see > in the lower left hand corner of the Console window
# If you see + you have missed a piece of code and R is waiting
# When we run code, the result will show in the console

# If you want to reset a line in your console, click into your console and hit Esc
# If you want to clear your console, Ctrl+L (you will lose your console history)


# ---- 2. Mathematical Operators ----

# We can use R to act as a calculator to perform math
# See the result in the console?
2 + 2
2 - 10
5 * 5
4/10
(2+1)/13
3^2

# Now, clear your console!

# ---- 3. Logical Operations ----
# A logical operation will return a value of TRUE or FALSE

# 2 is equal to 2
# Double equals sign means equal in R!
2 == 2

# 2 is NOT equal to 3
2 == 3

# 2 is greater than 0 
2 > 0

# 2 is less than or equal to 5
2 <= 5

# 2 is not equal to 8
2 != 8
!(2 == 8)

# 2 is equal to 2 AND less than 7
# Both statements have to be TRUE for the whole statement to be TRUE
2 == 2 & 2 < 7

# 2 is equal to 2 OR 3 is greater than 10
# Only 1 of the statements has to be TRUE for the whole statement to be TRUE
2 == 2 | 3 > 10

## Logical Operator exercises 
## Complete each statement so that it returns TRUE
3*5 == 15
1/2 != 1/4
30 == 10*3 & 40*10 < 405


# ---- 4. Functions ----
# Functions "do things"
# Recognize functions by the function name followed by (
# Every ( needs a )
# The information placed inside the () is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81
sqrt(81)

# Goal: Find the absolute value of 6-14
# Function name: abs
# Argument: 6-14
abs(6-14)

# Goal: Find the square root of the absolute value of 4 - 20

# Option 1: Evaluate in 2 steps
abs(4-20) # returns 16
sqrt(16)

# Option 2: Nested functions (function inside a function)
# The output of abs(4-20) becomes the argument for sqrt()
sqrt(abs(4-20))

# Option 3: Pipes - covered later in the dplyr section!

# Functions require specific types of arguments
# sqrt() requires a number
sqrt("a")

# Arguments are named, but it's not always neccessary to
# call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10
sqrt(x = 10)

# Some functions use more than one argument
# It's not always neccessary to provide these
# There are required arguments and optional arguments
# Optional arguments have default values
# We can access help for a function by typing ? infront of the function name
?rnorm

# Goal: Return one value from a normal distribution
# that has a mean of 0 and a standard deviation of 1
rnorm(n = 1, mean = 0, sd = 1)
rnorm(n = 1)
# By default, rnorm uses mean = 0 and sd = 1 so you don't
# need to specify those values

rnorm() # produces an error
## What does this error message tell you?

# Goal: Return one value from a normal distribution
# that has a mean of 10 and a standard deviation of 6
rnorm(n = 1, mean = 10, sd = 6)

rnorm(1, 10, 6) # Why might this be a bad idea?
rnorm(mean = 10, n = 1, sd = 6) # Why might this be a bad idea?
rnorm(n = 1, sd = 5) # Is this okay?

# ---- 5. Objects ----
# Objects ("containers") store information

# Goal: find the value of the object pi
pi

# Goal: Use pi to accomplish a task
# Eg. divide pi by 2
pi/2

# Goal: make an object called x that contains the value 2
# Use the assignment operator
# The assignment operator gives an object a value
# The operator places information into the container
x <- 2
x

# Goal: make a new object, y, that is x plus 3
y <- x+3
y

# Note: if you update x, it does not automatically update y!
x <- 100
x
y

# Without running the lines below, what do you expect to get as output?
# a) b) c) or d) ?

m <- 3
n <- 7
N <- 20
output <- m + n
m <- 100
output


# a) 23
# b) 10
# c) 120
# d) 107

# ---- 6. Data Classes ----
# 1. Numeric
num <- 2
num
class(num)
sqrt(num)

# 2. Character
char <- 'hello world'
char
class(char)
sqrt(char)

# 3. Logical
logic <- TRUE
logic
class(logic)
sqrt(logic) # Wait... why does this work?
sqrt(FALSE) # Hint: try running this...

# ---- 7. Data Structures: Vectors ----
# One dimensional objects with more than 1 element
# a "list" of values

# Goal: list all integers from 1:10 in an object called myvector
myvector <- 1:10 # using a ':' will tell R to make a list of values increasing by 1
myvector

# Goal: how many elements are in your vector?
length(myvector)

# Goal: What class of data is found in my vector?
class(myvector)

# Goal: Apply a function to all elements
myvector * 2
sqrt(myvector)

# Is each element in myvector greater than 5?
myvector > 5

# Is 2 found in myvector?
2 %in% myvector

# Goal: Create a vector called 'customvector' that contains
# the numbers 2, 21, 42, 50, 100
customvector <- c(2,21,42,50,100) # c() means combine into a vector!

# What is the average of my numbers?
mean(customvector)

# Goal: Create a vector called fruit that contains the words
# apple, blueberry and kiwi
fruit <- c('apple', 'blueberry', 'kiwi')
fruit
class(fruit)

# Goal: add "banana" to the vector called fruit
fruit <- c(fruit, 'banana')
fruit

# ---- 7.1 Characteristics of Vectors ----
# Vectors are "atomic": they can only contain 1 class of data
# Implication: You can't mix charcaters and numbers
scores <- c(95,86,'exemption', 75)
class(scores)

# What was the average test score?
mean(scores)
scores

# Goal: Create a new object called newscores that contains
# the values from scores treated as a numeric vector
newscores <- as.numeric(scores)
newscores

# Goal: What is th average/minimum/maximum test score?
mean(newscores)
min(newscores)
max(newscores)

# ---- 7.2 Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs
mean(newscores, na.rm = TRUE)
# na.rm is an optional argument in several similar functions
min(newscores, na.rm = TRUE)
max(newscores, na.rm = TRUE)

# Goal: Find which values are NA
newscores == NA # doesn't work
is.na(newscores) # works

# is.na() is a function that acts like a conditional operator
# checks if each value is NA
# can check if a value if NOT NA by using !
!is.na(newscores)


 
# ---- 8. Data Structures: Data Frames
# Data Frames are the name to the objects you likely
# think of when you hear the word dataset.
# Option 1: R has many built in datasets
irisdata <- datasets:: iris
irisdata

# Option 2: We can create our own

