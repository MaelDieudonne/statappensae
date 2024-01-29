# Packages et librairies
packages <- c(
  "archive",
  "aws.s3",
  "data.table",
  "feather",
  "ggplot2",
  "httr",
  "sf")

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

invisible(lapply(packages, library, character.only = TRUE))

rm(installed_packages, packages)

# Fonctions
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