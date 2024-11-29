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
formátumokban kimenti. A
szkript [R nyelven](https://www.youtube.com/@FerenciTamas/playlists?view=50&sort=dd&shelf_id=2) készült.

A repozitórium a 2024. 11. 29. dátum szerinti állapotot tartalmazza.
A bemeneti állományok archív változatait
szintén [elérhetővé teszi](https://github.com/tamas-ferenci/IrszHnk/blob/master/archiv.zip).

Megjegyzés: 2020 óta a Helységnévtár is tartalmaz irányítószámra
vonatkozó információkat, de ez nem teljesen konzisztens a Posta
adatbázisával. A példa kedvéért: a Helységnévtár szerint Abádszalók
településhez 3 irányítószám is tartozik (5241, 5242, 5340), ehhez
képest a Posta szerint Abádszalók irányítószáma 5241 (kizárólag),
míg 5242 a Posta szerint egy nem is létező irányítószám, az 5340
pedig Kunhegyes irányítószáma (és kizárólag azé). A Helységnévtár
szerint 5242 ráadásul nem csak, hogy létezik, de Abádszalókon
kívül Tiszaburához is tartozik, míg az 5340 egyaránt Kunhegyesé
és Abádszalóké...

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
The script uses [R language](https://www.youtube.com/@FerenciTamas/playlists?view=50&sort=dd&shelf_id=2).

The repository contains the results as of 29-Nov-2024. It also
makes the archive versions of the input
data [available](https://github.com/tamas-ferenci/IrszHnk/blob/master/archiv.zip).

Note: Since 2020, the Detailed Gazetteer also contains information
on postal codes, but this is not entirely consistent with the Post's
database. As an example: according to the Detailed Gazetteer,
Abádszalók has 3 postal codes (5241, 5242, 5340), in contrast to
this, the postal code of Abádszalók is 5241 (and only that)
according to the Post, while 5242 is a postal code that does not even
exist according to the Post and 5340 is the postcode of Kunhegyes
(and only that). According to the Detailed Gazetteer, 5242 not
only exists, but is also one of the postal codes of Tiszabura
in addition to Abádszalók, while 5340 belongs to Kunhegyes
and Abádszalók...