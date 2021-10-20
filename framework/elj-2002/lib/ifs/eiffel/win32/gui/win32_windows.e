indexing
	contents: "WIN32 window functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: yes

class WIN32_WINDOWS
	
--	------------------------------------------------------------------------
--	Following are the functions to create and manage windows. 
--
--	AdjustWindowRect
--	AdjustWindowRectEx
--	AnyPopup
--	ArrangeIconicWindows
--	BeginDeferWindowPos
--	BringWindowToTop
--	CascadeWindows
--	ChildWindowFromPoint
--	ChildWindowFromPointEx
--	CloseWindow
--	CreateWindow
--	CreateWindowEx
--	DeferWindowPos
--	DestroyWindow
--	EnableWindow
--	EndDeferWindowPos
--	EnumChildProc
--	EnumChildWindows
--	EnumThreadWindows
--	EnumThreadWndProc
--	EnumWindows
--	EnumWindowsProc
--	FindWindow
--	FindWindowEx
--	GetClientRect
--	GetDesktopWindow
--	GetForegroundWindow
--	GetLastActivePopup
--	GetNextWindow
--	GetParent
--	GetTopWindow
--	GetWindow
--	GetWindowPlacement
--	GetWindowRect
--	GetWindowText
--	GetWindowTextLength
--	GetWindowThreadProcessId
--	IsChild
--	IsWindow
--	IsWindowUnicode
--	IsWindowVisible
--	IsZoomed
--	MoveWindow
--	SetForegroundWindow
--	SetParent
--	SetWindowLong
--	SetWindowPlacement
--	SetWindowPos
--	SetWindowText
--	ShowOwnedPopups
--	ShowWindow
--	WindowFromPoint
--	WinMain
--	------------------------------------------------------------------------

inherit
	WIN32_WINDOW_CONSTANTS

