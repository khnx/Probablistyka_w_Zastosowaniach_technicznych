# Zainstaluj pakiety.
install.packages("boot");
install.packages("ggm");
install.packages("Hmisc");
install.packages("car");

# Zaladuj pakiety.
library(boot);
library(ggm);
library(Hmisc);
library(car);

# Wczytaj dane.
examData <- read.delim("Exam Anxiety.dat", header = T);
# Wypisz wspolczynnik korelacji Pearsona.
cor(examData$Exam, examData$Anxiety, use = "complete.obs", method = "pearson");

# Macierz korelacji dla wybranych wartosci.
examData2 <- examData[ , c("Exam", "Anxiety", "Revise")];
cor(examData2);

# Wczytaj dane.
liarData <- read.delim("The Biggest Liar.dat", header = T);

# Stworz funkcje, ktora przyjmuje data frame oraz iterator. Funkcja zwraca korelacje tau Kendalla.
bootTau <- function(liarData, i) {
  cor(liarData$Position[i], liarData$Creativity[i], use = "complete.obs", method = "kendall");
}
# Funkcja boot() wywoluje funkcje statystyczna bootTau 2000 razy. Za kazdym razem generuje losowe wartosci dla kazdego wiersza z liarData. Te wartosci sa uzywane do wybrania probki wewnatrz funkcji bootTau.
boot_kendall <- boot(liarData, bootTau, 2000);
boot_kendall;

# Wprowadzenie danych.
some_data <- matrix(
  c(
    41, 40, 40, 38, 34, 46, 42, 42, 47, 42, 45, 46, 44, 54,
    1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0,
    0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0 ,0 ,0, 1
  ),
  ncol = 3, nrow = 14
);
colnames(some_data) <- c("time", "gender", "record");
some_df <- data.frame(some_data);
# Test korelacji Pearsona.
cor(some_df$time, some_df$gender, use = "complete.obs", method = "pearson");
cor(some_df$time, some_df$record, use = "complete.obs", method = "pearson");

# Wczytaj dane.
album1 <- read.delim("Album Sales 1.dat");
# Znajdz pasujacy model regresji liniowej.Za formule przyjmowana jest wartosc z kolumny adverts, za dane album1.
albumSales.1 <- lm(sales ~ adverts, data = album1);
summary(albumSales.1);
# y = 9.612e-02 * x + 1.341e+02

# Wczytaj dane.
album2 <- read.delim("Album Sales 2.dat", header = T);
# Stworz modele regresji o zadanych parametrach.
albumSales.2 <- lm(sales ~ adverts, data = album2);
albumSales.2;
albumSales.3 <- lm(sales ~ adverts + airplay + attract, data = album2);
albumSales.3;
# Porownaj czy dwie grupy sa podobne. Porownuje srednie grup, sprawdzajac czy sa bardzo rozne od sredniej dla wszystkich grup razem.
anova(albumSales.2, albumSales.3);
# Model dla albumSales.3 jest lepiej dopasowany niż model dla albumSales.2.
