# BASH - BACH - framework do testów jednostkowych. 

Dokumentacja: https://bach.sh/

Zrzut z ekranu po wykonaniu testu:

# TestTAUBach.PNG

* [Screens](https://github.com/zboro121/AutomaticTestsPJWSTK/blob/LAB5/TestTAUBach.PNG)

Poniżej skrypty do tego projektu

# bach.sh
* [Code](https://github.com/zboro121/AutomaticTestsPJWSTK/blob/LAB5/bach.sh)
# example.sh
* [Code](https://github.com/zboro121/AutomaticTestsPJWSTK/blob/LAB5/example.sh)
Co to jest Bach:

Platforma testująca skrypty Bashowskie używana do testowania skryptów, które zawierają są niezbezpieczne z perspeltywy działania systemu. np. usunięcie pliku rekursywnie rm -rf "name_files".
Polecenia w przypadkach testowych Bacha są uruchamiane na bez ingerencji w system, weryfikują działanie skryptów bash, a nie testowanie poleceń. 

Przebieg instalacji:

Dodajemy do projektu skrypt bach.sh do swojego projektu, używamy polecenia "source" w celu importu skryptu. 

 * Import skryptu:
    ```
    source bach.sh
    ```

Przypadki testowe:

Do tego przykładu Bacha zostały wykorzystane dwie funkcje. Jedno służy do przeprowadzania testów, a drugei do potwierdzania. Bach uruchomi te dwie funkcje oddzielnie, a następnie porówna, czy ta sama sekwencja poleceń zostanie wykonana w obu funkcjach. Nazwa funkcji testującej musi zaczynać się od test-, nazwa odpowiedniej funkcji potwierdzającej kończy się -assert.

Bach będzie uruchamiał te dwie funkcje osobno, test-rm-rfa test-rm-rf-assert. W funkcji testującej test-rm-rf ostatnią rzeczywistą komendą do wykonania jest sudo rm -rf "/". To to samo, co funkcja potwierdzająca test-rm-rf-assert. Więc ten przypadek testowy przechodzi.

Jeśli Bach nie znajdzie funkcji potwierdzającej dla funkcji testującej. Spróbuje zastosować tradycyjną metodę testową. W takim przypadku funkcja testująca musi mieć wywołanie, aby potwierdzić interfejsy API. W przeciwnym razie przypadek testowy zakończy się niepowodzeniem.
