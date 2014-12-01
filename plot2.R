dados <- read.table("C:\\Users\\Rafael\\Documents\\Coursera\\household_power_consumption.txt", h=T, 
                    sep=";", stringsAsFactors = F)
d1 <- which(dados$Date == "1/2/2007")
d2 <- which(dados$Date == "2/2/2007")
dados2 <- dados[c(d1,d2),]

dados2[,1] <- as.Date(strptime(dados2[,1], format = "%d/%m/%Y"))
weekdays(dados2[,1])

dados2[,3] <- as.numeric(dados2[,3])

#plot 2
png("plot2.png", width = 480, height = 480)
plot(dados2[,3], t="l", ylab = "Global Active Power (kilowatts)", xlab = "", 
     axes = F, frame.plot = T)
axis(1, at = c(0,1441,2880), labels = c("Thu", "Fri", "Sat"))
axis(2, at = NULL)
dev.off()
