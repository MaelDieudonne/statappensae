#importation présidentielles 2022
temp <- tempfile()
download.file("https://conflit-politique-data.ams3.cdn.digitaloceanspaces.com/zip/pres2022_csv.zip", temp)
dezip <- unzip(temp,"pres2022_csv/pres2022comm.csv")
table <- read.csv2("/home/onyxia/work/pres2022_csv/pres2022comm.csv", sep = ",")   

#importation capitalimmobilier
temp <- tempfile()
download.file("https://conflit-politique-data.ams3.cdn.digitaloceanspaces.com/zip/Capital_immobilier_csv.zip", temp)
list_fichier <- unzip(temp,list=TRUE)
unzip(temp,"Capital_immobilier_csv/capitalimmobilier.csv")
table <- read.csv2("/home/onyxia/work/Capital_immobilier_csv/capitalimmobilier.csv", sep = ",")
rm(temp)  