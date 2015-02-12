setwd("/Users/clay/GitHub/Leada-Data-Literacy/")

#Create dataframe of bike trip data
bike_rentals <- read.csv("bike_trip_data.csv", header = T)

#Calculate the mean of all values for the column "Duration"
mean(bike_rentals$Duration, na.rm = T)
#Problem 1: What was the average total time (in minutes) used by a bicycle in the data?
#1230.91 minutes

#Create vector of start dates
start_dates <- bike_rentals$Start.Date

#Create new field in dataframe and fill it with the simple dates
bike_rentals$Start.Date.Simple <- as.Date(start_dates, "%m/%d/%Y")

#Create vector of new start dates and make it a table
start_dates_freq <- bike_rentals$Start.Date.Simple
start_table <- table(start_dates_freq)

#Identify the value of the variable that is most frequent and print the value
the_max <- names(which.max(start_table))
start_table[the_max]
#Problem 2: What was the most popular day by trip frequency in this dataset?
#09/25/13

table(bike_rentals$Start.Station)

# so what I want is a for a field that is number of bikes at start station after
# that bike has been removed. create table where each row is a unique time in chronological
# order and each column is a bike station. a value of -1 is a bike leaving and a +1 is a
# bike being returned. create a running total for each column. identify the first row that
# records a 0. Identify the column that records a 0 in that row