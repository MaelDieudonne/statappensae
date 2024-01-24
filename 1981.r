library(aws.s3)
library(data.table)
library(dplyr)

# Résultats électoraux
## Téléchargement
pres1981 <- 
  aws.s3::s3read_using(
    FUN = data.table::fread,
    object = "/diffusion/csv/Elections_pres/pres1981comm.csv",
    bucket = "maeldieudonne",
    opts = list("region" = "")
  )
## Recodages
### Droite / gauche
pres1981$GD_ratio_T1 <- (pres1981$voixLAGUILLER + pres1981$voixMARCHAIS + pres1981$voixMITTERRAND + pres1981$voixCREPEAU + pres1981$voixBOUCHARDEAU + pres1981$voixLALONDE) / pres1981$exprimes
setnames(pres1981, old = "pvoixT2MITTERRANDratio", new = "GD_ratio_T2")
### Libéralisme culturel / conservatisme moral
pres1981$lib_ratio_T1 <- (pres1981$voixMITTERRAND + pres1981$voixGISCARDDESTAING + pres1981$voixBOUCHARDEAU + pres1981$voixLALONDE) / pres1981$exprimes
## Nettoyage
pres1981 <- pres1981 %>%
  dplyr::select(-starts_with("pv"), -starts_with("vote"))

variable_names <- names(pres1981)
print(variable_names)