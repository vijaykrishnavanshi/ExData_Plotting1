#	Zip file once downloaded needs to be unzipped
#	Reading data from the text file by following function
#	Setting sep arguement of read.table fuction as ";" and na.strings as "?".

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?");

# 	Converting date column as a variable to a class

data$Date<-as.Date(data$Date,"%d/%m/%Y");

#  	Extarcting the subset required by using Dates as logical vector.

reqData<-data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"),];

#  	Opening a connection to a bitmap graphic device in R
#	This creates a file named plot.png in working directory

png("plot1.png");

#  	Plotting the histogram setting lables to variables on both axes and color

hist(reqData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power");

#  	Closing the connection to the opened graphic device.

dev.off();
