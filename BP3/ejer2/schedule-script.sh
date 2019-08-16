#!/bin/bash
for ((N=1;N<5;N=N*2))
do
    export OMP_NUM_THREADS=4
    ./schedule-clause 16 $N >> resultadoschedule4
done

