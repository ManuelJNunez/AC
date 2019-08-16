#!/bin/bash
for ((N=1;N<5;N=N*2))
do
    export OMP_NUM_THREADS=4
    ./scheduled-clause 16 $N >> resultadoscheduled4
done

