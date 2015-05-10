
## Exploratory Data Analysis Course Project 1

######### data loading/processing section (common to all R scripts)

## load raw data
this_table<-read.table('household_power_consumption.txt', header = TRUE,sep = ';')

## format date field for filtering
this_table$Date<-as.Date(this_table$Date, format = "%d/%m/%Y")

## subset table to two days of interest
this_table<-subset(this_table, Date>=as.Date("2007-02-01"))
this_table<-subset(this_table, Date<=as.Date("2007-02-02"))


## convert factor variables to numeric
this_table$Global_active_power<-as.character(this_table$Global_active_power)
this_table$Global_active_power<-as.numeric(this_table$Global_active_power)

this_table$Global_reactive_power<-as.character(this_table$Global_reactive_power)
this_table$Global_reactive_power<-as.numeric(this_table$Global_reactive_power)

this_table$Voltage<-as.character(this_table$Voltage)
this_table$Voltage<-as.numeric(this_table$Voltage)

this_table$Sub_metering_1<-as.character(this_table$Sub_metering_1)
this_table$Sub_metering_1<-as.numeric(this_table$Sub_metering_1)

this_table$Sub_metering_2<-as.character(this_table$Sub_metering_2)
this_table$Sub_metering_2<-as.numeric(this_table$Sub_metering_2)

this_table$Sub_metering_3<-as.character(this_table$Sub_metering_3)
this_table$Sub_metering_3<-as.numeric(this_table$Sub_metering_3)


## combine/convert time variable 
this_table$Time<-as.POSIXct(paste(as.character(this_table$Date)," ",as.character(this_table$Time)))


########## plotting section

## plot 4

##open png plotting device 
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

##do plot
par(mfrow=c(2,2))

## plot 4/1
plot(this_table$Global_active_power~this_table$Time,type = "l",ylab="Global Active Power", xlab="")


## plot 4/2
plot(this_table$Voltage~this_table$Time,type = "l",ylab="Voltage", xlab="datetime")

## plot 4/3
plot(this_table$Sub_metering_1 ~ this_table$Time, type="l", ylab="Energy sub metering", xlab="")
lines(this_table$Sub_metering_2 ~ this_table$Time, type="l", col="red")
lines(this_table$Sub_metering_3 ~ this_table$Time, type="l", col="blue")

legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n") 

## plot 4/4
plot(this_table$Global_reactive_power~this_table$Time,type = "l",ylab="Global_reactive_power", xlab="datetime")

par(mfrow=c(1,1))


##close png device
dev.off()

