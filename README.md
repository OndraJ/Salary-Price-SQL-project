# Salary-Price-SQL-project

## Popis projektu
```
Projekt slouží ke sledování vývoje mezd napříč odvětvími a cen potravin v ČR.
Přiložený dokument first_table.sql se zabývá otázkami č. 1,2,3 a 4.
Dokument second_table.sql za zabávý otázkou č. 5.
K otázkám č. 1,3,4,5 jsem vypracoval vizualizace v Tableau Public.
```
##
### Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
##

### Otázka č.1
```
V průběhu sledovaného období (2000-2021) zaznamenaly neustálý meziroční růst pouze tři odvětví:
 - Ostatní činnosti
 - Zdravotní a sociální péče
 - Zpracovatelský průmysl
 
Všechna ostatní odvětví také vzrostla, ovšem s několika meziročními poklesy.
 - Nejméně vzrostlo odvětví 'Těžba a dobývání' o 129.78%.
 - Nejvíce vzrostlo odvětví 'Zdravotní a sociální péče' o 294.41%.
```
Odkaz na vizualizaci [ZDE](https://public.tableau.com/views/Mzdy2000-2021/VvojmezdOtzka_1?:language=en-US&:display_count=n&:origin=viz_share_link)
##

### Otázka č.2
```
První srovnatelné období z dostupných dat je rok 2006 a poslední srovnatelné odbobí je rok 2018.
ROK 2006:
 - Průměrná mzda činila 21 165 Kč
 - Průměrná cena 1kg chleba byla 16,12 Kč
 - Průměrná cena 1L mléka byla 14,44 Kč
V roce 2006 jste si mohli za průměrnou mzdu nakoupit 1312,9 kilogramů chleba, nebo 1465,7 litrů mléka.

ROK 2018:
 - Průměrná mzda činila 33 092 Kč
 - Průměrná cena 1kg chleba byla 24,24 Kč
 - Průměrná cena 1L mléka byla 19,82 Kč
V roce 2018 jste si mohli za průměrnou mzdu nakoupit 1365,2 kilogramů chleba, nebo 1669,6 litrů mléka.
```
##

## Otázka č.3
```
Při rozhodování jsem se nejvíce zaměřil na meziroční percentuální nárůst nebo pokles.
Čísla by měly být co nejblíže nule.
Z vizualizace vidíme, že ceny v různách kategoriích hodně kolísají nahoru a dolů.
Nejnižší rozdíly v kolísaní mají kategorie:
 - Přírodní minerální voda uhličitá
 - Šunkový salám
Jediná kategorie, která má pokaždé meziroční nárůst je:
- Pivo výčepní, světlé, lahvové
Navíc jsou hodnoty u této kategorie velice nízké oproti ostatním.
Kategorie, u které je nejnižší percentuální meziroční nárůst je tedy:
 - Pivo výčepní, světlé, lahvové
```
Odkaz na vizualizaci [ZDE](https://public.tableau.com/views/Potraviny2006-2018/VvojcenpotravinOtzka_3?:language=en-US&:display_count=n&:origin=viz_share_link)
##

## Otázka č.4
```
Z vizualizace vidíme, že meziroční nárůsty cen a mezd jsou velice podobné.
Jediné výjimky jsou roky 2009 a 2013.
V roce 2009 vzrostla průměrná mzda o 3,1% a průměrná cena potravin klesla o 6,4%.
V roce 2013 zase klesla průměrná mzda o 1,55% a průmerná cena potravin vzrostla o 5,16%.
V žádném roce nebyl nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %).
Nejblíže byl rok 2013, kdy potraviny vzrostly oproti mzdám o 6,71%.
```
Odkaz na vizualizaci [ZDE](https://public.tableau.com/views/Mzdypotraviny2006-2018/SrovnnmezdacenpotravinOtzka_4?:language=en-US&:display_count=n&:origin=viz_share_link)
##

## Otázka č.5
```
Z vizualizace vidíme, že s růstem HDP rostou i mzdy. Jediné větší výjimky jsou roky 2009 a 2020, kdy kleslo HDP a mzdy stále rostly.
U  cen potravin vidíme, že kopírují růst či pokles HDP, až na roky 2012, 2013, 2015 a 2016.
Z toho největší odchylka kolem 5% jsou v letech 2012, 2013 a 2015.
Jediný rok, kdy stouply mzdy a ceny potravin výrazně více než HDP je rok 2008.
Výška HDP bude mít určitý vliv na mzdy a ceny potravin, ovšem je zde spousta jinýh faktorů, které ovlivňují mzdy a ceny potravin, 
jako například nezaměstatnost, nabídka a poptávka na trhu práce, vzdělání atd... 
U potravin to můžou být různá nová nařízení, úroda, přirodní katastrofy, import a export.
```
