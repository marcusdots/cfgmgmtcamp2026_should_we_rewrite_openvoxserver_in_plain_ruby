#include <math.h>
int main(){
  long long n;
  for( n=0; n< 40000000; n=n+1)
    sqrtf( (float) n );
  return 0;
}
