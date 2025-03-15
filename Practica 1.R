## TAREA 1 

data <- read.csv("C:/Users/USER/OneDrive/Desktop/R---Programing/hw1_data.csv",
                 sep = ',', header = T)

# Extraer las dos primeras filas y las 2 ultimas
head(data,2)
tail(data,2)


# Cual es el valor del ozono en la fila 47
data$Ozone[[47]]


#¿Cuántos valores perdidos hay en la columna Ozono de este marco de datos?

A <- sum(is.na(data$Ozone))
A

# Pregunta 17
#¿Cuál es la media de la columna Ozono en este conjunto de datos? 
#Excluya los valores que faltan (codificados como NA) de este cálculo.
colum1 <- data$Ozone
colum1
b <- is.na(colum1)
b
 # Obtengo todos los valores menos el NA
c <- colum1[!b]

# Media 
mean(c)


# Pregunta 18
# Extraiga el subconjunto de filas del marco de datos donde los valores de
# Ozono son superiores a 31 y los valores de Temp son superiores a 90. 
#¿Cuál es la media de Solar.R en este subconjunto?


# Ozono superior a 31 y Temp superior a 90

a <- data[data$Ozone > 31 & data$Temp > 90,]
a


# Quitar NA
colum2 <- a$Solar.R

nas <- is.na(colum2)

# Quitamos los NA
sin_na <- colum2[!nas]


# Hallamos la media+
mean(sin_na)

### Otra forma 

sin_na2 <- mean(a$Solar.R, na.rm = T)
sin_na2


##¿Cuál es la media de "Temp" cuando "Mes" es igual a 6? 

z <- data[data$Month == 6,]
mean(z$Temp, na.rm = T)


## ¿Cuál fue el valor máximo de ozono en el mes de mayo 
##(es decir, el mes es igual a 5)?

y <- data[data$Month == 5,]
max(y$Ozone, na.rm = T)



