#Reading data
setwd("C:\\Users\\Rafael\\Documents\\Coursera\\ExData_Plotting1")
dados <- read.table("C:\\Users\\Rafael\\Documents\\Coursera\\household_power_consumption.txt", h=T, 
                    sep=";", stringsAsFactors = F)
d1 <- which(dados$Date == "1/2/2007")
d2 <- which(dados$Date == "2/2/2007")
dados2 <- dados[c(d1,d2),]

dados2[,1] <- as.Date(strptime(dados2[,1], format = "%d/%m/%Y"))
weekdays(dados2[,1])

dados2[,3] <- as.numeric(dados2[,3])

#plot 1
png("plot1.png", width = 480, height = 480)
hist(dados2[,3], col=2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
