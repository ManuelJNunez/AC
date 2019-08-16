#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la funciï¿½n printf()
#include <time.h>	// biblioteca donde se encuentra la funciï¿½n clock_gettime()

#define MAX 11579
   
double A[MAX][MAX], B[MAX][MAX], C[MAX][MAX];

int main(int argc, char** argv){

  int i, j, k;

  struct timespec cgt1,cgt2; 
  double ncgt; //para tiempo de ejecución

  if (argc<2){
    printf("Faltan dimensiones de la matriz.\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);	// Mï¿½ximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  if (N>MAX) N=MAX;
  printf("Dimensiones de la matriz:%ux%u (%lu B)\n", N, N, sizeof(unsigned int)); 

  //Inicializar matrices
  for(i = 0; i < N; ++i)
  	for(j = 0; j < N; ++j){
  		  B[i][j] = N*0.1-j*0.1;
        C[i][j] = N*0.1-j*0.1;
    }

  clock_gettime(CLOCK_REALTIME,&cgt1);
  //Calculos
  for(i = 0; i < N; i+=4){
  	for(j = 0; j < N; j++)
      for(k = 0; k < N; k++){
  		  A[i][j] += B[i][k] * C[k][j];
        A[i+1][j] += B[i+1][k] * C[k][j];
        A[i+2][j] += B[i+2][k] * C[k][j];
        A[i+3][j] += B[i+3][k] * C[k][j];
      }
  }

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
       (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Tiempo:%11.9f\t / Tamaño Matrices:%ux%u\n",ncgt,N, N);
  printf("A[0][0]=%8.6f / / A[%d][%d]=%8.6f/\n",
           A[0][0], N-1, N-1, A[N-1][N-1]);


  return 0;
}