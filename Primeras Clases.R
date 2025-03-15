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

a <- matrix(nrow = 3, ncol =2, byrow = TRUE,  dimnames = list(c("Fila1", "Fila2", "Fila3"), 
                                                              c("Col1", "Col2")))

a # Crea una matriz vacia

## dimension de una matriz

dim(a)

  ## atributos de una lista

attributes(a)


## Llenado de matriz en columnas 
matriz2 <- matrix(1:6, nrow = 2, ncol = 3)
matriz2

# Se puede crear una matriz con la funcion dim

y <- 1:10
dim(y) <- c(2,5) # crea una matriz de dos filas y cinco columnas
y


## Otra manera es concatenando las filas y columnas

a <- 1:4
b <- 10:13

## unir columnas
x <- cbind(a,b)
x

## unir filas

y <- rbind(a,b) 
y


## FACTORES

w <- factor(c("Si","No", "Si","Si","No"))
w 

## frecuencia de los niveles

table(w)


## Ordenamos los niveles del factor

w2 <- factor(c("Si","No","No","Si","Si"),levels = c("Si","No"))
w2


## VALORES MISING O FALTANTES (NAN y NA)

x <- c(1,6,NA,7)
x
is.na(x)
is.nan(x) # No hay ningun NAN
## Por que? -- esto se debe a que un NAN puede ser un NA
## pero un NA no necesariamente es un NAN

y <- c("Rey","corona", NaN)
y


is.nan(y) # Me aparece falso por que ha toma la clase string del vector

## El nan son valores indeterminados matematicamente

w <- c(4,6,NaN)
w

is.nan(w)
is.na(w) # Me arroja tambien un true por que los NAN son considerados NA

z <- c(NA,5, 6, NaN)

is.na(z) # Habra dos na
is.nan(z) # solo hay un nan


## DATA FRAME

# creamos un data frame

a1 <- data.frame(edad = c(14,15,16), nombre = c("Miguel","Ana","Luis"))
a1

nrow(a1)
ncol(a1)


# Convertir un dataframe a matriz

a2 <- data.frame(edad = c(2,5,7), sueldo = c(1200,1100,2000))
a2

a22 <- data.matrix(a2)
a22

## NOMBRES DE ATRIBUTOS

### Para los vectores
w1 <- c(1,4,5,6)

names(w1) <- c("Uno","Dos","Tres")

w1

# Para el caso de las listas

w2 <- list(c = 5, d = 4 , e = 2)
w2

# Para el caso de Matrices

w3 <- matrix(c(2,45,6,7),ncol = 2, nrow = 2)
w3
dimnames(w3) <- list(c("Año", "Edad"), c("tB","xe"))
w3

## LECTURA DE DATOS TABULARES


x <- list(a = 1, b = 2, c = c(3, 4, 5))

# Guardar el objeto en un archivo de texto
dput(x, file = "objeto.R")

# Leer el objeto desde el archivo
nuevo_x <- dget("objeto.R")
x

### Lectura de grandes datos

  ## Se puede limitar las filas que se van a leer con nrows
 data1 <- read.csv("C:/Users/USER/OneDrive/Desktop/R---Programing/Ecommerce_Delivery_Analytics_New.csv"
                   , sep =",", nrows = 100)
 data1

  ## Para saber de que clases son las columnas de un objeto en R
 clases <- sapply(data1,class)
 
 clases
 
 
 ## Simplificando
 
 data2 <- read.csv("C:/Users/USER/OneDrive/Desktop/R---Programing/Ecommerce_Delivery_Analytics_New.csv",
                   sep = ",", colClasses = clases)
data2 

### FORMATO DE DATOS DE TEXTO
# -- con dput guardas el objeto en R y ademas los metadatos
d <- data.frame(a = 1, b = 5)
dput(d)

## Guardarlo en un archivo

dput(d, file = "Rdata.R")
dget("Rdata.R")


## Otra forma es usar la funcion dump

a <- data.frame(a = 1,b = 6,c = 8,d = 6)
b <- "Hola"

dump(c("a","b"), file = "Prueba2.R")

# Remover los objetos
rm(a,b)

source("Prueba2.R")
a
b

## Leer datos con conexiones
str(file)

#Objeto de R
z <- c("Hola","Mundo")

# Crea archivo de txt
dput(z,"Prueba1.txt")

