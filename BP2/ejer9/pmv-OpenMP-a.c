/*
 Suma de dos vectores: v3 = v1 + v2
 
 Para compilar usar (-lrt: real time library, es posible que no sea necesario usar -lrt):  
	gcc  -O2 -fopenmp  pmv-OpenMP-a.c -o pmv-OpenMP-a -lrt
	gcc  -O2 -S pmv-OpenMP-a.c -lrt 

 Para ejecutar use: pmv-OpenMP-a <longitud>
		
*/ 

#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la función printf()
#include <time.h>	// biblioteca donde se encuentra la función clock_gettime()
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

//Sólo puede estar definida una de las tres constantes VECTOR_ (sólo uno de los ... 
//dos defines siguientes puede estar descomentado):
//#define VECTOR_GLOBAL
#define VECTOR_DYNAMIC

#ifdef VECTOR_GLOBAL
#define MAX 16375
   
double M[MAX][MAX], v[MAX], v2[MAX];
#endif
int main(int argc, char** argv){ 
  
  int i, j; 

  struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución

  if (argc<2){	
    printf("Faltan dimensiones de la matriz.\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]);	// Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  printf("Dimensiones de la matriz:%ux%u (%lu B)\n", N, N, sizeof(unsigned int)); 

  #ifdef VECTOR_GLOBAL
  if (N>MAX) N=MAX;
  #endif
  #ifdef VECTOR_DYNAMIC
  double *v, *v2;
  double **M;
  v = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
  v2 = (double*) malloc(N*sizeof(double));
  M = (double**) malloc(N*sizeof(double*));

  for(i = 0; i < N; ++i)
  	M[i] = (double*) malloc(N*sizeof(double));
  if ((v == NULL) || (v2 == NULL) || (M == NULL)) {	
    printf("No hay suficiente espacio para los vectores \n");
    exit(-2);
  }
  #endif
 
  //Inicializar vector y matriz
  #pragma omp parallel for private(j)
  for(i = 0; i < N; ++i)
  	for(j = 0; j < N; ++j)
  		M[i][j] = N*0.1-j*0.1;

  #pragma omp parallel for
  for(i=0; i<N; i++)
    v[i] = N*0.1+i*0.1;

  #pragma omp parallel for
  for(i = 0; i < N; ++i)
  	v2[i] = 0;
 
  clock_gettime(CLOCK_REALTIME,&cgt1);
  //Calculos
  #pragma omp parallel for private(j)
  for(i = 0; i < N; ++i){
    for(j = 0; j < N; ++j)
      v2[i] += M[i][j] * v[j];
  }
 
  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
       (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));


  if (N<12) {
  printf("Tiempo:%11.9f\t / Tamaño Matriz:%ux%u\n",ncgt,N, N); 
  for(i=0; i<N; i++) 
    printf("/ M[%d][k]*V[k]=V2[%d](%8.6f) /\n",i,i,v2[i]); 
  }
  else
    printf("Tiempo:%11.9f\t / Tamaño Matriz:%ux%u\t/ M[0][k]*V[k]=V2[0](%8.6f) / / M[%d][k]*V[k]=V2[%d](%8.6f) /\n",
           ncgt,N,N,v2[0], N-1, N-1, v2[N-1]); 
 

  #ifdef VECTOR_DYNAMIC
  free(v); // libera el espacio reservado para v
  free(v2); // libera el espacio reservado para v2
  
  for(i = 0; i < N; ++i)	//libera espacio para M
  	free(M[i]);

  free(M);
  #endif
  return 0; 
}
