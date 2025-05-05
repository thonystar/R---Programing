#####################################
########### CLASE 4 #################
####################################

# Muestra la estructura interna de un objeto en R
str(lm)

# Otro ejemplo

x <- rnorm(100,2,4)
summary(x)

str(x)

# Ejemplo con un factor

y <- gl(40, 10)
y

str(y)

## Con un dataframe
library(datasets)
head(airquality)

str(airquality)


## Con una matriz
m <- matrix(rnorm(100),10,10)
m

str(m)

## Con una lista
l <- split(airquality, airquality$Month)
str(l)

x <- 1:19
dnorm(x, mean = 0, sd = 1, log = FALSE) # Calcular el log si pones TRUE
pnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) # calcula de la cola inferior
qnorm(x, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(x,mean = 0, sd = 1)

# Cada vez que se quiera simular numeros es importante fijar un valor semilla en
# el generador de numeros aleatorios

set.seed(1)


## Simulación de un modelo Lineal
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x + e
summary(y)

plot(x,y)


## Que pasa si x es una variable binaria aleatoria (genero)

set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x + e
summary(y)

plot(x,y)

## Simular un modelo mas complicado
## Modelo lineal generalizado, con distribucion de poison

set.seed(1)
x <- rnorm(100)
log_mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log_mu))
summary(y)

plot(x,y)


### Simulacion de muestreo aleatorio

## Funcion sample

set.seed(1)
sample(1:10, 4)

# Puedo tomar muestras de letras

sample(letters, 10)


# Permutacion entre numeros
sample(1:10) 

# Si quiero una muestra con reposicion

sample(1:10, replace = T)
