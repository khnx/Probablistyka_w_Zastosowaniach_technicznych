setwd("Dokumenty/Git/Probablistyka_w_Zastosowaniach_Technicznych");

examData <- read.delim("Exam Anxiety.dat", header=T);

cor(examData$Exam, examData$Anxiety, use="complete.obs", method="pearson");

examData2 <- examData[, c("Exam", "Anxiety", "Revise")];

cor(examData2);

liarData <- read.delim("The Biggest Liar.dat", heade=T);

library(boot);

bootTau <- function(liarData, i) cor(liarData$Position[i], liarData$Creativity[i], use="complete.obs", method="kendall");

boot_kendall <- boot(liarData, bootTau, 2000);

boot_kendall;

# Działanie funkcji boot

#zad9
zad9 <- read.delim("9.dat", header=T);
cor(zad9$time, zad9$gender, use="complete.obs", method="pearson");