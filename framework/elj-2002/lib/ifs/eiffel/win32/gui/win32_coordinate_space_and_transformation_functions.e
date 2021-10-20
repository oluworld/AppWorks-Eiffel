indexing
	contents: "WIN32 coordinate space and transformation functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_COORDINATE_SPACE_AND_TRANSFORMATION_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with coordinate spaces and
--	transformations. 
--
--	ClientToScreen
--	CombineTransform
--	DPtoLP
--	GetCurrentPositionEx
--	GetGraphicsMode
--	GetMapMode
--	GetViewportExtEx
--	GetViewportOrgEx
--	GetWindowExtEx
--	GetWindowOrgEx
--	GetWorldTransform
--	LPtoDP
--	MapWindowPoints
--	ModifyWorldTransform
--	OffsetViewportOrgEx
--	OffsetWindowOrgEx
--	ScaleViewportExtEx
--	ScaleWindowExtEx
--	ScreenToClient
--	SetGraphicsMode
--	SetMapMode
--	SetViewportExtEx
--	SetViewportOrgEx
--	SetWindowExtEx
--	SetWindowOrgEx
--	SetWorldTransform
--	------------------------------------------------------------------------

inherit
	WIN32_COORDINATE_SPACE_AND_TRANSFORMATION_CONSTANTS

feature {NONE}

	ClientToScreen (a_handle : POINTER;
					a_point  : POINTER) : BOOLEAN is
--	ClientToScreen (a_handle : POINTER;
--					a_point  : WIN32_POINT) : BOOLEAN is
--	The ClientToScreen function converts the client coordinates of a 
--	specified point to screen coordinates. 
		external "C use <windows.h>"
		alias "ClientToScreen"
		end -- ClientToScreen
		
	CombineTransform (	a_trans_form_res:	POINTER;
						a_form_1:			POINTER;
						a_form_2:			POINTER): BOOLEAN is
--	CombineTransform (	a_trans_form_res:	WIN32_XFORM;
--						a_form_1:			WIN32_XFORM;
--						a_form_2:			WIN32_XFORM): BOOLEAN is
--	The CombineTransform function concatenates two world-space to 
--	page-space transformations. 
		external "C use <windows.h>"
		alias "CombineTransform"
		end -- CombineTransform
		
	DPtoLP (a_dc:			POINTER;
			a_point_array:	POINTER;
			a_count:		INTEGER): BOOLEAN is
--	DPtoLP (a_dc:			POINTER;
--			a_point_array:	C_STRUCT_ARRAY[WIN32_POINT];
--			a_count:		INTEGER): BOOLEAN is
--	The DPtoLP function converts device coordinates into logical 
--	coordinates. The conversion depends on the mapping mode of the device 
--	context (DC), the settings of the origins and extents for the window 
--	and viewport, and the world transformation. 
		external "C use <windows.h>"
		alias "DPtoLP"
		end -- DPtoLP
		
	GetCurrentPositionEx (	a_dc:		POINTER;
							a_point:	POINTER): BOOLEAN is
--	GetCurrentPositionEx (	a_dc:		POINTER;
--							a_point:	WIN32_POINT): BOOLEAN is
--	The GetCurrentPositionEx function retrieves the current position in 
--	logical coordinates. 
		external "C use <windows.h>"
		alias "GetCurrentPositionEx"
		end -- GetCurrentPositionEx
		
	GetMapMode (a_dc: POINTER): INTEGER is
--	The GetMapMode function retrieves the current mapping mode. 
		external "C use <windows.h>"
		alias "GetMapMode"
		end -- GetMapMode

	GetViewportExtEx (	a_dc:	POINTER;
						a_size:	POINTER): BOOLEAN is
--	GetViewportExtEx (	a_dc:	POINTER;
--						a_size:	WIN32_SIZE): BOOLEAN is
--	The GetViewportExtEx function retrieves the x-extents and y-extents of 
--	the current viewport for the specified device context. 
		external "C use <windows.h>"
		alias "GetViewportExtEx"
		end -- GetViewportExtEx
		
	GetViewportOrgEx (	a_dc:		POINTER;
						a_point:	POINTER): BOOLEAN is
--	GetViewportOrgEx (	a_dc:		POINTER;
--						a_point:	WIN32_POINT): BOOLEAN is
--	The GetViewportOrgEx function retrieves the x-coordinates and 
--	y-coordinates of the viewport origin for the specified device context. 
		external "C use <windows.h>"
		alias "GetViewportOrgEx"
		end -- GetViewportOrgEx

	GetWindowExtEx (a_dc:	POINTER;
					a_size:	POINTER): BOOLEAN is
--	GetWindowExtEx (a_dc:	POINTER;
--					a_size:	WIN32_SIZE): BOOLEAN is
--	This function retrieves the x-extents and y-extents of the window for 
--	the specified device context. 
		external "C use <windows.h>"
		alias "GetWindowExtEx"
		end -- GetWindowExtEx
		
	GetWindowOrgEx (a_dc:		POINTER;
					a_point:	POINTER): BOOLEAN is
