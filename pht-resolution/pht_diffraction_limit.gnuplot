# This file is used to generate an encapsulated postscript file
# with
#
#   - three color cones
#   - the diffraction limit of the Peterberger Halbmeter Telesceope (PHT)
#                                  \Lambda
#           sin( \Phi ) = 1.22   -----------
#                                     D
#
#   - Resolution in pixel per arcseconds for different cameras
#

set encoding utf8


set terminal postscript color enhance eps
set output 'pht_diffraction_limit.eps'
set grid
set xlabel "Wavelength {/Symbol l} (nm)"
set ylabel "Arcseconds / pixel"

set title "Diffraction Limit PHT" 
set xtic 50
set ytic 0.1
set yr[0:1]
set xrange [300:800]

plot \
     '../data/color_cones.data' using 1:($4/2.0) smooth cspline notitle with filledcurves fs transparent noborder solid 0.1 lt -1 lc rgb "blue", \
     '../data/color_cones.data' using 1:($3/2.0) smooth cspline notitle with filledcurves fs transparent noborder solid 0.1 lt -1 lc rgb "green", \
     '../data/color_cones.data' using 1:($2/2.0) smooth cspline notitle with filledcurves fs transparent noborder solid 0.1 lt -1 lc rgb "red", \
     1.22 * x * 10**(-9) / 500 * 10**3 * 180.0 * 3600.0 / 3.14159265 title 'Diffraction Limit' lc rgb "black" lw 3.0 lt -1, \
     0.38 title 'Canon EOS 5D Mark II (5616x3744)' lt 3 lc rgb "red",\
     0.32 title 'Canon EOS 40D / 450D (3888x2592)' lt 3 lc rgb "green", \
     0.44 title 'Canon EOS 10D / 300D (3092x2048)' lt 3 lc rgb "blue"

# vim:syntax=gnuplot