feature {NONE}

	AdjustWindowRect (a_rect: POINTER; a_style: BIT 32; a_menu: BOOLEAN): BOOLEAN is
			--	The AdjustWindowRect function calculates the required
			-- size of the window rectangle based on the desired
			-- client-rectangle size. The window rectangle can then be
			-- passed to the CreateWindowEx function to create a window
			-- whose client area is the desired size. 
		external "C use <windows.h>"
		end -- AdjustWindowRect

	AdjustWindowRectEx (a_rect: POINTER;
	   a_style: BIT 32;
	   a_menu: BOOLEAN;
	   a_ex_style: BIT 32): BOOLEAN is
			--	The AdjustWindowRectEx function calculates the required size
			-- of the rectangle of a window with extended style based on the
			-- desired client-rectangle size. The window rectangle can then
			-- be passed to the CreateWindowEx function to create a window
			-- whose client area is the desired size. 
		external "C use <windows.h>"
		end -- AdjustWindowRectEx

	AnyPopup: BOOLEAN is
			--	The AnyPopup function indicates whether an owned, visible,
			-- top-level pop-up, or overlapped window exists on the screen.
			-- The function searches the entire Windows screen, not just the
			-- calling application's client area. 
		external "C use <windows.h>"
		end -- AnyPopup
	
	ArrangeIconicWindows (a_window: POINTER): INTEGER is
			--	The ArrangeIconicWindows function arranges all the minimized
			-- (iconic) child windows of the specified parent window. 
		external "C use <windows.h>"
		end -- ArrangeIconicWindows

	BeginDeferWindowPos (a_num_windows: INTEGER): INTEGER is
			--	The BeginDeferWindowPos function allocates memory for a
			-- multiple-window - position structure and returns the handle
			-- to the structure. 
		external "C use <windows.h>"
		end -- BeginDeferWindowPos

	BringWindowToTop (a_window: POINTER): BOOLEAN is
			--	The BringWindowToTop function brings the specified window to
			-- the top of the Z order. If the window is a top-level window,
			-- it is activated. If the window is a child window, the top-level
			-- parent window associated with the child window is activated. 
		external "C use <windows.h>"
		end -- BringWindowToTop

	CascadeWindows (a_parent:	POINTER;
					a_flag:		INTEGER;
					a_rect:		POINTER;
					a_count:	INTEGER;
					a_childs:	POINTER): INTEGER is
			--	The CascadeWindows function cascades the specified windows or
			-- the child windows of the specified parent window.
		external "C use <windows.h>"
		end -- CascadeWindows

	ChildWindowFromPoint (a_parent_wnd: POINTER;
	   a_point: POINTER): POINTER is
			--	The ChildWindowFromPoint function determines which, if any,
			-- of the child windows belonging to a parent window contains
			-- the specified point. 
		external "C use <windows.h>"
		end -- ChildWindowFromPoint

	ChildWindowFromPointEx (a_parent_wnd: POINTER;
	   a_point: POINTER;
	   a_flags: BIT 32): POINTER is
			--	The ChildWindowFromPointEx function determines which, if any,
			-- of the child windows belonging to the specified parent window
			-- contains the specified point. The function can ignore invisible,
			-- disabled, and transparent child windows.
		external "C use <windows.h>"
		end -- ChildWindowFromPointEx

	CloseWindow (a_window: POINTER): BOOLEAN is
			--	The CloseWindow function minimizes (but does not destroy) the
			-- specified window. 
		external "C use <windows.h>"
		end -- CloseWindow

	CreateWindow (a_class_name  	: POINTER;
					  a_window_name : POINTER;
					  a_style       : BIT 32;
					  a_x           : INTEGER;
					  a_y           : INTEGER;
					  a_width       : INTEGER;
					  a_height      : INTEGER;
					  a_wnd_handle  : POINTER;
					  a_menu        : POINTER;
					  a_h_instance  : POINTER;
					  a_param_ptr   : POINTER) : POINTER is
			--	The CreateWindow function creates an overlapped, pop-up, or
			-- child window. It specifies the window class, window title,
			-- window style, and (optionally) the initial position and size
			-- of the window. The function also specifies the window's parent
			-- or owner, if any, and the window's menu.
		external "C use <windows.h>"
		end -- CreateWindow

	CreateWindowEx (a_ex_style	  :	BIT 32;
					a_class_name  : POINTER;
					a_window_name : POINTER;
					a_style       : BIT 32;
					a_x           : INTEGER;
					a_y           : INTEGER;
					a_width       : INTEGER;
					a_height      : INTEGER;
					a_wnd_handle  : POINTER;
					a_menu        : POINTER;
					a_h_instance  : POINTER;
					a_param_ptr   : POINTER) : POINTER is
			--	The CreateWindowEx function creates an overlapped, pop-up, or
			-- child window with an extended style; otherwise, this function
			-- is identical to the CreateWindow function. For more information
			-- about creating a window and for full descriptions of the other
			-- parameters of CreateWindowEx, see CreateWindow. 
		external "C use <windows.h>"
		end -- CreateWindowEx

	DeferWindowPos (a_win_pos_info:	POINTER;
					a_window:		POINTER;
					a_window_after:	POINTER;
					a_x:			INTEGER;
					a_y:			INTEGER;
					a_width:		INTEGER;
					a_height:		INTEGER
					a_flags:		BIT 32): POINTER is
			--	The DeferWindowPos function updates the specified
			-- multiple-window - position structure for the specified
			-- window. The function then returns the handle to the
			-- updated structure. The EndDeferWindowPos function uses
			-- the information in this structure to change the position
			-- and size of a number of windows simultaneously. The
			-- BeginDeferWindowPos function creates the structure. 
		external "C use <windows.h>"
		end -- DeferWindowPos

	DestroyWindow (a_hwnd: POINTER): BOOLEAN is
			--	The DestroyWindow function destroys the specified window. The
			-- function sends WM_DESTROY and WM_NCDESTROY messages to the window
			-- to deactivate it and remove the keyboard focus from it. The
			-- function also destroys the window's menu, flushes the thread
			-- message queue, destroys timers, removes clipboard ownership,
			-- and breaks the clipboard viewer chain (if the window is at the
			-- top of the viewer chain). 
			--
			--	If the specified window is a parent or owner window,
			-- DestroyWindow automatically destroys the associated child or
			-- owned windows when it destroys the parent or owner window. The
			-- function first destroys child or owned windows, and then it
			-- destroys the parent or owner window. 
			--
			--	DestroyWindow also destroys modeless dialog boxes created by
			-- the CreateDialog function. 
		external "C use <windows.h>"
		end -- DestroyWindow

	EnableWindow (a_window: POINTER;
	   enable_it: BOOLEAN): BOOLEAN is
			--	The EnableWindow function enables or disables mouse and
			-- keyboard input to the specified window or control. When
			-- input is disabled, the window does not receive input such
			-- as mouse clicks and key presses. When input is enabled,
			-- the window receives all input. 
		external "C use <windows.h>"
		end -- EnableWindow

	EndDeferWindowPos (a_pos_handle: POINTER): BOOLEAN is
			--	The EndDeferWindowPos function simultaneously updates the
			-- position and size of one or more windows in a single
			-- screen-refreshing cycle. 
		external "C use <windows.h>"
		end -- EndDeferWindowPos

	EnumChildWindows (a_parent: POINTER;
	   a_enum_func: POINTER;
	   a_param: POINTER): BOOLEAN is
			--	The EnumChildWindows function enumerates the child windows
			-- that belong to the specified parent window by passing the
			-- handle of each child window, in turn, to an application-defined
			-- callback function. EnumChildWindows continues until the last
			-- child window is enumerated or the callback function returns
			-- FALSE. 
		do
			Result := c_EnumChildWindows(a_parent, Current.to_pointer, a_enum_func, a_param)
		end -- EnumChildWindows

	EnumThreadWindows (a_thread_id: INTEGER;
	   a_enum_func: POINTER;
	   a_param: POINTER): BOOLEAN is
			--	The EnumThreadWindows function enumerates all nonchild
			-- windows associated with a thread by passing the handle
			-- of each window, in turn, to an application-defined
			-- callback function. EnumThreadWindows continues until
			-- the last window is enumerated or the callback function 
			--	returns FALSE. To enumerate child windows of a
			-- particular window, use the EnumChildWindows function.
			-- This function supersedes the EnumTaskWindows function. 
		do
			Result := c_EnumThreadWindows(a_thread_id, Current.to_pointer, a_enum_func, a_param)
		end -- EnumThreadWindows

	EnumWindows (a_enum_func: POINTER;
	   a_param: POINTER): BOOLEAN is
			--	The EnumWindows function enumerates all top-level windows
			-- on the screen by passing the handle of each window, in
			-- turn, to an application-defined callback function.
			-- EnumWindows continues until the last top-level window is
			-- enumerated or the callback function returns FALSE. 
		do
			Result := c_EnumWindows(Current.to_pointer, a_enum_func, a_param)
		end -- EnumWindows

	FindWindow (a_class_name: POINTER;
	   a_window_name: POINTER): POINTER is
			--	The FindWindow function retrieves the handle to the
			-- top-level window whose class name and window name
			-- match the specified strings. This function does not
			-- search child windows. 
		external "C use <windows.h>"
		end -- FindWindow

	FindWindowEx (a_parent:		POINTER;
					a_child_after:	POINTER;
					a_class_name:	POINTER;
					a_window_name:	POINTER): POINTER is
			--	The FindWindowEx function retrieves the handle to a
			-- window whose class name and window name match the
			-- specified strings. The function searches child windows,
			-- beginning with the one following the given child window.
		external "C use <windows.h>"
		end -- FindWindowEx

	GetClientRect (a_window: POINTER;
	   a_rect: POINTER): BOOLEAN is
			--	The GetClientRect function retrieves the coordinates
			-- of a window's client area. The client coordinates
			-- specify the upper-left and lower-right corners of the
			-- client area. Because client coordinates are relative
			-- to the upper-left corner on a window's client area, the
			-- coordinates of the upper-left corner are (0,0). 
		external "C use <windows.h>"
		end -- GetClientRect

	GetDesktopWindow: POINTER is
			--	The GetDesktopWindow function returns the handle of the
			-- Windows desktop window. The desktop window covers the
			-- entire screen. The desktop window is the area on top
			-- of which all icons and other windows are painted. 
		external "C use <windows.h>"
		end -- GetDesktopWindow

	GetForegroundWindow: POINTER is
			--	The GetForegroundWindow function returns the handle of the
			-- foreground window (the window with which the user is
			-- currently working). The system assigns a slightly higher
			-- priority to the thread that creates the foreground window
			-- than it does to other threads. 
		external "C use <windows.h>"
		end -- GetForegroundWindow

	GetLastActivePopup (a_owner: POINTER): POINTER is
			--	The GetLastActivePopup function determines which pop-up
			-- window owned by the specified window was most recently
			-- active. 
		external "C use <windows.h>"
		end -- GetLastActivePopup

	GetNextWindow (a_window: POINTER;
	   a_cmd: INTEGER): POINTER is
			--	The GetNextWindow function retrieves the handle of the
			-- next or previous window in the Z order. The next window
			-- is below the specified window; the previous window is
			-- above. If the specified window is a topmost window, the
			-- function retrieves the handle of the next (or previous) 
			--	topmost window. If the specified window is a top-level
			-- window, the function retrieves the handle of the next
			-- (or previous) top-level window. If the specified window
			-- is a a child window, the function searches for a handle
			-- of the next (or previous) child window. 
		external "C use <windows.h>"
		end -- GetNextWindow

	GetParent (a_window: POINTER): POINTER is
			--	The GetParent function retrieves the handle of the
			-- specified child window's parent window. 
		external "C use <windows.h>"
		end -- GetParent

	GetTopWindow (a_parent: POINTER): POINTER is
			--	The GetTopWindow function examines the Z order of the
			-- child windows associated with the specified parent window
			-- and retrieves the handle of the child window at the top
			-- of the Z order. 
		external "C"
		end -- GetTopWindow

	GetWindow (a_root: POINTER;
	   a_cmd: INTEGER): POINTER is
			--	The GetWindow function retrieves the handle of a window
			-- that has the specified relationship (Z order or owner)
			-- to the specified window. 
		external "C use <windows.h>"
		end -- GetWindow

	GetWindowPlacement (a_window: POINTER;
	   a_data: POINTER): BOOLEAN is
			--	The GetWindowPlacement function retrieves the show state
			-- and the restored, minimized, and maximized positions of
			-- the specified window. 
		external "C use <windows.h>"
		end -- GetWindowPlacement

	GetWindowRect (a_window: POINTER;
	   a_rect: POINTER): BOOLEAN is
			--	The GetWindowRect function retrieves the dimensions of
			-- the bounding rectangle of the specified window. The
			-- dimensions are given in screen coordinates that are
			-- relative to the upper-left corner of the screen. 
		external "C use <windows.h>"
		end -- GetWindowRect

	GetWindowText (a_window: POINTER; a_buffer: POINTER; a_buf_size: INTEGER): INTEGER is
			--	The GetWindowText function copies the text of the
			-- specified window's title bar (if it has one) into
			-- a buffer. If the specified window is a control, the
			-- text of the control is copied. 
		external "C use <windows.h>"
		end -- GetWindowText

	GetWindowTextLength (a_window: POINTER): INTEGER is
			--	The GetWindowTextLength function retrieves the length,
			-- in characters, of the specified window's title bar text
			-- (if the window has a title bar). If the specified window
			-- is a control, the function retrieves the length of the
			-- text within the control. 
		external "C use <windows.h>"
		end -- GetWindowTextLength

	GetWindowThreadProcessId (a_window: POINTER;
	   a_process_id: POINTER): INTEGER is
			--	The GetWindowThreadProcessId function retrieves the
			-- identifier of the thread that created the specified
			-- window and, optionally, the identifier of the process
			-- that created the window. This function supersedes the
			-- GetWindowTask function. 
		external "C use <windows.h>"
		end -- GetWindowThreadProcessId

	IsChild (a_parent: POINTER;
	   a_window: POINTER): BOOLEAN is
			--	The IsChild function tests whether a window is a child
			-- window or descendant window of a specified parent window.
			-- A child window is the direct descendant of a specified
			-- parent window if that parent window is in the chain of
			-- parent windows; the chain of parent windows leads from
			-- the original overlapped or pop-up window to the child window. 
		external "C use <windows.h>"
		end -- IsChild

	IsIconic (a_window: POINTER): BOOLEAN is
			--	The IsIconic function determines whether the specified
			-- window is minimized (iconic). 
		external "C use <windows.h>"
		end -- IsIconic

	IsWindow (a_window: POINTER): BOOLEAN is
			--	The IsWindow function determines whether the specified
			-- window handle identifies an existing window. 
		external "C use <windows.h>"
		end -- IsWindow

	IsWindowUnicode (a_window: POINTER): BOOLEAN is
			--	The IsWindowUnicode function determines whether the
			-- specified window is a native Unicode window. 
		external "C use <windows.h>"
		end -- IsWindowUnicode

	IsWindowVisible (a_window: POINTER): BOOLEAN is
			--	The IsWindowVisible function retrieves the visibility
			-- state of the specified window. 
		external "C use <windows.h>"
		end -- IsWindowVisible

	IsZoomed (a_window: POINTER): BOOLEAN is
			--	The IsZoomed function determines whether a window is
			-- maximized. 
		external "C use <windows.h>"
		end -- IsZoomed

	MoveWindow (a_window     : POINTER;
		         a_x          : INTEGER;
		         a_y          : INTEGER;
		         a_width      : INTEGER;
		         a_height     : INTEGER;
		         a_do_repaint : BOOLEAN): BOOLEAN is
			--	The MoveWindow function changes the position and dimensions
			-- of the specified window. For a top-level window, the position
			-- and dimension are relative to the upper-left corner of the
			-- screen. For a child window, they are relative to the
			-- upper-left corner of the parent window's client area. 
		external "C use <windows.h>"
		end -- MoveWindow

	OpenIcon (a_window: POINTER): BOOLEAN is
			--	The OpenIcon function restores a minimized (iconic) window
			-- to its previous size and position; it then activates the
			-- window. 
		external "C use <windows.h>"
		end -- OpenIcon

	SetForegroundWindow (a_window: POINTER): BOOLEAN is
			--	The SetForegroundWindow function puts the thread that
			-- created the specified window into the foreground and
			-- activates the window. Keyboard input is directed to
			-- the window, and various visual cues are changed for
			-- the user. 
		external "C use <windows.h>"
		end -- SetForegroundWindow

	SetParent (a_window: POINTER; a_new_parent: POINTER): POINTER is
			--	The SetParent function changes the parent window of the
			-- specified child window. 
		external "C use <windows.h>"
		end -- SetParent

	SetWindowLong (a_window: POINTER; a_index: INTEGER; a_value: INTEGER): INTEGER is
			--	The SetWindowLong function changes an attribute of the
			-- specified window. The function also sets a 32-bit (long)
			-- value at the specified offset into the extra window memory
			-- of a window. 
		external "C use <windows.h>"
		end -- SetWindowLong

	SetWindowPlacement (a_window: POINTER; a_place: POINTER): BOOLEAN is
			--	The SetWindowPlacement function sets the show state and the
			-- restored, minimized, and maximized positions of the specified
			-- window. 
		external "C use <windows.h>"
		end -- SetWindowPlacement

	SetWindowPos (a_window:		POINTER;
					a_window_after:	POINTER;
					a_x:			INTEGER;
					a_y:			INTEGER;
					a_cx:			INTEGER;
					a_cy:			INTEGER;
					a_flags:		BIT 32): BOOLEAN is
			--	The SetWindowPos function changes the size, position, and
			-- Z order of a child, pop-up, or top-level window. Child,
			-- pop-up, and top-level windows are ordered according to
			-- their appearance on the screen. The topmost window receives
			-- the highest rank and is the first window in the Z order. 
		external "C use <windows.h>"
		end -- SetWindowPos

	SetWindowText (a_window: POINTER;
	   a_text: POINTER): BOOLEAN is
			--	The SetWindowText function changes the text of the specified
			-- window's title bar (if it has one). If the specified window
			-- is a control, the text of the control is changed. 
		external "C use <windows.h>"
		end -- SetWindowText

	ShowOwnedPopups (a_window: POINTER;
	   do_show: BOOLEAN): BOOLEAN is
			--	The ShowOwnedPopups function shows or hides all pop-up
			-- windows owned by the specified window. 
		external "C use <windows.h>"
		end -- ShowOwnedPopups

	ShowWindow (a_hwnd     : POINTER;
	   a_cmd_show : INTEGER) : BOOLEAN is
			--	The ShowWindow function sets the specified window's show state. 
		external "C use <windows.h>"
		end -- ShowWindow

	ShowWindowAsync (a_hwnd     : POINTER;
	   a_cmd_show : INTEGER) : BOOLEAN is
			--	The ShowWindowAsync function sets the show state of a window
			-- created by a different thread. 
		external "C use <windows.h>"
		end -- ShowWindowAsync

	TileWindows (a_parent:		POINTER;
					do_how:			INTEGER;
					a_rect:			POINTER;
					a_child_count:	INTEGER;
					a_child_list:	POINTER): INTEGER is
			--	The TileWindows function tiles the specified windows, or
			-- the child windows of the specified parent window.
		external "C use <windows.h>"
		end -- TileWindows

	WindowFromPoint (a_point: POINTER): POINTER is
			--	The WindowFromPoint function retrieves the handle of
			-- the window that contains the specified point. 
		external "C use <windows.h>"
		end -- WindowFromPoint

feature {NONE}

	c_EnumChildWindows (a_parent    : POINTER;
						a_current   : POINTER;
						a_enum_func : POINTER;
						a_param     : POINTER): BOOLEAN is
		external "C"
		end -- c_EnumChildWindows

	c_EnumThreadWindows (a_thread_id : INTEGER;
							a_current   : POINTER;
							a_enum_func : POINTER;
							a_param     : POINTER): BOOLEAN is
		external "C"
		end -- c_EnumThreadWindows

	c_EnumWindows (a_current   : POINTER;
					a_enum_func : POINTER;
					a_param     : POINTER): BOOLEAN is
		external "C"
		end -- c_EnumWindows

end -- class WIN32_WINDOWS