# Zaladowanie tabeli.
facebookData <- read.delim("FacebookNarcissism.dat", header = T);
# Stworzenie grafu z odpowiednimi osiami X, Y.
graph <- ggplot(facebookData, aes(NPQC_R_Total, Rating));
#Utworzenie punktow na grafie.
graph + geom_point();

# Wczytaj dane.
examData <- read.delim("Exam Anxiety.dat", header = T);
# Utworz graf, kolor wynikow zalezy od wartosci z naglowka Gender.
scatter <- ggplot(examData, aes(Anxiety, Exam, color = Gender));
# Wyswietl graf wraz z punktami oraz jako zakres okreslony liniami ciaglymi, w postaci liniowej. Kolor wypelnienia niech zalezy od wartosci Gender, przezroczystosc rowna 0,1.
scatter + geom_point() + geom_smooth(method = "lm", aes(fill = Gender), alpha = 0.1);

# Wczytaj dane.
festivalData <- read.delim("DownloadFestival.dat", header = T);
# Stworz histogram dla osi day1, bez legendy.
festivalHistogram <- ggplot(festivalData, aes(day1)) + theme(legend.position = "none");
# Wyswietl histogram z dana szerokoscia oraz opisami.
festivalHistogram + geom_histogram(binwidth = 0.4) + labs(x = "Hygiene Day 1 of the festival", y = "Frequency");

# Stworz graf z osiami gender (X) i day1 (Y)
festivalBoxplot <- ggplot(festivalData, aes(gender, day1));
# Wyswietl jako wykres pudelkowy z zadanymi opisami osi
festivalBoxplot + geom_boxplot() + labs(x = "Gender", y = "Hygiene(Day 1 of the festival)");

# Utworz graf.
density <- ggplot(festivalData, aes(day1));
# Wyswietl dane w postaci funkcji gestosci.
density + geom_density() + labs(x = "Hygiene (Day 1 of the festival)", y = "Density Estimate");

# Zaladuj dane.
chickFlick <- read.delim("ChickFlick.dat", header = T);
# Utworz graf z danymi osiami.
bar <- ggplot(chickFlick, aes(film, arousal));
# Wyswietl graf jako wykres slupkowy, z bialym wypelnieniem.
bar + stat_summary(fun = "mean", geom = "bar", fill = "White", color = "Black") + labs(x = "Film", y = "Mean Arousal");
# Funkcja stat_summary() z argumentem fun.data = "mean_cl_normal" nie dziala.

# Stworz wykres slupkowy dla takich kategorii.
bar <- ggplot(chickFlick, aes(film, arousal, fill = gender));
# Wyswietl wykres z zadanymi parametrami.
bar + stat_summary(fun = "mean", geom = "bar", position = "dodge") + stat_summary(fun = "mean", geom = "errorbar", position = position_dodge(width = 0.9), width = 0.2) + labs(x = "Film", y = "Mean Arousal", fill = "Gender");
