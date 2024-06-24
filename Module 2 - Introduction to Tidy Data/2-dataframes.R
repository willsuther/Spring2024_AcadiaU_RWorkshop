# ---- Packages ----
# Packages are user-created collections of objects, functions, and datasets that
# can be installed to RStudio and used to accomplish common tasks

# Some of the most commonly used packages include:
## ggplot2    for data visualization
## dplyr      for data wrangling
## tidyr      for data cleaning
## lubridate  for dealing with dates and times
## stringr    for dealing with strings (characters)

# Download and install the dplyr package (one time)
install.packages("dplyr")   # must be connected to the internet

# Load the dplyr package to your current session (every time)
library(dplyr)

# Best practice: add libraries at the top of your script

# ---- Import Parks Data ----
# We can check the working directory our R is in
getwd()

# We can set it to the same one we downloaded our files in
setwd("C:/Users/wills/OneDrive - Acadia University/Will Sutherland (136915s)/General R Work/Spring2024_AcadiaU_RWorkshop")

# List the files & folders in the project
list.files()

# List the files & folders in the "data" folder
list.files("data")

# parks.csv is in "comma separated values" format
parks <- read.csv("data/parks.csv") # Create an object called parks containing the data frame

# ---- QA/QC Techniques I: Exploring Data ----
# Explore Data: preview
head(parks)    # Print the first six rows
tail(parks)    # Print the last six rows
View(parks)    # View the data in a separate tab

# Explore Data: structure
nrow(parks)   # How many rows?
ncol(parks)    # How many columns?
dim(parks)     # How many rows and columns?
colnames(parks)   # Print column names

# Explore Data: class
str(parks)     # Print data structure

# ---- Interacting with Data Frames ----
# Interact with Data: columns as vectors
# Columns can be extracted as vectors using $
# objectname$component

parks$park_name   # Look at the values in the park_name column
parks$acres

# Interact with Data: indexing
# [*] represents the position of each value in an object

# vectors: one dimensional; one position required
parks$park_name[4]  # Look at the value in the fourth position of the vector

# data frames: two dimensional, two positions required
parks[3, 2]             # Look at the value in the third row, second column of the data frame
parks[3, "park_name"]   # Select the column based on column name

## Goal: Find the tenth value in the park_code column
## (a) indexing from a vector
parks$park_code[10]
## (b) indexing from a data frame using a numeric value to select the column
parks[10, 1]
## (c) indexing from a data frame using a character value to select the column
parks[10, "park_code"]

# Indexing used to be an absolutely essential tool!
# The move toward alternative methods of interacting with data frames
# means that it is still quite important to be familiar with, but less critical

# ---- QA/QC Techniques II: Assessing Data ----
# Assessing Data: numeric variables
summary(parks) # Summary statistics

# Assessing Data: character variables
unique(parks$state)         # Print unique state values
length(unique(parks$state)) # How many unique state values?

# Simple Tables
table(parks$state) # Count occurrences of each state

# Simple Visualizations: Univariate
hist(parks$acres) # Histogram of acres
barplot(table(parks$state))  # Barplot of states

# Simple Visualizations: Multivariate
plot(parks)                        # Scatterplots of all variables
plot(parks$acres ~ parks$year)     # Scatterplot of acres by year
boxplot(parks$acres ~ parks$state) # Distribution of acres by state

## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?
nrow(parks)                     # 56 rows
length(unique(parks$park_name)) # 56 unique park names
# or
table(parks$park_name) # Scroll through output and make sure they are all 1

