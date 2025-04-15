setwd("C:/Users/USER/OneDrive/Desktop/R---Programing/rprog_data_specdata")


corr <- function (directory, threshold = 0){
        datos <- numeric()
        for (i in 1:332){
                
                direc <- sprintf("%s/%03d.csv", directory, i)
                data <- read.csv(direc, sep = ",", header =  T)
                datacomp <- data[complete.cases(data), ]
                
                if (threshold < nrow(datacomp)){
                        vect <- cor(datacomp$nitrate, datacomp$sulfate)
                        datos <- c(datos, vect)
                } else {
                        0
                        
                }
        }
        return(datos)
        
}

cr <- corr("specdata", 50000)
length(cr)
head(cr)


cr <- corr("specdata")                

cr <- sort(cr)   

set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)



cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
