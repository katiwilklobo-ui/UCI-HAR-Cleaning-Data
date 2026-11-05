# UCI HAR Dataset - Proyecto de Obtención y Limpieza de Datos

Este repositorio contiene la solución completa para el proyecto de curso de *Getting and Cleaning Data*, basado en el procesamiento y ordenamiento de datos de reconocimiento de actividad humana mediante teléfonos inteligentes (*Human Activity Recognition Using Smartphones*).

## Estructura del Repositorio

- **`run_analysis.R`**: Script principal en R que automatiza todo el proceso de descarga, transformación y limpieza de los datos.
- **`CodeBook.md`**: Libro de códigos que detalla las variables, las unidades de medida y las transformaciones aplicadas.
- **`tidy_data_average.txt`**: Conjunto de datos ordenado final que contiene el promedio de cada variable por cada par de sujeto y actividad.

---

## Funcionamiento del Script (`run_analysis.R`)

El script ejecuta secuencialmente las siguientes cinco fases analíticas:

1. **Fusión de conjuntos**: Descarga el archivo comprimido del UCI HAR Dataset (si no se encuentra disponible localmente) y une los datos de entrenamiento (*train*) y prueba (*test*) correspondientes a las señales de los acelerómetros, las etiquetas de actividad y los identificadores de los sujetos mediante funciones de concatenación por filas (`rbind`) y columnas (`cbind`).
2. **Extracción de medias y desviaciones estándar**: Filtra el conjunto de datos completo para conservar exclusivamente las mediciones asociadas a la media (`mean()`) y a la desviación estándar (`std()`) de cada característica.
3. **Nombres descriptivos de actividades**: Reemplaza los códigos numéricos de actividad por etiquetas textuales claras y descriptivas (*WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING*).
4. **Etiquetado semántico de variables**: Modifica los nombres de las columnas para hacerlos legibles y estructurados, expandiendo abreviaturas (ej. sustituyendo prefijos como `t` por `Time`, `f` por `Frequency`, `Acc` por `Accelerometer`, y eliminando caracteres especiales no alfanuméricos).
5. **Generación del conjunto ordenado secundario**: A partir del conjunto depurado, agrupa los datos por `subject` y `activity`, calculando la media aritmética de cada variable para cada estrato, y exporta el resultado final en formato plano sin nombres de filas (`write.table` con `row.names = FALSE`).

## Requisitos de Ejecución

Para ejecutar correctamente el script, asegúrate de tener instalado R junto con el paquete:
- `dplyr`

Simplemente abre el script `run_analysis.R` en tu entorno de trabajo y ejecútalo con el directorio base configurado.