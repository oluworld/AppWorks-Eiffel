class WIN32_ACCESSIBILITY_FUNCTIONS

feature {NONE}

	-- GetSystemMetrics

	GetSystemMetrics (a_nIndex : INTEGER) : INTEGER  is
			-- The GetSystemMetrics function retrieves various system
			-- metrics and system configuration settings. System metrics
			-- are the dimensions (widths and heights) of Windows
			-- display elements. All dimensions retrieved by GetSystemMetrics
			-- are in pixels. 
		external "C use <windows.h>"
		end -- GetSystemMetrics

	-- SystemParametersInfo

	SystemParametersInfo (a_uiAction : INTEGER;
		a_uiParam : INTEGER;
		a_pvParam : POINTER;
		a_fWinIni : INTEGER) : BOOLEAN  is
			-- The SystemParametersInfo function queries or sets
			-- systemwide parameters. This function can also update
			-- the user profile while setting a parameter. 
		require
			not_void_a_pvParam : a_pvParam /= Void
		external "C use <windows.h>"
		end -- SystemParametersInfo

end -- class WIN32_ACCESSIBILITY_FUNCTIONS