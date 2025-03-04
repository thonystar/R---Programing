 # Primeros pasas en R

## Se asigna un valor a X

x <- 14

msg <- "Mensaje inicial"


# Forma de ejecutar 
x
msg

print(x)
print(msg)

# Genera una secuencia

y <- 1:20

print(y)

# Tipos de datos usados en R #

vector <- c(2,4,6)

print(vector)

# se puede generar un vector vacio con la funcion vector
vector("numeric", 4)


## Listas

list1 = list(
  x = 3,
  value = "tres",
  v = c(TRUE, FALSE),
  digito = 3.5
)

## Numericos

a <- 3.5
typeof(a) ## Indica que es de tipo double
class(a) ## Indica que es de la clase numeric


## Enteros
b <- 3
class(b) # Indica que es numeric pero si colocamos la L como sufijo
typeof(b) # Indica que es del tipo double

b <- 3L
class(b) # Indica ahora si que es integer
typeof(b) # Clase integer 


# Numeros especiales

## Infinito
c <- 5/0
c

## NAN
d <- 0/0
d ## Puede ser visto tambien como un valor faltante 



### VECTORES Y LISTAS 

x1 <- c(TRUE, FALSE)

 ## Coherción implicita

x2 <- c(3, TRUE) # Convierte el true en 1
x2

x3 <- c("TRES", TRUE) # Convierte el TRUE en string
x3

x4<- c("numeric", 4) # Convierte el 4 en string
x4

  ## Cohercion explicita

x5 <- 4:12
class(x5)

# Se realiza la cohercion

x10 <- as.numeric(x5)
x10
class(x10) ## Converti en numeric

## Se puede convertir en string

x11 <- as.character(x5)
x11

## Se convierte en complejo

x12 <- as.complex(x5)
x12

# Se convierte en booleano
x13 <- as.logical(x5)
x13


## Cuando falla la cohercion

a <- c("uno", "dos", "tres")
b <- as.integer(a)
b

# Listas

list1 <- list(3, "a",TRUE, 3 + 2i)

## Puedo indexar cada elemento con [] para ingresar a cada elemento
## empezando desde 1 

list1[[1]]
list1[1]

list2 <- list(c(2,4), 5.6, FALSE, c("b", "d"))

## Para ingresar a un elemento dentro de otro elemento de la lista 
## es con los dobles corchetes

list2[[1]][1] # Se obtiene 2
list2[[4]][2] # Se obtiene d



## Matriz
### Creando una matriz

a <- matrix(3,5,2)
a
