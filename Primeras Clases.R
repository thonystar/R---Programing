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
