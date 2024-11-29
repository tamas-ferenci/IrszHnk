Irányítószámok és települések összerendelése
================
Ferenci Tamás (<https://www.medstat.hu/>)

Magyar irányítószámok és települések adatainak összerendelése /
Associating Hungarian ZIP codes with data on their settlements.

## Magyar / Hungarian

E szkript célja, hogy - hivatalos adatforrások alapján - hozzárendelje
a magyar irányítószámokat a településeikhez, együtt a települések
adataival (a Helységnévtár alapján). Az adatok forrása az irányítószám
esetén a Magyar Posta (<https://www.posta.hu/static/internet/download/Iranyitoszam-Internet_uj.xlsx>),
a települési adatok esetén a Központi Statisztikai Hivatal
(<https://www.ksh.hu/docs/helysegnevtar/hnt_letoltes_2024.xlsx>).

A [szkript](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.R)
elvégzi a fenti állományok letöltését, végrehajtja a szükséges
adattranszformációkat és a hozzárendelést, majd az eredményt
[CSV](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.csv)
és [RDS](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.rds)
formátumokban kimenti.

A repozitórium a 2024. 11. 29. dátum szerinti állapotot tartalmazza.
A bemeneti állományok archív változatait szintén elérhetővé teszi.

## Angol / English

The aim of this script is to associate the Hungarian postal codes
with their respective settlements, along with detailed data on the
settlements (using the Detailed Gazetteer), based on official data
sources. For the postal codes, the data source is the Magyar Posta
Ltd., i.e. the Hungarian Post (<https://www.posta.hu/static/internet/download/Iranyitoszam-Internet_uj.xlsx>),
for the data on settlements, the data source is the Hungarian
Central Statistics Office (<https://www.ksh.hu/docs/helysegnevtar/hnt_letoltes_2024.xlsx>).

The [script](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.R)
downloads the abovementioned data, performs the necessary
data transformations and merging, and then saves the result in
[CSV](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.csv)
and [RDS](https://github.com/tamas-ferenci/IrszHnk/blob/master/IrszHnk.rds) formats.

The repository contains the results as of 29-Nov-2024. It also
makes the archive versions of the input data available.