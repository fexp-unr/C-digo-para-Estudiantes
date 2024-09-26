set terminal x11
# si se quiere la salida de grafica en un archivo descomentar las dos lineas siguientes
# set term pos col
# set out 'PvsT.ps'

set grid
set key center
set xlabel 'T (K)'
set ylabel 'P (kPa)'


Z = 0.001
f(x) = W * exp(x * Z)
fit f(x) "ejemplo.dat" u 1:2:3:4 xyerrors via W, Z

p [305:] 'ejemplo.dat' u 1:2:3:4 ps 1.3 pt 2 t 'Data' w xyerrorbars,\
f(x) t 'Fit'
