indexing
	contents: "WIN32 painting  drawing functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_PAINTING_AND_DRAWING

--	------------------------------------------------------------------------
--	Following are the functions used with painting and drawing. 
--
--	BeginPaint
--	DrawAnimatedRects
--	DrawCaption
--	DrawEdge
--	DrawFocusRect
--	DrawFrameControl
--	DrawState
--	DrawStateProc
--	DrawTextEx  (see e2c_text_and_font_functions.c)
--	EndPaint
--	ExcludeUpdateRgn
--	GdiFlush
--	GdiGetBatchLimit
--	GdiSetBatchLimit
--	GetBkColor
--	GetBkMode
--	GetBoundsRect
--	GetROP2
--	GetUpdateRect
--	GetUpdateRgn
--	GetWindowDC
--	GrayString
--	InvalidateRect
--	InvalidateRgn
--	LockWindowUpdate
--	OutputProc
--	PaintDesktop
--	RedrawWindow
--	ResetDisplay (not found)
--	SetBkColor
--	SetBkMode
--	SetBoundsRect
--	SetRectRgn
--	SetROP2
--	UpdateWindow
--	ValidateRect
--	ValidateRgn
--	WindowFromDC 
--	------------------------------------------------------------------------

feature {NONE}

	BeginPaint (a_handle : POINTER;
				a_paint  : POINTER) : POINTER is
--	BeginPaint (a_handle : POINTER;
--				a_paint  : WIN32_PAINT_STRUCT) : POINTER is
--	The BeginPaint function prepares the specified window for painting and 
--	fills a PAINTSTRUCT structure with information about the painting. 
		external "C use <windows.h>"
		end -- BeginPaint

	DrawAnimatedRects (	a_wnd	: POINTER;
						a_ani	: INTEGER;
						a_from	: POINTER;
						a_to	: POINTER) : BOOLEAN is
--	DrawAnimatedRects (	a_wnd	: POINTER;
--						a_ani	: INTEGER;
--						a_from	: WIN32_SMALL_RECT;
--						a_to	: WIN32_SMALL_RECT) : BOOLEAN is
--	The DrawAnimatedRects function draws a wire-frame rectangle and 
--	animates it to indicate the opening of an icon or the minimizing or 
--	maximizing of a window.
		external "C use <windows.h>"
		end -- DrawAnimatedRects

	DrawCaption (	a_wnd	: POINTER;
					a_dc	: POINTER;
					a_rect	: POINTER;
					a_flags	: BIT 32) : BOOLEAN is
--	DrawCaption (	a_wnd	: POINTER;
--					a_dc	: POINTER;
--					a_rect	: WIN32_RECT;
--					a_flags	: BIT 32) : BOOLEAN is
--	The DrawCaption function draws a window caption.
		external "C use <windows.h>"
		end -- DrawCaption

	DrawEdge (	a_dc	: POINTER;
				a_rect	: POINTER;
				a_edge	: BIT 32;
				a_flags	: BIT 32) : BOOLEAN is
--	DrawEdge (	a_dc	: POINTER;
--				a_rect	: WIN32_RECT;
--				a_edge	: BIT 32;
--				a_flags	: BIT 32) : BOOLEAN is
--	The DrawEdge function draws one or more edges of rectangle.
		external "C use <windows.h>"
		end -- DrawEdge

	DrawFocusRect (	a_dc	: POINTER;
					a_rect	: POINTER): BOOLEAN is
--	DrawFocusRect (	a_dc	: POINTER;
--					a_rect	: WIN32_RECT): BOOLEAN is
--	The DrawFocusRect function draws a rectangle in the style used to 
--	indicate that the rectangle has the focus. 
		external "C use <windows.h>"
		end -- DrawFocusRect

	DrawFrameControl (	a_dc	: POINTER;
						a_rect	: POINTER;
						a_type	: INTEGER;
						a_state	: BIT 32): BOOLEAN is
--	DrawFrameControl (	a_dc	: POINTER;
--						a_rect	: WIN32_RECT;
--						a_type	: INTEGER;
--						a_state	: BIT 32): BOOLEAN is
--	The DrawFrameControl function draws a frame control of the specified type 
--	and style.
		external "C use <windows.h>"
		end -- DrawFrameControl

	DrawState (	a_dc			: POINTER;
				a_brush			: POINTER;
				a_output_func	: POINTER;
				a_ldata			: INTEGER;
				a_wdata			: INTEGER;
				a_x				: INTEGER;
				a_y				: INTEGER;
				a_cx			: INTEGER;
				a_cy			: INTEGER;
				a_flags			: INTEGER): BOOLEAN is