--	GetWindowOrgEx (a_dc:		POINTER;
--					a_point:	WIN32_SIZE): BOOLEAN is
--	The GetWindowOrgEx function retrieves the x-coordinates and 
--	y-coordinates of the window origin for the specified device context. 
		external "C use <windows.h>"
		alias "GetWindowOrgEx"
		end -- GetWindowOrgEx

	GetWorldTransform (	a_dc:		POINTER;
						a_xform:	POINTER): BOOLEAN is
--	GetWorldTransform (	a_dc:		POINTER;
--						a_xform:	WIN32_XFORM): BOOLEAN is
--	The GetWorldTransform function retrieves the current world-space to 
--	page-space transformation. 
		external "C use <windows.h>"
		alias "GetWorldTransform"
		end -- GetWorldTransform
		
	LPtoDP (a_dc:			POINTER;
			a_point_array:	POINTER;
			a_count:		INTEGER): BOOLEAN is
--	LPtoDP (a_dc:			POINTER;
--			a_point_array:	C_STRUCT_ARRAY[WIN32_POINT];
--			a_count:		INTEGER): BOOLEAN is
--	The LPtoDP function converts logical coordinates into device 
--	coordinates. The conversion depends on the mapping mode of the device 
--	context, the settings of the origins and extents for the window and 
--	viewport, and the world transformation. 
		external "C use <windows.h>"
		alias "LPtoDP"
		end -- LPtoDP
		
	MapWindowPoints (	a_wnd_from:		POINTER;
						a_wnd_to:		POINTER;
						a_point_array:	POINTER;
						a_count:		INTEGER): INTEGER is
			--	MapWindowPoints (	a_wnd_from:		POINTER;
			--						a_wnd_to:		POINTER;
			--						a_point_array:	C_STRUCT_ARRAY[WIN32_POINT];
			--						a_count:		INTEGER): INTEGER is
			--	The MapWindowPoints function converts (maps) a set of
			-- points from a coordinate space relative to one window to
			-- a coordinate space relative to another window. 
		external "C use <windows.h>"
		alias "MapWindowPoints"
		end -- MapWindowPoints
										
	MapWindowRect (	a_wnd_from:	POINTER;
					a_wnd_to:	POINTER;
					a_rect:		POINTER): INTEGER is
		do
			Result := MapWindowPoints (	a_wnd_from,
										a_wnd_to,
										a_rect,
										2)
		end -- MapWindowRect
										
	ModifyWorldTransform (	a_dc:		POINTER;
							a_xform:	POINTER;
							a_mode:		INTEGER): BOOLEAN is
--	ModifyWorldTransform (	a_dc:		POINTER;
--							a_xform:	WIN32_XFORM;
--							a_mode:		INTEGER): BOOLEAN is
--	The ModifyWorldTransform function changes the world transformation for 
--	a device context using the specified mode. 
		external "C use <windows.h>"
		alias "ModifyWorldTransform"
		end -- ModifyWorldTransform
		
	OffsetViewportOrgEx (	a_dc:		POINTER;
							a_x_offset:	INTEGER;
							a_y_offset:	INTEGER;
							a_point:	POINTER): BOOLEAN is
--	OffsetViewportOrgEx (	a_dc:		POINTER;
--							a_x_offset:	INTEGER;
--							a_y_offset:	INTEGER;
--							a_point:	WIN32_POINT): BOOLEAN is
--	The OffsetViewportOrgEx function modifies the viewport origin for a 
--	device context using the specified horizontal and vertical offsets. 
		external "C use <windows.h>"
		alias "OffsetViewportOrgEx"
		end -- OffsetViewportOrgEx
		
	OffsetWindowOrgEx (	a_dc:		POINTER;
						a_x_offset:	INTEGER;
						a_y_offset:	INTEGER;
						a_point:	POINTER): BOOLEAN is
--	OffsetWindowOrgEx (	a_dc:		POINTER;
--						a_x_offset:	INTEGER;
--						a_y_offset:	INTEGER;
--						a_point:	WIN32_POINT): BOOLEAN is
--	The OffsetWindowOrgEx function modifies the window origin for a device 
--	context using the specified horizontal and vertical offsets. 
		external "C use <windows.h>"
		alias "OffsetWindowOrgEx"
		end -- OffsetWindowOrgEx
		
	ScaleViewportExtEx (a_dc:		POINTER;
						a_x_num:	INTEGER;
						a_x_denom:	INTEGER;
						a_y_num:	INTEGER;
						a_y_denom:	INTEGER;
						a_size:		POINTER): BOOLEAN is
