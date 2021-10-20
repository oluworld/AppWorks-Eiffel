indexing
	contents: "WIN32 caret functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_CARET_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with carets. 
--
--	CreateCaret
--	DestroyCaret
--	GetCaretBlinkTime
--	GetCaretPos
--	HideCaret
--	SetCaretBlinkTime
--	SetCaretPos
--	ShowCaret
--	------------------------------------------------------------------------

feature {NONE}

	CreateCaret (a_window_handle : POINTER;
				 a_bitmap_handle : POINTER;
				 a_width         : INTEGER;
				 a_height        : INTEGER) : BOOLEAN is
			--	The CreateCaret function creates a new shape for the system
			-- caret and assigns ownership of the caret to the specified window.
			-- The caret shape can be a line, a block, or a bitmap. 
		external "C use <windows.h>"
		end -- CreateCaret

	DestroyCaret : BOOLEAN is
			--	The DestroyCaret function destroys the caret's current shape,
			-- frees the caret from the window, and removes the caret from the
			-- screen. 
		external "C use <windows.h>"
		end -- DestroyCaret

	GetCaretBlinkTime : INTEGER is
			--	The GetCaretBlinkTime function returns the elapsed time, in 
			--	milliseconds, required to invert the caret's pixels. 
		external "C use <windows.h>"
		end -- GetCaretBlinkTime

	GetCaretPos (point : POINTER) : BOOLEAN is
			--	GetCaretPos (point : WIN32_POINT) : BOOLEAN is
			--	The GetCaretPos function copies the caret's position, in client 
			--	coordinates, to the specified POINT structure. 
		external "C use <windows.h>"
		end -- GetCaretPos

	HideCaret (a_handle : POINTER) : BOOLEAN is
			--	The HideCaret function removes the caret from the screen.
			-- Hiding a caret does not destroy its current shape or
			-- invalidate the insertion point. 
		external "C use <windows.h>"
		end -- HideCaret

	SetCaretBlinkTime (a_milli_secs : INTEGER) : BOOLEAN is
			--	The SetCaretBlinkTime function sets the caret blink time
			-- to the specified number of milliseconds. The blink time
			-- is the elapsed time, in milliseconds, required to invert
			-- the caret's pixels. 
		external "C use <windows.h>"
		end -- SetCaretBlinkTime

	SetCaretPos (a_x : INTEGER;
	 			 a_y : INTEGER) : BOOLEAN is
			--	The SetCaretPos function moves the caret to the specified
			-- coordinates.  If the window that owns the caret was created
			-- with the CS_OWNDC class style, then the specified coordinates
			-- are subject to the mapping mode of the device context
			-- associated with that window. 
	 	external "C use <windows.h>"
		end -- SetCaretPos

	ShowCaret (a_handle : POINTER) : BOOLEAN is
			--	The ShowCaret function makes the caret visible on the
			-- screen at the caret's current position. When the caret
			-- becomes visible, it begins flashing automatically. 
		external "C use <windows.h>"
		end -- ShowCaret

end -- class WIN32_CARET_FUNCTIONS