indexing
	contents: "WIN32 device context functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_DEVICE_CONTEXT_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with device contexts. 
--
--	CancelDC
--	ChangeDisplaySettings
--	CreateCompatibleDC
--	CreateDC
--	CreateIC
--	DeleteDC
--	DeleteObject
--	DeviceCapabilities
--	DrawEscape
--	EnumDisplaySettings
--	EnumObjects
--	EnumObjectsProc
--	GetCurrentObject
--	GetDC
--	GetDCEx
--	GetDCOrgEx
--	GetDeviceCaps
--	GetGraphicsMode
--	GetObject
--	GetObjectType
--	GetStockObject
--	ReleaseDC
--	ResetDC
--	RestoreDC
--	SaveDC
--	SelectObject
--	------------------------------------------------------------------------

inherit
	WIN32_DEVICE_CONTEXT_CONSTANTS

feature {NONE}

	CancelDC (a_handle: POINTER): BOOLEAN is
			--	The CancelDC function cancels any pending operation on
			-- the specified device context (DC). 
		external "C use <windows.h>"
		end -- CancelDC

	ChangeDisplaySettings (	a_dev_mode: POINTER;
							a_flag_set:	BIT 32): INTEGER is
--	ChangeDisplaySettings (	a_dev_mode: WIN32_DEVMODE;
--							a_flag_set:	BIT 32): INTEGER is
--	The ChangeDisplaySettings function changes the display settings to the 
--	specified graphics mode. 
		external "C use <windows.h>"
		end -- ChangeDisplaySettings
		
	CreateCompatibleDC (a_handle : POINTER) : POINTER is
--	The CreateCompatibleDC function creates a memory device context (DC) 
--	compatible with the specified device. 
		external "C use <windows.h>"
		end -- CreateCompatibleDC

	CreateDC (	a_driver:	POINTER;
				a_device:	POINTER;
				a_output:	POINTER;
				a_dev_mode:	POINTER): POINTER is
--	CreateDC (	a_driver:	STRING;
--				a_device:	STRING;
--				a_output:	STRING;
--				a_dev_mode:	WIN32_DEVMODE): POINTER is
			--	The CreateDC function creates a device context (DC) for a
			-- device by using the specified name. 
		external "C use <windows.h>"
		end -- CreateDC

	CreateIC (	a_driver:	POINTER;
				a_device:	POINTER;
				a_output:	POINTER;
				a_dev_mode:	POINTER): POINTER is
--	CreateIC (	a_driver:	STRING;
--				a_device:	STRING;
--				a_output:	STRING;
--				a_dev_mode:	WIN32_DEVMODE): POINTER is
			--	The CreateIC function creates an information context for the
			-- specified device. The information context provides a fast
			-- way to get information about the device without creating a
			-- device context. 
		external "C use <windows.h>"
		end -- CreateIC
		
	DeleteDC (a_handle: POINTER): BOOLEAN is
			--	The DeleteDC function deletes the specified device context (DC). 
		external "C use <windows.h>"
		end -- DeleteDC

	DeleteObject (a_handle_object : POINTER) : BOOLEAN is
			--	The DeleteObject function deletes a logical pen, brush,
			-- font, bitmap, region, or palette, freeing all system
			-- resources associated with the object. After the object
			-- is deleted, the specified handle is no longer valid. 
		external "C use <windows.h>"
		end -- DeleteObject

	DeviceCapabilities (a_device:		POINTER;
						a_port:			POINTER;
						a_cpabillity:	INTEGER;
						a_result:		POINTER;
						a_dev_mode:		POINTER): INTEGER is
--	DeviceCapabilities (a_device:		STRING;
--						a_port:			STRING;
--						a_cpabillity:	INTEGER;
--						a_result:		STRING;
--						a_dev_mode:		WIN32_DEVMODE): INTEGER is
			--	The DeviceCapabilities function retrieves the capabilities of
			-- a printer device driver. 
		external "C use <windows.h>"
		end -- DeviceCapabilities
		
	DrawEscape (a_handle:	POINTER;
				a_escape:	INTEGER;
				a_res_len:	INTEGER;
				a_result:	POINTER): INTEGER is
--	DrawEscape (a_handle:	POINTER;
--				a_escape:	INTEGER;
--				a_res_len:	INTEGER;
--				a_result:	STRING): INTEGER is
			--	The DrawEscape function accesses drawing capabilities of a
			-- video display that are not directly available through the
			-- graphics device interface (GDI). 
		external "C use <windows.h>"
		end -- DrawEscape

	EnumDisplaySettings (a_device:	POINTER;
							a_mode:		INTEGER;
							a_dev_mode:	POINTER): BOOLEAN is
