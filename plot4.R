dados <- read.table("C:\\Users\\Rafael\\Documents\\Coursera\\household_power_consumption.txt", h=T, 
                    sep=";", stringsAsFactors = F)
d1 <- which(dados$Date == "1/2/2007")
d2 <- which(dados$Date == "2/2/2007")
dados2 <- dados[c(d1,d2),]

dados2[,1] <- as.Date(strptime(dados2[,1], format = "%d/%m/%Y"))
weekdays(dados2[,1])

dados2[,3] <- as.numeric(dados2[,3]); dados2[,5] <- as.numeric(dados2[,5])
dados2[,7] <- as.numeric(dados2[,7]); dados2[,8] <- as.numeric(dados2[,8]); 
dados2[,9] <- as.numeric(dados2[,9])

#plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dados2[,3], t="l", ylab = "Global Active Power (kilowatts)", xlab = "",
     axes = F, frame.plot = T)
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = NULL)
plot(dados2[,5], t="l", ylab = "Voltage", xlab = "datetime",
     axes = F, frame.plot = T) 
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = NULL)
plot(dados2[,7], t="l", ylab = "Energy syb metering", xlab = "",
     axes = F, frame.plot = T)
lines(dados2[,8], col = 2)
lines(dados2[,9], col = 4)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c(1,2,4), lty = 1, bty = "n")
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = NULL)
plot(dados2[,4], t="l", ylab = "Global_reactive_power", xlab = "datetime",
     axes = F, frame.plot = T)
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = NULL)
dev.off()
