# si se quiere salida en formato postscript, descomentar estas lineas y comentar el bloque que sigue
#set term pos col
#set out 'PvsT.ps'

#si se quiere salida png, descomentar estas lineas, y comentar el bloque anterior
# la opción enhanced habilita la opción de escribir cierto mdoo matemático en el texto
# el modo matemático incluye subíndices(_), supraíndices(^), y otros símbolos.
# para más información ver https://gnuplot.sourceforge.net/docs_4.2/node411.html#enhanced
set term png enhanced
set out 'PvsT.png'

set grid
set key center
set xlabel 'T (K)'
set ylabel 'P (kPa)'


Z = 0.001
f(x) = W * exp(x * Z)
fit f(x) "ejemplo.dat" u 1:2:3:4 xyerrors via W, Z

p [305:] 'ejemplo.dat' u 1:2:3:4 ps 1.3 pt 2 t 'Data' w xyerrorbars,\
f(x) t 'Fit'
