# Load packages ----
library(ggplot2)
library(dplyr)

# Make sure we can find the data
getwd()
setwd()

# Import data ----
fish <- read.delim("data/fish.txt")

# The grammar of graphics ----
# Any visualization has three components:
# 1. a data set (What are you trying to look at?)
# 2. a coordinate system (The most common are x and y axes)
# 3. a geom (How do you want to visualize the data set on the coordinate system?)

## Getting started with geom_point() ----
# Goal: Create a scatterplot
## x: year
## y: catch

# Initialize ggplot()
ggplot()

# 1. Specify a data set
ggplot(fish)

# 2. Specify a coordinate system
ggplot(fish, aes(x = year, y = catch))

# 3. Specify a geom
# Option 1: coordinate system is part of ggplot()
ggplot(fish, aes(x = year, y = catch)) +
  geom_point()

# Option 2: coordinate system is part of geom_()
ggplot(fish) +
  geom_point(aes(x = year, y = catch))

## geom_histogram() ----
# Goal: Create a histogram
## x: area
ggplot(fish) +
  geom_histogram(aes(x = area))

## geom_density() ----
# Goal: Create a density plot
## x: area
ggplot(fish) +
  geom_density(aes(x = area))

## geom_bar() ----
# Goal: Create a bar plot
## x: habitat
ggplot(fish) +
  geom_bar(aes(x = habitat))

## Exercise 1 ----
# Reproduce the figure called figure1.png
ggplot(fish) +
  geom_histogram(aes(x = temperature))

# Reproduce the figure called figure2.png
ggplot(fish) +
  geom_point(aes(x = site, y = habitat))

## geom_boxplot() ----
# Goal: Create a boxplot
## x: site
## y: area
ggplot(fish) +
  geom_boxplot(aes(x = site, y = area))

# Goal: Create a boxplot
## x: year
## y: area
ggplot(fish) +
  geom_boxplot(aes(x = year, y = area))
## What happens if a continuous variable is used on the x axis?

# Option 1: force year to be categorical
ggplot(fish) +
  geom_boxplot(aes(x = as.factor(year), y = area))

# Option 2: add a group argument
ggplot(fish) +
  geom_boxplot(aes(x = year, y = area, group = year))

## geom_violin() ----
# Goal: Create a violin plot
## x: site
## y: area
ggplot(fish) +
  geom_violin(aes(x = site, y = area))

# Combining geom_() layers ----
# Goal: Create a scatterplot, overlayed with a violin plot
## x: site
## y: area
# Start with geom_point()
ggplot(fish) +
  geom_point(aes(x = site, y = area))

# Add geom_violin()
ggplot(fish) +
  geom_point(aes(x = site, y = area)) +
  geom_violin(aes(x = site, y = area))

# Change geom_point() to geom_jitter()
ggplot(fish) +
  geom_jitter(aes(x = site, y = area)) +
  geom_violin(aes(x = site, y = area))

# This syntax is less typing
ggplot(fish, aes(x = site, y = area)) +
  geom_jitter() +
  geom_violin()

# Add alpha argument to geom_() to set transparency
ggplot(fish, aes(x = site, y = area)) +
  geom_jitter() +
  geom_violin(alpha = 0.5)

## Exercise 2 ----
# Reproduce the figure called figure3.png
ggplot(fish, aes(x = habitat, y = area)) +
  geom_boxplot() +
  geom_violin(alpha = 0.5)

# Adding colour ----
# Goal: Create a scatterplot
## x: year
## y: catch
ggplot(fish) +
  geom_point(aes(x = year, y = catch))

# Goal: Make points blue  
ggplot(fish) +
  geom_point(aes(x = year, y = catch, col = "blue"))
## Can you explain why this happens?!

## How would you fix this?
ggplot(fish) +
  geom_point(aes(x = year, y = catch), col = "blue")
## Any argument inside the aes() function is linked
## back to the dataset. Here, the colour "blue" is
## unrelated to the dataset so aes() can't follow
## the instructions you've given it

## Exercise 3 ----
# Specify a colour from the full R colour palette
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# Specify a colour using a hexidecimal code
# https://htmlcolorcodes.com/

# Doing more with colour ----
## But what if you want the colour to be based
## on something in the dataset?

# Continuous variable
# Goal: Make the color of each point based on the month
ggplot(fish) +
  geom_point(aes(x = year, y = catch, col = month))

