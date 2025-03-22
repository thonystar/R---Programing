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

