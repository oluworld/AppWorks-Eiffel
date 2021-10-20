class WIN32_TOOLBAR_FUNCTIONS


feature {NONE}

	-- CreateMappedBitmap

	CreateMappedBitmap (a_hInstance : POINTER;
						a_idBitmap 	: INTEGER;
						a_wFlags	: INTEGER;
						a_ColorMap	: POINTER;
						a_iNumMaps	: INTEGER) : POINTER is
--	CreateMappedBitmap (a_hInstance : POINTER;
--						a_idBitmap 	: INTEGER;
--						a_wFlags	: INTEGER;
--						a_ColorMap	: WIN32_COLORMAP;
--						a_iNumMaps	: INTEGER) : POINTER is
			-- The CreateMappedBitmap function creates a bitmap for
			-- use in a toolbar. 
		external "C use <windows.h>"
		end -- CreateMappedBitmap

	-- CreateToolbarEx

	CreateToolbarEx(a_hwnd			: POINTER;
					a_ws			: INTEGER;
					a_wID			: INTEGER;
					a_nBitmaps		: INTEGER;
					a_hBMInst		: POINTER;
					a_wBMID			: INTEGER;
					a_Buttons		: POINTER;
					a_iNumButtons	: INTEGER;
					a_dxButton		: INTEGER;
					a_dyButton		: INTEGER;
					a_dxBitmap		: INTEGER;
					a_dyBitmap		: INTEGER;
					a_uStructSize	: INTEGER) : INTEGER is
--	CreateToolbarEx(a_hwnd			: POINTER;
--					a_ws			: INTEGER;
--					a_wID			: INTEGER;
--					a_nBitmaps		: INTEGER;
--					a_hBMInst		: POINTER;
--					a_wBMID			: INTEGER;
--					a_Buttons		: C_STRUCT_ARRAY[WIN32_TBBUTTON];
--					a_iNumButtons	: INTEGER;
--					a_dxButton		: INTEGER;
--					a_dyButton		: INTEGER;
--					a_dxBitmap		: INTEGER;
--					a_dyBitmap		: INTEGER;
--					a_uStructSize	: INTEGER) : INTEGER is
			-- The CreateToolbarEx function creates a toolbar window
			-- and adds the specified buttons to the toolbar.
		external "C use <windows.h>"
		end -- CreateToolbarEx

end -- class WIN32_TOOLBAR_FUNCTIONS