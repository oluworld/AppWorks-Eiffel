indexing
	contents: "WIN32 cursor functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: yes
	
class WIN32_CURSOR_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with cursors. 
--
--	ClipCursor
--	CopyCursor
--	CreateCursor
--	DestroyCursor
--	GetClipCursor
--	GetCursor
--	GetCursorPos
--	LoadCursor
--	LoadCursorFromFile
--	SetCursor
--	SetCursorPos
--	SetSystemCursor
--	ShowCursor
--	------------------------------------------------------------------------

inherit
	WIN32_MACROS

feature {NONE}

	-- ClipCursor

	ClipCursor (a_Rect : POINTER) : BOOLEAN  is
--	ClipCursor (a_Rect : WIN32_RECT) : BOOLEAN  is
			-- The ClipCursor function confines the cursor to a rectangular
			-- area on the screen. If a subsequent cursor position
			-- (set by the SetCursorPos function or the mouse) lies
			-- outside the rectangle, Windows automatically adjusts
			-- the position to keep the cursor inside the rectangular
			-- area. 
		external "C use <windows.h>"
		end -- ClipCursor

	-- CopyCursor

	CopyCursor (a_pcur : POINTER) : POINTER  is
			--  The CopyCursor function copies a cursor. 
		external "C use <windows.h>"
		end -- CopyCursor

	-- CreateCursor

--	The CreateCursor function creates a cursor having the specified size, 
--	bit patterns, and hot spot. 
--	CreateCursor (a_hInst : INTEGER;
--				a_xHotSpot : INTEGER;
--				a_yHotSpot : INTEGER;
--				a_nWidth : INTEGER;
--				a_nHeight : INTEGER;
--				a_pvANDPlane_deref : ARRAY;
--				a_pvXORPlane_deref : ARRAY) : INTEGER  is
--			--  The CreateCursor function creates a cursor having
--			-- the specified size, bit patterns, and hot spot. 
--		do
--			Result := c_CreateCursor (a_hInst, a_xHotSpot, a_yHotSpot, a_nWidth, a_nHeight, a_pvANDPlane_deref, a_pvXORPlane_deref)
--		end -- CreateCursor

	-- DestroyCursor

	DestroyCursor (a_hCursor : POINTER) : BOOLEAN  is
			--  The DestroyCursor function destroys a cursor created
			-- by the CreateCursor function and frees any memory the
			-- cursor occupied. Do not use this function to destroy
			-- a cursor that was not created with the CreateCursor fn.
		external "C use <windows.h>"
		end -- DestroyCursor

	-- GetClipCursor

	GetClipCursor (a_Rect : POINTER) : BOOLEAN  is
--	GetClipCursor (a_Rect : WIN32_RECT) : BOOLEAN  is
			--  The GetClipCursor function retrieves the screen coordinates
			-- of the rectangular area to which the cursor is confined.
		external "C use <windows.h>"
		end -- GetClipCursor

	-- GetCursor

	GetCursor : POINTER  is
			--  The GetCursor function retrieves the handle of the
			-- current cursor. 
		external "C use <windows.h>"
		end -- GetCursor

	-- GetCursorPos

	GetCursorPos (a_Point : POINTER) : BOOLEAN  is
--	GetCursorPos (a_Point : WIN32_POINT) : BOOLEAN  is
			--  The GetCursorPos function retrieves the cursor's position,
			-- in screen coordinates. 
		external "C use <windows.h>"
		end -- GetCursorPos

	-- LoadCursor

	LoadCursor (a_instance: POINTER;
	            a_cursor:   POINTER): POINTER is
			--  The LoadCursor function loads the specified cursor
			-- resource from the executable (.EXE) file associated
			-- with an application instance. 
		external "C use <windows.h>"
		end -- LoadCursor

	-- LoadCursorFromFile

	LoadCursorFromFile (a_FileName : POINTER) : POINTER  is
