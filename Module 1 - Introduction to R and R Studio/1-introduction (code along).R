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

# ---- 2. Mathematical Operators ----

# We can use R to act as a calculator to perform math
# See the result in the console?

 # + is for addition
 # - is for subtraction
 # * is for multiplication 
 # / is for division
 # you can use brackets () for BEDMAS
 # ^ is for exponents

# Now, clear your console!

# ---- 3. Logical Operations ----
# A logical operation will return a value of TRUE or FALSE

# 2 is equal to 2
2 ??? 2 # == is equal

# 2 is NOT equal to 3
2 ??? 3 # != is not equal

# 2 is greater than 0 
2 ??? 0 # > is greater than

# 2 is less than or equal to 5
2 ??? 5 # <= is less than or equal to

# 2 is not equal to 8
2 ??? 8
!(2 ??? 8)

# 2 is equal to 2 AND less than 7
# Both statements have to be TRUE for the whole statement to be TRUE
(2 ??? 2) & (2 ??? 7)

# 2 is equal to 2 OR 3 is greater than 10
# Only 1 of the statements has to be TRUE for the whole statement to be TRUE
2 ??? 2 | 3 ??? 10

## Logical Operator exercises 
## Complete each statement so that it returns TRUE
3*5 ??? 15
1/2 ??? 1/4
(30 ??? 10*3) & (40*10 ??? 405)


# ---- 4. Functions ----
# Functions "do things"
# Recognize functions by the function name followed by (
# Every ( needs a )
# The information placed inside the () is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81


# Goal: Find the absolute value of 6-14
# Function name: abs
# Argument: 6-14


# Goal: Find the square root of the absolute value of 4 - 20

# Option 1: Evaluate in 2 steps
???(???) # returns 16
???(???)

# Option 2: Nested functions (function inside a function)
# The output of abs(4-20) becomes the argument for sqrt()
???(???(???))

# Option 3: Pipes - covered later in the dplyr section!

# Functions require specific types of arguments
# sqrt() requires a number
sqrt("a")

# ---- 5. Objects ----
# Objects ("containers") store information

# Goal: find the value of the object pi


# Goal: Use pi to accomplish a task
# Eg. divide pi by 2


# Goal: make an object called x that contains the value 2
# Use the assignment operator
# The assignment operator gives an object a value
# The operator places information into the container
x <- ???
x

# Goal: make a new object, y, that is x plus 3
y <- ???
y

# Note: if you update x, it does not automatically update y!
x <- ???
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


# 2. Character


# 3. Logical

sqrt(logic) # Wait... why does this work?
sqrt(FALSE) # Hint: try running this...

# ---- 7. Data Structures: Vectors ----
# One dimensional objects with more than 1 element
# a "list" of values

# Goal: list all integers from 1:10 in an object called myvector
myvector <- ??? # using a ':' will tell R to make a list of values increasing by 1
myvector

# Goal: how many elements are in your vector?
???(myvector)

# Goal: What class of data is found in my vector?
???(myvector)

# Goal: Apply a function to all elements
myvector * 2
sqrt(myvector)

# Is each element in myvector greater than 5?
myvector > 5

# Is 2 found in myvector?
2 %in% myvector

# Goal: Create a vector called 'customvector' that contains
# the numbers 2, 21, 42, 50, 100
customvector <- c(???, ???, ???, ???, ???) # c() means combine into a vector!

# What is the average of my numbers?
mean(customvector)

# Goal: Create a vector called fruit that contains the words
# apple, blueberry and kiwi
fruit <- c(???, ???, ???)
fruit
class(fruit)

# Goal: add "banana" to the vector called fruit
fruit <- c(???, ???)
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


# Goal: What is th average/minimum/maximum test score?


# ---- 7.2 Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs

# na.rm is an optional argument in several similar functions


# Goal: Find which values are NA


# is.na() is a function that acts like a conditional operator
# checks if each value is NA
# can check if a value if NOT NA by using !
!(???(newscores))


 
# ---- 8. Data Structures: Data Frames ----
# Data Frames are the name to the objects you likely
# think of when you hear the word dataset.
# Option 1: R has many built in datasets
irisdata <- datasets:: iris
irisdata
 
# Option 2: We can create our own data frame
# Goal: Create a data frame with a column called 'numbers'
# containing the values 1 to 5 and a column called 'animals'
# containing the species of your favorite animals
mydata <- data.frame(numbers = ???,
                     animals = c(???, ???, ???,
                                 ???, ???))
mydata

# IMPORTANT: each column is a vector (and ATOMIC)
# but data frames as a whole can have different data classes

# In R you can extract a column of a data frame using $
# dataframename$columnname

mydata$numbers # Show me the contents of the column called numbers in the object mydata


# Then you can treat the extracted contents like a regular vector


# Option 3: Downloading data from an external source
