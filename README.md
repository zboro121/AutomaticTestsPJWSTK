# AutomaticTestsPJWSTK

Zostały stworzone dwa testy, które weryfikują działanie dwóch stron:

1)http://www.kurs-selenium.pl/demo/
2)https://www.upc.pl

Pierwsza strona zwiera test, który wyszukuje możliwość podróży do wskazanej lokalizacji.
Drugi test sprawdza czy są dostępne usługi telekomunikacyjne pod naszym adresem oraz wyświetla informację o dodatkowych dostępnych usługach.
Testy zostały przeprowadzone na przeglądarce Chrome. 

1. Logi
C:\Users\pazwik\Desktop\python\python.exe C:/Users/pazwik/Desktop/Kursy/studia/zad2/kurs-selenium.plGoogleChrom.py
2020-12-18 23:22:57,148 - Selenium - Scenario1 - INFO - Uruchamiamy przeglądarkę
 
[WDM] - Current google-chrome version is 87.0.4280
[WDM] - Get LATEST driver version for 87.0.4280
[WDM] - Driver [C:\Users\pazwik\.wdm\drivers\chromedriver\win32\87.0.4280.88\chromedriver.exe] found in cache
2020-12-18 23:23:03,101 - Selenium - Scenario1 - INFO - Wchodzimy na stronę www.kurs-selenium.pl/demo
2020-12-18 23:23:07,114 - Selenium - Scenario1 - INFO - Klikamy w pole wyszukiwania miejsca pobytu
2020-12-18 23:23:07,351 - Selenium - Scenario1 - INFO - Podajemy miejsce pobytu i zatwierdzamy
2020-12-18 23:23:07,768 - Selenium - Scenario1 - INFO - Podajemy okres zamaldowania i wymeldowania
2020-12-18 23:23:08,301 - Selenium - Scenario1 - INFO - Podajemy typ oraz liczbę osób wybierającą się w podróż
2020-12-18 23:23:08,498 - Selenium - Scenario1 - INFO - Zatwierdzamy wyszukiwanie
2020-12-18 23:23:09,782 - Selenium - Scenario1 - INFO - Zamykamy przeglądarkę

Process finished with exit code 0


2. Logi
C:\Users\pazwik\Desktop\python\python.exe C:\Users\pazwik\Desktop\Kursy\studia\zad2\upc.plGoogleChrom.py
2020-12-18 23:21:52,313 - Selenium - Scenario2 - INFO - Uruchamiamy przeglądarkę
[WDM] - Current google-chrome version is 87.0.4280
[WDM] - Get LATEST driver version for 87.0.4280
 
[WDM] - Driver [C:\Users\pazwik\.wdm\drivers\chromedriver\win32\87.0.4280.88\chromedriver.exe] found in cache
2020-12-18 23:21:58,321 - Selenium - Scenario2 - INFO - Wchodzimy na stronę www.upc.pl
2020-12-18 23:22:02,786 - Selenium - Scenario2 - INFO - Podajemy naszą lokalizację
2020-12-18 23:22:03,218 - Selenium - Scenario2 - INFO - Wybór pakietu
2020-12-18 23:22:10,318 - Selenium - Scenario2 - INFO - WYbór okresu umowy
2020-12-18 23:22:10,622 - Selenium - Scenario2 - INFO - Wyswietlenie dodatkowych uslug
Nazwa uslugi:  Polsat Sport Premium + Eleven Sports
Nazwa uslugi:  Multiroom HD - kolejny dekoder
Nazwa uslugi:  Multiroom HD – karta CI+
Nazwa uslugi:  Pakiet HBO HD + HBO GO
Nazwa uslugi:  Pakiet FILMBOX
Nazwa uslugi:  Pakiet Cinemax HD
Nazwa uslugi:  Pakiet FILMKLUB
Nazwa uslugi:  Pakiet MyPrime
2020-12-18 23:22:11,058 - Selenium - Scenario2 - INFO - Zamykamy przeglądarkę

Process finished with exit code 0
