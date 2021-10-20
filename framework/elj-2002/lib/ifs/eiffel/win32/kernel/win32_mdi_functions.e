class WIN32_MDI_FUNCTIONS

feature {NONE}

	-- CreateMDIWindow

	CreateMDIWindow (a_pClassName : POINTER;
		a_pWindowName : POINTER;
		a_dwStyle : BIT 32;
		a_X : INTEGER;
		a_Y : INTEGER;
		a_nWidth : INTEGER;
		a_nHeight : INTEGER;
		a_hWndParent : POINTER;
		a_hInstance : POINTER;
		a_lParam : INTEGER) : POINTER is
--	CreateMDIWindow (a_pClassName : STRING;
--		a_pWindowName : STRING;
--		a_dwStyle : BIT 32;
--		a_X : INTEGER;
--		a_Y : INTEGER;
--		a_nWidth : INTEGER;
--		a_nHeight : INTEGER;
--		a_hWndParent : POINTER;
--		a_hInstance : POINTER;
--		a_lParam : INTEGER) : POINTER  is
			-- The CreateMDIWindow function creates a multiple document
			-- interface child window. 
		external "C use <windows.h>"
		end -- CreateMDIWindow

	-- DefFrameProc

	DefFrameProc (a_hWnd : POINTER;
		a_hWndMDIClient : POINTER;
		a_uMsg : INTEGER;
		a_wParam : INTEGER;
		a_lParam : INTEGER) : INTEGER is
			-- The DefFrameProc function provides default processing
			-- for any window messages that the window procedure of
			-- a multiple document interface (MDI) frame window does
			-- not process. All window messages that are not explicitly
			-- processed by the window procedure must be passed to
			-- the DefFrameProc function, not the DefWindowProc function.
		external "C use <windows.h>"
		end -- DefFrameProc

	-- DefMDIChildProc

	DefMDIChildProc (a_hWnd : POINTER;
		a_uMsg : INTEGER;
		a_wParam : INTEGER;
		a_lParam : INTEGER) : INTEGER is
			-- The DefMDIChildProc function provides default processing
			-- for any window message that the window procedure of
			-- a multiple document interface (MDI) child window does
			-- not process. A window message not processed by the
			-- window procedure must be passed to the DefMDIChildProc
			-- function, not to the DefWindowProc function. 
		external "C use <windows.h>"
		end -- DefMDIChildProc

	-- TranslateMDISysAccel

	TranslateMDISysAccel (a_hwndClient : POINTER;
		a_pmsg : POINTER) : BOOLEAN is
--	TranslateMDISysAccel (a_hwndClient : POINTER;
--		a_pmsg : WIN32_MSG) : BOOLEAN is
			-- The TranslateMDISysAccel function processes accelerator
			-- keystrokes for System menu commands of the multiple
			-- document interface (MDI) child windows associated with
			-- the specified MDI client window. The function translates
			-- WM_KEYUP and WM_KEYDOWN messages to WM_SYSCOMMAND messages
			-- and sends them to the appropriate MDI child windows.
		external "C use <windows.h>"
		end -- TranslateMDISysAccel

end -- class WIN32_MDI_FUNCTIONS
