#!/bin/bash


module load UCC/1.0.0-GCCcore-11.3.0   #    USS/2020 
#   module load slurm
module load GCC/11.3.0                 #gcc/7.3.0
module load OpenMPI/4.1.4-GCC-11.3.0       #openmpi/3.1.3
module load OpenFOAM/10-foss-2022a     #openfoam-org/10.0

source /opt/easybuild/foss2022a/software/OpenFOAM/10-foss-2022a/OpenFOAM-10/etc/bashrc

module load gnuplot/5.4.4-GCCcore-11.3.0 
 


foamLog log.simpleFoam >/dev/null

#: <<'END'

#END

gnuplot -persist > /dev/null 2>&1 << EOF
        set logscale y
        set title "Residual vs. Iteration"
        set xlabel "Iteration"
        set ylabel "Residual"
        plot "logs/Ux_0" with lines,\
             "logs/Uy_0" with lines,\
             "logs/Uz_0" with lines,\
             "logs/p_0" with lines

	set terminal pdfcairo enhanced color notransparent
        set output "residual.pdf"

        replot
        unset output
        unset terminal

EOF
