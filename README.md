
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

