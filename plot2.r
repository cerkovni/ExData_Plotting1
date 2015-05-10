household_power_consumption <- read.csv("C:/Users/Shelby/Downloads/household_power_consumption.txt", sep=";")
library(dplyr)
pwrdat <- filter(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
#mutate(pwrdat, goodtime = paste(as.character(Date), as.character(Time)))
goodtime = paste(as.character(pwrdat$Date), as.character(pwrdat$Time))
pwrdat$Time <- goodtime
pwrdat$Time <- strptime(pwrdat$Time, format = "%d/%m/%Y %H:%M:%S")
pwrdat$Date <- strftime(pwrdat$Time, format = "%a")

# pwrdat$Global_active_power <- as.double(pwrdat$Global_active_power)
# pwrdat$Global_reactive_power <- as.double(pwrdat$Global_reactive_power)
# pwrdat$Voltage <- as.numeric(pwrdat$Voltage)
# pwrdat$Sub_metering_1 <- as.double(pwrdat$Sub_metering_1)
# pwrdat$Sub_metering_2 <- as.double(pwrdat$Sub_metering_2)
# pwrdat$Sub_metering_3 <- as.double(pwrdat$Sub_metering_3)

pwrdat$Global_active_power <- as.numeric(as.character(pwrdat$Global_active_power))
pwrdat$Global_reactive_power <- as.numeric(as.character(pwrdat$Global_reactive_power))
pwrdat$Voltage <- as.numeric(as.character(pwrdat$Voltage))
pwrdat$Sub_metering_1 <- as.numeric(as.character(pwrdat$Sub_metering_1))
pwrdat$Sub_metering_2 <- as.numeric(as.character(pwrdat$Sub_metering_2))
pwrdat$Sub_metering_3 <- as.numeric(as.character(pwrdat$Sub_metering_3))

plot(pwrdat$Time, pwrdat$Global_active_power, type ="l", ylab =" Global Active Power (kilowatts)", xlab ="")
