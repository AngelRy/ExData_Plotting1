library(dplyr)
library(tidyr)
## The downloaded file is first unpacked in Windows
## Due to some regional settings, the weekday names in my plots do not appear in English
rr6 <- read.table("./household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = FALSE)
rr6$Date <- as.Date(rr6$Date, "%d/%m/%Y")
rr6in <- subset(rr6, rr6$Date == "2007-02-01" | rr6$Date == "2007-02-02")
rr6in$Global_active_power <- as.numeric(rr6in$Global_active_power)
rr6un <- unite(rr6in, DaTi, Date, Time, sep = " ", remove = FALSE)
rr6un$DaTi <- strptime(rr6un$DaTi, format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
with(rr6un, plot(DaTi, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kiloWatts)"))
dev.off()