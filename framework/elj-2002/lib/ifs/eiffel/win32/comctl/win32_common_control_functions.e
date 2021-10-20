class WIN32_COMMON_CONTROL_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with common controls.
--
--	GetEffectiveClientRect
--	InitCommonControls
--	InitCommonControlsEx
--	ShowHideMenuCtl
--	------------------------------------------------------------------------

feature {NONE}

	GetEffectiveClientRect (a_window:	POINTER;
							a_rect:		POINTER;
							a_info:		POINTER) is
--	GetEffectiveClientRect (a_window:	POINTER;
--							a_rect:		WIN32_RECT;
--							a_info:		ARRAY[INTEGER]) is
--		The GetEffectiveClientRect function calculates the dimensions of a 
--		rectangle in the client area. This function has limited utility.
		external "C use <windows.h>"
		end -- GetEffectiveClientRect

	-- InitCommonControls

	InitCommonControls   is
			-- InitCommonControls
--		The InitCommonControls function ensures that the common control dynamic-
--		link library (DLL) is loaded.
		external "C use <windows.h>"
		end -- InitCommonControls

	InitCommonControlsEx (a_icc: POINTER) : BOOLEAN is
--	InitCommonControlsEx (a_icc: WIN32_INITCOMMONCONTROLSEX) : BOOLEAN is
			-- InitCommonControlsEx
--		Registers specific common control classes from the common control
--		dynamic-link library (DLL).
		external "C use <windows.h>"
		end -- InitCommonControls

	ShowHideMenuCtl(a_mdi_child : POINTER;
					a_menu      : INTEGER;
					a_info      : POINTER): BOOLEAN is
--	ShowHideMenuCtl(a_mdi_child : POINTER;
--					a_menu      : INTEGER;
--					a_info      : ARRAY[INTEGER]): BOOLEAN is
--		The ShowHideMenuCtl function sets or removes the specified menu item's
--		check-mark attribute, and shows or hides the corresponding control. The
--		function adds a check mark to the specified menu item if it does not
--		have one and then displays the corresponding control. If the menu item
--		already has a check mark, the function removes the check mark and hides
--		the corresponding control.
		external "C use <windows.h>"
		end -- ShowHideMenuCtl

end -- class WIN32_COMMON_CONTROL_FUNCTIONS