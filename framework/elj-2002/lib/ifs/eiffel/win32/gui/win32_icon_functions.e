indexing
	contents: "WIN32 icon functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no
	
class WIN32_ICON_FUNCTIONS

--	------------------------------------------------------------------------
--
--	Following are the functions used with icons. 
--
--	ArrangeIconicWindows  (defined in e2c_windows)
--	CopyIcon
--	CreateIcon
--	CreateIconFromResource
--	CreateIconIndirect
--	DestroyIcon
--	DrawIcon
--	DrawIconEx
--	GetIconInfo
--	IsIconic  (defined in e2c_windos)
--	LoadIcon
--	LookupIconIdFromDirectory
--	OpenIcon (defined in e2c_windos)
--
--	------------------------------------------------------------------------

inherit
	WIN32_ICON_CONSTANTS

feature {NONE}

	CopyIcon (a_icon: POINTER): POINTER is
--	The CopyIcon function copies the specified icon from another module to 
--	the current module. 
		external "C use <windows.h>"
		end -- CopyIcon

	CreateIcon (a_instance	: POINTER;
				a_width		: INTEGER;
				a_height	: INTEGER;
				a_planes	: INTEGER;
				a_bits_pixel: INTEGER;
				a_and_bits	: POINTER;
				a_xor_bits	: POINTER): POINTER is
--	CreateIcon (a_instance	: POINTER;
--				a_width		: INTEGER;
--				a_height	: INTEGER;
--				a_planes	: INTEGER;
--				a_bits_pixel: INTEGER;
--				a_and_bits	: ARRAY[CHARACTER];
--				a_xor_bits	: ARRAY[CHARACTER]): POINTER is
			--	The CreateIcon function creates an icon that has the
			-- specified size, colors, and bit patterns. 
		external "C use <windows.h>"
		end -- CreateIcon

	CreateIconFromResource (a_presbits	: POINTER;
							a_res_size	: INTEGER;
							a_icon		: BOOLEAN;
							a_ver		: INTEGER): POINTER is
			--	The CreateIconFromResource function creates an icon or
			-- cursor from resource bits describing the icon. 
		external "C use <windows.h>"
		end -- CreateIconFromResource

	CreateIconIndirect (a_icon_info: POINTER): POINTER is
--	CreateIconIndirect (a_icon_info: WIN32_ICONINFO): POINTER is
		--	The CreateIconIndirect function creates an icon or cursor
		-- from an ICONINFO structure. 
		external "C use <windows.h>"
		end -- CreateIconIndirect

	DestroyIcon (a_icon: POINTER): BOOLEAN is
			--	The DestroyIcon function destroys an icon and frees any
			-- memory the icon occupied. 
		external "C use <windows.h>"
		end -- DestroyIcon

	DrawIcon (a_hdc	: POINTER;
				a_x		: INTEGER;
				a_y		: INTEGER;
				a_icon	: POINTER): BOOLEAN is
			--	The DrawIcon function draws an icon in the client
			-- area of the window of the specified device context. 
		external "C use <windows.h>"
		end -- DrawIcon

	DrawIconEx (a_hdc				: POINTER;
				a_xleft				: INTEGER;
				a_ytop				: INTEGER;
				a_icon				: POINTER;
				a_xwidth			: INTEGER;
				a_ywidth			: INTEGER;
				a_step_if_ani_cur	: INTEGER;
				a_flicker_free_draw	: POINTER;
				a_flags				: INTEGER): BOOLEAN is
			--	The DrawIconEx function draws an icon or cursor in the
			-- client area of the window of the given device context,
			-- performing the specified raster operations, and stretching
			-- or compressing the icon or cursor as specified. 
		external "C use <windows.h>"
		end -- DrawIconEx

	GetIconInfo (a_icon		: POINTER;
					a_icon_info	: POINTER): BOOLEAN is
--	GetIconInfo (a_icon		: POINTER;
--					a_icon_info	: WIN32_ICONINFO): BOOLEAN is
			--	The GetIconInfo function retrieves information about the
			-- specified icon or cursor. 
		external "C use <windows.h>"
		end -- GetIconInfo

	LoadIcon (a_instance : POINTER;
				a_icon     : POINTER) : POINTER is
			--	The LoadIcon function loads the specified icon resource
			-- from the executable (.EXE) file associated with an
			-- application instance. 
		external "C use <windows.h>"
		end -- LoadIcon

	LookupIconIdFromDirectory (a_presbits	: POINTER;
								a_icon		: BOOLEAN): INTEGER is
			--	The LookupIconIdFromDirectory function searches through
			-- icon or cursor data for the icon or cursor that best fits
			-- the current display device. 
		external "C use <windows.h>"
		end -- LookupIconIdFromDirectory 

end -- class WIN32_ICON_FUNCTIONS