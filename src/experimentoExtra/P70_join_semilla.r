# Experimentos Colaborativos Default
#limpio la memoria

rm( list= ls(all.names= TRUE) )  #remove all objects
gc( full= TRUE )                 #garbage collection

require("data.table")


dataset_grande <- fread ("~/buckets/b1/datasets/competencia_2023.csv.gz")

#semilla1

dataset_pred1 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s192991.csv")

dataset_pred1[dataset_grande,
              on = c("numero_de_cliente", "foto_mes"),
              mprestamos_totales := ifelse(mprestamos_totales < umbral_prestamos, i.mprestamos_totales, mprestamos_totales)]


dataset_pred1 [, ganancia:= -3000]
dataset_pred1 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred1, - prob)

dataset_pred1 [, ganancia_acumulada:= cumsum(ganancia)]

dataset_pred1 [, envios:= .I]

#semilla 2

dataset_pred2 <- fread ("~/buckets/b1/exp/ZZ6920_ML07/pred_01_043_s211283.csv")

dataset_pred2 [, ganancia:= -3000]
dataset_pred2 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred2, - prob)

dataset_pred2 [, ganancia_acumulada:= cumsum(ganancia)]

dataset_pred2 [, envios:= .I]

#semilla 3

dataset_pred3 <- fread ("~/buckets/b1/exp/ZZ6920_ML07/pred_01_043_s473167.csv")

dataset_pred3 [, ganancia:= -3000]
dataset_pred3 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred3, - prob)

dataset_pred3 [, ganancia_acumulada:= cumsum(ganancia)]

dataset_pred3 [, envios:= .I]

#semilla 4

dataset_pred4 <- fread ("~/buckets/b1/exp/ZZ6920_ML07/pred_01_043_s586909.csv")

dataset_pred4 [, ganancia:= -3000]
dataset_pred4 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred4, - prob)

dataset_pred4 [, ganancia_acumulada:= cumsum(ganancia)]

dataset_pred4 [, envios:= .I]

#semilla 5

dataset_pred5 <- fread ("~/buckets/b1/exp/ZZ6920_ML07/pred_01_043_s883343.csv")

dataset_pred5 [, ganancia:= -3000]
dataset_pred5 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred5, - prob)

dataset_pred5 [, ganancia_acumulada:= cumsum(ganancia)]

dataset_pred5 [, envios:= .I]

# Calcular el promedio de ganancia acumulada por envío

promedio_ganancia <- rbindlist(list(dataset_pred1, dataset_pred2, dataset_pred3, dataset_pred4, dataset_pred5))[, .(ganancia_media = mean(ganancia_acumulada)), by = envios]

#Gráfico

library(ggplot2)


# Subconjunto de datos para el gráfico (hasta 20,000 envíos)

data_plot <- promedio_ganancia[promedio_ganancia$envios <= 20000, ]

# Gráfico de ganancias acumuladas en función del número de envíos

#ggplot(data_plot, aes(x = envios, y = ganancia_media)) +
  #geom_line(size = 1, alpha = 0.7) +
 # xlab("Número de envíos") +
  #ylab("Ganancia ") +
  #ggtitle("Promedio de Ganancias (por semillas)  en función del número de envíos")

ggplot(data_plot, aes(x = envios, y = ganancia_media)) +
  geom_line(size = 1, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_y_continuous(labels = scales::unit_format(unit = "M", scale = 1e-6)) +
  xlab("Número de envíos") +
  ylab("Ganancia (millones)") +
  ggtitle("Promedio de Ganancias en función del número de envíos") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 16, color = "blue"),
        axis.title = element_text(face = "bold", size = 14),
        legend.title = element_blank(),
        legend.text = element_text(size = 12, color = "gray"))

