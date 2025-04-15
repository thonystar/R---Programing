setwd("C:/Users/USER/OneDrive/Desktop/R---Programing/rprog_data_specdata")


complete <- function(directory, id = 1:332){
        dato <- data.frame()
        
        for (i in id) {
                
                direct <- sprintf("%s/%03d.csv", directory, i)
                data <- read.csv(direct, sep = ",", header = T)
                data_sin_na <- data[complete.cases(data), ]
                dato <- rbind(dato, data.frame(id = i, nobs = nrow(data_sin_na)))
                
                
        }
return(dato)
}

complete("specdata", 54)
complete("specdata", c(2,5,7,8))
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
cc


# Crea una semilla  
set.seed(42)
# crea la funcion
cc <- complete("specdata", 332:1)
# genera una muestra de 10 numeros de 332
use <- sample(332, 10)

print(cc[use, ])

