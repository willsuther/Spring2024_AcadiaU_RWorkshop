# ---- Packages ----
# Packages are collections of functions built by other users
#
# Step 1: Download & install the package
install.packages("ggplot2") # you only need to do this once

# Step 2: "Call" and access the newly installed package
library(ggplot2) # do this every time you start R studio and want to use the package

# ---- Importing Data ----
# We can check the working directory our R is in
getwd()

# We can set it to the same one we created our project in
setwd("C:/Users/wills/OneDrive - Acadia University/Will Sutherland (136915s)/General R Work/Spring2024_AcadiaU_RWorkshop")

# List the files & folders in the project
list.files()

# List the files & folders in the "data" folder
list.files("data")

# Excel files (.xlsx or .xls)


# Comma Separated Values (.csv)
data <- read.csv("data/fish.csv")

# Tab Delimited Values (.txt)
taxonomy <- read.delim("data/taxonomy.txt")

# ---- Exploring Data Frames ----
View(data) # View data in a new tab
View(taxonomy)

dim(data) # Number of rows and columns
nrow(data) # Number of rows
ncol(data) # Number of columns

head(data) # Display the first six rows
tail(data) # Display the last six rows
names(data) # Display the names of each column

summary(data) # Summarise each column
str(data) # Display the structure of the object
glimpse(data) # Display the structure of the object using {dplyr}

# ---- {tidyverse} ----
# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# Goal: Download & install the packages lubridate, tidyr, dplyr
install.packages("lubridate")
install.packages("tidyr")
install.packages("dplyr")

# Goal: Call the newly installed packages
library(lubridate)
library(tidyr)
library(dplyr)

# Packages used in {tidyverse}
# {dplyr}: data manipulation #
# {ggplot2}: visualizing data #
# {lubridate}: working with dates and times #
# {tidyr}: tidying data
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvset}: web scraping

# https://www.tidyverse.org/packages/

View(inner_join(data, taxonomy, by = 'common_name'))

# ---- Working with dates ----
separate(data$date, into = c('year', 'month',' day'), sep = '-')
# ---- Subsetting Data with {dplyr} ----
# select() : selects columns from a data frame and outputs as a data frame
# Example: Output the column called year
select(data, date)

# Goal: Output the columns called site and common_name
select(data, site, common_name)

# Goal: Convert the data frame to a tibble for easier viewing
data_tb <- as_tibble(data)

# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
data
data_tb

# Goal: Output the columns called site and common_name
select(data_tb, site, common_name)

# filter() : filters rows from a data frame
# Example: Output the rows where year is less than or equal to 2000
filter(data_tb, year <= 2000)

# Goal: Output the rows that correspond to data from site D
filter(data_tb, site == "D")

# Goal: Output the rows that correspond to data from pools in site D
filter(data_tb,
       site == "D",
       habitat == "pool")

## What is the output from the following line of code?
filter(data_tb,
       year %in% c(1999, 2001),
       month > 6,
       site == "A",
       common_name == "Creek Chub")

## What is the output from the following line of code?
filter(data_tb,
       between(year, 1999, 2001),
       month > 1,
       month < 4,
       site != "A",
       common_name == "Creek Chub")
