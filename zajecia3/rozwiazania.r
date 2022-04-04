# Zainstaluj pakiet ggplot2
install.packages("ggplot2");

# Wczytaj biblioteke ggplot2
library(ggplot2);

# Wczytaj tabele "FacebookNarcissim.dat", razem z naglowkami
facebookData <- read.delim("FacebookNarcissim.dat", header = T);

# Utworz graf
# Format: zmienna <- ggplot(tabela, aes(opis osi X, opis osi Y));
graph <- ggplot(facebookData, aes(NPQC_R_Total, Rating));

# Wyswietl dane na grafie oraz legende z podanym atrybutem (kolor)
# Format: graf + geom_point(aes(color = zmienna, ktora odpowiada za punkty));
graph + geom_point(aes(color = Rating_Type));

# Wczytaj "Exam Anxiety.dat" razem z naglowkami, stworz graf scatter z osiami Anxiety oraz Exam
examData <- read.delim("Exam Anxiety.dat", header = T);
scatter <- ggplot(examData, aes(Anxiety, Exam));
# Wyswietl punkty na grafie.
scatter + geom_point();

# Wyswietl pokazujac przebieg punktow jako funkcje ciagla (lm - liniowa)
scatter + geom_smooth(method = "lm", color = "Red");
# Wyswietl pokazujac przebieg punktow jako funkcje ciagla oraz punkty
scatter + geom_point() + geom_smooth(method = "lm", color = "Red");

# Wczytaj "DownloadFestival.dat" wraz z naglowkami
festivalData <- read.delim("DownloadFestival.dat", header = T);
# Stworz graf, nie wyswietlaj legendy
festivalHistogram <- ggplot(festivalData, aes(day1)) + theme(legend.position = "none");
# Uwaga: funkcja opts() jest zdeprecjonowana i jej miejsce zajela funkcja theme()
# Wyswietl jako histogram z danymi opisami osi kolejno X i Y
festivalHistogram + geom_histogram() + labs(x = "Hygiene (Day 1)", y = "Frequency");

# Stworz graf z osiami gender (X) i day1 (Y)
festivalBoxplot <- ggplot(festivalData, aes(gender, day1));
# Wyswietl jako wykres pudelkowy z zadanymi opisami osi
festivalBoxplot + geom_boxplot() + labs(x = "Gender", y = "Hygiene(Day 1 of the festival)");

# Wykres gestosci prawdopodobienstwaw (rozkladu prawdopodobienstwa)
density <- ggplot(festivalData, aes(day1));
# Wyswietl wykres gestosci prawdopodobienstwa z zadanymi opisami osi
density + geom_density() + labs(x = "Hygiene(Day 1 of the festival)", y = "Density Estimate");

# Wczytaj tablice z pliku "ChickFlick.dat" wraz z naglowkami
chickFlick <- read.delim("ChickFlick.dat", header = T);
# Stworz graf dla tabeli chickFlick; za osie odniesienia wybierz naglowek film (X), arousal (Y), gender (wypelnienie slupka)
bar <- ggplot(chickFlick, aes(film, arousal, fill = gender));
# Stworz wykres slupkowy
#  - fun - funkcja, na podstawie ktorej wyliczna jest wartosc slupka (domyslnie srednia)
# - geom - ksztalt jaki ma przyjac wynik np slupek (bar) albo kafelka (tile)
# - position = "dodge" - sprawia, ze slupki stoja obok siebie, nie pokrywaja sie
bar + stat_summary(fun = mean, geom = "bar", position = "dodge");
# Uwaga: fun.y jest zdeprecjonowane, zamiast tego, uzyj fun

# Wczytaj tablice z pliku "Hiccups.dat" wraz z naglowkami
hiccupsData <- read.delim("Hiccups.dat", header = T);
# "Rozprostuj" tabele do wektora
hiccups <- stack(hiccupsData);
# Nadaj nazwy kolumnom
names(hiccups) <- c("Hiccups", "Intervention");
# Nie zadziala, poniewaz atrybut levels powinien zawierac wektor unikatowych wartosci, a zawiera duplikaty
hiccups$Intervention_Factor <- factor(hiccups$Intervention, levels = hiccups$Intervention);
# Stworz graf dla tabeli hiccups z osiami Interevntion (X) i Hiccups (Y)
line <- ggplot(hiccups, aes(Intervention, Hiccups));
# Wyswietl wyniki jako wykres punktowy
line + stat_summary(fun = mean, geom = "point");