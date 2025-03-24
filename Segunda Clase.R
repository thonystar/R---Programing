## Sentencia de control IF - ELSE
x  = 20
if (x > 10){
  y <- 0
} else {
  y <- 15
}

y

## Otra forma 

z <- if (y == 0){
  10
}else if (y > 0){
  15
}else {
  1
}

z


z <- if (y == 0){
  10
}else if (y > 0){
  15
}else {
  1
}


## BUCLES

s <- for (i in 1:10) {
  print(i)
}


# Otra forma de realizar el bucle

b <- c("a","b","c","d")
a <- for(i in 1:4){
  print(b[i])
}


## Con seq_along permite dar una secuencia numerica del objeto introducido
w <- c("Raul","Diego","Evelyn")
seq_along(w)

y <- for (i in seq_along(w)) {
  print(paste("Mi numero es",i,"y mi nombre es:", w[i]))
}

## Con letter

for (letter in b) {
  print(letter)
}

## Cuando es solo una sentencia se puede omitir los corchetes

for (i in 1:4) print(i)

## Bucles anidados
o <- matrix(1:6,3,2)
o

for (i in seq_len(nrow(o))) {
  for (j in seq_len(ncol(o))) {
    print(o[i,j])
  }
}


### BUCLES WHILE

contador <- 0

while (contador <= 10){
  print(contador)
  contador <- contador + 1
  
}

# while con condicionales

valor <- 6
while (valor >= 3 & valor < 10){
  print(valor)
  cond <- rbinom(1,1,0.5) ## Devuelve un 1 o 0 con una prob del 50%
  if (cond == 1) {
    valor <- valor + 1
  } else {
    valor <- valor - 1
  }
}

## Estructuras de control next, repeat y break

## Repeat se usa para iterar de forma infinita y break para salir de una function

for (i in 1:100){
  if (i <= 20) {
    print(i)
    next
  }
  
}


## PRIMERAS FUNCIONES 

### sumatoria

f_suma <- function(w, y){
  w + y
}

f_suma(5,6)



## Obtengo de un vector los valores mayores al que indico

f_numerosmayores <- function(x,n){
  num <- 1:x
  cond <- num > n
  num[cond]
  
}

f_numerosmayores(20,12)
f_numerosmayores(59, 20)


## Function para hallar el promedio
w <- data.frame(edad = c(15,12,19,29), peso = c(12.4,14.5,43.2,22.1),
                altura = c(1.21,4.22,1.45,1.44))

f_promedio <- function(base){
  nc <- ncol(base)
  v_means <- numeric(nc)
  for (i in 1:nc) {
    v_means[i] <- mean(base[ ,i])
  }
  return(v_means)
  
}

f_promedio(w)
