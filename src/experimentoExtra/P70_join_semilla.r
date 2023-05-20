# Experimentos Colaborativos Default
#limpio la memoria

rm( list= ls(all.names= TRUE) )  #remove all objects
gc( full= TRUE )                 #garbage collection

require("data.table")


dataset_grande <- fread ("~/buckets/b1/exp/PTS40/dataset_future.csv.gz")
dataset_pred1 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s192991.csv")


# agrego a dataset_pred1  las columnas  mprestamos_totales y  umbral_prestamos
dataset_pred1[dataset_grande,
                                  on = c("numero_de_cliente", "foto_mes"),
                                   c( "mprestamos_totales_rank", "mumbral_prestamos_rank") := list( i.mprestamos_totales_rank, i.mumbral_prestamos_rank) ]

#ordeno por probabilidad descendente
setorder(  dataset_pred1,  -prob )  # ordeno por probabilidad descendente

# marco todos en cero
dataset_pred1[  , Predicted := 0 ]

# marco en 1 a los primeros 10500  , cambiar luego a gusto, ya está ordenado !
dataset_pred1[ 1:10500,  Predicted := 1 ]

#ahora viene el  "Engendro Marcela"  ,  donde decido NO enviar estimulo a los que deben mucho

dataset_pred1[  mprestamos_totales_rank  >  mumbral_prestamos_rank,  Predicted :=0 ]

#finalmente, grabo a disco
fwrite( dataset_pred1[ , list( numero_de_cliente, Predicted ) ],
                file= "marcela_bola_de_cristal_10500.csv",
                sep= "," )


#semilla 2

dataset_pred2 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s211283.csv")



dataset_pred2[dataset_grande,
              on = c("numero_de_cliente", "foto_mes"),
              c( "mprestamos_totales_rank", "mumbral_prestamos_rank") := list( i.mprestamos_totales_rank, i.mumbral_prestamos_rank) ]


setorder(  dataset_pred1,  -prob )  # ordeno por probabilidad descendente


dataset_pred2[  , Predicted := 0 ]

# marco en 1 a los primeros 10500  , cambiar luego a gusto, ya está ordenado !
dataset_pred1[ 1:10500,  Predicted := 1 ]


dataset_pred2[  mprestamos_totales_rank  >  mumbral_prestamos_rank,  Predicted :=0 ]

#finalmente, grabo a disco
fwrite( dataset_pred2[ , list( numero_de_cliente, Predicted ) ],
        file= "marcela_bola_de_cristal2_10500.csv",
        sep= "," )

#semilla 3

dataset_pred3 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s473167.csv")



dataset_pred3[dataset_grande,
              on = c("numero_de_cliente", "foto_mes"),
              c( "mprestamos_totales_rank", "mumbral_prestamos_rank") := list( i.mprestamos_totales_rank, i.mumbral_prestamos_rank) ]


setorder(  dataset_pred3,  -prob )  # ordeno por probabilidad descendente


dataset_pred3[  , Predicted := 0 ]

# marco en 1 a los primeros 10500  , cambiar luego a gusto, ya está ordenado !
dataset_pred3[ 1:10500,  Predicted := 1 ]


dataset_pred3[  mprestamos_totales_rank  >  mumbral_prestamos_rank,  Predicted :=0 ]

#finalmente, grabo a disco
fwrite( dataset_pred3[ , list( numero_de_cliente, Predicted ) ],
        file= "marcela_bola_de_cristal3_10500.csv",
        sep= "," )

#semilla 4

dataset_pred4 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s586909.csv")



dataset_pred4[dataset_grande,
              on = c("numero_de_cliente", "foto_mes"),
              c( "mprestamos_totales_rank", "mumbral_prestamos_rank") := list( i.mprestamos_totales_rank, i.mumbral_prestamos_rank) ]


setorder(  dataset_pred4,  -prob )  # ordeno por probabilidad descendente


dataset_pred4[  , Predicted := 0 ]

# marco en 1 a los primeros 10500  , cambiar luego a gusto, ya está ordenado !
dataset_pred4[ 1:10500,  Predicted := 1 ]


dataset_pred4[  mprestamos_totales_rank  >  mumbral_prestamos_rank,  Predicted :=0 ]


fwrite( dataset_pred4[ , list( numero_de_cliente, Predicted ) ],
        file= "marcela_bola_de_cristal4_10500.csv",
        sep= "," )

#semilla 5

dataset_pred5 <- fread ("~/buckets/b1/exp/PZZ60/pred_01_007_s883343.csv")



dataset_pred5[dataset_grande,
              on = c("numero_de_cliente", "foto_mes"),
              c( "mprestamos_totales_rank", "mumbral_prestamos_rank") := list( i.mprestamos_totales_rank, i.mumbral_prestamos_rank) ]


setorder(  dataset_pred5,  -prob )  # ordeno por probabilidad descendente


dataset_pred5[  , Predicted := 0 ]

# marco en 1 a los primeros 10500  , cambiar luego a gusto, ya está ordenado !
dataset_pred5[ 1:10500,  Predicted := 1 ]


dataset_pred5[  mprestamos_totales_rank  >  mumbral_prestamos_rank,  Predicted :=0 ]

#finalmente, grabo a disco
fwrite( dataset_pred5[ , list( numero_de_cliente, Predicted ) ],
        file= "marcela_bola_de_cristal5_10500.csv",
        sep= "," )