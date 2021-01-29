# bach.sh
# example.sh

Bach to platforma testująca Bash, która może być używana do testowania skryptów zawierających niebezpieczne polecenia, takie jak rm -rf /. Bez niespodzianek, bez bólu.

Pierwsze kroki
Bach Testing Framework to prawdziwy framework do testów jednostkowych. Wszystkie polecenia w PATHzmiennej środowiskowej stają się zewnętrznymi zależnościami testowanych skryptów bash. Żadne polecenia nie mogą być faktycznie wykonane. Innymi słowy, wszystkie polecenia w przypadkach testowych Bacha są uruchamiane na sucho . Ponieważ te testy jednostkowe powinny weryfikować zachowanie skryptów bash, a nie testować polecenia. Bach Testing Framework zapewnia również interfejsy API do mockowania poleceń.

Instalowanie
Instalacja Bacha Testing Framework jest bardzo prosta. Pobierz bach.sh do swojego projektu, użyj sourcepolecenia, aby zaimportować bach.sh.

Pisz przypadki testowe
W przeciwieństwie do innych frameworków testowych, standardowy przypadek testowy Bacha składa się z dwóch funkcji Bash. Jeden służy do przeprowadzania testów, a drugi do potwierdzania. Bach uruchomi te dwie funkcje oddzielnie, a następnie porówna, czy ta sama sekwencja poleceń zostanie wykonana w obu funkcjach. Nazwa funkcji testującej musi zaczynać się od test-, nazwa odpowiedniej funkcji potwierdzającej kończy się -assert.

Bach będzie uruchamiał te dwie funkcje osobno, test-rm-rfa test-rm-rf-assert. W funkcji testującej test-rm-rfostatnią rzeczywistą komendą do wykonania jest sudo rm -rf "/". To to samo, co funkcja potwierdzająca test-rm-rf-assert. Więc ten przypadek testowy przechodzi.

Jeśli Bach nie znajdzie funkcji potwierdzającej dla funkcji testującej. Spróbuje zastosować tradycyjną metodę testową. W takim przypadku funkcja testująca musi mieć wywołanie, aby potwierdzić interfejsy API. W przeciwnym razie przypadek testowy zakończy się niepowodzeniem.
