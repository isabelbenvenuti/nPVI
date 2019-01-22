#This script will find utterance length.

#To set working directory, copy the pathname of the folder where
#your .csv is saved & paste it into setwd(""). In line 7, Change name of file in read.csv("") command to the 
#name of your file.
setwd("~/Documents/Winter 2019/LA Speaks")
data <- read.csv("durations_la_speaks_3.csv")

utterance.lengths <- c()
for (j in 1:data[which.max(data$Utterance), 3]) {
  utterance <- c()
for (i in 1:nrow(data)) {
  if (data$Utterance[i] == j) {
    utterance <- c(utterance, data$Utterance[i])
  }
} 
  utterance.lengths <- c(utterance.lengths, length(utterance)) 
}

write.csv(utterance.lengths, file = "utterance_lengths_sp_3")