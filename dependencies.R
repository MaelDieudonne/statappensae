# Packages et librairies
packages <- c(
  "archive",
  "aws.s3",
  "data.table",
  "feather",
  "ggplot2",
  "httr",
  "mapview",
  "sf",
  "viridis",
  "xtable")

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

invisible(lapply(packages, library, character.only = TRUE))

rm(installed_packages, packages)



# Dossiers
if (!dir.exists("data")) {dir.create("data")}
if (!dir.exists("output")) {dir.create("output")}



# Fonctions
## Pour récupérer les données dans le Datalab
import_feather <- function(input_file) {
  bucket_name <- "maeldieudonne"
  data <- aws.s3::s3read_using(
    FUN = arrow::read_feather,
    object = input_file,
    bucket = bucket_name,
    opts = list("region" = "")
  )  
  data <- as.data.table(data)
  return(data)
}

## Pour nettoyer les tableaux
round_and_remove_zeros <- function(x) {
  if (is.numeric(x)) {
    rounded_value <- round(x, digits = 3)
    result <- ifelse(rounded_value != 0, gsub("\\.?0+$", "", as.character(rounded_value)), "0")
    return(result)
  } else {
    return(x)
  }
}