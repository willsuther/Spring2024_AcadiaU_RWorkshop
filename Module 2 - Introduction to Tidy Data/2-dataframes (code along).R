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


# List the files & folders in the "data" folder


# parks.csv is in "comma separated values" format
 # Create an object called parks containing the data frame

# ---- QA/QC Techniques I: Exploring Data ----
# Explore Data: preview
   # Print the first six rows
   # Print the last six rows
   # View the data in a separate tab

# Explore Data: structure
  # How many rows?
  # How many columns?
  # How many rows and columns?
  # Print column names

# Explore Data: class
 # Print data structure

# ---- Interacting with Data Frames ----
# Interact with Data: columns as vectors
# Columns can be extracted as vectors using $
# objectname$component

# Look at the values in the park_name column


# Interact with Data: indexing
# [*] represents the position of each value in an object

# vectors: one dimensional; one position required
  # Look at the value in the fourth position of the vector

# data frames: two dimensional, two positions required
# [row, column]
            # Look at the value in the third row, second column of the data frame
            # Select the column based on column name

## Goal: Find the tenth value in the park_code column
## (a) indexing from a vector

## (b) indexing from a data frame using a numeric value to select the column

## (c) indexing from a data frame using a character value to select the column


# Indexing used to be an absolutely essential tool!
# The move toward alternative methods of interacting with data frames
# means that it is still quite important to be familiar with, but less critical

# ---- QA/QC Techniques II: Assessing Data ----
# Assessing Data: numeric variables
 # Summary statistics

# Assessing Data: character variables
       # Print unique state values
       # How many unique state values?

# Simple Tables
 # Count occurrences of each state

# Simple Visualizations: Univariate
   # Histogram of acres
   # Barplot of states

# Simple Visualizations: Multivariate
 # Scatterplots of all variables
 # Scatterplot of acres by year
 # Distribution of acres by state

## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?
nrow(parks)                     
length(unique(parks$park_name)) 
# or
table(parks$park_name) 
