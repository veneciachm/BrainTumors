set term post eps enhanced 18 size 5,5
set output 'MRIxy.eps'

unset key

set multiplot

set palette model RGB defined(0.00000 0.36863 0.36863 0.36863,0.50000 0.68627 0.68627 0.68627,1.00000 1.00000 1.00000 1.00000)
set view 0,90

set tics font "Italic,25"
set tics scale 2.0
set mxtics 4

set mytics 4

set pm3d map
unset colorbox

splot 'Sal3xyF' u (-$1):2:13 i 0

unset border
set origin 0.0,0.0
set contour
set cntrparam levels discrete 0.07, 0.076, 0.08, 0.138, 0.140, 0.15, 0.16,  0.19, 0.21, 0.3, 0.4
unset surface
#do for [ii=1:99]{
	splot 'Sal3xyF' u (-$1):2:14 i 3

# every ::1::ii
#}
splot 'Sal3xyF' u (-$1):2:14 i 0
unset multiplot

