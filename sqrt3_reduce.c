#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <pthread.h>

void* crunch( void* no_data_in){
  long long n;
  double sum = 0;
  for( n=0; n< 40000000; n=n+1)
    sum = sum + sqrt( n );
  sum = sum + (double) rand();
  printf("%f",sum);
  return NULL;
}

int main(){
  int threadcount=10;
  int i;
  int ret;
  pthread_t* threadlist = malloc( sizeof(pthread_t) * threadcount);
  for ( i=0; i<threadcount; i = i+1 ){
    ret = pthread_create( &threadlist[i], NULL, &crunch, NULL);
    if( ret != 0) {
      puts( "Error creating thread");
      exit(1);
   }
  }
  for ( i=0; i<threadcount; i = i+1 ){
    pthread_join( threadlist[i], NULL);
  }
  return 0;
}
