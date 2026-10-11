#include <stdbool.h>

int main(){
  unsigned int *LED = (unsigned int *) 0x00060000;
  
  while (true){
    *LED = 1;
    
    for(int i=0; i < 10000000; i++){
      __asm__("nop");
    }

    *LED = 0;

    for(int i=0; i < 10000000; i++){
      __asm__("nop");
    }
    

  }



}