--	The DrawState function displays an image and applies a visual effect to 
--	indicate a state, such as a disabled or default state.
		do
			Result := c_DrawState (	a_dc, 
									a_brush, 
									a_output_func, 
									a_ldata, 
									a_wdata, 
									a_x, 
									a_y, 
									a_cx, 
									a_cy, 
									a_flags,
									Current.to_pointer)
		end -- DrawState

	EndPaint (	a_wnd	: POINTER;
				a_paint	: POINTER): BOOLEAN is
--	EndPaint (	a_wnd	: POINTER;
--				a_paint	: WIN32_PAINT_STRUCT): BOOLEAN is
--	The EndPaint function marks the end of painting in the given window. 
--	This function is required for each call to the BeginPaint function, but 
--	only after painting is complete. 
		external "C use <windows.h>"
		end -- EndPaint

	ExcludeUpdateRgn (	a_dc	: POINTER;
						a_wnd	: POINTER): INTEGER is
--	The ExcludeUpdateRgn function prevents drawing within invalid areas of a 
--	window by excluding an updated region in the window from a clipping 
--	region. 
		external "C use <windows.h>"
		end -- ExcludeUpdateRgn

	GdiFlush : BOOLEAN is
--	The GdiFlush function flushes the calling thread's current batch. 
		external "C use <windows.h>"
		end -- GdiFlush

	GdiGetBatchLimit : INTEGER is
--	The GdiGetBatchLimit function returns the maximum number of function 
--	calls that can be accumulated in the calling thread's current batch. 
--	The system flushes the current batch whenever this limit is exceeded. 
		external "C use <windows.h>"
		end -- GdiGetBatchLimit

	GdiSetBatchLimit (a_limit: INTEGER): INTEGER is
--	The GdiSetBatchLimit function sets the maximum number of functions that 
--	can be accumulated in the calling thread's current batch. The system 
--	flushes the current batch whenever this limit is exceeded. 
		external "C use <windows.h>"
		end -- GdiSetBatchLimit

	GetBkColor (a_dc: POINTER): INTEGER is
--	The GetBkColor function returns the current background color for the 
--	specified device context. 
		external "C use <windows.h>"
		end -- GetBkColor

	GetBkMode (a_dc: POINTER): INTEGER is
--	The GetBkMode function returns the current background mix mode for a 
--	specified device context. The background mix mode of a device context 
--	affects text, hatched brushes, and pen styles that are not solid lines. 
		external "C use <windows.h>"
		end -- GetBkMode

	GetBoundsRect (	a_dc			: POINTER;
					a_rect_bounds	: POINTER;
					a_flags			: INTEGER): INTEGER is
--	GetBoundsRect (	a_dc			: POINTER;
--					a_rect_bounds	: WIN32_RECT;
--					a_flags			: INTEGER): INTEGER is
--	The GetBoundsRect function obtains the current accumulated bounding 
--	rectangle for a specified device context. 
--
--	Windows maintains an accumulated bounding rectangle for each application. 
--	An application can retrieve and set this rectangle. 
		external "C use <windows.h>"
		end -- GetBoundsRect

	GetROP2 (a_dc: POINTER): INTEGER is
--	The GetROP2 function retrieves the foreground mix mode of the specified 
--	device context. The mix mode specifies how the pen or interior color and 
--	the color already on the screen are combined to yield a new color. 
		external "C use <windows.h>"
		end -- GetROP2

	GetUpdateRect (	a_wnd	: POINTER;
					a_rect	: POINTER;
					a_erase	: BOOLEAN): BOOLEAN is
--	GetUpdateRect (	a_wnd	: POINTER;
--					a_rect	: WIN32_RECT;
--					a_erase	: BOOLEAN): BOOLEAN is
--	The GetUpdateRect function retrieves the coordinates of the smallest 
--	rectangle that completely encloses the update region of the specified 
--	window. If the window was created with the CS_OWNDC style and the mapping 
--	mode is not MM_TEXT, GetUpdateRect retrieves the rectangle in logical 
--	coordinates. Otherwise, it retrieves the rectangle in client coordinates. 
--	If there is no update region, GetUpdateRect retrieves an empty rectangle 
--	(sets all coordinates to zero). 
		external "C use <windows.h>"
		end -- GetUpdateRect

	GetUpdateRgn (	a_wnd	: POINTER;
					a_rgn	: POINTER;
					a_erase	: BOOLEAN): INTEGER is
