city_calc_growth <- function(set_city)
{
  df_pop_cal = subset(set_city, select = c(Year, Population))
  df_pop_cal2 <- df_pop_cal [-c(1),]
  df_pop_cal3 <- df_pop_cal [-c(28),]
  df_pop_cal2$pop2 <- as.numeric(df_pop_cal3$Population)
  df_pop_cal2$diff <- as.numeric((df_pop_cal2$Population) - df_pop_cal2$pop2)
  df_pop_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_pop_cal2)
  set_city$PopulationChange <- as.numeric(df_pop_cal2$diff)
  set_city$PopulationPercentChange <- round((as.numeric(df_pop_cal2$diff) / as.numeric(df_pop_cal$Population)),4)

  df_unit_cal = subset(set_city, select = c(Year, TotalUnits))
  df_unit_cal2 <- df_unit_cal [-c(1),]
  df_unit_cal3 <- df_unit_cal [-c(28),]
  df_unit_cal2$units2 <- df_unit_cal3$TotalUnits
  df_unit_cal2$diff <- (df_unit_cal2$TotalUnits - df_unit_cal2$units2)
  df_unit_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_unit_cal2)

  set_city$UnitChange <- as.numeric(df_unit_cal2$diff)
  set_city$UnitPercentChange <- round((as.numeric(df_unit_cal2$diff) / as.numeric(df_unit_cal$TotalUnits)),4)
  
  df_sfh_cal = subset(set_city, select = c(Year, Single))
  df_sfh_cal2 <- df_sfh_cal [-c(1),]
  df_sfh_cal3 <- df_sfh_cal [-c(28),]
  df_sfh_cal2$units2 <- df_sfh_cal3$Single
  df_sfh_cal2$diff <- (df_sfh_cal2$Single - df_sfh_cal2$units2)
  df_sfh_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_sfh_cal2)
  
  set_city$SingleChange <- as.numeric(df_sfh_cal2$diff)
  set_city$SinglePercentChange <- round((as.numeric(df_sfh_cal2$diff) / as.numeric(df_sfh_cal$Single)),4)
  
  df_mfh_cal = subset(set_city, select = c(Year, Multi))
  df_mfh_cal2 <- df_mfh_cal [-c(1),]
  df_mfh_cal3 <- df_mfh_cal [-c(28),]
  df_mfh_cal2$units2 <- df_mfh_cal3$Multi
  df_mfh_cal2$diff <- (df_mfh_cal2$Multi - df_mfh_cal2$units2)
  df_mfh_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_mfh_cal2)
  
  set_city$MultiChange <- as.numeric(df_mfh_cal2$diff)
  set_city$MultiPercentChange <- round((as.numeric(df_mfh_cal2$diff) / as.numeric(df_mfh_cal$Multi)),4)
  
  df_mobile_cal = subset(set_city, select = c(Year, Mobile))
  df_mobile_cal2 <- df_mobile_cal [-c(1),]
  df_mobile_cal3 <- df_mobile_cal [-c(28),]
  df_mobile_cal2$units2 <- df_mobile_cal3$Mobile
  df_mobile_cal2$diff <- (df_mobile_cal2$Mobile - df_mobile_cal2$units2)
  df_mobile_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_mobile_cal2)
  
  set_city$MobileChange <- as.numeric(df_mobile_cal2$diff)
  set_city$MobilePercentChange <- round((as.numeric(df_mobile_cal2$diff) / as.numeric(df_mobile_cal$Mobile)),4)
  
  set_city$Vacancy <- round(1- (set_city$Occupied / set_city$TotalUnits), 4)
  
  growth_coeff = subset(set_city, select = c(Year, PopulationPercentChange, UnitPercentChange))
  x1 <- growth_coeff[-c(1),]
  x1$PHGC <- x1$PopulationPercentChange / x1$UnitPercentChange
  x1 <- rbind(c("1990", 0, 0, 0), x1)
  growth_coeff <- x1
  set_city$PHGC <- round(as.numeric(growth_coeff$PHGC),2)
  
  df_interval_columns = subset(set_city, select = c(Year,Population, TotalUnits, Single, Multi, Mobile, PopulationChange,UnitChange,SingleChange, MultiChange,MobileChange))
  
    #1991-1995
  df_1991_1995 = filter(df_interval_columns, Year == 1991 | Year == 1992 | Year == 1993 | Year == 1994 | Year == 1995)
  df_intervals <- rbind(df_1991_1995, c("1991-1995" , "", "", "", "", "", sum(df_1991_1995$PopulationChange), 
                                        sum(df_1991_1995$UnitChange), sum(df_1991_1995$SingleChange), 
                                        sum(df_1991_1995$MultiChange), sum(df_1991_1995$MobileChange)))
  
  #1996-2000
  df_1996_2000 = filter(df_interval_columns, Year == 1996 | Year == 1997 | Year == 1998 | Year == 1999 | Year == 2000)
  df_intervals <- rbind(df_intervals, df_1996_2000, c("1996-2000" , "", "", "", "", "", sum(df_1996_2000$PopulationChange), sum(df_1996_2000$UnitChange),
                              sum(df_1996_2000$SingleChange), sum(df_1996_2000$MultiChange), 
                          sum(df_1996_2000$MobileChange)))
  
  df_2001_2005 = filter(df_interval_columns,  Year == 2001 | Year == 2002 | Year == 2003 | Year == 2004 | Year == 2005)
  df_intervals <- rbind(df_intervals, df_2001_2005, c("2001-2005" , "", "", "", "", "", sum(df_2001_2005$PopulationChange), sum(df_2001_2005$UnitChange),
                                        sum(df_2001_2005$SingleChange), sum(df_2001_2005$MultiChange), 
                                        sum(df_2001_2005$MobileChange)))
  
  df_2006_2010 = filter(df_interval_columns,  Year == 2006 | Year == 2007 | Year == 2008 | Year == 2009 | Year == 2010)
  df_intervals <- rbind(df_intervals, df_2006_2010, c("2006-2010" , "", "", "", "", "", sum(df_2006_2010$PopulationChange), sum(df_2006_2010$UnitChange),
                                        sum(df_2006_2010$SingleChange), sum(df_2006_2010$MultiChange), 
                                        sum(df_2006_2010$MobileChange)))
  
  df_2011_2015 = filter(df_interval_columns,  Year == 2011 | Year == 2012 | Year == 2013 | Year == 2014 | Year == 2015)
  df_intervals <- rbind(df_intervals, df_2011_2015, c("2011-2015" , "", "", "", "", "", sum(df_2011_2015$PopulationChange), sum(df_2011_2015$UnitChange),
                                        sum(df_2011_2015$SingleChange), sum(df_2011_2015$MultiChange), 
                                        sum(df_2011_2015$MobileChange)))
  
  df_2016_2017 = filter(df_interval_columns,  Year == 2016 | Year == 2017)
  df_intervals <- rbind(df_intervals, df_2016_2017, c("2016-2017" , "", "", "", "", "", sum(df_2016_2017$PopulationChange), sum(df_2016_2017$UnitChange),
                                        sum(df_2016_2017$SingleChange), sum(df_2016_2017$MultiChange), 
                                        sum(df_2016_2017$MobileChange)))
  
  df_interval_perc = filter(df_intervals, Year == 1995 | Year == 2000 | Year == 2005 | Year == 2010 | Year == 2015 )  
  df_interval_perc <- subset(df_interval_perc, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  
  df_interval_perc2 = rbind(filter(df_intervals, Year == "1991-1995"), filter(df_intervals, Year == "1996-2000"),
                            filter(df_intervals, Year == "2001-2005"),filter(df_intervals, Year == "2006-2010"),
                            filter(df_intervals, Year == "2011-2015"),filter(df_intervals, Year == "2016-2017"))
  df_interval_perc2 <- subset(df_interval_perc2, select = c(Year, PopulationChange, UnitChange,	SingleChange,	MultiChange,	MobileChange))
  names(df_interval_perc2)[1] <- "YearRange"
  
  df_1990 = filter(df_interval_columns, Year == 1990)
  df_1990 <- subset(df_1990, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  df_2017 = filter(df_interval_columns, Year == 2017)
  df_2017 <- subset(df_2017, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  
  df_interval_perc <- rbind(df_1990, df_interval_perc)
  
  df_interval_perc2$PopulationPercentChange <- round((as.numeric(df_interval_perc2$PopulationChange) / as.numeric(df_interval_perc$Population)),2)
  df_interval_perc2$UnitPercentChange <- round((as.numeric(df_interval_perc2$UnitChange) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc2$SinglePercentChange <- round((as.numeric(df_interval_perc2$SingleChange) / as.numeric(df_interval_perc$Single)),2)
  df_interval_perc2$MultiPercentChange <- round((as.numeric(df_interval_perc2$MultiChange) / as.numeric(df_interval_perc$Multi)),2)
  df_interval_perc2$MobilePercentChange <- round((as.numeric(df_interval_perc2$MobileChange) / as.numeric(df_interval_perc$Mobile)),2)
  df_interval_perc2$SingleGrowthShare <- round((as.numeric(df_interval_perc2$SingleChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  df_interval_perc2$MultiGrowthShare <- round((as.numeric(df_interval_perc2$MultiChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  df_interval_perc2$MobileGrowthShare <- round((as.numeric(df_interval_perc2$MobileChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  
  df_interval_perc <- rbind(df_interval_perc,df_2017)
  df_interval_perc2 <- rbind(c(1990,0,0,0,0,0,0,0,0,0,0,0,0,0),df_interval_perc2)
  
  df_interval_perc$SinglePercent <- round((as.numeric(df_interval_perc$Single) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc$MultiPercent <- round((as.numeric(df_interval_perc$Multi) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc$MobilePercent <- round((as.numeric(df_interval_perc$Mobile) / as.numeric(df_interval_perc$TotalUnits)),2)
  
  df_interval_perc3 <- cbind(df_interval_perc,df_interval_perc2)
  
  dir.create("City")
  dir_path <- paste0("City","/", location)
  dir.create(dir_path)
  write.csv(df_interval_perc3, file=paste0(dir_path, "/", location, "_growth.csv"))
  
  return(df_interval_perc3)
  
}

county_calc_growth <- function(set_county)
{
  df_pop_cal = subset(set_county, select = c(Year, Population))
  df_pop_cal2 <- df_pop_cal [-c(1),]
  df_pop_cal3 <- df_pop_cal [-c(28),]
  df_pop_cal2$pop2 <- as.numeric(df_pop_cal3$Population)
  df_pop_cal2$diff <- as.numeric((df_pop_cal2$Population) - df_pop_cal2$pop2)
  df_pop_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_pop_cal2)
  set_county$PopulationChange <- as.numeric(df_pop_cal2$diff)
  set_county$PopulationPercentChange <- round((as.numeric(df_pop_cal2$diff) / as.numeric(df_pop_cal$Population)),4)
  
  df_unit_cal = subset(set_county, select = c(Year, TotalUnits))
  df_unit_cal2 <- df_unit_cal [-c(1),]
  df_unit_cal3 <- df_unit_cal [-c(28),]
  df_unit_cal2$units2 <- df_unit_cal3$TotalUnits
  df_unit_cal2$diff <- (df_unit_cal2$TotalUnits - df_unit_cal2$units2)
  df_unit_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_unit_cal2)
  
  set_county$UnitChange <- as.numeric(df_unit_cal2$diff)
  set_county$UnitPercentChange <- round((as.numeric(df_unit_cal2$diff) / as.numeric(df_unit_cal$TotalUnits)),4)
  
  df_sfh_cal = subset(set_county, select = c(Year, Single))
  df_sfh_cal2 <- df_sfh_cal [-c(1),]
  df_sfh_cal3 <- df_sfh_cal [-c(28),]
  df_sfh_cal2$units2 <- df_sfh_cal3$Single
  df_sfh_cal2$diff <- (df_sfh_cal2$Single - df_sfh_cal2$units2)
  df_sfh_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_sfh_cal2)
  
  set_county$SingleChange <- as.numeric(df_sfh_cal2$diff)
  set_county$SinglePercentChange <- round((as.numeric(df_sfh_cal2$diff) / as.numeric(df_sfh_cal$Single)),4)
  
  df_mfh_cal = subset(set_county, select = c(Year, Multi))
  df_mfh_cal2 <- df_mfh_cal [-c(1),]
  df_mfh_cal3 <- df_mfh_cal [-c(28),]
  df_mfh_cal2$units2 <- df_mfh_cal3$Multi
  df_mfh_cal2$diff <- (df_mfh_cal2$Multi - df_mfh_cal2$units2)
  df_mfh_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_mfh_cal2)
  
  set_county$MultiChange <- as.numeric(df_mfh_cal2$diff)
  set_county$MultiPercentChange <- round((as.numeric(df_mfh_cal2$diff) / as.numeric(df_mfh_cal$Multi)),4)
  
  df_mobile_cal = subset(set_county, select = c(Year, Mobile))
  df_mobile_cal2 <- df_mobile_cal [-c(1),]
  df_mobile_cal3 <- df_mobile_cal [-c(28),]
  df_mobile_cal2$units2 <- df_mobile_cal3$Mobile
  df_mobile_cal2$diff <- (df_mobile_cal2$Mobile - df_mobile_cal2$units2)
  df_mobile_cal2 <- rbind(c("1990", 0, 0, 0, 0), df_mobile_cal2)
  
  set_county$MobileChange <- as.numeric(df_mobile_cal2$diff)
  set_county$MobilePercentChange <- round((as.numeric(df_mobile_cal2$diff) / as.numeric(df_mobile_cal$Mobile)),4)
  
  set_county$Vacancy <- round(1- (set_county$Occupied / set_county$TotalUnits), 4)
  
  growth_coeff = subset(set_county, select = c(Year, PopulationPercentChange, UnitPercentChange))
  x1 <- growth_coeff[-c(1),]
  x1$PHGC <- x1$PopulationPercentChange / x1$UnitPercentChange
  x1 <- rbind(c("1990", 0, 0, 0), x1)
  growth_coeff <- x1
  set_county$PHGC <- round(as.numeric(growth_coeff$PHGC),2)
  
  df_interval_columns = subset(set_county, select = c(Year,Population, TotalUnits, Single, Multi, Mobile, PopulationChange,UnitChange,SingleChange, MultiChange,MobileChange))
  
  #1991-1995
  df_1991_1995 = filter(df_interval_columns, Year == 1991 | Year == 1992 | Year == 1993 | Year == 1994 | Year == 1995)
  df_intervals <- rbind(df_1991_1995, c("1991-1995" , "", "", "", "", "", sum(df_1991_1995$PopulationChange), 
                                        sum(df_1991_1995$UnitChange), sum(df_1991_1995$SingleChange), 
                                        sum(df_1991_1995$MultiChange), sum(df_1991_1995$MobileChange)))
  
  #1996-2000
  df_1996_2000 = filter(df_interval_columns, Year == 1996 | Year == 1997 | Year == 1998 | Year == 1999 | Year == 2000)
  df_intervals <- rbind(df_intervals, df_1996_2000, c("1996-2000" , "", "", "", "", "", sum(df_1996_2000$PopulationChange), sum(df_1996_2000$UnitChange),
                                                      sum(df_1996_2000$SingleChange), sum(df_1996_2000$MultiChange), 
                                                      sum(df_1996_2000$MobileChange)))
  
  df_2001_2005 = filter(df_interval_columns,  Year == 2001 | Year == 2002 | Year == 2003 | Year == 2004 | Year == 2005)
  df_intervals <- rbind(df_intervals, df_2001_2005, c("2001-2005" , "", "", "", "", "", sum(df_2001_2005$PopulationChange), sum(df_2001_2005$UnitChange),
                                                      sum(df_2001_2005$SingleChange), sum(df_2001_2005$MultiChange), 
                                                      sum(df_2001_2005$MobileChange)))
  
  df_2006_2010 = filter(df_interval_columns,  Year == 2006 | Year == 2007 | Year == 2008 | Year == 2009 | Year == 2010)
  df_intervals <- rbind(df_intervals, df_2006_2010, c("2006-2010" , "", "", "", "", "", sum(df_2006_2010$PopulationChange), sum(df_2006_2010$UnitChange),
                                                      sum(df_2006_2010$SingleChange), sum(df_2006_2010$MultiChange), 
                                                      sum(df_2006_2010$MobileChange)))
  
  df_2011_2015 = filter(df_interval_columns,  Year == 2011 | Year == 2012 | Year == 2013 | Year == 2014 | Year == 2015)
  df_intervals <- rbind(df_intervals, df_2011_2015, c("2011-2015" , "", "", "", "", "", sum(df_2011_2015$PopulationChange), sum(df_2011_2015$UnitChange),
                                                      sum(df_2011_2015$SingleChange), sum(df_2011_2015$MultiChange), 
                                                      sum(df_2011_2015$MobileChange)))
  
  df_2016_2017 = filter(df_interval_columns,  Year == 2016 | Year == 2017)
  df_intervals <- rbind(df_intervals, df_2016_2017, c("2016-2017" , "", "", "", "", "", sum(df_2016_2017$PopulationChange), sum(df_2016_2017$UnitChange),
                                                      sum(df_2016_2017$SingleChange), sum(df_2016_2017$MultiChange), 
                                                      sum(df_2016_2017$MobileChange)))
  
  df_interval_perc = filter(df_intervals, Year == 1995 | Year == 2000 | Year == 2005 | Year == 2010 | Year == 2015 )  
  df_interval_perc <- subset(df_interval_perc, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  
  df_interval_perc2 = rbind(filter(df_intervals, Year == "1991-1995"), filter(df_intervals, Year == "1996-2000"),
                            filter(df_intervals, Year == "2001-2005"),filter(df_intervals, Year == "2006-2010"),
                            filter(df_intervals, Year == "2011-2015"),filter(df_intervals, Year == "2016-2017"))
  df_interval_perc2 <- subset(df_interval_perc2, select = c(Year, PopulationChange, UnitChange,	SingleChange,	MultiChange,	MobileChange))
  names(df_interval_perc2)[1] <- "YearRange"
  
  df_1990 = filter(df_interval_columns, Year == 1990)
  df_1990 <- subset(df_1990, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  df_2017 = filter(df_interval_columns, Year == 2017)
  df_2017 <- subset(df_2017, select = c(Year, Population, TotalUnits,	Single,	Multi,	Mobile))
  
  df_interval_perc <- rbind(df_1990, df_interval_perc)
  
  df_interval_perc2$PopulationPercentChange <- round((as.numeric(df_interval_perc2$PopulationChange) / as.numeric(df_interval_perc$Population)),2)
  df_interval_perc2$UnitPercentChange <- round((as.numeric(df_interval_perc2$UnitChange) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc2$SinglePercentChange <- round((as.numeric(df_interval_perc2$SingleChange) / as.numeric(df_interval_perc$Single)),2)
  df_interval_perc2$MultiPercentChange <- round((as.numeric(df_interval_perc2$MultiChange) / as.numeric(df_interval_perc$Multi)),2)
  df_interval_perc2$MobilePercentChange <- round((as.numeric(df_interval_perc2$MobileChange) / as.numeric(df_interval_perc$Mobile)),2)
  df_interval_perc2$SingleGrowthShare <- round((as.numeric(df_interval_perc2$SingleChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  df_interval_perc2$MultiGrowthShare <- round((as.numeric(df_interval_perc2$MultiChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  df_interval_perc2$MobileGrowthShare <- round((as.numeric(df_interval_perc2$MobileChange) / as.numeric(df_interval_perc2$UnitChange)),2)
  
  df_interval_perc <- rbind(df_interval_perc,df_2017)
  df_interval_perc2 <- rbind(c(1990,0,0,0,0,0,0,0,0,0,0,0,0,0),df_interval_perc2)
  
  df_interval_perc$SinglePercent <- round((as.numeric(df_interval_perc$Single) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc$MultiPercent <- round((as.numeric(df_interval_perc$Multi) / as.numeric(df_interval_perc$TotalUnits)),2)
  df_interval_perc$MobilePercent <- round((as.numeric(df_interval_perc$Mobile) / as.numeric(df_interval_perc$TotalUnits)),2)
  
  df_interval_perc3 <- cbind(df_interval_perc,df_interval_perc2)
  
  dir.create("County")
  dir_path <- paste0("County","/", location)
  dir.create(dir_path)
  write.csv(df_interval_perc3, file=paste0(dir_path,"/", location, "county_growth.csv"))
  
  return(df_interval_perc3)
}

chart <- function (x)
{
  #housing by type
  df_chart_housing_type_year <- subset (x, select=c(Year,Single,Multi,Mobile))
  df_chart_housing_type_year$Year <- as.numeric(df_chart_housing_type_year$Year)
  df_chart_housing_type_year$Single <- as.numeric(df_chart_housing_type_year$Single)
  df_chart_housing_type_year$Multi <- as.numeric(df_chart_housing_type_year$Multi)
  df_chart_housing_type_year$Mobile <- as.numeric(df_chart_housing_type_year$Mobile)
  df_chart_housing_type_year <- df_chart_housing_type_year [-c(7),]
  df_chart_housing_type_year1 <- melt (df_chart_housing_type_year, id.var = "Year")
  
  ggplot(df_chart_housing_type_year1, aes(x = Year, y = value, fill = variable)) + 
    geom_bar(stat = "identity") +
    ggtitle (paste0(location," Total Housing by Type")) +
    ylab("Housing Units") +
    scale_fill_discrete(name = "Housing Type") +
    geom_text(aes(label = value))
  ggsave(paste0(dir_path, "/", location, "-housing-change-by-type.jpg"))
  
  #housing share by type
  df_chart_housing_type_share <- subset (x, select=c(Year,SinglePercent,MultiPercent,MobilePercent))
  df_chart_housing_type_share <- df_chart_housing_type_share [-c(7),]
  df_chart_housing_type_share1 <- melt (df_chart_housing_type_share, id.var = "Year")
  
  ggplot(df_chart_housing_type_share1, aes(x = Year, y = value, fill = variable)) + 
    geom_bar(stat = "identity") +
    ggtitle (paste0(location," Housing Share by Type")) +
    ylab("Housing Unit Share") +
    scale_fill_discrete(name = "Housing Type") +
    geom_text(aes(label = value))
  ggsave(paste0(dir_path, "/", location, "-housing-share-by-type.jpg"))
  
  #housing change by share
  df_chart_housing_type_growth_share <- subset (x, select=c(YearRange,SingleGrowthShare,MultiGrowthShare,MobileGrowthShare))
  df_chart_housing_type_growth_share <- df_chart_housing_type_growth_share [-c(1,7),]
  df_chart_housing_type_growth_share1 <- melt (df_chart_housing_type_growth_share, id.var = "YearRange")
  
  ggplot(df_chart_housing_type_growth_share1, aes(x = YearRange, y = value, fill = variable)) + 
    geom_bar(stat = "identity") +
    ggtitle (paste0(location," Housing Growth Share by Type")) +
    ylab("Growth Share") +
    scale_fill_discrete(name = "Housing Type") +
    geom_text(aes(label = value))
  
  ggsave(paste0(dir_path, "/", location, "-housing-share-growth-by-type.jpg"))
  
  #housing change by type
  df_chart_housing_type_growth <- subset (x, select=c(YearRange,SingleChange,MultiChange,MobileChange))
  df_chart_housing_type_growth$SingleChange <- as.numeric(df_chart_housing_type_growth$SingleChange)
  df_chart_housing_type_growth$MultiChange <- as.numeric(df_chart_housing_type_growth$MultiChange)
  df_chart_housing_type_growth$MobileChange <- as.numeric(df_chart_housing_type_growth$MobileChange)
  df_chart_housing_type_growth <- df_chart_housing_type_growth [-c(1,7),]
  df_chart_housing_type_growth1 <- melt (df_chart_housing_type_growth, id.var = "YearRange")
  
  ggplot(df_chart_housing_type_growth1, aes(x = YearRange, y = value, fill = variable)) + 
    geom_bar(stat = "identity") +
    ggtitle (paste0(location," Housing Growth by Type")) +
    ylab("Unit Change") +
    scale_fill_discrete(name = "Housing Type") +
    geom_text(aes(label = value), position = position_stack(vjust = 0.5)) + 
  ggsave(paste0(dir_path, "/", location, "-housing-growth-by-type.jpg"))
  
  #housing growth vs pop growth
  df_chart_pop_vs_housing_growth <- subset (x, select=c(YearRange,PopulationChange,UnitChange))
  df_chart_pop_vs_housing_growth$PopulationChange <- as.numeric(df_chart_pop_vs_housing_growth$PopulationChange)
  df_chart_pop_vs_housing_growth$UnitChange <- as.numeric(df_chart_pop_vs_housing_growth$UnitChange)
  df_chart_pop_vs_housing_growth <- df_chart_pop_vs_housing_growth [-c(1,7),]
  df_chart_pop_vs_housing_growth1 <- melt (df_chart_pop_vs_housing_growth, id.var = "YearRange")
  
  ggplot(df_chart_pop_vs_housing_growth1, aes(x = YearRange, y = value, fill = variable)) + 
    geom_bar(stat = "identity", position = "dodge") +
    ggtitle (paste0(location," Population vs Housing Growth")) +
    ylab("Growth") +
    scale_fill_discrete(name = "Change") +
    geom_text(aes(label = value))
  ggsave(paste0(dir_path, "/", location, "-population-vs-housing-growth.jpg"))
  
  #population growth vs housing growth pace
  df_chart_pop_vs_housing_growth_pace <- subset (x, select=c(YearRange,PopulationPercentChange,UnitPercentChange))
  df_chart_pop_vs_housing_growth_pace$PopulationPercentChange <- as.numeric(df_chart_pop_vs_housing_growth_pace$PopulationPercentChange)
  df_chart_pop_vs_housing_growth_pace$UnitPercentChange <- as.numeric(df_chart_pop_vs_housing_growth_pace$UnitPercentChange)
  df_chart_pop_vs_housing_growth_pace <- df_chart_pop_vs_housing_growth_pace [-c(1,7),]
  df_chart_pop_vs_housing_growth_pace1 <- melt (df_chart_pop_vs_housing_growth_pace, id.var = "YearRange")
  
  ggplot(df_chart_pop_vs_housing_growth_pace1, aes(x = YearRange, y = value, fill = variable)) + 
    geom_bar(stat = "identity", position = "dodge") +
    ggtitle (paste0(location," Population vs Housing - Growth Rate")) +
    ylab("Growth Rate") +
    scale_fill_discrete(name = "Growth Rate") +
    geom_text(aes(label = value))
  ggsave(paste0(dir_path, "/", location, "-population-vs-housing-growth-rate.jpg"))
}
  