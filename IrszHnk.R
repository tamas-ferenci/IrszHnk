IrszUrl <- paste0("https://www.posta.hu/static/internet/",
                  "download/Iranyitoszam-Internet_uj.xlsx")
HnkUrl <- paste0("https://www.ksh.hu/docs/helysegnevtar/",
                 "hnt_letoltes_2024.xlsx")

temp <- tempfile(fileext = paste0(".", tools::file_ext(IrszUrl)))
download.file(IrszUrl, temp, mode = "wb")
Irsz <- readxl::read_excel(temp, sheet = "Települések",
                           .name_repair = "universal")
Irsz <- Irsz[!grepl("*", Irsz$Település, fixed = TRUE), ]
IrszTemp <- readxl::read_excel(temp, sheet = "Bp.u.",
                               guess_max = 10000)
IrszTemp$KER[IrszTemp$KER%in%c("0", "Margitsziget")] <- "XIII."
IrszTemp$Település <- paste0("Budapest ", formatC(as.numeric(
  as.roman(gsub(".", "", IrszTemp$KER, fixed = TRUE))),
  width = 2, flag = "0"), ". ker.")
IrszTemp$Településrész <- ""
Irsz <- rbind(Irsz, IrszTemp[ , c("IRSZ", "Település",
                                  "Településrész")])
for (tel in c("Miskolc", "Debrecen", "Szeged", "Pécs", "Győr")) {
  IrszTemp <- readxl::read_excel(temp, sheet = paste0(tel, " u."),
                                 .name_repair = "universal")
  names(IrszTemp)[names(IrszTemp)=="IRSZ."] <- "IRSZ"
  IrszTemp$Település <- tel
  IrszTemp$Településrész <- ""
  Irsz <- rbind(Irsz, IrszTemp[ , c("IRSZ", "Település",
                                    "Településrész")])
}
unlink(temp)
Irsz <- Irsz[!duplicated(Irsz),]

temp <- tempfile(fileext = paste0(".", tools::file_ext(HnkUrl)))
download.file(HnkUrl, temp, mode = "wb")
Hnk <- readxl::read_excel(temp, sheet = 1, skip = 2,
                          .name_repair = "universal")
unlink(temp)
colnames(Hnk)[14:26] <- paste0("NemzetisegiOnkormanyzat_", 
                               colnames(Hnk)[14:26])

names(Irsz)[2] <- names(Hnk)[1]

IrszHnk <- merge(Irsz, Hnk, by = "Helység.megnevezése")

IrszHnk <- IrszHnk[!duplicated(IrszHnk), ]

data.table::fwrite(IrszHnk, "IrszHnk.csv", row.names = FALSE,
                   dec = ",", sep =";", bom = TRUE)
saveRDS(IrszHnk, "IrszHnk.rds")