# Categorical variable
# Goal: Make the color of each point based on site
ggplot(fish) +
  geom_point(aes(x = year, y = catch, col = site))

# Exercise 4 ----
# Reproduce the figure called figure4.png
ggplot(fish) +
  geom_boxplot(aes(x = site, y = area, col = habitat))

# Reproduce the figure called figure5.png
# Hint: try the "fill" argument
ggplot(fish) +
  geom_boxplot(aes(x = site, y = area, fill = habitat))

# ggplot() as an object ----
# Store ggplot() plots as an object
plot1 <- ggplot(fish) +
  geom_point(aes(x = year, y = catch, col = site))
plot1

# Labeling variables ----
# Goal: Add labels on x and y axis
# Option 1
plot2 <- plot1 +
  xlab("Year") +
  ylab("Number Captured")
plot2 # show plot2

# Option 2
plot2 <- plot1 +
  labs(x = "Year", y = "Number Captured")
plot2

# Themes ----
# Goal: Tidy up the background colours
plot3 <- plot2 +
  theme_bw()
plot3

## Try out some of the other built-in themes!
plot2 + theme_classic()
plot2 + theme_dark()
plot2 + theme_void()
plot2 + theme_minimal()

## You can build your own themes, or adjust
## specific components of existing themes to
## customize your own figures

# Exercise 5 ----
# Reproduce the figure called figure6.png
ggplot(fish) +
  geom_bar(aes(x = site, fill = habitat)) +
  labs(x = "Site", y = "Frequency") +
  theme_classic()

# Facetting ----
# Goal: Add a layer to plot3 that creates a 
# separate panel for each habitat type
plot3 + facet_wrap(~habitat)

# Goal: Arrange the panels as a single column
plot3 + facet_wrap(~habitat, ncol = 1)

# Goal: Create a grid with one panel for each
# combination of habitat and site
plot3 + facet_grid(site~habitat)
plot3 + facet_grid(habitat~site)

# ---- Capstone ----
# Use the resulting table to reproduce the figure called myfigure.png

plotme <- fish %>%
  filter(common_name == "Central Stoneroller") %>%
  group_by(year, site, habitat) %>%
  summarise(catch_average = mean(catch),
            catch_minimum = min(catch),
            catch_maximum = max(catch)) %>%
  filter(habitat == "pool", between(year, 1999, 2012))

# Tip: Make a list of what needs to be done and tackle ONE thing at a time.
# Here is a list of things you'll need to do
# See how many you can accomplish!

# We haven't seen all of these yet! Don't hesitate to consult resources:
# http://www.cookbook-r.com/Graphs/


# Components of the plot:
# (1) Scatterplot with year on x axis and mean on y axis
# (2) X axis label is "Year"
# (3) Y axis label is "Mean Number Caught"
# (4) Theme is black and white
# (5) Point colour is based on site
# (6) Points are triangles
# (7) Facet your plot based on site
# (8) Stack all facet panels into one column
# (9) Draw a line connecting the points
## Hint: geom_line()
# (10) Draw a dashed line represented the maximum number captured per year
## Hint: Just like col and shape, there is an argument called linetype
# (11) Draw a dashed line representing the minumum number captured per year
# (12) Allow the y axis limits to be based only on the points within them
## Hint: Look at R Cookbook ggplot2 under "Facets"
# (13) Name the legend "Site ID"
## Hint: You can specify this in the name argument of the function used in step (13) 
# (14) Add a title: "Central Stonerollers in Pools (1999 - 2012)"
## Hint: ggtitle()
# (15) Store your finished plot in an object called myfigure
# (16) Save your plot to your working directory
## Hint: ggsave()
## Bonus: Make the plot 7 inches wide and 9 inches high

# Solution:
myfigure <- ggplot(plotme) +
  geom_point(aes(x = year, y = catch_average, col = site), size = 2, shape = "triangle") + 
  geom_line(aes(x = year, y = catch_average, col = site)) +
  geom_line(aes(x = year, y = catch_maximum, col = site), linetype = "dashed") +
  geom_line(aes(x = year, y = catch_minimum, col = site), linetype = "dashed") +
  labs(x = "Year", y = "Mean Number Captured", col = "Site ID") + 
  theme_bw() +
  facet_wrap(~site, ncol = 1, scales = "free_y") +
  ggtitle("Central Stonerollers in Pools (1999 - 2012)")

myfigure

# Saving plots to your current working directory
ggsave("myfigure.png", myfigure, width = 7, height = 9)
