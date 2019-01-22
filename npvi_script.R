#This script will calculate nPVI.

#First, save your spreadsheet as a .csv file. To set working directory, copy the pathname of the folder where
#your .csv is saved & paste it into setwd(""). In line 7, Change name of file in read.csv("") command to the 
#name of your file.
setwd("~/Documents/Winter 2019/LA Speaks")
data <- read.csv("duration_la_speaks_4.csv")

#This line creates a separate table for vowel data. If you want to find nPVI for consonants, set which(data$Vowel==0).
data.vowels <- data[which(data$Vowel==1),]

counter <- 1
nPVI.vector <- c()
for (j in 1:data.vowels[which.max(data.vowels$Utterance), 3]) {
current.utterance <- data.vowels[which(data.vowels$Utterance==counter),]
duration.frac <- c()
  for (i in 1:(nrow(current.utterance)-1)){
    duration.diff <- current.utterance$Duration[i] - current.utterance$Duration[i + 1]
    duration.avg <- (current.utterance$Duration[i] + current.utterance$Duration[i + 1])/2
    duration.frac[i] <- abs(duration.diff/duration.avg)
    next
  }
duration.sum <- Reduce('+', duration.frac)
nPVI <- duration.sum[1] * (100/(nrow(current.utterance)-1))
nPVI.vector <- c(nPVI.vector, nPVI)
counter <- counter + 1
next
}

#Make a histogram of nPVI values
hist(nPVI.vector)

#This line writes your list of nPVI values into a .csv file and saves it in your working directory.
write.csv(nPVI.vector, file = "npvi_speaker_4.csv")