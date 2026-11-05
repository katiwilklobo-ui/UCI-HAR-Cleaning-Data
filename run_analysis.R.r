library(dplyr)

# 0. Descarga y configuración del entorno de datos
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archivo_zip <- "UCI_HAR_Dataset.zip"

if (!file.exists(archivo_zip)) {
  download.file(url, archivo_zip, mode = "wb")
  unzip(archivo_zip)
}

dir_base <- "UCI HAR Dataset"

# Carga de metadatos estructurales
features <- read.table(file.path(dir_base, "features.txt"), col.names = c("n", "feature"))
activity_labels <- read.table(file.path(dir_base, "activity_labels.txt"), col.names = c("code", "activity"))

# Carga de datos de prueba (test)
subject_test <- read.table(file.path(dir_base, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(dir_base, "test", "X_test.txt"))
y_test <- read.table(file.path(dir_base, "test", "y_test.txt"), col.names = "code")

# Carga de datos de entrenamiento (train)
subject_train <- read.table(file.path(dir_base, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(dir_base, "train", "X_train.txt"))
y_train <- read.table(file.path(dir_base, "train", "y_train.txt"), col.names = "code")

# 1. Fusionar los conjuntos de entrenamiento y de prueba[cite: 117]
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

colnames(x_data) <- features$feature

datos_completos <- cbind(subject, y_data, x_data)

# 2. Extraer sólo las mediciones de la media y la desviación estándar[cite: 117]
datos_filtrados <- datos_completos %>%
  select(subject, code, matches("mean\\(\\)|std\\(\\)"))

# 3. Utilizar nombres de actividades descriptivos[cite: 117]
datos_filtrados <- datos_filtrados %>%
  left_join(activity_labels, by = "code") %>%
  select(-code) %>%
  select(subject, activity, everything())

# 4. Etiquetar adecuadamente el conjunto de datos con nombres descriptivos de variables[cite: 117]
nombres_actuales <- names(datos_filtrados)
nombres_actuales <- gsub("^t", "Time", nombres_actuales)
nombres_actuales <- gsub("^f", "Frequency", nombres_actuales)
nombres_actuales <- gsub("Acc", "Accelerometer", nombres_actuales)
nombres_actuales <- gsub("Gyro", "Gyroscope", nombres_actuales)
nombres_actuales <- gsub("Mag", "Magnitude", nombres_actuales)
nombres_actuales <- gsub("BodyBody", "Body", nombres_actuales)
nombres_actuales <- gsub("mean\\(\\)", "Mean", nombres_actuales)
nombres_actuales <- gsub("std\\(\\)", "StandardDeviation", nombres_actuales)
nombres_actuales <- gsub("[-()]", "", nombres_actuales)

colnames(datos_filtrados) <- nombres_actuales

# 5. Crear un segundo conjunto de datos independiente y ordenado con la media por sujeto y actividad[cite: 117]
tidy_data_avg <- datos_filtrados %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean)) %>%
  ungroup()

# Exportación del archivo final procesado
write.table(tidy_data_avg, "tidy_data_average.txt", row.names = FALSE)