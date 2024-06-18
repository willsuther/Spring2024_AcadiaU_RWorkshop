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

# Examine Data
names(fish)
head(fish)
tail(fish)
nrow(fish)
str(fish)
glimpse(fish) # {dplyr} function

# Subsetting Data with {dplyr} ----
# - select() ----
# select() : selects columns from a data frame and outputs as a data frame
# Goal: Output the column called year
select(fish, year)

# Goal: Output the columns called year and tl
select(fish, year, tl)

# Goal: Convert the data frame to a tibble for easier viewing
fish_tb <- as_tibble(fish)
# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
fish
fish_tb

## Goal: Output the columns called mat, age, and sex from
## (a) the fish data frame
select(fish, mat, age, sex)
## (b) the fish_tb tibble
select(fish_tb, mat, age, sex)

# - filter() ----
# filter() : filters rows from a data frame
# Example: Output the rows that correspond to fish caught prior to 2010
filter(fish_tb, year < 2010)

# Goal: Output the rows that correspond to male fish
filter(fish_tb, sex == "male")

## What is the output from the following line of code?
filter(fish_tb,
       year %in% 2005:2008,
       age > 15)

## Output the rows of:
## immature female fish
## caught in 2004, 2006, or 2009
## anywhere except location 3
## that are larger than 500 mm
filter(fish_tb,
       mat == "immature",
       sex == "female",
       year %in% c(2004, 2006, 2009),
       loc != 3,
       tl > 500)

# Creating Workflows ----
# Information is put into a "pipe"
# It comes out the other side and is used
# as the first argument for the function that awaits

# Goal: Find the square root of 81
81 %>% sqrt()              # 81 becomes the argument for sqrt()

# Goal: Output the column called year
select(fish_tb, year)     # Standard use of select()

fish_tb %>% select(year)  # Pipeline use of select()
# fish_tb becomes the first argument for select()

# This can also be written as
fish_tb %>%
  select(year)

# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nesting functions:
sqrt(abs(-16))  # The output of abs(-16) becomes the argument for sqrt()

# Using pipes:
-16 %>%
  abs() %>%
  sqrt()

# Goal: Considering only fish caught prior to 2010,
# output the columns called year, mat, and tl
fish_tb %>%
  filter(year < 2010) %>%
  select(year, mat, tl)

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
fish_tb %>%
  filter(loc == 2) %>%
  select(w, tl, age,loc)

## Output the grid id (grid), year and tl of instances
## where male fish smaller than 250 mm were captured
fish_tb %>%
  filter(sex == "male",
         tl < 260) %>%
  select(grid, year, tl)

# Modifying Data with {dplyr} ----
# - mutate() ----
# mutate() : creates a column or modifies an existing column

# Use case #1: Creating a new column

# Goal: Create a new column called user that contains your name
fish_tb %>%
  mutate(user = "Will")

glimpse(fish_tb) # What do you notice?

# To make the change permanent, you need to overwrite the
# original object
fish_tb <- fish_tb %>%
  mutate(user = "Will")  # "replace fish_tb with this new version"

glimpse(fish_tb)

# Use case #2: Creating a new column based on calculations from an existing column

# Goal: Convert tl from mm to cm (divide by 10)
fish_tb %>%
  mutate(tl_cm = tl/10)

fish_tb <- fish_tb %>%
  mutate(tl_cm = tl/10)

## Goal: Create column of condition factor (weight / total length in cm)
fish_tb <- fish_tb %>%
  mutate(condition = w / tl_cm)

glimpse(fish_tb)

# Use case #3: Creating a new column based on logic statements about an existing column

# Goal: Create a TRUE/FALSE column called lunker
# that describes if a fish is greater than 70 cm
fish_tb <- fish_tb %>%
  mutate(lunker = tl_cm > 70)

glimpse(fish_tb)
summary(fish_tb)

fish_tb %>%
  filter(lunker == TRUE)

## Goal: Create a column called age_type that is "Old" if the fish is more than
## 10 years old and "Young" if it is not
fish_tb <- fish_tb %>%
  mutate(age_type = ifelse(age > 10, "Old", "Young"))

glimpse(fish_tb)

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
    age == 0 ~ 0,
    age %in% c(1:5) ~ 1,
    age %in% c(6:10) ~ 2,
    age %in% c(11:17) ~ 3,
    TRUE ~ 4
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

