#include "types.h"
#include "stat.h"
#include "user.h"


int main ( int argc, char **argv ) {
    //check the we got the policy number
    if(argc>0){
         policy(atoi(argv[1]));
    }
    else{
        printf(1,"ERROR! we didnt get any policy number- please try again");
    }
exit(0);
}