--	EnumDisplaySettings (	a_device:	STRING;
--							a_mode:		INTEGER;
--							a_dev_mode:	WIN32_DEVMODE): BOOLEAN is
			--	The EnumDisplaySettings function obtains information about
			-- one of a display device's graphics modes. You can obtain
			-- information for all of a display device's graphics modes by
			-- making a series of calls to this function.
		external "C use <windows.h>"
		end -- EnumDisplaySettings
		
	EnumObjects (a_handle:	POINTER;
					a_type:		INTEGER;
					a_callback:	POINTER;
					a_param:	INTEGER): INTEGER is
			--	The EnumObjects function enumerates the pens or brushes
			-- available for the specified device context. This function
			-- calls the application-defined callback function once for
			-- each available object, supplying data describing that
			-- object. EnumObjects continues calling the callback 
			--	function until the callback function returns zero or until 
			-- all of the objects have been enumerated. 
		do
			Result := c_EnumObjects (	a_handle,
										a_type,
										a_callback,
										a_param,
										current.to_pointer)
		end -- EnumObjects

	GetCurrentObject (a_handle:	POINTER;
						a_type:		INTEGER): POINTER is
			--	The GetCurrentObject function returns the currently
			-- selected object of the specified type. 
		external "C use <windows.h>"
		end -- GetCurrentObject

	GetDC (a_handle : POINTER) : POINTER is
			--	The GetDC function retrieves a handle of a display device
			-- context (DC) for the client area of the specified window.
			-- The display device context can be used in subsequent GDI
			-- functions to draw in the client area of the window. 
		external "C use <windows.h>"
		end -- GetDC

	GetDCEx (a_handle:	POINTER;
				a_region:	POINTER;
				a_flag_set:	BIT 32) : POINTER is
			--	The GetDCEx function retrieves the handle of a display device
			-- (DC) context for the specified window. The display device context
			-- can be used in subsequent GDI functions to draw in the client area. 
		external "C use <windows.h>"
		end -- GetDCEx
		
	GetDCOrgEx (a_dc:		POINTER;
				a_point:	POINTER): BOOLEAN is
--	GetDCOrgEx (a_dc:		POINTER;
--				a_point:	WIN32_POINT): BOOLEAN is
			--	The GetDCOrgEx function obtains the final translation origin for
			-- a specified device context (DC). The final translation origin
			-- specifies an offset that Windows uses to translate device
			-- coordinates into client coordinates (for coordinates in an
			-- application's window). This function supersedes the GetDCOrg fn. 
		external "C use <windows.h>"
		end -- GetDCOrgEx
		
	GetDeviceCaps (a_handle : POINTER;
					a_index  : INTEGER) : BIT 32 is
			--	The GetDeviceCaps function retrieves device-specific information
			-- about a specified device. 
		external "C use <windows.h>"
		end -- GetDeviceCaps

	GetGraphicsMode (a_handle: POINTER): INTEGER is
			--	The GetGraphicsMode function retrieves the current graphics mode
			-- for the specified device context. 
		external "C use <windows.h>"
		end -- GetGraphicsMode

	GetObject (a_hgdiobj   : POINTER;
				a_cbBuffer  : INTEGER;
				a_lpvObject : POINTER) : INTEGER is
			--	The GetObject function obtains information about a specified
			-- graphics object. Depending on the graphics object, the function
			-- places a filled-in BITMAP, DIBSECTION, EXTLOGPEN, LOGBRUSH,
			-- LOGFONT, or LOGPEN structure, or a count of table entries (for
			-- a logical palette), into a specified buffer. 
		external "C use <windows.h>"
		end -- GetObject

	GetObjectType (a_handle: POINTER): INTEGER is
			--	The GetObjectType identifies the type of the specified object. 
		external "C use <windows.h>"
		end -- GetObjectType

	GetStockObject(a_fn_object : INTEGER) : POINTER is
			--	The GetStockObject function retrieves a handle to one of the
			-- predefined stock pens, brushes, fonts, or palettes. 
		external "C use <windows.h>"
		end -- GetStockObject

	ReleaseDC (a_handle : POINTER;
 				a_hdc    : POINTER) : INTEGER is
			--	The ReleaseDC function releases a device context (DC), freeing
			-- it for use by other applications. The effect of the ReleaseDC
			-- function depends on the type of device context. It frees only
			-- common and window device contexts. It has no effect on class
			-- or private device contexts. 
		external "C use <windows.h>"
		end -- ReleaseDC

	RestoreDC (a_handle:	POINTER;
				a_state:	INTEGER): BOOLEAN is
			--	The RestoreDC function restores a device context (DC) to the
			-- specified state. The device context is restored by popping
			-- state information off a stack created by earlier calls to the
			-- SaveDC function. 
		external "C use <windows.h>"
		end -- RestoreDC
	
	SaveDC (a_handle: POINTER): INTEGER is
			--	The SaveDC function saves the current state of the specified
			-- device context (DC) by copying data describing selected objects
			-- and graphic modes (such as the bitmap, brush, palette, font, pen,
			-- region, drawing mode, and mapping mode) to a context stack. 
		external "C use <windows.h>"
		end -- SaveDC

	SelectObject (a_hdc            : POINTER;
					a_gdi_obj_handle : POINTER) : POINTER is
			--	The SelectObject function selects an object into the specified
			-- device context. The new object replaces the previous object of
			-- the same type. 
		external "C use <windows.h>"
		end -- SelectObject

feature {NONE}

	c_EnumObjects (	a_handle:	POINTER;
					a_type:		INTEGER;
					a_callback:	POINTER;
					a_param:	INTEGER;
					a_object:	POINTER): INTEGER is
		external "C"
		end -- c_EnumObjects

end -- WIN32_DEVICE_CONTEXT_FUNCTIONS