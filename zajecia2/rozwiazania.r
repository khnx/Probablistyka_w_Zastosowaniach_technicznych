# Rozwiazanie lab 2

# Ustaw folder, w ktorym pracuje biezaca sesja
# Parametry:
# - Sciezka do folderu
setwd("C:/Users/radek/Downloads/prob")

# ##### Praca z "Lecturer Data.dat" #####

# Wczytaj dane
# Parametry:
# - Nazwa pliku,
# - Pobierz rowniez naglowki
lecturerData <- read.delim("Lecturer Data.dat", header=T)

# Wyswietl tabele
lecturerData

# Zapisz tabele lecturerData do pliku tekstowego
# Parametry:
# - Nazwa zmiennej do zapisu,
# - Nazwa pliku, pod ktora zostanie dokonany zapis,
# - Separator kolumn
# - Nie zapisuj nazw wierszy
write.table(lecturerData, "nazwaDoZapisu.txt", sep="\t", row.names=F)

# Otrzymanie podtabeli
# Format:
# zmienna <- tabela[ wektor nazw naglowkow do wypisania ]
lecturerPersonality <- lecturerData[c("friends", "alcohol", "neurotic")]
lecturerPersonality

# Wybranie rekordow, u ktorych "alcohol" > 10
# Format:
# zmienna <- tabela[ tabela[ naglowek ] > warunek, wektor naglowkow do wypisania ]
alcoholPersonality <- lecturerData[lecturerData["alcohol"] > 10, c("friends", "alcohol", "neurotic")]
alcoholPersonality

# Funkcja subset
# Format:
# zmienna <- subset(tabela, tabela[ naglowek ] > warunek, select = wektor naglowkow do wypisania)
alcoholPersonality <- subset(lecturerData, lecturerData["alcohol"] > 10, select=c("friends", "alcohol", "neurotic"))
alcoholPersonality

# Zamiast uzywac skladni tabela[ tabela["alcohol"], ...] mozemy napisac
alcohol <- lecturerData["alcohol"]
alcoholPersonality <- lecturerData[alcohol > 10, c("friends", "alcohol", "neurotic")]

# Przeksztalcenie tablicy w macierz
# Format:
# zmienna <- as.matrix(tablica)
alcoholPersonalityMatrix <- as.matrix(alcoholPersonality)
alcoholPersonalityMatrix
# Lub
alcoholPersonalityMatrix <- as.matrix(lecturerData[alcohol > 10, c("friends", "alcohol", "neurotic")])
alcoholPersonalityMatrix
# Uwaga: alcohol <- lecturerData["alcohol"]

# ##### Praca z "Honeymoon Period.dat" #####

# Wczytaj dane
satisfactionData <- read.delim("Honeymoon Period.dat", header=T)
satisfactionData

# Funkcja stack() przeksztalca tablice (data.frame) doklejajac poszczegolne kolumny do siebie, oraz podajac kolumne mowiaca, skad dany rekord pochodzi
# Format: zmienna <- stack(tablica, select = wektor naglowkow)
satisfactionStacked <- stack(satisfactionData, select = c("Satisfaction_Base", "Satisfaction_6_Months", "Satisfaction_12_Months", "Satisfaction_18_Months"))
satisfactionStacked
# Dzialanie odwrotne: unstack()
# Format: zmienna <- unstack(zmienna na ktora zadzialal stack())
satisfactionUnstacked = unstack(satisfactionStacked)
satisfactionUnstacked

# Instalacja dodatkowych pakietow bibliotecznych
# Format: install.packages(nazwa pakietu)
install.packages("reshape")
# Import danego pakietu bibliotecznego
# Format: library(nazwa pakietu)
library(reshape)

# Funkcja melt() działa podobie do funkcji stack() ale ma wieksze mozliwosci.
# Format: zmianna <- melt(
#   tabela,
#   id = wektor naglowkow, ktorych wartosci wiersza zostana przypisane do kazdego zmeltowanego rekordu,
#   measured = wektor naglowkow, ktorych wartosci zostana zmeltowane
# )
restructuredData <- melt(satisfactionData, id = c("Person", "Gender"), measured = c("Satisfaction_Base", "Satisfaction_6_Months", "Satisfaction_12_Months", "Satisfaction_18_Months"))
restructuredData

# Wroc dane do oryginalnej formy - funkcja cast()
# Format: zmienna <- cast(
#   tabela, na ktorej uzyto melt(),
#   nazwy naglowkow, ktore wystepowaly w zmeltowanej wersji tabeli, wszystkie oddzielone znakiem plus +, oraz nazwy naglowkow, ktore znikna, wszystkie oddzielone tylda ~,
#   value = nazwa naglowka, dla ktorej zostana rozdzielone kolumny
# )
wideData <- cast(restructuredData, Person + Gender ~variable, value = "value")
wideData

