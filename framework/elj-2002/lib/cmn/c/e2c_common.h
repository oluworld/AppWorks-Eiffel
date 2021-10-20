#ifndef _E2C_COMMON_H
#define _E2C_COMMON_H

#include <stdio.h>
#include "eiffel_glue.h"

typedef struct _GENERIC
{
	struct _GENERIC* 	next;
}GENERIC;

void append_to_list (void** List, void* Element);
int is_in_list (void** List, void* Element);
void remove_from_list (void** List, void* Element);

#endif