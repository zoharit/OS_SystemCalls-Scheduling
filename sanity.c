#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"


int main(){
    int pid=0;
    int first_status=0;
    int second_status=0;
    int third_status=0;
    pid = fork();
    if(pid > 0) {
      first_status=detach(pid); // status = 0
      second_status = detach(pid); // status = -1, because this process has already
        // // detached this child, and it doesn’t have
        // // this child anymore.
      third_status = detach(pid-1); // status = -1, because this process doesn’t
        // have a child with this pid.
         printf(1,"first: %d \n second : %d \n third : %d \n",first_status, second_status, third_status);
    }
   
    exit(0);
}