#######################################################################
## This R script creates the first plot for household energy
## Energy consumption data. The first plot provides histogram of 
## Global Active Power variable
#######################################################################
## read the whole data from the current directory
## file is ";" separated, and there is a header for each column
daat <- read.table("household_power_consumption.txt",header=T,sep=";")
## convert Time variable to Time in R, while doing so, get rid of 
## default added date by R, hence, substr
daat$Time<-substr(strptime(daat$Time, "%H:%M:%S"),12,19)
## convert Date variable to Date in R
daat$Date<-as.Date(daat$Date,"%d/%m/%Y")
## focus on Data for two days 2/1/2007 and 2/2/2007
data<-daat[daat$Date <= "2007-02-02" & daat$Date >= "2007-02-01",]
## open the png file to save the plot
png(filename="plot1.png")
## create histogram, specify title, x-axis label, and color
hist(as.numeric(as.character(data$Global_active_power)),main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
## don't forget to close the device
dev.off()
