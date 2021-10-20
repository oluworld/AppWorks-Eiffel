#include <windows.h>

#include "e2c_eiffelproc_global.h"
#include "eiffel_glue.h"

/*
	------------------------------------------------------------------------
	EnumFontFamilies

	The EnumFontFamilies function enumerates the fonts in a specified font 
	family that are available on a specified device. This function 
	supersedes the EnumFonts function. 

	int EnumFontFamilies(
		HDC hdc,	// handle to device control 
		LPCTSTR lpszFamily,	// pointer to family-name string 
		FONTENUMPROC lpEnumFontFamProc,	// pointer to callback function 
		LPARAM lParam 	// address of application-supplied data  
	);	
 

	Parameters

	* hdc

	  Identifies the device context. 

	* lpszFamily

	  Points to a null-terminated string that specifies the family name of 
	  the desired fonts. If lpszFamily is NULL, EnumFontFamilies randomly 
	  selects and enumerates one font of each available type family. 

	* lpEnumFontFamProc

	  Specifies the procedure-instance address of the application-defined 
	  callback function. For information about the callback function, see 
	  the EnumFontFamProc function. 

	* lParam

	  Points to application-supplied data. The data is passed to the 
	  callback function along with the font information. 


	Return Values

	If the function succeeds, the return value is the last value returned by 
	the callback function. Its meaning is implementation specific. 

	Remarks

	The EnumFontFamilies function differs from the EnumFonts function in 
	that it retrieves the style names associated with a TrueType font. With 
	EnumFontFamilies, information can be retrieved about unusual font styles 
	(for example, Outline) that could not be enumerated by using the 
	EnumFonts function. Win32-based applications should use EnumFontFamilies 
	instead of EnumFonts. For each font having the typeface name specified 
	by the lpszFamily parameter, the EnumFontFamilies function retrieves 
	information about that font and passes it to the function pointed to by 
	the lpEnumFontFamProc parameter. The application-defined callback 
	function can process the font information as desired. Enumeration 
	continues until there are no more fonts or the callback function returns 
	zero.
 	------------------------------------------------------------------------
*/

EIF_INTEGER c_EnumFontFamilies (EIF_INTEGER hdc,
								EIF_POINTER lpszFamily,
								EIF_POINTER lpEnumFontFamProc,
								EIF_INTEGER lParam,
								EIF_POINTER lpCurrent)
{
	ENUMPARAM enum_struct;
	
	enum_struct.eif_object = lpCurrent;
	enum_struct.eif_enum = lpEnumFontFamProc;
	enum_struct.lparam = lParam;
	
	return (EIF_INTEGER) EnumFontFamilies (	(HDC)			hdc,
											(LPCTSTR)		lpszFamily,
											(FONTENUMPROC)	c_enum_font_family,
											(LPARAM)		&enum_struct);
}

/*
	------------------------------------------------------------------------
	EnumFontFamProc

	The EnumFontFamProc function is an application-defined callback function 
	that retrieves data describing available fonts. 

	int CALLBACK EnumFontFamProc(
		ENUMLOGFONT FAR *lpelf,	// pointer to logical-font data 
		NEWTEXTMETRIC FAR *lpntm,	// pointer to physical-font data 
		int FontType,	// type of font 
		LPARAM lParam 	// address of application-defined data  
	);	
 

	Parameters

	* lpelf

	  Points to an ENUMLOGFONT structure that contains information about the 
	  logical attributes of the font. This structure is locally defined.

	* lpntm

	  Points to a NEWTEXTMETRIC structure that contains information about 
	  the physical attributes of the font, if the font is a TrueType font. 
	  If the font is not a TrueType font, this parameter points to a 
	  TEXTMETRIC structure.

	* FontType

	  Specifies the type of the font. This parameter can be a combination of 
	  the following values: 

	  DEVICE_FONTTYPE RASTER_FONTTYPE TRUETYPE_FONTTYPE

	* lParam

	  Points to the application-defined data passed by the EnumFontFamilies 
	  function. 


	Return Values

	The return value must be a nonzero value to continue enumeration; to 
	stop enumeration, it must return zero. 

	Remarks

	An application must register this callback function by passing its 
	address to the EnumFontFamilies function. The EnumFontFamProc function 
	is a placeholder for the application-defined function name. The AND (&) 
	operator can be used with the RASTER_FONTTYPE, DEVICE_FONTTYPE, and 
	TRUETYPE_FONTTYPE constants to determine the font type. If the 
	RASTER_FONTTYPE bit is set, the font is a raster font. If the 
	TRUETYPE_FONTTYPE bit is set, the font is a TrueType font. If neither 
	bit is set, the font is a vector font. DEVICE_FONTTYPE is set when a 
	device (for example, a laser printer) supports downloading TrueType 
	fonts or when the font is a device-resident font; it is zero if the 
	device is a display adapter, dot-matrix printer, or other raster device. 
	An application can also use DEVICE_FONTTYPE to distinguish graphics 
	device interface (GDI)-supplied raster fonts from device-supplied fonts. 
	GDI can simulate bold, italic, underline, and strikeout attributes for 
	GDI-supplied raster fonts, but not for device-supplied fonts. 
	------------------------------------------------------------------------
*/

