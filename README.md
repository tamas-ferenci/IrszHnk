# IrszHnk
Magyar irányítószámok és települések adatainak összerendelése / Associating Hungarian ZIP codes with data on their settlements.

## Magyar / Hungarian 
E szkript célja, hogy - hivatalos adatforrások alapján - hozzárendelje a magyar irányítószámokat a településeikhez, együtt a települések adataival (a Helységnévkönyv alapján). Az adatok forrása az irányítószám esetén a Magyar Posta (https://www.posta.hu/static/internet/download/Iranyitoszam-Internet.XLS), a települési adatok esetén a Központi Statisztikai Hivatal Helységnévkönyve (http://www.ksh.hu/docs/hun/hnk/hnk_2016.xls).

A szkript elvégzi a fenti állományok letöltését, végrehajtja a szükséges adattranszformációkat és a hozzárendelést, majd az eredményt CSV formátumban kimenti.

A repozitórium a szkripten túl tartalmazza az 2017. 11. 11. dátumra érvényes fenti két bemeneti állományt, és az eredményfájlt is.

## Angol / English

The aim of this script is to associate the Hungarian ZIP codes with their respective settlements, along with detailed data on the settlements (using the Detailed Gazetteer), based on official data sources. For the ZIP codes, the data source is the Magyar Posta Ltd., i.e. the Hungarian Post (https://www.posta.hu/static/internet/download/Iranyitoszam-Internet.XLS), for the data on settlements, the data source is the Detailed Gazetteer of the Hungarian Central Statistics Office (http://www.ksh.hu/docs/hun/hnk/hnk_2016.xls).

The script downloads the abovementioned data, performs the necessary data transformations and merging, and then saves the result in CSV format.

In addition to the script itself, the repository contains the abovementioned two input files and the result as of 11-Nov-2017.
