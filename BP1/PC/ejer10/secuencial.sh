#!/bin/bash
for ((N=16384;N<67108865;N=N*2))
do
    ./secuencial $N >> secuencial.txt
done
