# Instalacja wszystkich pakietow.
install.packages("car");
install.packages("ggplot2");
install.packages("pastecs");
install.packages("psych");
install.packages("Rcmdr");

# Wczytaj pakiety.
library(car);
library(ggplot2);
library(pastecs);
library(psych);
library(Rcmdr);

# Wczytaj data frame DownloadFestival.dat.
dlf <- read.delim("DownloadFestival.dat", header = T);

# opts jest zdeprecjonowana, zamiast tego uzywam theme; geom_histogram wyswietla histogram funkcji gestosci, labs podpisuje osie, stat_function dodaje do wykresu linie normy
hist.day1 <- ggplot(dlf, aes(day1)) + theme(legend.position = "none") + geom_histogram(aes(y = ..density..), color = "black", fill = "white") + labs(x = "Hygiene score on day 1", y = "Density") + stat_function(fun = dnorm, args = list(mean = mean(dlf$day1, na.rm = T), sd = sd(dlf$day1, na.rm = T)), color = "black", size = 1);
hist.day1;
# Utworz prosty wykres dla day1; stat jest zdeprecjonowany.
qqplot.day1 <- qplot(sample = dlf$day1);
qqplot.day1;

# Powtorz dla day2.
hist.day2 <- ggplot(dlf, aes(day2)) + theme(legend.position = "none") + geom_histogram(aes(y = ..density..), color = "black", fill = "white") + labs(x = "Hygiene score on day 2", y = "Density") + stat_function(fun = dnorm, args = list(mean = mean(dlf$day2, na.rm = T), sd = sd(dlf$day2, na.rm = T)), color = "black", size = 1);
hist.day2;
qqplot.day2 <- qplot(sample = dlf$day2);
qqplot.day2;
# Powtorz dla day3.
hist.day3 <- ggplot(dlf, aes(day3)) + theme(legend.position = "none") + geom_histogram(aes(y = ..density..), color = "black", fill = "white") + labs(x = "Hygiene score on day 3", y = "Density") + stat_function(fun = dnorm, args = list(mean = mean(dlf$day3, na.rm = T), sd = sd(dlf$day3, na.rm = T)), color = "black", size = 1);
hist.day3;
qqplot.day3 <- qplot(sample = dlf$day3);
qqplot.day3;

# factor zamienia wskazane wartosci na inne.
rexam <- read.delim("RExam.dat", header = T);
rexam$uni <- factor(rexam$uni, levels = c(0:1), labels = c("Duncetown University", "Sussex University"));

# Utworz tabele podstawowych wlasnosci statystycznych. Tylko statystyki opisowe.
desc_rexam <- stat.desc(rexam, basic = F);
ggplot(data = desc_rexam, aes(exam)) + geom_histogram();
# Powtorz dla pozostalych kolumn.
ggplot(data = desc_rexam, aes(computer)) + geom_histogram();
ggplot(data = desc_rexam, aes(lectures)) + geom_histogram();
ggplot(data = desc_rexam, aes(numeracy)) + geom_histogram();

# Przeksztalc dane dla wartosci kolumn uni, pokaz dla nich wlasnosci statystyczne.
by(cbind(data = rexam$exam, data = rexam$numeracy), rexam$uni, describe);

# Wyodrebnij dunceData z rexam.
dunceData <- rexam[rexam["uni"] == "Duncetown University", c("exam", "computer", "lectures", "numeracy", "uni")];
# Stworz wykres dla uniwersytetu Duncetown. Bez legendy. Dodaj histogram dla funkcji gestosci. Dodaj linie funkcji normy zalezna od sredniej.
hist.numeracy.duncetown <- ggplot(dunceData, aes(numeracy)) + theme(legend.position = "none") + geom_histogram(aes(y = ..density..), fill = "white", color = "black", binwidth = 1) + labs(x = "Numeracy Score", y = "Density") + stat_function(fun = dnorm, args = list(mean = mean(dunceData$numeracy, na.rm = T), sd = sd(dunceData$numeracy, na.rm = T)), color = "blue", size = 1);
hist.numeracy.duncetown;
# Powtorz dla Sussex.
susData <- rexam[rexam["uni"] == "Sussex University", c("exam", "computer", "lectures", "numeracy", "uni")];
hist.numeracy.sussex <- ggplot(susData, aes(numeracy)) + theme(legend.position = "none") + geom_histogram(aes(y = ..density..), fill = "white", color = "black", binwidth = 1) + labs(x = "Numeracy Score", y = "Density") + stat_function(fun = dnorm, args = list(mean = mean(susData$numeracy, na.rm = T), sd = sd(susData$numeracy, na.rm = T)), color = "blue", size = 1);
hist.numeracy.sussex;