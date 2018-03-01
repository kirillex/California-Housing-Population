# Ingest county sheets

data_1990 <- read_xls ("1990.xls", sheet=1)
data_1990c <- data_1990 [-c(1,2,3),-c(3,4)]
data_1990c[,2:9] <- sapply(data_1990c[,2:9],as.numeric)
names(data_1990c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1990c$Year <- as.numeric("1990")

data_1991 <- read_xls ("1990.xls", sheet=3)
data_1991c <- data_1991 [-c(1,2,3),-c(3,4)]
data_1991c[,2:9] <- sapply(data_1991c[,2:9],as.numeric)
names(data_1991c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1991c$Year <- as.numeric("1991")

data_1992 <- read_xls ("1990.xls", sheet=5)
data_1992c <- data_1992 [-c(1,2,3),-c(3,4)]
data_1992c[,2:9] <- sapply(data_1992c[,2:9],as.numeric)
names(data_1992c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1992c$Year <- as.numeric("1992")

data_1993 <- read_xls ("1990.xls", sheet=7)
data_1993c <- data_1993 [-c(1,2,3),-c(3,4)]
data_1993c[,2:9] <- sapply(data_1993c[,2:9],as.numeric)
names(data_1993c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1993c$Year <- as.numeric("1993")

data_1994 <- read_xls ("1990.xls", sheet=9)
data_1994c <- data_1994 [-c(1,2,3),-c(3,4)]
data_1994c[,2:9] <- sapply(data_1994c[,2:9],as.numeric)
names(data_1994c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1994c$Year <- as.numeric("1994")

data_1995 <- read_xls ("1990.xls", sheet=11)
data_1995c <- data_1995 [-c(1,2,3),-c(3,4)]
data_1995c[,2:9] <- sapply(data_1995c[,2:9],as.numeric)
names(data_1995c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1995c$Year <- as.numeric("1995")

data_1996 <- read_xls ("1990.xls", sheet=13)
data_1996c <- data_1996 [-c(1,2,3),-c(3,4)]
data_1996c[,2:9] <- sapply(data_1996c[,2:9],as.numeric)
names(data_1996c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1996c$Year <- as.numeric("1996")

data_1997 <- read_xls ("1990.xls", sheet=15)
data_1997c <- data_1997 [-c(1,2,3),-c(3,4)]
data_1997c[,2:9] <- sapply(data_1997c[,2:9],as.numeric)
names(data_1997c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1997c$Year <- as.numeric("1997")

data_1998 <- read_xls ("1990.xls", sheet=17)
data_1998c <- data_1998 [-c(1,2,3),-c(3,4)]
data_1998c[,2:9] <- sapply(data_1998c[,2:9],as.numeric)
names(data_1998c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1998c$Year <- as.numeric("1998")

data_1999 <- read_xls ("1990.xls", sheet=19)
data_1999c <- data_1999 [-c(1,2,3),-c(3,4)]
data_1999c[,2:9] <- sapply(data_1999c[,2:9],as.numeric)
names(data_1999c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_1999c$Year <- as.numeric("1999")

data_2000 <- read_xls ("2000.xls", sheet=2)
data_2000c <- data_2000 [-c(1,2,3),-c(3,4)]
data_2000c[,2:9] <- sapply(data_2000c[,2:9],as.numeric)
names(data_2000c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2000c$Year <- as.numeric("2000")

data_2001 <- read_xls ("2000.xls", sheet=4)
data_2001c <- data_2001 [-c(1,2,3),-c(3,4)]
data_2001c[,2:9] <- sapply(data_2001c[,2:9],as.numeric)
names(data_2001c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2001c$Year <- as.numeric("2001")

data_2002 <- read_xls ("2000.xls", sheet=6)
data_2002c <- data_2002 [-c(1,2,3),-c(3,4)]
data_2002c[,2:9] <- sapply(data_2002c[,2:9],as.numeric)
names(data_2002c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2002c$Year <- as.numeric("2002")

data_2003 <- read_xls ("2000.xls", sheet=8)
data_2003c <- data_2003 [-c(1,2,3),-c(3,4)]
data_2003c[,2:9] <- sapply(data_2003c[,2:9],as.numeric)
names(data_2003c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2003c$Year <- as.numeric("2003")

data_2004 <- read_xls ("2000.xls", sheet=10)
data_2004c <- data_2004 [-c(1,2,3),-c(3,4)]
data_2004c[,2:9] <- sapply(data_2004c[,2:9],as.numeric)
names(data_2004c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2004c$Year <- as.numeric("2004")

data_2005 <- read_xls ("2000.xls", sheet=12)
data_2005c <- data_2005 [-c(1,2,3),-c(3,4)]
data_2005c[,2:9] <- sapply(data_2005c[,2:9],as.numeric)
names(data_2005c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2005c$Year <- as.numeric("2005")

data_2006 <- read_xls ("2000.xls", sheet=14)
data_2006c <- data_2006 [-c(1,2,3),-c(3,4)]
data_2006c[,2:9] <- sapply(data_2006c[,2:9],as.numeric)
names(data_2006c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2006c$Year <- as.numeric("2006")

data_2007 <- read_xls ("2000.xls", sheet=16)
data_2007c <- data_2007 [-c(1,2,3),-c(3,4)]
data_2007c[,2:9] <- sapply(data_2007c[,2:9],as.numeric)
names(data_2007c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2007c$Year <- as.numeric("2007")

data_2008 <- read_xls ("2000.xls", sheet=18)
data_2008c <- data_2008 [-c(1,2,3),-c(3,4)]
data_2008c[,2:9] <- sapply(data_2008c[,2:9],as.numeric)
names(data_2008c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2008c$Year <- as.numeric("2008")

data_2009 <- read_xls ("2000.xls", sheet=20)
data_2009c <- data_2009 [-c(1,2,3),-c(3,4)]
data_2009c[,2:9] <- sapply(data_2009c[,2:9],as.numeric)
names(data_2009c) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2009c$Year <- as.numeric("2009")

data_2010 <- read_xlsx ("2010.xlsx", sheet=2)
data_2010c <- data_2010 [-c(1,2,3),-c(3,4)]
data_2010c[,2:11] <- sapply(data_2010c[,2:11],as.numeric)
names(data_2010c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2010c$Year <- as.numeric("2010")

data_2011 <- read_xlsx ("2010.xlsx", sheet=4)
data_2011c <- data_2011 [-c(1,2,3),-c(3,4)]
data_2011c[,2:11] <- sapply(data_2011c[,2:11],as.numeric)
names(data_2011c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2011c$Year <- as.numeric("2011")

data_2012 <- read_xlsx ("2010.xlsx", sheet=6)
data_2012c <- data_2012 [-c(1,2,3),-c(3,4)]
data_2012c[,2:11] <- sapply(data_2012c[,2:11],as.numeric)
names(data_2012c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2012c$Year <- as.numeric("2012")

data_2013 <- read_xlsx ("2010.xlsx", sheet=8)
data_2013c <- data_2013 [-c(1,2,3),-c(3,4)]
data_2013c[,2:11] <- sapply(data_2013c[,2:11],as.numeric)
names(data_2013c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2013c$Year <- as.numeric("2013")

data_2014 <- read_xlsx ("2010.xlsx", sheet=10)
data_2014c <- data_2014 [-c(1,2,3),-c(3,4)]
data_2014c[,2:11] <- sapply(data_2014c[,2:11],as.numeric)
names(data_2014c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2014c$Year <- as.numeric("2014")

data_2015 <- read_xlsx ("2010.xlsx", sheet=12)
data_2015c <- data_2015 [-c(1,2,3),-c(3,4)]
data_2015c[,2:11] <- sapply(data_2015c[,2:11],as.numeric)
names(data_2015c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2015c$Year <- as.numeric("2015")

data_2016 <- read_xlsx ("2010.xlsx", sheet=14)
data_2016c <- data_2016 [-c(1,2,3),-c(3,4)]
data_2016c[,2:11] <- sapply(data_2016c[,2:11],as.numeric)
names(data_2016c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2016c$Year <- as.numeric("2016")

data_2017 <- read_xlsx ("2010.xlsx", sheet=16)
data_2017c <- data_2017 [-c(1,2,3),-c(3,4)]
data_2017c[,2:11] <- sapply(data_2017c[,2:11],as.numeric)
names(data_2017c) = c("County","Population", "TotalUnits", "SingleA","SingleD", "Multi2", "Multi5", "Mobile", "Occupied","Vacancy","HouseholdSize")
data_2017c$Year <- as.numeric("2017")

data_county_1990_2009 <- rbind(data_1990c, data_1991c, data_1992c, data_1993c, data_1994c, data_1995c, data_1996c
                               , data_1997c, data_1998c, data_1999c, data_2000c, data_2001c, data_2002c, data_2003c
                               , data_2004c, data_2005c, data_2006c, data_2007c, data_2008c, data_2009c)
data_county_2010_2017 <- rbind(data_2010c, data_2011c, data_2012c, data_2013c, data_2014c, data_2015c
                               , data_2016c, data_2017c)

data_county_2010_2017$Single <- as.numeric((data_county_2010_2017$SingleA + data_county_2010_2017$SingleD))
data_county_2010_2017$Multi <- (data_county_2010_2017$Multi2 + data_county_2010_2017$Multi5)

data_county_2010_2017c <- subset(data_county_2010_2017, select=c(c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize", "Year")))

data_county <- rbind(data_county_1990_2009, data_county_2010_2017c)
names(data_county) = c("County","Population", "TotalUnits", "Single", "Multi", "Mobile", "Occupied","Vacancy","HouseholdSize","Year")
data_county$Vacancy <- round(data_county$Vacancy, 2)
data_county$HouseholdSize <- round(data_county$HouseholdSize, 2)
data_county <- subset(data_county, County != "N/A")

#Housing Type Mix
data_county$SinglePercent <- round((data_county$Single / data_county$TotalUnits),4)
data_county$MultiPercent <- round((data_county$Multi / data_county$TotalUnits),4)
data_county$MobilePercent <- round((data_county$Mobile / data_county$TotalUnits),4)
