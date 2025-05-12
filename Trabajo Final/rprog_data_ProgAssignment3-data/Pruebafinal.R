
# Colocar el directorio
#setwd("C:/Users/USER/OneDrive/Desktop/R---Programing/Trabajo Final/rprog_data_ProgAssignment3-data")
#getwd()
nombre = "outcome-of-care-measures.csv"
outcome<- read.csv(nombre, header = T, sep = ",")
outcome <- as.data.frame(data)
head(outcome)

# Visualizar de mejor forma la base
View(outcome)

# Visualizar el numero de columnas
ncol(outcome)

# Visualiza el numero de filas
nrow(outcome)


# Visualiza el nombre de las columnas 
names(outcome)

## Realizar el histograma de la tasa de mortalidad por infarte a 30 días

outcome[, 11] <- as.numeric(outcome[, 11])
tasa_mortalidad_30_dias <- outcome[, 11]
tasa_mortalidad_30_dias

## Generamos el histograma
hist(tasa_mortalidad_30_dias)


outcome <- outcome[outcome$State == "AL", ]
outcome


outcome2[order(outcome2[, 3],decreasing = F), ]


outcome_sin_na <- is.na(outcome)
outcome_sin_na
outcome[]


valor_minimo <- min(outcome2[, 3])
valor_minimo

outcome2 <- outcome2[outcome2[, 3] == valor_minimo, ]
outcome2[, 1]
####################################
#####
###################################

best <- function(state, outcome) {
    hospitalName <- vector()
    
    data <- read.csv(nombre,header = T, sep = ",", colClasses = "character")
    
    # Estados aceptables 
    estados_aceptados <- unique(data$State)
    
    # Salidas aceptables
    outcome_aceptados <- c("heart attack", "heart failure" , "pneumonia")
    
    if (!(state %in% estados_aceptados)){
        stop("invalid state")
    }
    
    if (!(outcome %in% outcome_aceptados)) {
        stop("invalid outcome")
    }
    
    ## Devolver el nombre del estado con la menor tasa de mortalidad
    
    if (outcome == 'heart attack') {
        # Convierte en numerico los valores
        data[, 11] <- as.numeric(data[, 11])
        
        # Registro el estado que se introduce
        data <- data[data$State == state, ]
        # Me quedo solo con las columnas que necesito
        data <- data[, c(2,7,11)]
        
        # Me quedo solo con los valores que no tienen NA
        data <- na.omit(data)
        
        # Obtiene el valor minimo
        valor_minimo <- min(data[, 3])
        
        # Filtra solo los valores con el valor minimo
        data <- data[data[, 3] == valor_minimo, ]
        
        # Guarda en el vector hospital.name
        hospitalName <- data[ , 1]
        
    } else if(outcome == 'heart failure'){
        # Convierte en numerico los valores
        data[, 17] <- as.numeric(data[, 17])
        
        # Registro el estado que se introduce
        data <- data[data$State == state, ]
        # Me quedo solo con las columnas que necesito
        data <- data[, c(2,7,17)]
        
        # Me quedo solo con los valores que no tienen NA
        data <- na.omit(data)
        
        # Obtiene el valor minimo
        valor_minimo <- min(data[, 3])
        
        # Filtra solo los valores con el valor minimo
        data <- data[data[, 3] == valor_minimo, ]
        
        # Guarda en el vector hospital.name
        hospitalName <- data[ , 1]
        
    }else if(outcome == 'pneumonia'){
        # Convierte en numerico los valores
        data[, 23] <- as.numeric(data[, 23])
        
        # Registro el estado que se introduce
        data <- data[data$State == state, ]
        # Me quedo solo con las columnas que necesito
        data <- data[, c(2,7,23)]
        
        # Me quedo solo con los valores que no tienen NA
        data <- na.omit(data)
        
        # Obtiene el valor minimo
        valor_minimo <- min(data[, 3])
        
        # Filtra solo los valores con el valor minimo
        data <- data[data[, 3] == valor_minimo, ]
        
        # Guarda en el vector hospital.name
        hospitalName <- data[ , 1]
        
    }else{
        hospitalName <- NULL
    }
    
    return(sort(hospitalName)[1])
}
best("AK", "pneumonia")
best("NY", "pneumonia")
best("SC", "heart attack")
best("AL","heart attack")
best("TX","heart attack")
best("TX","heart failure")
best("TX", "ataque cardíaco")
best("MD", "heart attack")
best("MD", "pneumonia")



