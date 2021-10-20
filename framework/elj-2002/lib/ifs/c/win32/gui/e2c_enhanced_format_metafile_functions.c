#include <windows.h>

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"

/*
	------------------------------------------------------------------------
	EnumEnhMetaFile

	The EnumEnhMetaFile function enumerates the records within an enhanced-
	format metafile by retrieving each record and passing it to the specified 
	callback function. The application-supplied callback function processes 
	each record as required. The enumeration continues until the last record 
	is processed or when the callback function returns zero. 
	
	BOOL EnumEnhMetaFile(	
		HDC hdc,	// handle to device context 
		HENHMETAFILE hemf,	// handle to enhanced metafile 
		ENHMFENUMPROC lpEnhMetaFunc,	// pointer to callback function 
		LPVOID lpData,	// pointer to callback-function data 
		CONST RECT *lpRect 	// pointer to bounding rectangle 
	); 

	Parameters
	
	* hdc
	
	Identifies a device context. This handle is passed to the callback 
	function. 
	
	* hemf
	
	Identifies an enhanced metafile. 
	
	* lpEnhMetaFunc
	
	Points to the application-supplied callback function. For more 
	information, see the EnhMetaFileProc function. 
	
	* lpData
	
	Points to optional callback-function data. 
	
	* lpRect
	
	Points to a RECT structure that specifies the coordinates of the 
	picture's upper-left and lower-right corners. The dimensions of this 
	rectangle are specified in logical units.
	
	Return Values
	
	If the callback function successfully enumerates all the records in the 
	enhanced metafile, the return value is nonzero.
	If the callback function does not successfully enumerate all the records 
	in the enhanced metafile, the return value is zero. 
	
	Remarks
	
	Points along the edge of the rectangle pointed to by the lpRect parameter 
	are included in the picture. If the hdc parameter is NULL, Windows 
	ignores lpRect. If the callback function calls the PlayEnhMetaFileRecord 
	function, hdc must identify a valid device context. Windows uses the 
	device context's transformation and mapping mode to transform the picture 
	displayed by the PlayEnhMetaFileRecord function.  You can use the 
	EnumEnhMetaFile function to embed one enhanced-metafile within another. 
	
	See Also
	
	EnhMetaFileProc, PlayEnhMetaFile, PlayEnhMetaFileRecord, RECT 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumEnhMetaFile (	EIF_INTEGER hdc,
								EIF_INTEGER hemf,
								EIF_POINTER lpEnhMetaFunc,
								EIF_INTEGER lpData,
								EIF_POINTER lpRect,
								EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	
	res_param.eif_object = lpCurrent;
	res_param.lparam     = lpData;
	res_param.eif_enum   = lpEnhMetaFunc;
	
	return (EIF_BOOLEAN) EnumEnhMetaFile (	(HDC) hdc,
											(HENHMETAFILE) hemf,
											(ENHMFENUMPROC) c_enh_meta_file_proc,
											(LPVOID) &res_param,
											(CONST RECT*) lpRect);	
}
