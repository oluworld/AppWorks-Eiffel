#include "root.h"
//#include "eiffel.h"

//extern void* eiffel_root_object;

/* Available Eiffel routines via -cecil:      */
/* void ROOT_set(void* C,T8 a1,T2 a2,T23 a3); */

void ROOT_set(void* C,int a1,int a2,char** a3);

int main (int argc, char **argv)
{
	initialize_eiffel_runtime(argc, argv);

	ROOT_set (eiffel_root_object, (int)getpid(), argc, argv);

	return 0;
}


