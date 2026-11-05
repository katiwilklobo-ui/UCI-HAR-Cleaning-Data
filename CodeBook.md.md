# Libro de Códigos (CodeBook) - UCI HAR Tidy Dataset

Este documento describe las variables, las transformaciones y las unidades de medida presentes en el conjunto de datos ordenado final (`tidy_data_average.txt`).

## Identificadores Principales

- **`subject`**: Identificador numérico del sujeto que participó en el experimento. 
  - *Rango*: 1 a 30.
- **`activity`**: Nombre descriptivo de la actividad física realizada por el sujeto durante la medición.
  - *Categorías*: 
    1. `WALKING` (Caminando)
    2. `WALKING_UPSTAIRS` (Subiendo escaleras)
    3. `WALKING_DOWNSTAIRS` (Bajando escaleras)
    4. `SITTING` (Sentado)
    5. `STANDING` (De pie)
    6. `LAYING` (Acostado)

---

## Variables de Medición y Características

Las siguientes variables representan el promedio de las mediciones normalizadas de las señales del acelerómetro y giroscopio del smartphone (Samsung Galaxy S), capturadas a una frecuencia constante de 50 Hz. Los valores originales fueron normalizados y acotados en el rango [-1, 1].

Las características provienen de las señales en el dominio del tiempo (`Time...`) y de frecuencia (`Frequency...`), separadas en componentes de aceleración lineal y velocidad angular.

### Aceleración del Dominio del Tiempo (*Time Domain Signals*)
- `TimeBodyAccelerometerMeanX` / `Y` / `Z`
- `TimeBodyAccelerometerStandardDeviationX` / `Y` / `Z`
- `TimeGravityAccelerometerMeanX` / `Y` / `Z`
- `TimeGravityAccelerometerStandardDeviationX` / `Y` / `Z`
- `TimeBodyAccelerometerJerkMeanX` / `Y` / `Z`
- `TimeBodyAccelerometerJerkStandardDeviationX` / `Y` / `Z`

### Giroscopio del Dominio del Tiempo (*Time Domain Gyroscope Signals*)
- `TimeBodyGyroscopeMeanX` / `Y` / `Z`
- `TimeBodyGyroscopeStandardDeviationX` / `Y` / `Z`
- `TimeBodyGyroscopeJerkMeanX` / `Y` / `Z`
- `TimeBodyGyroscopeJerkStandardDeviationX` / `Y` / `Z`

### Magnitudes Temporales (*Magnitude*)
- `TimeBodyAccelerometerMagnitudeMean` / `StandardDeviation`
- `TimeGravityAccelerometerMagnitudeMean` / `StandardDeviation`
- `TimeBodyAccelerometerJerkMagnitudeMean` / `StandardDeviation`
- `TimeBodyGyroscopeMagnitudeMean` / `StandardDeviation`
- `TimeBodyGyroscopeJerkMagnitudeMean` / `StandardDeviation`

### Dominio de Frecuencia (*Frequency Domain Signals*)
- `FrequencyBodyAccelerometerMeanX` / `Y` / `Z`
- `FrequencyBodyAccelerometerStandardDeviationX` / `Y` / `Z`
- `FrequencyBodyAccelerometerJerkMeanX` / `Y` / `Z`
- `FrequencyBodyAccelerometerJerkStandardDeviationX` / `Y` / `Z`
- `FrequencyBodyGyroscopeMeanX` / `Y` / `Z`
- `FrequencyBodyGyroscopeStandardDeviationX` / `Y` / `Z`

### Magnitudes Frecuenciales
- `FrequencyBodyAccelerometerMagnitudeMean` / `StandardDeviation`
- `FrequencyBodyAccelerometerJerkMagnitudeMean` / `StandardDeviation`
- `FrequencyBodyGyroscopeMagnitudeMean` / `StandardDeviation`
- `FrequencyBodyGyroscopeJerkMagnitudeMean` / `StandardDeviation`

---

## Transformaciones y Limpieza Realizadas

1. **Consolidación**: Se unieron los registros independientes de entrenamiento y prueba en una estructura matricial unificada.
2. **Filtrado**: Se aislaron exclusivamente las columnas correspondientes a estimaciones de media (`mean()`) y desviación estándar (`std()`).
3. **Estandarización de Nombres**: Se eliminaron caracteres especiales (paréntesis, guiones) y se expandieron los nombres de las variables para garantizar una legibilidad óptima y evitar ambigüedades técnicas.
4. **Agregación**: Se calculó el valor medio de cada variable numérica agrupada de forma cruzada por cada combinación única de `subject` y `activity`.