rankhospital <- function(state, outcome, num){
    # Leo la informacion
    datos <- read.csv("outcome-of-care-measures.csv", header = T, 
                      sep = ",", colClasses = "character", 
                      na.strings = "Not Available")
    
    #Crea un vector para los hospitales
    hospitalName <- vector()

    
    # resultados aceptados
    resultados<- list(
        "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
        "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
        "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    )
    
    ## Validamos estado
    if(!(state %in% unique(datos$State))){
        stop("invalid state")
        
    
    ## Validamos resultado    
    }
    if(!(outcome %in% names(resultados))){
        stop("invalid outcome")
    }
    
    ## Selecciona el resultado que queremos
    col_resultados <- resultados[[outcome]]
    
    ## Restringe por estado
    datos_estado <- datos[datos$State == state, c("Hospital.Name", col_resultados)]
    datos_estado
    #Convertir en numero mi tasa
    datos_estado[[col_resultados]] <- as.numeric(datos_estado[[col_resultados]])
    
    #Omitimos los valores na
    datos_estado <- na.omit(datos_estado)
    
    # Ordenar por tasa y nombre
    datos_orden<- datos_estado[order(datos_estado[[col_resultados]],
                                    datos_estado$Hospital.Name), ]
    
    # Elegir el indice
    
    if(num == "best"){
        index <- 1
        
    }else if (num == "worst"){
        index <- nrow(datos_orden)
        
    }else if (is.numeric(num)){
        if (num > nrow(datos_orden)){
            return(NA)
            
        }
        index <- num
    }else{
        stop("invalid num")
    }
    hospitalName <- datos_orden$Hospital.Name[index]
    return(hospitalName)
}

rankhospital("NY", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("WA", "heart attack", 7)
rankhospital("NC", "heart attack", "worst")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


rankall <- function(outcome, num){
    #Lee la data
    dt <- read.csv("outcome-of-care-measures.csv", header = T,
                   sep = ",", colClasses = "character", na.strings = "Not Available")
    
    
    # Crea una lista para los resultado
    resultados_validos <- list("heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                               "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                               "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    
    # Validacion de resultados
    if (!(outcome %in% names(resultados_validos))){
        stop("invalid outcome")
    }
    
    #Seleccionar la tasa que deseo
    col_result <- resultados_validos[[outcome]]
    
    #Convertir en numerico
    dt[[col_result]] <- as.numeric(dt[[col_result]])
    
    #Quitamos los NA
    dt_out <- dt[!is.na(dt[[col_result]]), ]
    
    # Se crea un vector con los estados y se ordena
    estados <- sort(unique(dt_out$State))
    
    #Creamos una nueva funcion
    f_hospital <- function(estado){
        data_estado <- dt_out[dt_out$State == estado, ]
        
        # Ordenas por tasa y estado
        data_estado <- data_estado[order(data_estado[[col_result]],
                                         data_estado$Hospital.Name), ]
        
        n <- nrow(data_estado)
        
        if(num == "best"){
            idx <- 1
        }else if (num == "worst"){
            idx <- n
        }else if (is.numeric(num)){
            if(num > n){
                return(NA)
            }
            idx <- num
        }else{
            return("invalid num")
        }
        
        data_estado[idx, "Hospital.Name"]
    }
    
    resultado_f <- sapply(estados, f_hospital)
    # Crea un dataframe para llenar los resultados
    df_result <- data.frame(hospital = resultado_f,estado = estados, 
                            row.names = estados)
    return(df_result)
}
r <- rankall("heart attack", 4)
r
as.character(subset(r, estado == "HI")$hospital)


r <- rankall("pneumonia", "worst")
as.character(subset(r, estado == "NJ")$hospital)


r <- rankall("heart failure", 10)
as.character(subset(r, estado == "NV")$hospital)


rankall("heart attack",20)



