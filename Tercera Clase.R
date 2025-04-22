### Funciones de bucle 
#### Lapply

list1 <- list(a = 1:5, b = rnorm(10))
list2 <- list(z = 1:10, y = 1:50)

lapply(list1, mean)


## Crear una funcion para ingresar en sapply

func1 <- function(lista){
    resultado <- c()
    for (i in 1:length(lista)){
        
        tot <- 0
        for (a in 1:length(lista[[i]])){
            tot <- tot + lista[[i]][a] 
            cant <- tot / length(lista[[i]])
         
        }
        resultado <- c(resultado, cant)
    }

    return(resultado)
}

### Crea una lista que sume los elementos y los divida entre la cantidad de elementos

func_simple <- function(vec) {
    tot <- 0
    for (a in 1:length(vec)) {
        tot <- tot + vec[a]
    }
    cant <- tot / length(vec)
    return(cant)
}

### aplicamos sapply



b <- lapply(list1, func_simple)
b


## Tambien se puede realizar sapply mediante la funcion runif
x <- 1:5
lapply(x, runif)

## Se puede aplicar argumentos de dichas funciones

lapply(x, runif, min = 10, max=20)


## Se puede generar mediante funciones anonimas

v1 <- matrix(c(1,4,6,7,8,9,10,12), ncol = 4) 


v2 <- matrix(1:14,7,2)
v2

##### genero la lista
list3 <- list(v1,v2)
list3

##### quiero obtener la primera columna de mis matrices
lapply(list3, function(ele) ele[,1]) # genero una funcion anonima


### Funcion sapply
y <- sapply(list1, func_simple)
class(y)

w <- sapply(list3, 
       function(ele) ele[,1])
class(w)


### Funcion Apply

z <- matrix(rnorm(200), 20,10)
z

## Calculo el promedio de las columnas de la matriz
apply(z, 2, mean)

## Calculo la suma de las filas de la matriz
apply(z,1,sum)


## Para calcular la suma de los valores de una columnas o 
## el promedio existen funciones especializadas

## rowSums
## rowMeans
## colSums
## col Means


## Calcular cuantiles

apply(z, 1, quantile, probs = c(0.25,0.75))



## Array de 3 dimensiones

w <- array(rnorm(2 * 2 * 10), c(2,2,10)) ## Divide los 10 numeros aleatorios
# en un array de 3 dimensiones, 2 filas, 2 columnas y 10 capas

# Se quiere calcular el promedio de los matrices

apply(w, c(1,2), mean)
w

rowMeans(w, dims = 2)


### MAPPLY

## Para un vector
a <- rep(1:4,4:1)
a
## Pero quiero obtener una lista donde tenga una repetcion de cuatro veces uno
## y asi sucesivamente
mapply(rep,1:4,4:1)


## Para una funcion simple
funcn <- function(n, media, desviacion){
    rnorm(n, media, desviacion)
}

## Obtengo 5 numeros aleatorios con media 1 y desviacion 2
funcn(5,1,2)

## Si lo uso para un vector 
funcn(1:5, 1:5, 2)

# No obtengo lo que deseo por que quiero un numero con media 1 y desviacion 2
## Dos numeros con media 2 y sdt 2 y asi sucesivamente

mapply(funcn, 1:5, 1:5, 2)


## TAPPLY
x <- c(rnorm(10), runif(10), rnorm(10,1))
factor <- gl(3,10) ## Crea un factor con 3 niveles y que cada nivel tenga
## 10 elementos

## Se calcula la media de los 3 niveles
tapply(x, factor, mean)


## Si no simplifico el resultado me da una lista
tapply(x, factor, mean, simplify = FALSE)


### Tambien se pueden realizar calculos mas complejos

tapply(x, factor, range)



###########################################
### FUNCIONES DE BUCLE - DIVIDIR ##########
###########################################
u <- c(rnorm(20), runif(20), rnorm(20,0))
factor <- gl(6,10)

split(u,factor)

## Realizo el promedio para los 6 grupos
lapply(split(u,factor), mean)


## Puede dividir objetos mas complicados
library(datasets)
head(airquality)

s1 <- split(airquality, airquality$Month)
s1

sapply(s1, function(x) apply(x[, c("Ozone","Solar.R","Wind","Temp")],2
                             ,mean, na.rm = T)
       )

sapply(s1, function(x) colMeans(x[, c("Ozone","Solar.R","Wind","Temp")],
                                  na.rm = T))
       


###Separacion a mas de un nivel

x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)

## Combino ambas variables factor
interaction(f1,f2)

str(split(x,list(f1,f2)))

## Realiza todas las combinaciones de ambos factor sin 
## necesidad de poner interaction sino simplemente
## tomar una lista de los factor

str(split(x, list(f1,f2),drop = T))

## Solo me da los valores que no tienen valores nulos
