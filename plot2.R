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

png("plot2.png");

#  	Plotting and setting lables to variables on both axes and color

plot(reqData$dt,reqData$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)");

#  	Closing the connection to the opened graphic device.

dev.off();
