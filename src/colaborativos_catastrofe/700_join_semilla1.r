# Experimentos Colaborativos Default
#limpio la memoria

rm( list= ls(all.names= TRUE) )  #remove all objects
gc( full= TRUE )                 #garbage collection

require("data.table")

dataset_grande <- fread ("~/buckets/b1/.datasets/competencia_2023.csv.gz")
dataset_pred <- fread ("~/buckets/b1/.exp/ZZ6910Ninguno_semilla1/pred_01_006.csv")

dataset_pred [, ganancia:= -3000]
dataset_pred [clase_ternaria== "BAJA+2", ganancia:= 117000]

setorder(dataset_pred, - prob)

dataset_pred [, ganancia_acumulada: = cumsum(ganancia)]

dataset_pred [, envios:= .I]
