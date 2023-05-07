# Experimentos Colaborativos Default
#limpio la memoria

rm( list= ls(all.names= TRUE) )  #remove all objects
gc( full= TRUE )                 #garbage collection

require("data.table")


dataset_grande <- fread ("~/buckets/b1/.datasets/competencia_2023.csv.gz")

#semilla1

dataset_pred1 <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla1/pred_01_006.csv")

dataset_pred1 [, ganancia:= -3000]
dataset_pred1 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred1, - prob)

dataset_pred1 [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred1 [, envios:= .I]

#semilla 2

dataset_pred2 <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla2/pred_01_006.csv")

dataset_pred2 [, ganancia:= -3000]
dataset_pred2 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred2, - prob)

dataset_pred2 [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred2 [, envios:= .I]

#semilla 3

dataset_pred3 <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla3/pred_01_006.csv")

dataset_pred3 [, ganancia:= -3000]
dataset_pred3 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred3, - prob)

dataset_pred3 [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred3 [, envios:= .I]

#semilla 4

dataset_pred2 <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla4/pred_01_006.csv")

dataset_pred4 [, ganancia:= -3000]
dataset_pred4 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred4, - prob)

dataset_pred4 [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred4 [, envios:= .I]

#semilla 5

dataset_pred5 <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla5/pred_01_006.csv")

dataset_pred5 [, ganancia:= -3000]
dataset_pred5 [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred5, - prob)

dataset_pred5 [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred5 [, envios:= .I]
