#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la funciï¿½n printf()
#include <time.h>	// biblioteca donde se encuentra la funciï¿½n clock_gettime()

#define MAX 268172524
   
double X[MAX], Y[MAX];
const double A = 1.75;

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
  printf("Tamaño del vector:%u\n", N); 

  //Inicializar matrices
  for(i = 0; i < N; ++i){
  	X[i] = N*0.1+i*0.1; 
    Y[i] = N*0.1-i*0.1;
  }

  clock_gettime(CLOCK_REALTIME,&cgt1);
  for(i = 0; i < N; ++i){
    Y[i] = A*X[i] + Y[i];
  }
  clock_gettime(CLOCK_REALTIME,&cgt2);

  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
       (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  printf("Tiempo:%11.9f\t / Tamaño Vector:%u\n",ncgt,N);
  printf("Y[0]=%8.6f / / A[%d]=%8.6f/\n", Y[0], N-1, Y[N-1]);


  return 0;
}