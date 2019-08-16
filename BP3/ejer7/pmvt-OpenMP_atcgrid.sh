#!/bin/bash
#Todos los scripts que se hagan para atcgrid deben incluir lo siguiente:
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N pmv
#Se asigna al trabajo la cola ac
#PBS -q ac   
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre  del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:" 
cat $PBS_NODEFILE
# FIN del trozo que deben incluir todos los scripts

#para N potencia de 2 desde 2^16 a 2^26
for ((N=0;N<9;N=N+1))
do
    if [ $N = 0 ];then
        export OMP_SCHEDULE=STATIC
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 1 ];then
        export OMP_SCHEDULE="STATIC,1"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 2 ];then
        export OMP_SCHEDULE="STATIC,64"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 3 ];then
        export OMP_SCHEDULE=DYNAMIC
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 4 ];then
        export OMP_SCHEDULE="DYNAMIC,1"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 5 ];then
        export OMP_SCHEDULE="DYNAMIC,64"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 6 ];then
        export OMP_SCHEDULE=GUIDED
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 7 ];then
        export OMP_SCHEDULE="GUIDED,1"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    elif [ $N = 8 ];then
        export OMP_SCHEDULE="GUIDED,64"
        $PBS_O_WORKDIR/pmtv-OpenMP 15360
    fi
done