fish_tb <- fish_tb %>%
  mutate(loc = case_when(
    loc == 1 ~ 'Shallow',
    loc == 2 ~ 'Shelf',
    loc == 3 ~ 'Deep'
  ))

# Exploratory Data Analysis with {dplyr} ----
# - group_by() ----
# group_by() : splits your data into groups based on the variables you specify
# Goal: Group by location
fish_tb %>%
  group_by(loc)

# - summarise() ----
# summarise() : returns a single value based on the instructions you give it

# Goal: Find the maximum age
fish_tb %>%
  summarise(max(age))

## Goal: Find the minimum year a fish was caught
fish_tb %>%
  summarise(min(year))

# - group_by() & summarise () ----
# Goal: Use group_by() and summarise() together to find the
# total age (w) of fish, by location (loc)
fish_tb %>%
  group_by(loc) %>%
  summarise(sum(age))

# This can be stored as a data frame object
total_ages <- fish_tb %>%
  group_by(loc) %>%
  summarise(sum(age))
total_ages  # Look at the contents of total_area

# The column names can be specified in summarise
total_ages <- fish_tb %>%
  group_by(loc) %>%
  summarise(total_age = sum(age))
total_ages

# Goal: What is the average total length (tl) and
# weight (w), by location?
fish_tb %>%
  group_by(loc) %>%
  summarise(average_length = mean(tl),
            average_weight = mean(w))

## Why can't we find average weight?
## How can we tell R to ignore the NAs when calculating the average weight?
fish_tb %>%
  group_by(loc) %>%
  summarise(average_length = mean(tl),
            average_weight = mean(w, na.rm = TRUE))

## Goal: What is the age of the oldest and 
## the condition of the skinniest fish
## by location?
fish_tb %>%
  group_by(loc) %>%
  summarise(oldest = max(age),
            skinniest = min(condition, na.rm = TRUE))

# - Other summarise() functions ----
# -- n() ----
# n() : counts occurences in each group using summarise()

# Goal: How many fish in each location?
fish_tb %>%
  group_by(loc) %>%
  summarise(fish = n())

# Goal: How many fish in each location, by age_class?
fish_tb %>%
  group_by(loc, age_class) %>%
  summarise(fish = n())

## Goal: How many males were captured each year?
fish_tb %>%
  filter(sex == "male") %>%
  group_by(year) %>%
  summarise(fish = n())

# -- n_distinct() ----
# n_distinct() : counts unique occurences of a variable in each group using summarise()

# Goal: How many different age_classes were captured each year?
fish_tb %>%
  group_by(year) %>%
  summarise(number_age_classes = n_distinct(age_class))

# Goal: How many different age_classes were captured each year, and
# what was the minimum and maximum age_class each year?
fish_tb %>%
  group_by(year) %>%
  summarise(number_age_classes = n_distinct(age_class),
            min_age_class = min(age_class),
            max_age_class = max(age_class))

# --- rename() and rename_with() ---
# rename() allows us to rename specified columns
# rename_with() makes it easier to rename multiple columns

# Let's first check the current names
colnames(fish_tb)

# Goal: Select the location ('loc'), year ('year') and the total length in cm ('tl_cm') and rename them
# Location, Year, Total_Length_cm using the rename() function
fish_tb %>%
  select(loc,year,tl_cm) %>%
  rename(Location = loc,
         Year = year,
         Total_length_cm = tl_cm)

# Goal: Select the location ('loc'), year ('year'), total length in cm ('tl_cm') and weight ('w') and rename them
# Location, Year, Total_Length_cm, Weight using the rename_with() function
new_names <- c('Location', 'Year', 'Total_length_cm','Weight')
fish_tb %>%
  select(loc, year, tl_cm, w) %>%
  rename_with(~new_names)

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
fish_tb %>%
  rename(Year = year) %>%
  filter(Year %in% c(2004, 2008, 2010, 2011, 2014)) %>%
  group_by(Year) %>%
  summarise(Count = n(),
            Grids = n_distinct(grid),
            Smallest_fish = min(tl_cm),
            Avg_condition = mean(condition, na.rm = TRUE),
            Total_weight = sum(w, na.rm = TRUE),
            Count_young = sum(age_type == "Young"))

