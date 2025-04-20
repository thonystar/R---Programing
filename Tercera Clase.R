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



