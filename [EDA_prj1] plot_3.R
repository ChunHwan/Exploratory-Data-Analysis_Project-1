# plot 3

##################################################
#### SourceCode in common for Plot 1 ~ 4    ######
##################################################

## Loading the data 
  setwd("./")
  file_path <- "EDA/household_power_consumption.txt"
  HPA_Data <- read.csv(file_path, sep=';', stringsAsFactors=F, na.strings="?") 
  #str(HPA_Data)

## convert date format to "%d/%m/%Y" 
  HPA_Data$Date <- as.Date(HPA_Data$Date, format="%d/%m/%Y")
  #str(HPA_Data$Date)
  #str(HPA_Data)

## Filter 2007-02-01 & 2007-02-02 
  Filter_Data <- subset(HPA_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

## Combine date & Time to DateTime
  datetime <- paste(as.Date(Filter_Data$Date), Filter_Data$Time) 
  Filter_Data$Datetime <- as.POSIXct(datetime) 

## Plot a Graph & Save a png file
  Png_path <- "EDA/plot3.png"

  if(!file.exists(Png_path)){ 
     plot(Filter_Data$Datetime, Filter_Data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") 
     lines(Filter_Data$Datetime, Filter_Data$Sub_metering_2, type="l", col="red") 
     lines(Filter_Data$Datetime, Filter_Data$Sub_metering_3, type="l", col="blue") 
     legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue")) 
     dev.copy(png, file=Png_path, height=480, width=480) 
     dev.off() 	
  } else { 
     plot(Filter_Data$Datetime, Filter_Data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") 
     lines(Filter_Data$Datetime, Filter_Data$Sub_metering_2, type="l", col="red") 
     lines(Filter_Data$Datetime, Filter_Data$Sub_metering_3, type="l", col="blue") 
     legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue")) 
  } 
