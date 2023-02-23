
--------------------------------------------------------------------
####################################################################
LABORATORIO_27_DATOS ORDENADOS_TIDY DATA PARTE3
RETOMAMOS LABORATORIO_25Y26
####################################################################
--------------------------------------------------------------------

# Hecho con gusto por la alumna JESSICA PAOLA AGUILAR SERVIN

# RETOMAR Laboratorio 25- Tidy data- Datos ordenados-

#PASOS PREVIOS
# Pre-requisitos: instalar paqueteria
install.packages("tidyverse")

# Instalar paquete de datos
install.packages("remotes")
remotes::install_github("cienciadedatos/datos")
install.packages("datos")

# Libreria de tidyverse
library("tidyverse")

# Libreria de datos
library("datos")

# Visualizar las tablas a utilizar (tabla1 a tabla4b). Ver datos como tibble
datos::tabla1
datos::tabla2
datos::tabla3
datos::tabla4a
datos::tabla4b

#DATOS como dataframe
df1 <- data_frame(tabla1)
df2 <- data_frame(tabla2)
df3 <- data_frame(tabla3)
df4a <- data_frame(tabla4a)
df4b <- data_frame(tabla4b)

#VISUALIZAR encabezados dataframe
head(df1)
head(df2)
head(df3)
head(df4a)
head(df4b)

# Exportar los dataframe originales
write.csv(df1, file = "df1.csv")
write.csv(df1, file = "df2.csv")
write.csv(df1, file = "df3.csv")
write.csv(df1, file = "df4a.csv")
write.csv(df1, file = "df4b.csv")

# Ordenar datos con la tabla4a (pivotar)
t4a_PIVOTANTE = tabla4a %>% 
  pivot_longer(cols = c ("1999", "2000"), names_to = "anio", values_to = "casos")

# Ordenar datos con la tabla4b (pivotar)
t4b_PIVOTANTE = tabla4b %>% 
  pivot_longer(cols = c ("1999", "2000"), names_to = "anio", values_to = "casos")

# Exportar resultado: tabla ordenada
write.csv(t4a_PIVOTANTE, file = "t4a_PIVOTANTE.csv")
write.csv(t4a_PIVOTANTE, file = "t4b_PIVOTANTE.csv")

-----------------------------------------------
###############################################
PARTE_2
################################################
----------------------------------------------
  
#EJERCICIO 2. PIVOTAR Y UNIR TABLAS
# Laboratorio 26- Tidy data- Parte 2
# Ver tabla4b (df4b)

# PASO1.Ordenar los datos de la tabla4b (pivotar)
  t4b_PIVOTANTE = tabla4b %>% 
  pivot_longer(cols = c ("1999", "2000"), names_to = "anio", values_to = "poblacion")

# PASO2.Combinar las versiones ordenadas de la tabla4a y tabla4b (ocupando dplyr)
union_t4 = left_join(t4a_PIVOTANTE, t4b_PIVOTANTE)

# Visualizar encabezados tabla4b
head(tabla4b)

# Exportar resultado: tabla ordenada
write.csv(union_t4, file = "union_t4.csv")

# Ejercicio 3 A PARTIR DE LOS Datos ANCHOS con la tabla 2
# Pivotar la tabla2 a lo ancho

# Ver encabezados tabla2
head(tabla2)

# Ordenar datos con la tabla2 (pivotar a lo ancho)
t2_ancha = tabla2 %>% 
  pivot_wider(names_from = tipo, values_from = cuenta)

# Ver encabezados t2_ancha
head(t2_ancha)

# Exportar resultado: tabla ordenada
write.csv(t2_ancha, file = "t2_ancha.csv")

-----------------------------------------------
###############################################
PARTE_3  tydydata
################################################
-----------
  
  # Laboratorio 27- Tidy data- Separar datos - Parte 3
  # La tabla3 (df3) que tiene un problema diferente
  # tenemos una columna (tasa) que tiene como resultado dos variables (casos y la poblacion)
  # Ver tabla3
  head(df3)

# Separacion 1
# separar casos y población por default y ver resultado
Separado_1 = tabla3 %>%
  separate(tasa, into = c("casos", "poblacion"))

head(Separado_1)

# Separacion 2
#separar casos y población por caracter "/"  "*" "-" y ver resultado
Separado_2 = tabla3 %>%
  separate(tasa, into = c("casos", "poblacion"), sep = "/")

head(Separado_2)

# Separacion 3: separar el año por siglo y año con 2 digitos cada uno y ver resultado
Separado_3 = tabla3 %>%
  separate(anio, into = c("siglo", "anio"), sep = 2)

head(Separado_3)

# Ahora vamos a unir la tabla generada anteriormente
# Podemos unite() para unir las columnas siglo y anio creadas en el ejemplo anterior
Union_1 = Separado_3 %>%
  unite(nueva, siglo, anio)

head(Union_1)

# Quitar el guion bajo (_) entre los valores de la union generada previamente
Union_2 = Separado_3 %>%
  unite(nueva, siglo, anio, sep = "")

head(Union_2)

# Exportar resultado: tabla ordenada
write.csv(Separado_1, file = "Separado_1.csv")
write.csv(Separado_2, file = "Separado_2.csv")
write.csv(Separado_3, file = "separado_3.csv")
write.csv(Union_1, file = "Union_1.csv")
  
  