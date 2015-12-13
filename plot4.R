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

png("plot4.png");

#  	Changing the plot settings to plot 4 plots using par() and mfrow.

par(mfcol=c(2,2));

#  	Plotting the first

with(reqData,plot(dt,Global_active_power,xlab="",ylab="Global Active Power",type="l"));

#  	Plotting the second

with(reqData,plot(dt,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"));
lines(reqData$dt,reqData$Sub_metering_2,col="red");
lines(reqData$dt,reqData$Sub_metering_3,col="blue");
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c('black','red','blue'));

#  	Plotting the third

with(reqData,plot(dt,Voltage,xlab="datetime",ylab="Voltage",type="l"));

#  	Plotting the fourth

with(reqData,plot(dt,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l"));

#  	Closing the connection.

dev.off();
