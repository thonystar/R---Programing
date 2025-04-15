# Veo mi directorio
getwd()

# Cambio de directorio

setwd("C:/Users/USER/OneDrive/Desktop/R---Programing/rprog_data_specdata")

## Crear funcion
pollutantmean <- function(directorio, contaminante, id = 1:332) {
        datos <- numeric()
        for (i in id) {
                archivo <- sprintf("%s/%03d.csv", directorio,i)
                
                
                data <- read.csv(archivo, sep = ",", header = T)
                datos <- c(datos, data[[contaminante]])
        }
        mean(datos, na.rm = TRUE)
}

pollutantmean("specdata", "nitrate", 70:72)
list.files("specdata")

pollutantmean2 <- function(directory, pollutant, id = 1:332){
        
        datos <- numeric()
        
        for (i in id) {
                ruta <- paste0(directory,"/",formatC(i, width = 3, flag = "0"),".csv")
                
                data <- read.csv(ruta, sep = ",", header = T)
                
                datos <- c(datos, data[[pollutant]])
                
        }
        mean(datos, na.rm = T)
}

pollutantmean("specdata", "nitrate")
pollutantmean2("specdata", "nitrate")

