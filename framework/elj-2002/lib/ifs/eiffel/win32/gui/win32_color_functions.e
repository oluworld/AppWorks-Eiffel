indexing
	contents: "WIN32 color functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_COLOR_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with color. 
--	
--	AnimatePalette
--	CreateHalftonePalette
--	CreatePalette
--	GetColorAdjustment
--	GetNearestColor
--	GetNearestPaletteIndex
--	GetPaletteEntries
--	GetSystemPaletteEntries
--	GetSystemPaletteUse
--	RealizePalette
--	ResizePalette
--	SelectPalette
--	SetColorAdjustment
--	SetPaletteEntries
--	SetSystemPaletteUse
--	UnrealizeObject
--	UpdateColors 
--	------------------------------------------------------------------------

feature {NONE}
	
	AnimatePalette (a_palette:		POINTER;
					a_start_idx:	INTEGER;
					a_count:		INTEGER;
					a_entry_arr:	POINTER): BOOLEAN is
--	AnimatePalette (a_palette:		POINTER;
--					a_start_idx:	INTEGER;
--					a_count:		INTEGER;
--					a_entry_arr:	C_STRUCT_ARRAY[WIN32_PALETTEENTRY]): BOOLEAN is
--	The AnimatePalette function replaces entries in the specified logical 
--	palette. 
		external "C use <windows.h>"
		end -- AnimatePalette
		
	CreateHalftonePalette (a_dc: POINTER): POINTER is
--	The CreateHalftonePalette function creates a halftone palette for the 
--	specified device context. 
		external "C use <windows.h>"
		end -- CreateHalftonePalette
	
	CreatePalette (a_log_palette: POINTER): POINTER is
--	CreatePalette (a_log_palette: WIN32_LOGPALETTE): POINTER is
--	The CreatePalette function creates a logical color palette. 
		external "C use <windows.h>"
		end -- CreatePalette
		
	GetColorAdjustment (a_dc:			POINTER;
						a_color_adj:	POINTER): BOOLEAN is
--	GetColorAdjustment (a_dc:			POINTER;
--						a_color_adj:	WIN32_COLORADJUSTMENT): BOOLEAN is
--	The GetColorAdjustment function retrieves the color adjustment values 
--	for the specified device context. 
		external "C use <windows.h>"
		end -- GetColorAdjustment
		
	GetNearestColor (	a_dc:		POINTER;
						a_color:	INTEGER): INTEGER is
--	The GetNearestColor function returns a color value identifying a color 
--	from the system palette that will be displayed when the specified color 
--	value is used. 
		external "C use <windows.h>"
		end -- GetNearestColor

	GetNearestPaletteIndex (a_palette:	POINTER;
							a_color:	INTEGER): INTEGER is
--	The GetNearestPaletteIndex function retrieves the index for the entry in 
--	the specified logical palette most closely matching a specified color 
--	value. 
		external "C use <windows.h>"
		end -- GetNearestPaletteIndex
	
	GetPaletteEntries (	a_palette:		POINTER;
						a_start:		INTEGER;
						a_count:		INTEGER;
						a_palette_arr:	POINTER): INTEGER is
--	GetPaletteEntries (	a_palette:		POINTER;
--						a_start:		INTEGER;
--						a_count:		INTEGER;
--						a_palette_arr:	C_STRUCT_ARRAY[WIN32_PALETTEENTRY]): INTEGER is
--	The GetPaletteEntries function retrieves a specified range of palette 
--	entries from the given logical palette. 
		external "C use <windows.h>"
		end -- GetPaletteEntries
		
	GetSystemPaletteEntries (	a_dc:			POINTER;
								a_start:		INTEGER;
								a_count:		INTEGER;
								a_palette_arr:	POINTER): INTEGER is
--	GetSystemPaletteEntries (	a_dc:			POINTER;
--								a_start:		INTEGER;
--								a_count:		INTEGER;
--								a_palette_arr:	C_STRUCT_ARRAY[WIN32_PALETTEENTRY]): INTEGER is
--	The GetSystemPaletteEntries function retrieves a range of palette 
--	entries from the system palette that is associated with the specified 
--	device context. 
		external "C use <windows.h>"
		end -- GetSystemPaletteEntries

	GetSystemPaletteUse (a_dc: POINTER): INTEGER is
--	The GetSystemPaletteUse function retrieves the current state of the 
--	system (physical) palette for the specified device context. 
		external "C use <windows.h>"
		end -- GetSystemPaletteUse
		
	RealizePalette (a_dc: POINTER): INTEGER is
--	The RealizePalette function maps palette entries from the current 
--	logical palette to the system palette. 
		external "C use <windows.h>"
		end -- RealizePalette
	
	ResizePalette (	a_palette:	POINTER;
					a_count:	INTEGER): BOOLEAN is
--	The ResizePalette function increases or decreases the size of a logical 
--	palette based on the specified value. 
		external "C use <windows.h>"
		end -- ResizePalette
	
	SelectPalette (	a_dc:			POINTER;
					a_palette:		POINTER;
					a_background:	BOOLEAN): POINTER is
--	The SelectPalette function selects the specified logical palette into a 
--	device context. 
		external "C use <windows.h>"
		end -- SelectPalette
	
	SetColorAdjustment (a_dc:			POINTER;
						a_color_adj:	POINTER): BOOLEAN is
--	SetColorAdjustment (a_dc:			POINTER;
--						a_color_adj:	WIN32_COLORADJUSTMENT): BOOLEAN is
--	The SetColorAdjustment function sets the color adjustment values for a 
--	device context using the specified values. 
		external "C use <windows.h>"
		end -- SetColorAdjustment
		
	SetPaletteEntries (	a_palette:		POINTER;
						a_start:		INTEGER;
						a_count:		INTEGER;
						a_palette_arr:	POINTER): INTEGER is
--	SetPaletteEntries (	a_palette:		POINTER;
--						a_start:		INTEGER;
--						a_count:		INTEGER;
--						a_palette_arr:	C_STRUCT_ARRAY[WIN32_PALETTEENTRY]): INTEGER is
--	The SetPaletteEntries function sets RGB (red, green, blue) color values 
--	and flags in a range of entries in a logical palette. 
		external "C use <windows.h>"
		end -- SetPaletteEntries
		
	SetSystemPaletteUse (	a_dc:		POINTER;
							a_usage:	INTEGER): INTEGER is
--	The SetSystemPaletteUse function allows an application to specify 
--	whether the system palette contains 2 or 20 static colors. The default 
--	system palette contains 20 static colors. (Static colors cannot be 
--	changed when an application realizes a logical palette.) 
		external "C use <windows.h>"
		end -- SetSystemPaletteUse
	
	UnrealizeObject (a_handle: POINTER): BOOLEAN is
--	The UnrealizeObject function resets a logical palette. It directs the 
--	system to realize the palette as though it had not previously been 
--	realized. The next time the application calls the RealizePalette 
--	function for the specified palette, the system completely remaps the 
--	logical palette to the system palette. 
--	
--	If hgdiobj is a brush, UnrealizeObject does nothing, and the function 
--	returns TRUE. Use SetBrushOrgEx to set the origin of a brush. 
		external "C use <windows.h>"
		end -- UnrealizeObject
	
	UpdateColors (a_dc: POINTER): BOOLEAN is
--	The UpdateColors function updates the client area of the specified 
--	device context by remapping the current colors in the client area to the 
--	currently realized logical palette. 
		external "C use <windows.h>"
		end -- UpdateColors
	
end -- WIN32_COLOR_FUNCTIONS