--	The GetUpdateRgn function retrieves the update region of a window by 
--	copying it into the specified region. The coordinates of the update 
--	region are relative to the upper-left corner of the window (that is, they 
--	are client coordinates). 
		external "C use <windows.h>"
		end -- GetUpdateRgn

	GetWindowDC (a_wnd: POINTER): POINTER is
--	The GetWindowDC function retrieves the device context (DC) for the 
--	entire window, including title bar, menus, and scroll bars. A window 
--	device context permits painting anywhere in a window, because the 
--	origin of the device context is the upper-left corner of the window 
--	instead of the client area. 
--
--	GetWindowDC assigns default attributes to the window device context 
--	each time it retrieves the device context. Previous attributes are 
--	lost. 
		external "C use <windows.h>"
		end -- GetWindowDC

	GrayString (a_dc			: POINTER;
				a_brush			: POINTER;
				a_output_func	: POINTER;
				a_data			: INTEGER;
				a_count			: INTEGER;
				a_x				: INTEGER;
				a_y				: INTEGER;
				a_width			: INTEGER;
				a_height		: INTEGER): BOOLEAN is
--	The GrayString function draws gray text at the specified location. The 
--	function draws the text by copying it into a memory bitmap, graying the 
--	bitmap, and then copying the bitmap to the screen. The function grays the 
--	text regardless of the selected brush and background. GrayString uses the 
--	font currently selected for the specified device context. 
--
--	If the lpOutputFunc parameter is NULL, GDI uses the TextOut function, and 
--	the lpData parameter is assumed to be a pointer to the character string 
--	to be output. If the characters to be output cannot be handled by TextOut 
--	(for example, the string is stored as a bitmap), the application must 
--	supply its own output function. 
		do
			Result := c_GrayString (a_dc, 
									a_brush, 
									a_output_func, 
									a_data, 
									a_count, 
									a_x, 
									a_y, 
									a_width, 
									a_height,
									Current.to_pointer)
		end -- GrayString

	InvalidateRect (a_wnd	: POINTER;
					a_rect	: POINTER;
					a_erase	: BOOLEAN): BOOLEAN is
--	InvalidateRect (a_wnd	: POINTER;
--					a_rect	: WIN32_RECT;
--					a_erase	: BOOLEAN): BOOLEAN is
--	The InvalidateRect function adds a rectangle to the specified window's 
--	update region. The update region represents the portion of the window's 
--	client area that must be redrawn. 
		external "C use <windows.h>"
		end -- InvalidateRect

	InvalidateRgn (	a_wnd	: POINTER;
					a_rgn	: POINTER;
					a_erase	: BOOLEAN): BOOLEAN is
--	The InvalidateRgn function invalidates the client area within the 
--	specified region by adding it to the current update region of a window. 
--	The invalidated region, along with all other areas in the update region, 
--	is marked for painting when the next WM_PAINT message occurs. 
		external "C use <windows.h>"
		end -- InvalidateRgn

	LockWindowUpdate (a_wnd_lock: POINTER): BOOLEAN is
--	The LockWindowUpdate function disables or reenables drawing in the 
--	specified window. Only one window can be locked at a time. 
		external "C use <windows.h>"
		end -- LockWindowUpdate

	PaintDesktop (a_dc: POINTER): BOOLEAN is
--	The PaintDesktop function fills the clipping region in the specified 
--	device context with the desktop pattern or wallpaper. The function is 
--	provided primarily for shell desktops.
		external "C use <windows.h>"
		end -- PaintDesktop

	RedrawWindow (	a_wnd			: POINTER;
					a_rect_update	: POINTER;
					a_rgn_update	: POINTER;
					a_flags			: BIT 32): BOOLEAN is
--	RedrawWindow (	a_wnd			: POINTER;
--					a_rect_update	: WIN32_RECT;
--					a_rgn_update	: POINTER;
--					a_flags			: BIT 32): BOOLEAN is
--	The RedrawWindow function updates the specified rectangle or region in a 
--	window's client area. 
		external "C use <windows.h>"
		end -- RedrawWindow

	SetBkColor (a_dc	: POINTER;
				a_color	: INTEGER): INTEGER is
