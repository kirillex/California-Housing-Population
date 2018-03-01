library(dplyr)
library(readxl)
library(ggplot2)
library(reshape2)
library(scales)
source ("~/CalHousePop/IngestCounty.R")
source ("~/CalHousePop/IngestCity.R")
source ("~/CalHousePop/IngestFRED.R")
source ("~/CalHousePop/Formulas.r")

#California
set_city <- subset(data_City,City=="State Total")
location <- "California"
city <- city_calc_growth(set_city)
chart(city)

#Los Angeles
location <- "Los Angeles"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#san Diego
location <- "San Diego"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#San Jose
location <- "San Jose"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)


#San Francisco - Use County Data
location <- "San Francisco"
set_county <- subset(data_county,County==location)
county <- county_calc_growth(set_county)
chart(county)

#Fresno
location <- "Fresno"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Sacramento
location <- "Sacramento"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Long Beach
location <- "Long Beach"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Long Beach
location <- "Long Beach"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Oakland
location <- "Oakland"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Oakland
location <- "Oakland"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Bakersfield
location <- "Bakersfield"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Anaheim
location <- "Anaheim"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Santa Ana
location <- "Santa Ana"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Riverside
location <- "Riverside"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Stockton
location <- "Stockton"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Chula Vista
location <- "Chula Vista"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)

#Irvine
location <- "Irvine"
set_city <- subset(data_City,City==location)
city <- city_calc_growth(set_city)
chart(city)