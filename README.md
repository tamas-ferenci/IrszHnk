Irányítószámok és települések összerendelése
================
Ferenci Tamás (<https://www.medstat.hu/>)

Magyar irányítószámok és települések adatainak összerendelése / Associating Hungarian ZIP codes with data on their settlements.

## Magyar / Hungarian

E szkript célja, hogy - hivatalos adatforrások alapján - hozzárendelje
a magyar irányítószámokat a településeikhez, együtt a települések
adataival (a Helységnévkönyv alapján). Az adatok forrása az irányítószám
esetén a Magyar Posta (https://www.posta.hu/static/internet/download/Iranyitoszam-Internet_uj.xlsx),
a települési adatok esetén a Központi Statisztikai Hivatal Helységnévkönyve
(https://www.ksh.hu/docs/helysegnevtar/hnt_letoltes_2024.xlsx).

A szkript elvégzi a fenti állományok letöltését, végrehajtja a szükséges
adattranszformációkat és a hozzárendelést, majd az eredményt CSV és RDS
formátumokban kimenti.

A repozitórium a szkripten túl tartalmazza az 2024. 11. 29. dátumra
érvényes fenti két bemeneti állományt, és az eredményfájlt is.

## Angol / English

The aim of this script is to associate the Hungarian postal codes
with their respective settlements, along with detailed data on the
settlements (using the Detailed Gazetteer), based on official data
sources. For the postal codes, the data source is the Magyar Posta
Ltd., i.e. the Hungarian Post (https://www.posta.hu/static/internet/download/Iranyitoszam-Internet_uj.xlsx),
for the data on settlements, the data source is the Detailed Gazetteer
of the Hungarian Central Statistics Office (https://www.ksh.hu/docs/helysegnevtar/hnt_letoltes_2024.xlsx).

The script downloads the abovementioned data, performs the necessary
data transformations and merging, and then saves the result in CSV and RDS formats.

In addition to the script itself, the repository contains the abovementioned
two input files and the result as of 29-Nov-2024.