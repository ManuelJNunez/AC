#!/bin/bash
for ((N=1;N<5;N=N+1))
do
    export OMP_NUM_THREADS=$N
    ./pmv-OpenMP-a 20000 >> resultadosPC20000
done