--	ScaleViewportExtEx (a_dc:		POINTER;
--						a_x_num:	INTEGER;
--						a_x_denom:	INTEGER;
--						a_y_num:	INTEGER;
--						a_y_denom:	INTEGER;
--						a_size:		WIN32_SIZE): BOOLEAN is
--	The ScaleViewportExtEx function modifies the viewport for a device 
--	context (DC) by using the ratios formed by the specified multiplicands 
--	and divisors. 
		external "C use <windows.h>"
		alias "ScaleViewportExtEx"
		end -- ScaleViewportExtEx

	ScaleWindowExtEx (	a_dc:		POINTER;
						a_x_num:	INTEGER;
						a_x_denom:	INTEGER;
						a_y_num:	INTEGER;
						a_y_denom:	INTEGER;
						a_size:		POINTER): BOOLEAN is
--	ScaleWindowExtEx (	a_dc:		POINTER;
--						a_x_num:	INTEGER;
--						a_x_denom:	INTEGER;
--						a_y_num:	INTEGER;
--						a_y_denom:	INTEGER;
--						a_size:		WIN32_SIZE): BOOLEAN is
--	The ScaleWindowExtEx function modifies the window for a device context 
--	using the ratios formed by the specified multiplicands and divisors. 
		external "C use <windows.h>"
		alias "ScaleWindowExtEx"
		end -- ScaleWindowExtEx

	ScreenToClient (a_handle : POINTER;
					a_point  : POINTER) : BOOLEAN is
			--	ScreenToClient (a_handle : POINTER;
			--					a_point  : WIN32_POINT) : BOOLEAN is
			--	The ScreenToClient function converts the screen
			-- coordinates of a specified point on the screen
			-- to client coordinates. 
		external "C use <windows.h>"
		alias "ScreenToClient"
		end -- ScreenToClient
		
	SetGraphicsMode (a_dc, a_mode: POINTER): INTEGER is
			--	The SetGraphicsMode function sets the graphics mode for
			-- the specified device context. 
		external "C use <windows.h>"
		end -- SetGraphicsMode
	
	SetMapMode (a_dc, a_mode: POINTER): INTEGER is
			--	The SetMapMode function sets the mapping mode of the
			-- specified device context. The mapping mode defines the
			-- unit of measure used to transform page-space units into
			-- device-space units, and also defines the 
			--	orientation of the device's x and y axes. 
		external "C use <windows.h>"
		end -- SetMapMode

	SetViewportExtEx (	a_dc:		POINTER;
						a_x_ext:	INTEGER;
						a_y_ext:	INTEGER;
						a_size:		POINTER): BOOLEAN is
			--	SetViewportExtEx (	a_dc:		POINTER;
			--						a_x_ext:	INTEGER;
			--						a_y_ext:	INTEGER;
			--						a_size:		WIN32_SIZE): BOOLEAN is
			--	The SetViewportExtEx function sets the horizontal and
			-- vertical extents of the viewport for a device context
			-- by using the specified values. 
		external "C use <windows.h>"
		end -- SetViewportExtEx
		
	SetWindowExtEx (a_dc:		POINTER;
					a_x_ext:	INTEGER;
					a_y_ext:	INTEGER;
					a_size:		POINTER): BOOLEAN is
--	SetWindowExtEx (a_dc:		POINTER;
--					a_x_ext:	INTEGER;
--					a_y_ext:	INTEGER;
--					a_size:		WIN32_SIZE): BOOLEAN is
--	The SetWindowExtEx function sets the horizontal and vertical extents of 
--	the window for a device context by using the specified values. 
		external "C use <windows.h>"
		end -- SetWindowExtEx
		
	SetViewportOrgEx (	a_dc:		POINTER;
						a_x_ext:	INTEGER;
						a_y_ext:	INTEGER;
						a_point:	POINTER): BOOLEAN is
--	SetViewportOrgEx (	a_dc:		POINTER;
--						a_x_ext:	INTEGER;
--						a_y_ext:	INTEGER;
--						a_point:	WIN32_POINT): BOOLEAN is
--	The SetViewportOrgEx function sets the viewport origin of a device 
--	context by using the specified coordinates. 
		external "C use <windows.h>"
		end -- SetViewportOrgEx
		
	SetWindowOrgEx (a_dc:		POINTER;
					a_x_ext:	INTEGER;
					a_y_ext:	INTEGER;
					a_point:	POINTER): BOOLEAN is
--	SetWindowOrgEx (a_dc:		POINTER;
--					a_x_ext:	INTEGER;
--					a_y_ext:	INTEGER;
--					a_point:	WIN32_POINT): BOOLEAN is
--	The SetWindowOrgEx function sets the window origin of the device 
--	context by using the specified coordinates. 
		external "C use <windows.h>"
		end -- SetWindowOrgEx

	SetWorldTransform (	a_dc:		POINTER;
						a_xform:	POINTER): BOOLEAN is
--	SetWorldTransform (	a_dc:		POINTER;
--						a_xform:	WIN32_XFORM): BOOLEAN is
--	The SetWorldTransform function sets a two-dimensional linear 
--	transformation between world space and page space for the specified 
--	device context. This transformation can be used to scale, rotate, 
--	shear, or translate graphics output. 
		external "C use <windows.h>"
		end -- SetWorldTransform

end -- class  WIN32_COORDINATE_SPACE_AND_TRANSFORMATION_FUNCTIONS