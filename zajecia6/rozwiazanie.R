# Zaladuj pakiety.
library(ggplot2);
library(pastecs);
library(WRS);

# Wprowadzenie danych z tablicy.
spider_matrix <- matrix(
  c(
    30, 35, 45, 40, 50, 35, 55, 25, 30, 45, 40, 50,
    40, 35, 50, 55, 65, 55, 50, 35, 30, 50, 60, 39
  ),
  ncol = 2, nrow = 12
);
colnames(spider_matrix) <- c("Picture", "Real");
spiderWide <- data.frame(spider_matrix);

# Srednia.
spiderWide$pMean <- (spiderWide$Picture + spiderWide$Real) / 2;

# Srednia zbiorcza.
grandMean <- mean(c(spiderWide$Picture, spiderWide$Real));

# 
spiderWide$adj <- grandMean - spiderWide$pMean;

# Wyswietl.
spiderWide;

# 
stat.desc(spiderWide, basic = F, norm = T);

# 
ind.t.test <- t.test(spiderWide$Real, spiderWide$Picture);

# 
ind.t.test;

# Przeprowadza test Yuena porownywania grup. bt to wersja typu bootstrap, czyli przyjmuje wartosc n, ktora jest iloscia przeprowawdzanych powtorzen testu.
yuenbt(spiderWide$Real, spiderWide$Picture, nboot = 2000);

# 
dep.t.test <- t.test(spiderWide$Real, spiderWide$Picture, paired = T);

# 
dep.t.test;

# Slowo paired sprawia, że do porownywan brane sa wartosci dotyczace par liczb z obu zapewnionych zbiorow danych. Bez slowa paired, funkcja dokonuje obliczen na calych zestawach danych.

# 
yuend(spiderWide$Real, spiderWide$Picture);

# 
bootdpci(spiderWide$Real, spiderWide$Picture, est = tmean, nboot = 2000);

# Wykres pudelkowy.
boxplot(spiderWide$Real, spiderWide$Picture, names = c("Real", "Picture"));

# Wykres slupkowy.
barplot(spiderWide$Real, spiderWide$Picture);