--	LoadCursorFromFile (a_FileName : STRING) : POINTER  is
			--  The LoadCursorFromFile function creates a cursor based
			-- on data contained in a file. The file is specified
			-- by its name or by a system cursor identifier. The function
			-- returns a handle to the newly created cursor. Files
			-- containing cursor data may be in either cursor (.CUR)
			-- or animated cursor (.ANI) format.

		external "C use <windows.h>"
		end -- LoadCursorFromFile

	-- SetCursor

	SetCursor (a_hcur : POINTER) : POINTER  is
			--  The SetCursor function establishes the cursor shape.
			-- 
		external "C use <windows.h>"
		end -- SetCursor

	-- SetCursorPos

	SetCursorPos (	a_X : INTEGER;
					a_Y : INTEGER) : BOOLEAN  is
			--  The SetCursorPos function moves the cursor to the
			-- specified screen coordinates. If the new coordinates
			-- are not within the screen rectangle set by the most
			-- recent ClipCursor function, Windows automatically adjusts
			-- the coordinates so that the cursor stays within the
			-- rectangle. 
		external "C use <windows.h>"
		end -- SetCursorPos

	-- SetSystemCursor

	SetSystemCursor(a_hCursor 	: POINTER;
					a_dwCursorID: INTEGER) : BOOLEAN  is
			--  The SetSystemCursor function replaces the contents
			-- of the system cursor specified by dwCursorId with the
			-- contents of the cursor specified by hCursor, and then
			-- destroys hCursor. This function lets an application
			-- customize the system cursors.
		external "C use <windows.h>"
		end -- SetSystemCursor

	-- ShowCursor

	ShowCursor (a_bShow : BOOLEAN) : INTEGER  is
			--  The ShowCursor function displays or hides the cursor.
			-- 
		external "C use <windows.h>"
		end -- ShowCursor

feature {NONE}
		
	IDC_ARROW: POINTER is
		once
			Result := MAKEINTRESOURCE(32512)
		end -- IDC_ARROW

	IDC_IBEAM: POINTER is
		once
			Result := MAKEINTRESOURCE(32513)
		end -- IDC_IBEAM
		
	IDC_WAIT: POINTER is
		once
			Result := MAKEINTRESOURCE(32514)
		end -- IDC_WAIT

	IDC_CROSS: POINTER is
		once
			Result := MAKEINTRESOURCE(32515)
		end -- IDC_CROSS

	IDC_UPARROW: POINTER is
		once
			Result := MAKEINTRESOURCE(32516)
		end -- IDC_UPARROW

	IDC_SIZENWSE: POINTER is
		once
			Result := MAKEINTRESOURCE(32642)
		end -- IDC_SIZENWSE

	IDC_SIZENESW: POINTER is
		once
			Result := MAKEINTRESOURCE(32643)
		end -- IDC_SIZENESW

	IDC_SIZEWE: POINTER is
		once
			Result := MAKEINTRESOURCE(32644)
		end -- IDC_SIZEWE

	IDC_SIZENS: POINTER is
		once
			Result := MAKEINTRESOURCE(32645)
		end -- IDC_SIZENS

	IDC_SIZEALL: POINTER is
		once
			Result := MAKEINTRESOURCE(32646)
		end -- IDC_SIZEALL
		
	IDC_NO: POINTER is
		once
			Result := MAKEINTRESOURCE(32648)
		end -- IDC_NO
		
	IDC_HAND : POINTER is
		once
			Result := MAKEINTRESOURCE(32649)
		end -- IDC_HAND

	IDC_APPSTARTING: POINTER is
		once
			Result := MAKEINTRESOURCE(32650)
		end -- IDC_APPSTARTING
		
	IDC_HELP: POINTER is
		once
			Result := MAKEINTRESOURCE(32651)
		end -- IDC_HELP

end -- WIN32_CURSOR_FUNCTIONS