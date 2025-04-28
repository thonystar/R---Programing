########################################
########## TERCERA PRACTICA ############
########################################

library(datasets)
data("iris")

## Ver informacion sobre los datos de la base iris
?iris

## 1- Habrá un objeto llamado 'iris' en su espacio de trabajo. 
##En este conjunto de datos, ¿cuál es la media de 'Longitud.del.sépalo' 
#para la especie virginica? 
##Por favor, redondee su respuesta al número entero más próximo.
# filtro

iris2 <- iris[iris$Species == 'virginica', ]

media_long_sep <- round(mean(iris2$Sepal.Length),0)
media_long_sep

## 2- Pregunta 2
#Siguiendo con el conjunto de datos "iris" de la pregunta anterior, 
#¿qué código R devuelve un vector de las medias de las variables 
#"Longitud.Sepal", "Anchura.Sepal", "Longitud.Pétalo" y "Anchura.Pétalo"?

apply(iris2[,1:4],2, mean)


############################################
data("mtcars")
mtcars
?mtcars

## Pregunta 3
#¿Cómo se puede calcular la media de millas por galón (mpg) 
##según el número de cilindros del coche (cyl)? Seleccione todas 
##las opciones que correspondan.


factorcyl <- factor(mtcars$cyl,c(4,6,8))
factorcyl

## Con tapply
tapply(mtcars$mpg, factorcyl, mean)

## Con split y sapply
sapply(split(mtcars$mpg, factorcyl),mean)


with(mtcars,tapply(mpg,cyl,mean))

### Pregunta 4
#Pregunta 4
#Siguiendo con el conjunto de datos "mtcars" de la pregunta anterior,
#¿cuál es la diferencia absoluta entre la potencia media de los coches
#de 4 cilindros y la potencia media de los coches de 8 cilindros?

# Calcula la media de la potencia por cilindros
vect_hp <- tapply(mtcars$hp, factorcyl, mean)
vect_hp

# media del cilindro 4 y 6
pot_4 <- as.vector(vect_hp[1])
pot_8 <- as.vector(vect_hp[3])

# Diferencia
dif <- round(abs(pot_4 - pot_8),0)
dif

debug(ls)
debug(ls())


with(mtcars)