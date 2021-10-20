indexing
	contents: "WIN32 API mouse input functions class"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: no
	tested: no

class WIN32_MOUSE_INPUT_FUNCTIONS

feature {NONE}

	-- DragDetect

	DragDetect (a_hwnd : POINTER;
	            a_pt   : POINTER) : BOOLEAN  is
--	DragDetect (a_hwnd : POINTER;
--	            a_pt   : WIN32_POINT) : BOOLEAN  is
			--  The DragDetect function captures the mouse and tracks
			-- its movement until the user releases the left button,
			-- presses the ESC key, or moves the mouse outside the
			-- "drag rectangle" around the specified point. The width
			-- and height of the drag rectangle are specified by the
			-- SM_CXDRAG and SM_CYDRAG values returned by the GetSystemMetrics
		external "C use <windows.h>"
		end -- DragDetect

	-- GetCapture

	GetCapture : POINTER  is
			--  The GetCapture function retrieves the handle of the
			-- window (if any) that has captured the mouse. Only one
			-- window at a time can capture the mouse; this window
			-- receives mouse input whether or not the cursor is within
			-- its borders. 
		external "C use <windows.h>"
		end -- GetCapture

	-- GetDoubleClickTime

	GetDoubleClickTime : INTEGER  is
			--  The GetDoubleClickTime function retrieves the current
			-- double-click time for the mouse. A double-click is
			-- a series of two clicks of the mouse button, the second
			-- occurring within a specified time after the first.
			-- The double-click time is the maximum number of milliseconds
			-- that may occur between the first and second click of
			-- a double-click. 
		external "C use <windows.h>"
		end -- GetDoubleClickTime

	-- mouse_event

	mouse_event(a_dwFlags	: INTEGER;
				a_dx 		: INTEGER;
				a_dy		: INTEGER;
				a_dwData	: INTEGER;
				a_dwExtraInfo : INTEGER) is
			--  The mouse_event function synthesizes mouse motion
			-- and button clicks. 
		external "C use <windows.h>"
		end -- mouse_event

	-- ReleaseCapture

	ReleaseCapture : BOOLEAN  is
			--  The ReleaseCapture function releases the mouse capture
			-- from a window in the current thread and restores normal
			-- mouse input processing. A window that has captured
			-- the mouse receives all mouse input, regardless of the
			-- position of the cursor, except when a mouse button
			-- is clicked while the cursor hot spot is in the window
			-- of another thread. 
		external "C use <windows.h>"
		end -- ReleaseCapture

	-- SetCapture

	SetCapture (a_hWnd : POINTER) : POINTER  is
			--  The SetCapture function sets the mouse capture to
			-- the specified window belonging to the current thread.
			-- Once a window has captured the mouse, all mouse input
			-- is directed to that window, regardless of whether the
			-- cursor is within the borders of that window. Only one
			-- window at a time can capture the mouse. - If the mouse
			-- cursor is over a window created by another thread,
			-- the system will direct mouse input to the specified
			-- window only if a mouse button is down. 
		external "C use <windows.h>"
		end -- SetCapture

	-- SetDoubleClickTime

	SetDoubleClickTime (a_uInterval : INTEGER) : BOOLEAN  is
			--  The SetDoubleClickTime function sets the double-click
			-- time for the mouse. A double-click is a series of two
			-- clicks of a mouse button, the second occurring within
			-- a specified time after the first. The double-click
			-- time is the maximum number of milliseconds that may
			-- occur between the first and second clicks of a double-click.
			-- 
		external "C use <windows.h>"
		end -- SetDoubleClickTime

	-- SwapMouseButton

	SwapMouseButton (a_fSwap : BOOLEAN) : BOOLEAN  is
			--  The SwapMouseButton function reverses or restores
			-- the meaning of the left and right mouse buttons. 
		external "C use <windows.h>"
		end -- SwapMouseButton

	-- TrackMouseEvent

	TrackMouseEvent (a_EventTrack : POINTER) : BOOLEAN  is
--	TrackMouseEvent (a_EventTrack : WIN32_TRACKMOUSEEVENT) : BOOLEAN  is
			--  The TrackMouseEvent function posts messages when the
			-- mouse pointer leaves a window or hovers over a window
			-- for a specified amount of time. [New - Windows NT]
		external "C use <windows.h>"
		end -- TrackMouseEvent

end -- class WIN32_MOUSE_INPUT_FUNCTIONS