--	The SetBkColor function sets the current background color to the 
--	specified color value, or to the nearest physical color if the device 
--	cannot represent the specified color value. 
		external "C use <windows.h>"
		end -- SetBkColor

	SetBkMode (	a_dc	: POINTER;
				a_mode	: INTEGER): INTEGER is
--	The SetBkMode function sets the background mix mode of the specified 
--	device context. The background mix mode is used with text, hatched 
--	brushes, and pen styles that are not solid lines. 
		external "C use <windows.h>"
		end -- SetBkMode

	SetBoundsRect (	a_dc			: POINTER;
					a_rect_bounds	: POINTER;
					a_flags			: BIT 32): BIT 32 is
--	SetBoundsRect (	a_dc			: POINTER;
--					a_rect_bounds	: WIN32_RECT;
--					a_flags			: BIT 32): BIT 32 is
--	The SetBoundsRect function controls the accumulation of bounding 
--	rectangle information for the specified device context. Windows can 
--	maintain a bounding rectangle for all drawing operations. An application 
--	can examine and set this rectangle. The drawing boundaries are useful for 
--	invalidating bitmap caches. 
		external "C use <windows.h>"
		end -- SetBoundsRect

	SetRectRgn (a_rgn			: POINTER;
				a_left_rect		: INTEGER;
				a_top_rect		: INTEGER;
				a_right_rect	: INTEGER;
				a_bottom_rect	: INTEGER): BOOLEAN is
--	The SetRectRgn function changes a region into a rectangular region with 
--	the specified coordinates. 
		external "C use <windows.h>"
		end -- SetRectRgn

	SetROP2 (	a_dc		: POINTER;
				a_draw_mode	: INTEGER): INTEGER is
--	The SetROP2 function sets the current foreground mix mode. GDI uses the 
--	foreground mix mode to combine pens and interiors of filled objects with 
--	the colors already on the screen. The foreground mix mode defines how 
--	colors from the brush or pen and the colors in the existing image are to 
--	be combined. 
		external "C use <windows.h>"
		end -- SetROP2

	SetWindowRgn (a_window, a_region: POINTER; a_redraw_flag: BOOLEAN): INTEGER is
		external "C use <windows.h>"
		end -- SetWindowRgn
	
	UpdateWindow (a_window: POINTER): BOOLEAN is
--	The UpdateWindow function updates the client area of the specified 
--	window by sending a WM_PAINT message to the window if the window's 
--	update region is not empty. The function sends a WM_PAINT message 
--	directly to the window procedure of the specified window, bypassing the 
--	application queue. If the update region is empty, no message is sent. 
		external "C use <windows.h>"
		end -- UpdateWindow

	ValidateRect (	a_wnd	: POINTER;
					a_rect	: POINTER): BOOLEAN is
--	ValidateRect (	a_wnd	: POINTER;
--					a_rect	: WIN32_RECT): BOOLEAN is
--	The ValidateRect function validates the client area within a rectangle by 
--	removing the rectangle from the update region of the specified window. 
		external "C use <windows.h>"
		end -- ValidateRect

	ValidateRgn (	a_wnd: POINTER;
					a_rgn: POINTER): BOOLEAN is
--	The ValidateRgn function validates the client area within a region by 
--	removing the region from the current update region of the specified 
--	window. 
		external "C use <windows.h>"
		end -- ValidateRgn

	WindowFromDC (a_dc: POINTER): POINTER is
--	The WindowFromDC function returns the handle of the window associated 
--	with the given display device context (DC). Output functions that use the 
--	given device context draw into this window. 
		external "C use <windows.h>"
		end -- WindowFromDC

feature {NONE}

	c_DrawState (	a_dc			: POINTER;
					a_brush			: POINTER;
					a_output_func	: POINTER;
					a_ldata			: INTEGER;
					a_wdata			: INTEGER;
					a_x				: INTEGER;
					a_y				: INTEGER;
					a_cx			: INTEGER;
					a_cy			: INTEGER;
					a_flags			: INTEGER;
					a_current		: POINTER): BOOLEAN is
		external "C"
		end -- c_DrawState

	c_GrayString (	a_dc			: POINTER;
					a_brush			: POINTER;
					a_output_func	: POINTER;
					a_data			: INTEGER;
					a_count			: INTEGER;
					a_x				: INTEGER;
					a_y				: INTEGER;
					a_width			: INTEGER;
					a_height		: INTEGER;
					a_current		: POINTER): BOOLEAN is
		external "C"
		end -- c_GrayString

end -- class WIN32_PAINTING_AND_DRAWING