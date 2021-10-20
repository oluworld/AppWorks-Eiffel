/*
indexing
	contents: "system entry point"
	description: "essentially a do-nothing"
*/

#include <windows.h>
#include "root.h"

/*extern void* eiffel_root_object;
*/

/* Available Eiffel routines via -cecil:      */
/* void ROOT_set(void* C,T8 a1,T2 a2,T23 a3); */

void ROOT_set(void* C,int a1,int a2,char** a3);

extern char **__argv;
extern int    __argc;

int _stdcall WinMain(	HINSTANCE 	hInstance, 
						HINSTANCE 	hPrevInstance, 
						LPSTR 		lpszCmdLine, 
						int 		CmdShow)
{
	initialize_eiffel_runtime(__argc, __argv);

	ROOT_set (eiffel_root_object, (int)hInstance, __argc, __argv);

	return 0;
}

/*
 * eof
 */