/* this is just a placeholder */

/*
	------------------------------------------------------------------------
	EnumFonts

	The EnumFonts function enumerates the fonts available on a specified 
	device. For each font with the specified typeface name, the EnumFonts 
	function retrieves information about that font and passes it to the 
	application-defined callback function. This callback function can 
	process the font information as desired. Enumeration continues until 
	there are no more fonts or the callback function returns zero. 

	This function is provided for compatibility with earlier versions of 
	Microsoft Windows. Win32-based applications should use the 
	EnumFontFamilies function.

	int EnumFonts(
		HDC hdc,	// handle to device context 
		LPCTSTR lpFaceName,	// pointer to font typeface name string 
		FONTENUMPROC lpFontFunc,	// pointer to callback function 
		LPARAM lParam 	// address of application-supplied data 
	);	
 

	Parameters

	* hdc

	  Identifies the device context. 

	* lpFaceName

	  Points to a null-terminated character string that specifies the 
	  typeface name of the desired fonts. If lpFaceName is NULL, EnumFonts 
	  randomly selects and enumerates one font of each available typeface. 

	* lpFontFunc

	  Points to the application-defined callback function. For more 
	  information about the callback function, see the EnumFontsProc 
	  function. 

	* lParam

	  Points to any application-defined data. The data is passed to the 
	  callback function along with the font information. 


	Return Values

	If the function succeeds, the return value is the last value returned by 
	the callback function. Its meaning is defined by the application. 

	Remarks

	Use EnumFontFamilies instead of EnumFonts. The EnumFontFamilies function 
	differs from the EnumFonts function in that it retrieves the style names 
	associated with a TrueType font. With EnumFontFamilies, you can retrieve 
	information about unusual font styles (for example, Outline) that cannot 
	be enumerated using the EnumFonts function.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_EnumFonts (	EIF_INTEGER hdc,
							EIF_POINTER lpFaceName,
							EIF_POINTER lpFontFunc,
							EIF_INTEGER lParam,
							EIF_POINTER lpCurrent)
{
	ENUMPARAM enum_struct;
	
	enum_struct.eif_object = lpCurrent;
	enum_struct.eif_enum = lpFontFunc;
	enum_struct.lparam = lParam;
	
	return (EIF_INTEGER) EnumFonts ((HDC)			hdc,
									(LPCTSTR)		lpFaceName,
									(FONTENUMPROC)	c_enum_font_family,
									(LPARAM)		&enum_struct);
}

/*
	------------------------------------------------------------------------
	EnumFontsProc

	The EnumFontsProc function is an application-defined callback function 
	that processes font data from the EnumFonts function. 

	int CALLBACK EnumFontsProc(
		lplf lplf,	// pointer to logical-font data 
		lptm lptm,	// pointer to physical-font data 
		DWORD dwType,	// font type 
		LPARAM lpData 	// pointer to application-defined data  
	);	
 

	Parameters

	* lplf

	  Points to a LOGFONT structure that contains information about the 
	  logical attributes of the font.

	* lptm

	  Points to a TEXTMETRIC structure that contains information about the 
	  physical attributes of the font.

	* dwType

	  Specifies the type of the font. This parameter can be a combination of 
	  the following values: 

	  DEVICE_FONTTYPE RASTER_FONTTYPE TRUETYPE_FONTTYPE

	* lpData

	  Points to the application-defined data passed by EnumFonts. 


	Return Values

	The return value must be a nonzero value to continue enumeration; to 
	stop enumeration, it must be zero. 

	Remarks

	The AND (&) operator can be used with the RASTER_FONTTYPE and 
	DEVICE_FONTTYPE constants to determine the font type. The 
	RASTER_FONTTYPE bit of the FontType parameter specifies whether the font 
	is a raster or vector font. If the bit is one, the font is a raster 
	font; if zero, it is a vector font. The DEVICE_FONTTYPE bit of FontType 
	specifies whether the font is a device-based or graphics device 
	interface (GDI)-based font. If the bit is one, the font is a device-
	based font; if zero, it is a GDI-based font. 

	If the device is capable of text transformations (scaling, italicizing, 
	and so on) only the base font is enumerated. The user must inquire into 
	the device's text-transformation abilities to determine which additional 
	fonts are available directly from the device. An application must 
	register the EnumFontsProc function by passing its address to the 
	EnumFonts function. EnumFontsProc is a placeholder for the application-
	defined function name. 
	------------------------------------------------------------------------
*/
