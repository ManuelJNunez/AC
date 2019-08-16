/*
 Suma de dos vectores: v3 = v1 + v2

 Para compilar usar (-lrt: real time library, es posible que no sea necesario usar -lrt):
	gcc  -O2  pmv-secuencial.c -o pmv-secuencial -lrt
	gcc  -O2 -S pmv-secuencial.c -lrt

 Para ejecutar use: pmv-secuencial <longitud>

*/

#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la funciï¿½n printf()
#include <time.h>	// biblioteca donde se encuentra la funciï¿½n clock_gettime()

#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char** argv){

  int i, j, k;

  struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecuciï¿½n

  if (argc<2){
    printf("Faltan dimensiones de la matriz.\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);	// Mï¿½ximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  printf("Dimensiones de la matriz:%ux%u (%lu B)\n", N, N, sizeof(unsigned int));

  double **A, **B, **C;
  A = (double**) malloc(N*sizeof(double*));// malloc necesita el tamaï¿½o en bytes
  B = (double**) malloc(N*sizeof(double*));
  C = (double**) malloc(N*sizeof(double*));

  for(i = 0; i < N; ++i){
  	A[i] = (double*) malloc(N*sizeof(double));
    B[i] = (double*) malloc(N*sizeof(double));
    C[i] = (double*) malloc(N*sizeof(double));
  }    

  if ((A == NULL) || (B == NULL) || (C == NULL)) {
    printf("No hay suficiente espacio para los vectores \n");
    exit(-2);
  }

  //Inicializar vector y matriz
  #pragma omp parallel for private(j)
  for(i = 0; i < N; ++i)
  	for(j = 0; j < N; ++j){
  		B[i][j] = N*0.1-j*0.1;
        C[i][j] = N*0.1-j*0.1;
    }

  clock_gettime(CLOCK_REALTIME,&cgt1);
  //Calculos
  #pragma omp parallel for private(j,k)
  for(i = 0; i < N; ++i){
  	for(j = 0; j < N; ++j)
      for(k = 0; k < N; ++k)
  		  A[i][j] += B[i][k] * C[k][j];
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
       (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Tiempo:%11.9f\t / Tamaño Matrices:%ux%u\n",ncgt,N, N);
  printf("A[0][0]=%8.6f / / A[N-1][N-1]=%8.6f/\n",
           A[0][0], A[N-1][N-1]);

  for(i = 0; i < N; ++i){	//libera espacio para M
  	free(A[i]);
    free(B[i]);
    free(C[i]);
  }

  free(A);
  free(B);
  free(C);
  return 0;
}
