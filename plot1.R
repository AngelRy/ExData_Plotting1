library(dplyr)
## The downloaded file is first unpacked in Windows
rr5 <- read.table("./household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = FALSE)
rr5$Date <- as.Date(rr5$Date, "%d/%m/%Y")
rr5in <- subset(rr5, rr5$Date == "2007-02-01" | rr5$Date == "2007-02-02")
rr5in$Global_active_power <- as.numeric(rr5in$Global_active_power)
rr5p1 <- select(rr5in, Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
with(rr5p1, hist(rr5in$Global_active_power, breaks = 12, xlab = "Global Active Power (kiloWatts)", main = "Global Active Power", col = "red"))
dev.off()