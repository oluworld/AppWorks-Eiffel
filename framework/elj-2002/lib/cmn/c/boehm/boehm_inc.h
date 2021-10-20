#ifndef __BOEHM_INC_H
#define __BOEHM_INC_H

#include <gc.h>

#define malloc(n) GC_malloc(n)
#define calloc(m,n)  GC_malloc(m*n)
#define realloc(m,n) GC_realloc(m,n)

#endif