# Crea una conexion para leer el archivo en R
conex1 <- file("Prueba1.txt", "r")

# Lee el archivo en con read.csv
data1 <- read.csv(conex1)
data1

# Cierra la conexion
close(conex1)


## Para leer una ruta web

conex2 <- url("http://www.jhsph.edu","r")

# con readLines
x <- readLines(conex2)

head(x,5)


## Subsetting

### Para extraer datos dentro de un objeto de R 


list3 <- list(a = c(1,6,3,12), b = "Gato", c = c("1","4"))

# Obtiene un elemento
list3[[1]]

# Obtiene una nueva lista
list3[1]

# Obtiene un elemento de un objeto respecto al nombre
list3$b


# Se extrae un rango

list3[1:2]

# Usar un indice numerico

a <- c(1,6,9,12,16,21)

a[a > 1] 

# Usar un indice logico

b <- a > 5
b 


## Subconjuntos de Listas
z <- list(gasto = c(1090,139,12), ingreso = "Nada")

# Diferencia entre z[] y z[[]]
z[1]

z[[1]]


#Si quiero extraer varios elementos:

x <- list(a = 1:4, b = c(TRUE, FALSE), c = "Lost")

# Si se quiere extraer dos elementos 

x[c(1,3)]

# Me da como input del primer y tercer elemento.

## Se puede indexar un elemento de una lista
x <- list(gas = 1:4, categoria = c(TRUE, FALSE), title = "Lost")

# Si se quiere indexas

a <- "gas"

x[[a]]

# Da como imput el vector 1,2,3,4

## Pero si se quiere indexar con el nombre no se podría
x$a ## Me sale que no existe un elemento de la lista que se llame *a*

## Se tendría que hacer de forma normal
x$gas

# Se puede extraer un subelemento de un elemento.

x <- list(gas = list(14,12,13), categoria = c(TRUE, FALSE))

# Si se quiere indexas un subelemento

x[[c(1,3)]]

## El input seria el numero 13, notar que para este caso se toma un doble corchete, 
## extrayendo el tercer subelemento del primer elemento.

# Otra forma

x[[1]][[3]]


## SUBCONJUNTO DE MATRICES
x <- matrix(1:6,2,3) ## Creamos una matriz de dos filas y tres columnas

## Subconjuntos

x[1,2] # Se extrae el elemento 3

x[2,1] # Se extrae el elemento 2


## Se puede extraer una columna o una fila entera

x[1, ] 

# Se extrae la primera fila (1,3,5)

x[ ,2]

# Se extrae la segunda columna (3,4)

## Cuando extraigo solo un elemento de la matriz se convierte en un solo vector. 
##Pero a veces queremos que nos devuelva una matriz.


x <- matrix(1:6,2,3) ## Creamos una matriz de dos filas y tres columnas

## Subconjuntos

x[1,2] # Me da como input 3

# Si quiero que mantenga el formato de matriz

x[1,2, drop = FALSE]

# Subconjunto - Coincidencia Parcial

x <- list(anthony = 1:4)

# Como es complicado a cada rato codificar anthony se puede extraer solo poniendo la a

x$a

# Input
#(1,2,3,4)

x[["a"]] # Me sale NULL

# Se debe poner la function exact

x[["a", exact = FALSE]]


## ELIMINACION DE VALORES NA
x <- c(1,2,4,NA,6, NA)

a <- is.na(x)

x[!a]

# No arroja un vector sin NA

## Otra forma de realizarlo 
x <- c(1,NA,3,6,NA)
u <- c("a",NA,"b","c",NA)

# Se utiliza la funcion

uno <- complete.cases(x,y) ## Arrojando TRUE, FALSE, TRUE, TRUE, FALSE

x[uno]

y[uno]

## Me arroja los vectores sin NA


###Para grandes bases de datos

anthony[1:6, ]

# Se tiene varios elementos de una fila y columna en NA

uno <- complete.cases(anthony)

anthony[uno, ][1:6, ]

## Operaciones vectorizadas

## Operaciones con vectores
x <- c(1,3,5,7); y <- 4:8

## Sumamos
x + y
x * y
x < 2
x == 2
x > 4
x / y

## Para vectores sigue el mismo comportamiento

## Operaciones con vectores
x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)

## Se usa para multiplicacion y division

x * y
x / y

# Para realizar una verdadera multiplicacion de matrices 

x %*% y