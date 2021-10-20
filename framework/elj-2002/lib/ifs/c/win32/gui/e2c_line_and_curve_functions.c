#include <windows.h>

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"

/*
	------------------------------------------------------------------------
	LineDDA

	The LineDDA function determines which pixels should be highlighted for 
	a line defined by the specified starting and ending points. 

	BOOL LineDDA(
		int  nXStart,	// x-coordinate of line's starting point 
		int  nYStart,	// y-coordinate of line's starting point 
		int  nXEnd,	// x-coordinate of line's ending point 
		int  nYEnd,	// y-coordinate of line's ending point 
		LINEDDAPROC  lpLineFunc,	// address of application-defined callback function  
		LPARAM  lpData 	// address of application-defined data 
	);	

	Parameters

	* nXStart

	  Specifies the x-coordinate of the line's starting point. 

	* nYStart

	  Specifies the y-coordinate of the line's starting point. 

	* nXEnd

	  Specifies the x-coordinate of the line's ending point. 

	* nYEnd

	  Specifies the y-coordinate of the line's ending point. 

	* lpLineFunc

	  Specifies the address of an application-defined callback function. 
	  For more information, see the LineDDAProc callback function. 

	* lpData

	  Points to the application-defined data. 

	Return Value

	  If the function succeeds, the return value is TRUE.

	  If the function fails, the return value is FALSE. 

	Remarks

	  The LineDDA function passes the coordinates for each point along the 
	  line, except for the line's ending point, to the application-defined 
	  callback function. In addition to passing the coordinates of a point, 
	  this function passes any existing application-defined data. 

	  The coordinates passed to the callback function match pixels on a 
	  video display only if the default transformations and mapping modes 
	  are used. 

	See Also

	  LineDDAProc 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_LineDDA (	EIF_INTEGER  nXStart,
						EIF_INTEGER  nYStart,
						EIF_INTEGER  nXEnd,
						EIF_INTEGER  nYEnd,
						EIF_POINTER  lpLineFunc,
						EIF_INTEGER  lpData,
						EIF_POINTER  lpCurrent)
{
	ENUMPARAM lparam;
	lparam.eif_object	= lpCurrent;
	lparam.eif_enum		= lpLineFunc;
	lparam.lparam		= lpData;
	
	return (EIF_BOOLEAN) LineDDA (	(int)			nXStart,
									(int)			nYStart,
									(int)			nXEnd,
									(int)			nYEnd,
									(LINEDDAPROC)	lpLineFunc,
									(LPARAM)		&lparam);
}

/*
	------------------------------------------------------------------------
	LineDDAProc

	A LineDDAProc function is an application-defined callback function that 
	processes coordinates from the LineDDA function. A value of type 
	LINEDDAPROC is a pointer to such a function. 

	VOID CALLBACK LineDDAProc(
		int  X,	// x-coordinate of point being evaluated  
		int  Y,	// y-coordinate of point being evaluated  
		LPARAM  lpData 	// address of application-defined data 
	);	

	Parameters

	* X

	  Specifies the x-coordinate of the current point. 

	* Y

	  Specifies the y-coordinate of the current point. 

	* lpData

	  Points to the application-defined data. 

	Remarks

	  LineDDAProc is a placeholder for an application-defined function 
	  name. 

	  An application registers a LineDDAProc function by passing its 
	  address to the LineDDA function. 

	See Also

	  LineDDA 
	------------------------------------------------------------------------
*/
