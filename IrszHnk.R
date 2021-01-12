IrszUrl <- "https://www.posta.hu/static/internet/download/Iranyitoszam-Internet_uj.xlsx"
HnkUrl <- "https://www.ksh.hu/docs/hun/hnk/hnk_2019.xlsx"

temp <- tempfile(fileext = paste0(".",tools::file_ext(IrszUrl)))
download.file(IrszUrl, temp, mode = "wb")
Irsz <- rio::import(temp, sheet = "Települések")
Irsz <- Irsz[!grepl("*", Irsz$Település, fixed = TRUE), ]
IrszTemp <- rio::import(temp, sheet = "Bp.u.", guess_max = 2000)
IrszTemp$KER[IrszTemp$KER%in%c("0", "Margitsziget")] <- "XIII."
IrszTemp$Település <- paste0("Budapest ", formatC(as.numeric(as.roman(gsub(".", "", IrszTemp$KER, fixed = TRUE))),
                                                  width = 2, flag = "0"), ". ker.")
IrszTemp$Településrész <- ""
Irsz <- rbind(Irsz, IrszTemp[ , c("IRSZ", "Település", "Településrész")])
for (t in c("Miskolc", "Debrecen", "Szeged", "Pécs", "Győr")) {
  IrszTemp <- rio::import(temp, sheet = paste0(t, " u."))
  names(IrszTemp)[names(IrszTemp)=="IRSZ."] <- "IRSZ"
  IrszTemp$Település <- t
  IrszTemp$Településrész <- ""
  Irsz <- rbind(Irsz, IrszTemp[ , c("IRSZ", "Település", "Településrész")])
}
unlink(temp)
Irsz <- Irsz[!duplicated(Irsz),]

Hnk <- rio::import(HnkUrl, sheet = 1)
Hnk <- Hnk[!is.na(Hnk$Helység),]
names(Hnk)[1:3] <- paste0(names(Hnk)[1], ".", Hnk[1, 1:3])
names(Hnk)[5:7] <- paste0(names(Hnk)[5], Hnk[1, 5:7])
names(Hnk)[8:9] <- paste0(names(Hnk)[8], ".", Hnk[1, 8:9])
names(Hnk)[14:26] <- paste0(names(Hnk)[14], ".", Hnk[1, 14:26])
Hnk <- Hnk[-1, ]

names(Irsz)[2] <- names(Hnk)[1]

IrszHnk <- merge(Irsz, Hnk, by = "Helység.megnevezése")

IrszHnk <- IrszHnk[!duplicated(IrszHnk), ]

write.csv2(IrszHnk, "IrszHnk.csv", row.names = FALSE)
saveRDS(IrszHnk, "IrszHnk.rds" )