# Librairies
library(aws.s3)
library(data.table)
# Environnement
bucket_name <- "maeldieudonne"

# Résultats électoraux
## Téléchargement
object_key <- "/diffusion/Elections_pres/pres1981comm.feather"
pres1981 <- aws.s3::s3read_using(
  FUN = arrow::read_feather,
  object = object_key,
  bucket = bucket_name,
  opts = list("region" = "")
)
pres1981 <- as.data.table(pres1981)

candidats <- fread("candidats.csv", header = TRUE)

# Recodages
## Droite / gauche
T1mask <- candidats[DrGau == "G", .(variable = paste0("voix", Candidat))]
pres1981[, GD_ratio_T1 := rowSums(.SD, na.rm = TRUE) / exprimes, .SDcols = T1mask$variable]
T2mask <- candidats[DrGau == "G", .(variable = paste0("voixT2", Candidat))]
T2candidates <- intersect(T2mask$variable, names(pres1981))
pres1981[, GD_ratio_T2 := rowSums(.SD, na.rm = TRUE) / exprimesT2, .SDcols = T2candidates]
## Libéralisme culturel / conservatisme moral
T1mask <- candidats[LibCons == "L", .(variable = paste0("voix", Candidat))]
pres1981[, lib_ratio_T1 := rowSums(.SD, na.rm = TRUE) / exprimes, .SDcols = T1mask$variable]

# Nettoyage
prefixes_to_drop <- c("pvoix", "vote", "pvote", "pervote")
pres1981 <- pres1981[, .SD, .SDcols = setdiff(names(pres1981), grep(paste0("^", paste(prefixes_to_drop, collapse = "|")), names(pres1981), value = TRUE))]

# Propriétaires
## Téléchargement
object_key <- "/diffusion/Proprietaires/proprietairescommunes.feather"
propri <- aws.s3::s3read_using(
  FUN = arrow::read_feather,
  object = object_key,
  bucket = bucket_name,
  opts = list("region" = "")
)
propri <- as.data.table(propri)