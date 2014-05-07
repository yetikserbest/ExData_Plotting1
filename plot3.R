#######################################################################
## This R script creates the third plot for household energy
## Energy consumption data. The third plot provides time series of 
## Energy Sub Metering variables
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
## determine the length of weekday factor vector
x<-length(wday(data$Date,label=T))
## open the png file to save the plot
png(filename="plot3.png")
## create base plot with submetering_1 in balck line and without x-axis
plot(as.numeric(as.character(data$Sub_metering_1)),ylab="Energy sub metering",xlab="",type="l",xaxt="n")
## add x-axis with day of the week points
axis(1,c(1,x/2,x),c("Thu","Fri","Sat"))
## add submetering_2 with color red line
points(as.numeric(as.character(data$Sub_metering_2)),type="l",col="red")
## add submetering_3 with color red line
points(as.numeric(as.character(data$Sub_metering_3)),type="l",col="blue")
## add the legend with corresponding colors to submetering
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
## don't forget to close the device
dev.off()
