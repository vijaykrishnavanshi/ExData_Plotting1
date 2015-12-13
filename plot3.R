#	Zip file once downloaded needs to be unzipped
#	Reading data from the text file by following function
#	Setting sep arguement of read.table fuction as ";" and na.strings as "?".

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?");

#  	Subsetting the required data.

reqData<-data[which(data$Date=='1/2/2007' | data$Date=='2/2/2007'),];

#  	Creating a new variable which includes both date and time but using paste().

reqData$dt<-do.call(paste,c(reqData[c("Date","Time")],sep=" "));

#  	Converting the new variable into date class using strptime().

reqData$dt<-strptime(reqData$dt,"%d/%m/%Y %H:%M:%S");

#  	Opening a connection to a bitmap graphic device in R
#	This creates a file named plot.png in working directory

png("plot3.png");

#  	Plotting & labeling with just one variable i.e. Sub_metering_1

with(reqData,plot(dt,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"));

#  	Adding new variable Sub_metering_2 to plot using lines() with color red.

lines(reqData$dt,reqData$Sub_metering_2,col="red");

#  	Adding new variable Sub_metering_3 to plot using lines() with color blue.

lines(reqData$dt,reqData$Sub_metering_3,col="blue");

#  	Adding the legend to the plot.

legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c('black','red','blue'));

#  	Closing the connection.

dev.off();
