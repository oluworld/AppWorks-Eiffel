#ifndef __EIFFEL_GLUE_H
#define __EIFFEL_GLUE_H

/* 
   Eiffel type INTEGER is #2 :
*/
typedef int T2;
#define EIF_INTEGER T2
#define M2 (0)
#define EIF_INTEGER_BITS (CHAR_BIT*sizeof(int))
#define EIF_MINIMUM_INTEGER (INT_MIN)
#define EIF_MAXIMUM_INTEGER (INT_MAX)

/*
  Eiffel type CHARACTER is #3 :
*/
typedef unsigned char T3;
#define EIF_CHARACTER T3
#define M3 (0)
#define EIF_CHARACTER_BITS (CHAR_BIT)
#define EIF_MINIMUM_CHARACTER_CODE (0)
#define EIF_MAXIMUM_CHARACTER_CODE (255)
#define T3code(x) ((T2)(x))
#define T3to_integer(x) ((T2)((char)(x)))
#define T3to_bit(x) (x)

/*
  Eiffel type REAL is #4 :
*/
typedef float T4;
#define EIF_REAL T4
#define M4 (0.0)
#define EIF_REAL_BITS (CHAR_BIT*sizeof(float))
#define EIF_MINIMUM_REAL (-(FLT_MAX))
#define EIF_MAXIMUM_REAL (FLT_MAX)
#define T2toT4(x) ((T4)(x))

/*
  Eiffel type DOUBLE is #5 :
*/
typedef double T5;
#define EIF_DOUBLE T5
#define M5 (0.0)
#define EIF_DOUBLE_BITS (CHAR_BIT*sizeof(double))
#define EIF_MINIMUM_DOUBLE (-(DBL_MAX))
#define EIF_MAXIMUM_DOUBLE (DBL_MAX)
#define T2toT5(x) ((T5)(x))
#define T4toT5(x) ((T5)(x))

/*
  Eiffel type BOOLEAN is #6 :
*/
typedef char T6;
#define EIF_BOOLEAN T6
#define M6 (0)
#define EIF_BOOLEAN_BITS (CHAR_BIT)

/* 
   Eiffel type POINTER is #8 :
*/
typedef void* T8;
#define EIF_POINTER T8
#define M8 (NULL)
#define EIF_POINTER_BITS (CHAR_BIT*sizeof(void*))

#endif