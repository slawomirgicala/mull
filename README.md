
Porównanie czasów mnożenia macierzy
======

Zadanie wykonane na zajęcia z programowania w języku Fortran. Każdy moduł zawiera funkcje, które wykonują mnożenie dwóch macierzy.
<br>
- w sposób naiwny (w pierwszej kolejności iterując po wierszach)
- poprawiony sposób uwzględniający kolejność przechowywania danych w języku Fortran (pierwszeństwo kolumn)
- sposób wykorzystujący funkcję dot_product (iloczyn skalarny) wbudowaną w język
<br>

Czasy działania poszczególnych napisanych funkcji oraz funkcji matmul wbudowanej w język zostały zmierzone dla macierzy kwadratowych kolejno o rozmiarach 10, 20, 40,...,1280. Pomiary zostały rozróżnione także ze względu na precyzję danych znajdującyc się w tablicach (kind = 4, 8, 16).

Za pomocą programu gnuplot otrzymałem następujące wykresy (skala logarytmiczna).

<object data="https://github.com/slawomirgicala/mull/blob/master/res/wykres4.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/slawomirgicala/mull/blob/master/res/wykres4.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://github.com/slawomirgicala/mull/blob/master/res/wykres4.pdf">Download PDF</a>.</p>
    </embed>
</object>

<object data="https://github.com/slawomirgicala/mull/blob/master/res/wykres8.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/slawomirgicala/mull/blob/master/res/wykres8.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://github.com/slawomirgicala/mull/blob/master/res/wykres8.pdf">Download PDF</a>.</p>
    </embed>
</object>

<object data="https://github.com/slawomirgicala/mull/blob/master/res/wykres16.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/slawomirgicala/mull/blob/master/res/wykres16.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://github.com/slawomirgicala/mull/blob/master/res/wykres16.pdf">Download PDF</a>.</p>
    </embed>
</object>

Dla precyzji kind równych 4 oraz 8 wykresy układają się w bardzo podobnie: dla małych rozmiarów macierzy mnożenie przy wykorzystaniu iloczynu skalarnego okazuje się najszybsze, wraz ze wzrostem wielkości danych coraz lepsza okazuje się funkcja wbudowana w język, natomiast funkcje napisane przez użytkownika zdają się mieć najgorszą wydajność, przy czym naiwne mnożenie jest zawsze najwolniejsze.

Słabą wydajność naiwnego mnożenia można łatwo wytłumaczyć powołując się na wykorzystanie tzw. column-major order zastosowanego w Fortranie. Kolumny są w pamięci przechowywane całymi blokami i łatwo się do nich dostać odwołując się po kolei. Najlepsza wydajność funkcji wbudowanej w język dla dużych danych można zapewne jest związana z optymalizacjami narzuconymi przez twórców języka. Najprawdopodobniej na czas wykonywania operacji dane są przenoszone do obszarów pamięci, do których jest szybszy dostęp. Wyjaśniałoby to także początkową słabszą wydajność tej funkcji - przy małych danych przenoszenie ich jest dodatkową stratą czasu, a nie optymalizacją.

Ciekawym zjawiskiem jest zbliżenie się do siebie wykresów dla precyzji liczb kind = 16. Dla większej dokładności wszystkie sposoby wyglądają na równie efektywne, jednak mimo to wciąż jesteśmy w stanie je wyróżnić i zauważyć, że to wciąż funkcja wbudowana w język matmull dziła najlepiej.

