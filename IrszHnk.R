library( XLConnect )

IrszUrl <- "https://www.posta.hu/static/internet/download/Iranyitoszam-Internet.XLS"
HnkUrl <- "http://www.ksh.hu/docs/hun/hnk/hnk_2016.xls"

temp <- tempfile()
download.file( IrszUrl, temp, mode = "wb" )
Irsz <- readWorksheetFromFile( temp, sheet = "Települések" )
Irsz$Település <- trimws( Irsz$Település )
Irsz$Település <- gsub( "*", "", Irsz$Település, fixed = TRUE )
IrszTemp <- readWorksheetFromFile( temp, sheet = "Bp.u." )
IrszTemp$Település <- paste0( "Budapest ", substring( IrszTemp$IRSZ, 2, 3 ), ". ker." )
IrszTemp$Településrész <- ""
Irsz <- rbind( Irsz, IrszTemp[ , c( "IRSZ", "Település", "Településrész" ) ] )
Irsz$Település[ Irsz$Település=="Budapest 00. ker." ] <- "Budapest"
for ( t in c( "Miskolc", "Debrecen", "Szeged", "Pécs", "Győr" ) ) {
  IrszTemp <- readWorksheetFromFile( temp, sheet = paste0( t, " u." ) )
  names( IrszTemp )[ names( IrszTemp )=="IRSZ." ] <- "IRSZ"
  IrszTemp$Település <- t
  IrszTemp$Településrész <- ""
  Irsz <- rbind( Irsz, IrszTemp[ , c( "IRSZ", "Település", "Településrész" ) ] )
}
unlink( temp )

temp <- tempfile()
download.file( HnkUrl, temp, mode = "wb" )
Hnk <- readWorksheetFromFile( temp, sheet = 1, startRow = 2 )
Hnk <- Hnk[ !is.na( Hnk$Helység ), ]
names( Hnk )[ 1:3 ] <- paste0( names( Hnk )[ 1 ], ".", Hnk[ 1, 1:3 ] )
names( Hnk )[ 5:7 ] <- paste0( names( Hnk )[ 5 ], Hnk[ 1, 5:7 ] )
names( Hnk )[ 8:9 ] <- paste0( names( Hnk )[ 8 ], ".", Hnk[ 1, 8:9 ] )
names( Hnk )[ 14:26 ] <- paste0( names( Hnk )[ 14 ], ".", Hnk[ 1, 14:26 ] )
names( Hnk ) <- trimws( names( Hnk ) )
Hnk <- Hnk[ -1, ]
unlink( temp )

names( Irsz )[ 2 ] <- names( Hnk )[ 1 ]

IrszHnk <- merge( Irsz, Hnk, by = "Helység.megnevezése" )

IrszHnk <- IrszHnk[ !duplicated( IrszHnk ), ]

write.csv2( IrszHnk, "IrszHnk.csv", row.names = FALSE )
