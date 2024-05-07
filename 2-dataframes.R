# ---- Packages ----
# Packages are collections of functions built by other users
#
# Step 1: Download & install the package
install.packages("ggplot2") # you only need to do this once

# Step 2: "Call" and access the newly installed package
library(ggplot2) # do this every time you start R studio and want to use the package

# Goal: Download & install the packages lubridate, stringr, dplyr
install.packages("lubridate")
install.packages("stringr")
install.packages("dplyr")
install.packages("readxl")

# Goal: Call the newly installed packages
library(lubridate)
library(stringr)
library(dplyr)
library(readxl)

# ---- Importing Data ----
# We can check the working directory our R is in
getwd()

# We can set it to the same one we created our project in
setwd("C:/Users/wills/OneDrive - Acadia University/Will Sutherland (136915s)/General R Work/Spring2024_AcadiaU_RWorkshop")

# List the files & folders in the project
list.files()

# List the files & folders in the "data" folder
list.files("data")
