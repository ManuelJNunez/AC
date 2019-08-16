#!/bin/bash
export OMP_NUM_THREADS=4
#para N potencia de 2 desde 2^16 a 2^26
for ((N=16384;N<67108865;N=N*2))
do
    ./sections $N >> sections.txt
done
