#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la funciï¿½n printf()
#include <time.h>	// biblioteca donde se encuentra la funciï¿½n clock_gettime()

struct {
	int a;
	int b;
} s[5000];

int X1, X2, R[40000];

int main(){
	int i, ii;
	struct timespec cgt1,cgt2; 
 	double ncgt; //para tiempo de ejecución

 	clock_gettime(CLOCK_REALTIME,&cgt1);

	for(ii = 0; ii < 40000; ii++){
		X1 = 0; X2 = 0;

		for(i = 0; i < 5000; i+=4){
			X1 += 2*s[i].a+ii;
			X2 += 3*s[i].b-ii;

			X1 += 2*s[i+1].a+ii;
			X2 += 3*s[i+1].b-ii;

			X1 += 2*s[i+2].a+ii;
			X2 += 3*s[i+2].b-ii;

			X1 += 2*s[i+2].a+ii;
			X2 += 3*s[i+2].b-ii;
		}

		if(X1<X2) R[ii]=X1; else R[ii] = X2;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Tiempo:%11.9f\n",ncgt);
  	printf("R[0]=%d / / R[39999]]=%d/\n", R[0], R[39999]);

	return 0;
}