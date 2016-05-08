# plot 1

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

## Plot a Graph & Save a png file
  Png_path <- "EDA/plot1.png"

  if(!file.exists(Png_path)){ 
     hist(Filter_Data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red") 
     dev.copy(png, file=Png_path, height=480, width=480) 
     dev.off() 
  } else { 
     hist(Filter_Data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red") 
  } 
