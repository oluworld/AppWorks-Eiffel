indexing
	contents: "WIN32 brush functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: no

class WIN32_BRUSH_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions that can be used with brushes. 
--	
--	CreateBrushIndirect
--	CreateDIBPatternBrushPt
--	CreateHatchBrush
--	CreatePatternBrush
--	CreateSolidBrush
--	GetBrushOrgEx
--	GetSysColorBrush
--	SetBrushOrgEx 
--	------------------------------------------------------------------------

inherit
	WIN32_BRUSH_CONSTANTS

feature {NONE}
	
	CreateBrushIndirect (a_brush: POINTER): POINTER is
--	CreateBrushIndirect (a_brush: WIN32_LOGBRUSH): POINTER is
--	The CreateBrushIndirect function creates a logical brush that has the 
--	specified style, color, and pattern. 
		external "C use <windows.h>"
		end -- CreateBrushIndirect
		
	CreateDIBPatternBrushPt (	a_pointer:	POINTER;
								a_usage:	INTEGER): POINTER is
--	The CreateDIBPatternBrushPt function creates a logical brush that has 
--	the pattern specified by the device-independent bitmap (DIB). 
		external "C use <windows.h>"
		end -- CreateDIBPatternBrushPt
	
	CreateHatchBrush (	a_style:	INTEGER;
						a_color:	INTEGER): POINTER is
--	The CreateHatchBrush function creates a logical brush that has the 
--	specified hatch pattern and color. 
		external "C use <windows.h>"
		end -- CreateHatchBrush
	
	CreatePatternBrush (a_bitmap: POINTER): POINTER is
--	The CreatePatternBrush function creates a logical brush with the 
--	specified bitmap pattern. The bitmap cannot be a DIB section bitmap, 
--	which is created by the CreateDIBSection function.
		external "C use <windows.h>"
		end -- CreatePatternBrush

	CreateSolidBrush (a_color: INTEGER): POINTER is
--	The CreateSolidBrush function creates a logical brush that has the 
--	specified solid color. 
		external "C use <windows.h>"
		end -- CreateSolidBrush
	
	GetBrushOrgEx (	a_dc:		POINTER;
					a_point:	POINTER): BOOLEAN is
--	GetBrushOrgEx (	a_dc:		POINTER;
--					a_point:	WIN32_POINT): BOOLEAN is
--	The GetBrushOrgEx function retrieves the current brush origin for the 
--	specified device context. This function replaces the GetBrushOrg 
--	function.
		external "C use <windows.h>"
		end -- GetBrushOrgEx
		
	GetSysColorBrush (a_index: INTEGER): POINTER is
--	The GetSysColorBrush function retrieves a handle identifying a logical 
--	brush that corresponds to the specified color index.
		external "C use <windows.h>"
		end -- GetSysColorBrush
	
	SetBrushOrgEx (	a_dc:		POINTER;
					a_x_org:	INTEGER;
					a_y_org:	INTEGER;
					a_point:	POINTER): BOOLEAN is
--	SetBrushOrgEx (	a_dc:		POINTER;
--					a_x_org:	INTEGER;
--					a_y_org:	INTEGER;
--					a_point:	WIN32_POINT): BOOLEAN is
--	The SetBrushOrgEx function sets the brush origin that GDI assigns to the 
--	next brush an application selects into the specified device context. 
		external "C use <windows.h>"
		end -- SetBrushOrgEx
		
end -- class WIN32_BRUSH_FUNCTIONS