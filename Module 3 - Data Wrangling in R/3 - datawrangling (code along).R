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
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvset}: web scraping

# https://www.tidyverse.org/packages/

install.packages('FSAdata')
# - Load Packages ----
library(dplyr)
library(FSAdata)

# Access Pre-Built Data from Package ----
fish <- FSAdata::WalleyeErie2 # looks great..!

# Examine Data using some quick QA/QC
names(fish)
head(fish)
tail(fish)
nrow(fish)
str(fish)
glimpse(fish) # {dplyr} function

# Subsetting Data with {dplyr} ----
# - select() ----
# select() : selects columns from a data frame and outputs as a data frame
# select(dataframe, column1, column2,...)
# Goal: Output the column called year


# Goal: Output the columns called year and tl


# Goal: Convert the data frame to a tibble for easier viewing
fish_tb <- as_tibble(fish)
# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
fish
fish_tb

## Goal: Output the columns called mat, age, and sex from
## (a) the fish data frame

## (b) the fish_tb tibble


# - filter() ----
# filter() : filters rows from a data frame
# filter(dataframe, logical conidtion1, logical condition2,...)
# Example: Output the rows that correspond to fish caught prior to 2010


# Goal: Output the rows that correspond to male fish


## What is the output from the following line of code?
filter(fish_tb,
       year %in% 2005:2008,
       age > 15)

## Output the rows of:
## immature female fish
## caught in 2004, 2006, or 2009
## anywhere except location 3
## that are larger than 500 mm


# Creating Workflows ----
# Information is put into a "pipe"
# It comes out the other side and is used
# as the first argument for the function that awaits
# %>% is the typical pipe
# dataframe %>% function

# Goal: Find the square root of 81
  

# Goal: Output the column called year
    # Standard use of select()

    # Pipeline use of select()
# fish_tb becomes the first argument for select()

# This can also be written as


# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nesting functions:
sqrt(abs(-16))  # The output of abs(-16) becomes the argument for sqrt()

# Using pipes:


# Goal: Considering only fish caught prior to 2010,
# output the columns called year, mat, and tl


## Can you explain why this gives the same output?
fish_tb %>%
  select(year, mat, tl) %>%
  filter(year < 2010)

## What would happen if you tried to run this?
fish_tb %>%
  select(mat, tl) %>%
  filter(year < 2010)

## Choose any location (loc).
## Output the weight (w), total length (tl),
## and age of fish caught in that location


## Output the grid id (grid), year and tl of instances
## where male fish smaller than 250 mm were captured


# Modifying Data with {dplyr} ----
# - mutate() ----
# mutate() : creates a column or modifies an existing column

# Use case #1: Creating a new column

# Goal: Create a new column called user that contains your name


glimpse(fish_tb) # What do you notice?

# To make the change permanent, you need to overwrite the
# original object
  # "replace fish_tb with this new version"

glimpse(fish_tb)

# Use case #2: Creating a new column based on calculations from an existing column

# Goal: Convert tl from mm to cm (divide by 10)


fish_tb <- 

## Goal: Create column of condition factor (weight / total length in cm)


fish_tb <- 

glimpse(fish_tb)

# Use case #3: Creating a new column based on logic statements about an existing column

# Goal: Create a TRUE/FALSE column called lunker
# that describes if a fish is greater than 70 cm


glimpse(fish_tb)
summary(fish_tb)



# case_when()  : a special helper function for mutate that
# allows you to apply rule sets when creating new columns
## Goal: Create a column called age_class that is:
# 0 if the fish age is 0
# 1 if the fish age is 1-5
# 2 if the fish age is 6-10
# 3 if the fish age is 11-17
# 4 if the fish age is anything else
fish_tb <- fish_tb %>%
  mutate(age_class = case_when(
    age == ??? ~ ???,
    age %in% ??? ~ ???,
    age %in% ??? ~ ???,
    age %in% ??? ~ ???,
    TRUE ~ ???
  ))

fish_tb %>%
  select(age, age_class) %>%
  # Show unique sets of variables
  distinct() %>%
  # Arrange the results by age
  arrange(age)

# Goal: find the distinct values of 'loc' and recode them
# Shallow if the loc = 1
# Shelf if the loc = 2
# Deep if the loc = 3

fish_tb %>%
  distinct(loc)


# Exploratory Data Analysis with {dplyr} ----
# - group_by() ----
# group_by() : splits your data into groups based on the variables you specify
# Goal: Group by location


# - summarise() ----
# summarise() : returns a single value based on the instructions you give it

# Goal: Find the maximum age


## Goal: Find the minimum year a fish was caught


# - group_by() & summarise () ----
# Goal: Use group_by() and summarise() together to find the
# total age (w) of fish, by location (loc)


# This can be stored as a data frame object

total_ages  # Look at the contents of total_area

# The column names can be specified in summarise

total_ages

# Goal: What is the average total length (tl) and
# weight (w), by location?


## Why can't we find average weight?
## How can we tell R to ignore the NAs when calculating the average weight?


## Goal: What is the age of the oldest and 
## the condition of the skinniest fish
## by location?


# - Other summarise() functions ----
# -- n() ----
# n() : counts occurences in each group using summarise()

# Goal: How many fish in each location?


# Goal: How many fish in each location, by age_class?


## Goal: How many males were captured each year?


# -- n_distinct() ----
# n_distinct() : counts unique occurences of a variable in each group using summarise()

# Goal: How many different age_classes were captured each year?


# Goal: How many different age_classes were captured each year, and
# what was the minimum and maximum age_class each year?


# --- rename() and rename_with() ---
# rename() allows us to rename specified columns
# rename_with() makes it easier to rename multiple columns

# Let's first check the current names
colnames(fish_tb)

# Goal: Select the location ('loc'), year ('year') and the total length in cm ('tl_cm') and rename them
# Location, Year, Total_Length_cm using the rename() function


# Goal: Select the location ('loc'), year ('year'), total length in cm ('tl_cm') and weight ('w') and rename them
# Location, Year, Total_Length_cm, Weight using the rename_with() function

new_names <- c(???, ???, ???,???)


# Exercise ----
# Rename 'year' to 'Year'
# Choose five years. (extra difficulty: five non-sequential years)
# Generate a table using a {dplyr} workflow that describes, for each year:
# (a) the number of fish caught, called "Count"
# (b) the number of unique grid cells sampled, called "Grids"
# (c) the smallest fish (tl_cm), called "Smallest_fish"
# (d) the average condition, called "Avg_condition"
# (e) the total weight (w), called "Total_weight"
# (f) extra challenge: how many young fish it had (age_type is "Young"), called "Count_young"
##### hint: think about characteristics of data classes

