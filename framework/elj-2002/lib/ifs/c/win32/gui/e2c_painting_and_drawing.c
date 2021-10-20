#include <windows.h>

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"

/*
	------------------------------------------------------------------------
	DrawState

	[Now Supported on Windows NT]
	
	The DrawState function displays an image and applies a visual effect to 
	indicate a state, such as a disabled or default state.
	
	BOOL WINAPI DrawState(
		HDC hdc,	// handle to device context
		HBRUSH hbr,	// handle to brush
		DRAWSTATEPROC lpOutputFunc,	// pointer to callback function
		LPARAM lData,	// image information
		WPARAM wData,	// more image information
		int x,	// horizontal location of image
		int y,	// vertical location of image
		int cx,	// width of image
		int cy,	// height of image
		UINT fuFlags	// image type and state 
	);	 
	
	Parameters
	
	* hdc
	
	Identifies the device context to draw in.
	
	* hbr
	
	Identifies the brush used to draw the image, if the state specified by 
	the fuFlags parameter is DSS_MONO. This parameter is ignored for other 
	states.
	
	* lpOutputFunc
	
	Points to an application-defined callback function used to render the 
	image. This parameter is required if the image type in fuFlags is 
	DST_COMPLEX. It is optional and can be NULL if the image type is 
	DST_TEXT. For all other image types, this parameter is ignored. For more 
	information about the callback function, see the DrawStateProc function.
	
	* lData
	
	Specifies information about the image. The meaning of this parameter 
	depends on the image type.
	
	* wData
	
	Specifies information about the image. The meaning of this parameter 
	depends on the image type. It is, however, zero extended for use with the 
	DrawStateProc function.
	
	* x
	
	Specifies the horizontal location at which to draw the image.
	
	* y
	
	Specifies the vertical location at which to draw the image.
	
	* cx
	
	Specifies the width of the image, in device units. This parameter is 
	required if the image type is DST_COMPLEX. Otherwise, it can be zero to 
	calculate the width of the image.
	
	* cy
	
	Specifies the height of the image, in device units. This parameter is 
	required if the image type is DST_COMPLEX. Otherwise, it can be zero to 
	calculate the height of the image.
	
	* fuFlags
	
	Specifies the image type and state. The type can be one of these values:
	
	Value (type)       Meaning
	DST_BITMAP	       The image is a bitmap. The low-order word of the 
	                   lData parameter is the bitmap handle. 
	DST_COMPLEX        The image is application defined. To render the 
	                   image, DrawState calls the callback function 
	                   specified by the lpOutputFunc parameter.
	DST_ICON           The image is an icon. The low-order word of lData 
	                   is the icon handle.
	DST_PREFIXTEXT     The image is text that may contain an accelerator 
	                   mnemonic. DrawState interprets the ampersand (&) 
	                   prefix character as a directive to underscore the 
	                   character that follows. The lData parameter 
	                   specifies the address of the string, and the wData 
	                   parameter specifies the length. If wData is zero, 
	                   the string must be null-terminated.
	DST_TEXT           The image is text. The lData parameter specifies 
	                   the address of the string, and the wData parameter 
	                   specifies the length. If wData is zero, the string 
	                   must be null-terminated. 
	
	The state can be one of these values: 
	
	Value (state)      Meaning
	DSS_NORMAL         Draws the image without any modification.
	DSS_UNION          Dithers the image.
	DSS_DISABLED       Embosses the image.
	DSS_MONO           Draws the image using the brush specified by the 
	                   hbr parameter.
	
	For all states except DSS_NORMAL, the image is converted to monochrome 
	before the visual effect is applied.
	
	Return Values
	
	If the function succeeds, the return value is nonzero.
	If the function fails, the return value is zero.
	
	See Also
	
	DrawStateProc 	
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_DrawState (	EIF_INTEGER hdc,
							EIF_INTEGER hbr,
							EIF_POINTER lpOutputFunc,
							EIF_INTEGER lData,
							EIF_INTEGER wData,
							EIF_INTEGER x,
							EIF_INTEGER y,
							EIF_INTEGER cx,
							EIF_INTEGER cy,
							EIF_INTEGER fuFlags,
							EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	LPARAM data;
	DRAWSTATEPROC drawproc;
	
	if (fuFlags == DST_COMPLEX)
	{	
		res_param.eif_object = lpCurrent;
		res_param.eif_enum   = lpOutputFunc;
		res_param.lparam     = lData;
		data                 = (LPARAM) &res_param;
		drawproc             = (DRAWSTATEPROC) c_draw_state_proc;
	}
	else
	{
		data                 = lData;
		drawproc             = (DRAWSTATEPROC) lpOutputFunc;
	}
	
	return (EIF_BOOLEAN) DrawState ((HDC) hdc,
									(HBRUSH) hbr,
									(DRAWSTATEPROC) drawproc,
									(LPARAM) data,
									(WPARAM) wData,
									(int) x,
									(int) y,
									(int) cx,
									(int) cy,
									(UINT) fuFlags);
}	 


/*
	------------------------------------------------------------------------
	GrayString

	The GrayString function draws gray text at the specified location. The 
	function draws the text by copying it into a memory bitmap, graying the 
	bitmap, and then copying the bitmap to the screen. The function grays the 
	text regardless of the selected brush and background. GrayString uses the 
	font currently selected for the specified device context. 

	If the lpOutputFunc parameter is NULL, GDI uses the TextOut function, and 
	the lpData parameter is assumed to be a pointer to the character string 
	to be output. If the characters to be output cannot be handled by TextOut 
	(for example, the string is stored as a bitmap), the application must 
	supply its own output function. 
	
	BOOL GrayString(	
		HDC hDC,	// handle to the device context
		HBRUSH hBrush,	// handle to the brush for graying
		GRAYSTRINGPROC lpOutputFunc,	// pointer to the callback function
		LPARAM lpData,	// pointer to application-defined data
		int nCount,	// number of characters to output
		int X,	// horizontal position
		int Y,	// vertical position
		int nWidth,	// width
		int nHeight 	// height
	); 
	
	Parameters
	
	* hDC
	
	Identifies the device context. 
	
	* hBrush
	
	Identifies the brush to be used for graying. If this parameter is NULL, 
	the text is grayed with the same brush that was used to draw window text. 
	
	* lpOutputFunc
	
	Points to the application-defined function that will draw the string, or, 
	if TextOut is to be used to draw the string, it is a NULL pointer. For 
	details, see the OutputProc callback function. 
	
	* lpData
	
	Specifies a pointer to data to be passed to the output function. If the 
	lpOutputFunc parameter is NULL, lpData must be a pointer to the string to 
	be output. 
	
	* nCount
	
	Specifies the number of characters to be output. If the nCount parameter 
	is zero, GrayString calculates the length of the string (assuming lpData 
	is a pointer to the string). If nCount is -1 and the function pointed to 
	by lpOutputFunc returns FALSE, the image is shown but not grayed. 
	
	* X
	
	Specifies the device x-coordinate of the starting position of the 
	rectangle that encloses the string. 
	
	* Y
	
	Specifies the device y-coordinate of the starting position of the 
	rectangle that encloses the string. 
	
	* nWidth
	
	Specifies the width, in device units, of the rectangle that encloses the 
	string. If this parameter is zero, GrayString calculates the width of the 
	area, assuming lpData is a pointer to the string. 
	
	* nHeight
	
	Specifies the height, in device units, of the rectangle that encloses the 
	string. If this parameter is zero, GrayString calculates the height of 
	the area, assuming lpData is a pointer to the string.  
	
	Return Values
	
	If the string is drawn, the return value is nonzero. If either the 
	TextOut function or the application-defined output function returned 
	zero, or there was insufficient memory to create a memory bitmap for 
	graying, the return value is zero. 
	
	See Also
	
	DrawText, GetSysColor, OutputProc, SetTextColor, TabbedTextOut, TextOut 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_GrayString (	EIF_INTEGER hDC,
							EIF_INTEGER hBrush,
							EIF_POINTER lpOutputFunc,
							EIF_INTEGER lpData,
							EIF_INTEGER nCount,
							EIF_INTEGER X,
							EIF_INTEGER Y,
							EIF_INTEGER nWidth,
							EIF_INTEGER nHeight,
							EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	LPARAM data;
	GRAYSTRINGPROC outputfunc;
	
	if (lpOutputFunc == NULL)
	{
		data       = lpData;
		outputfunc = lpOutputFunc;
	}
	else
	{
		res_param.eif_object = lpCurrent;
		res_param.eif_enum   = lpOutputFunc;
		res_param.lparam     = lpData;

		data                 = (LPARAM) &res_param;
		outputfunc           = (GRAYSTRINGPROC) c_output_proc;
	}

	return (EIF_BOOLEAN) GrayString (	(HDC) hDC,
										(HBRUSH) hBrush,
										(GRAYSTRINGPROC) outputfunc,
										(LPARAM) data,
										(int) nCount,
										(int) X,
										(int) Y,
										(int) nWidth,
										(int) nHeight);
}