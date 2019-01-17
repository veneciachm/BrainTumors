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

splot 'MRIxy' u (-$1):2:17 i 0

unset border
set origin 0.0,0.0
set contour
set cntrparam levels discrete 0.02, 0.06, 0.1, 0.138, 0.16, 0.1 
unset surface
#do for [ii=1:99]{
	splot 'MRIxy' u (-$1):2:18 i 2
# every ::1::ii
#}
#splot 'MRIxy' u (-$1):2:20 i 0
unset multiplot

