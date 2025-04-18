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
