#include <windows.h>

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"


/*
	------------------------------------------------------------------------
	EnumObjects

	The EnumObjects function enumerates the pens or brushes available for the 
	specified device context. This function calls the application-defined 
	callback function once for each available object, supplying data 
	describing that object. EnumObjects continues calling the callback 
	function until the callback function returns zero or until all of the 
	objects have been enumerated. 
	
	int EnumObjects(
		HDC hdc,	// handle to device context 
		int nObjectType,	// object-type identifier 
		GOBJENUMPROC lpObjectFunc,	// pointer to callback function 
		LPARAM lParam 	// pointer to application-supplied data  
	);	
	 
	
	Parameters
	
	* hdc
	
	  Identifies the device context. 
	
	* nObjectType
	
	  Specifies the object type. This parameter can be OBJ_BRUSH or OBJ_PEN. 

	* lpObjectFunc

	  The pointer to the application-defined callback function. For more 
	  information about the callback function, see the EnumObjectsProc 
	  function. 

	* lParam

	  Points to the application-defined data. The data is passed to the 
	  callback function along with the object information. 
	
	
	Return Values
	
	The return value specifies the last value returned by the callback 
	function. Its meaning is user-defined. The return value is -1 if there 
	are too many objects to enumerate. In this case, the callback function is 
	not called.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_EnumObjects (	EIF_INTEGER hdc,
							EIF_INTEGER nObjectType,
							EIF_POINTER lpObjectFunc,
							EIF_INTEGER lParam,
							EIF_POINTER lpCurrent)
{
	ENUMPARAM lparam;
	
	lparam.eif_object	= lpCurrent;
	lparam.eif_enum		= lpObjectFunc;
	lparam.lparam		= lParam;
	
	return (EIF_INTEGER) EnumObjects (	(HDC)				hdc,
										(int)				nObjectType,
										(ENUMOBJECTSPROC)	c_obj_enum_proc,
										(LPARAM)			&lparam);
}

/*
	------------------------------------------------------------------------
	EnumObjectsProc

	The EnumObjectsProc function is an application-defined callback function 
	that processes object data supplied by the EnumObjects function. 
	
	VOID CALLBACK EnumObjectsProc(
		LPVOID lpLogObject,	// pointer to graphic-object structure 
		LPARAM lpData 	// pointer to application-defined data 
	);	
	 
	
	Parameters
	
	* lpLogObject
	
	  Points to a LOGPEN or LOGBRUSH structure describing the attributes of 
	  the object. 
	
	* lpData
	
	  Points to the application-defined data passed by the EnumObjects 
	  function. 
	
	 
	
	Return Values
	
	This function does not return a value. 
	
	Remarks
	
	An application must register this function by passing its address to the 
	EnumObjects function. EnumObjectsProc is a placeholder for the 
	application-defined function name. 
	------------------------------------------------------------------------
*/