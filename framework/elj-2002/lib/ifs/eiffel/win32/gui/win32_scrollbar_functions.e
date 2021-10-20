indexing
	contents: "WIN32 scrollbar functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: no
	tested: no

class WIN32_SCROLLBAR_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with scroll bars. 
--
--	EnableScrollBar
--	GetScrollPos
--	GetScrollInfo
--	GetScrollRange
--	ScrollDC
--	ScrollWindow
--	ScrollWindowEx
--	SetScrollPos
--	SetScrollInfo
--	SetScrollRange
--	ShowScrollBar 
--	------------------------------------------------------------------------

inherit
	WIN32_SCROLLBAR_TYPE_CONSTANTS
	WIN32_SCROLLBAR_ACTIVATION_CONSTANTS

feature {NONE}

	EnableScrollBar (	a_handle     : POINTER;
						a_sb_flags   : INTEGER;
						a_arrow_flag : INTEGER) : BOOLEAN is
--	The EnableScrollBar function enables or disables one or both scroll bar 
--	arrows. 
		require
			valid_scrollbar_type:	a_sb_flags = SB_CTL or
									a_sb_flags = SB_HORZ or
									a_sb_flags = SB_VERT or
									a_sb_flags = SB_BOTH
		external "C use <windows.h>"
		alias "EnableScrollBar"
		end -- EnableScrollBar

	GetScrollInfo (	a_handle:			POINTER;
					a_scrollbar_type:	INTEGER;
					a_scroll_info:		POINTER): BOOLEAN is
--	GetScrollInfo (	a_handle:			POINTER;
--					a_scrollbar_type:	INTEGER;
--					a_scroll_info:		WIN32_SCROLLINFO): BOOLEAN is
--	The GetScrollInfo function retrieves the parameters of a scroll bar, 
--	including the minimum and maximum scrolling positions, the page size, 
--	and the position of the scroll box (thumb).
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- GetScrollInfo

	GetScrollPos (	a_handle         : POINTER;
					a_scrollbar_type : INTEGER) : INTEGER is
--	The GetScrollPos function retrieves the current position of the scroll 
--	box (thumb) in the specified scroll bar. The current position is a 
--	relative value that depends on the current scrolling range. For 
--	example, if the scrolling range is 0 through 100 and the scroll box is 
--	in the middle of the bar, the current position is 50. 
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- GetScrollPos

	GetScrollRange (a_handle         : POINTER;
					a_scrollbar_type : INTEGER;
					a_min_pos_ptr    : POINTER;
					a_max_pos_ptr    : POINTER) : BOOLEAN is
--	The GetScrollRange function retrieves the current minimum and maximum 
--	scroll box (thumb) positions for the specified scroll bar. 
--
--	For Windows 95, the GetScrollRange function exists for compatibility 
--	with operating system versions earlier than 4.0. With version 4.0 or 
--	later, use the GetScrollInfo function.
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- GetScrollRange

	ScrollDC (	a_handle            : POINTER;
				a_x                 : INTEGER;
				a_y                 : INTEGER;
				a_scroll_rect       : POINTER;
				a_clip_rect         : POINTER;
				a_rgn_update_handle : POINTER;
				a_update_rect       : POINTER) : BOOLEAN is
--	ScrollDC (	a_handle            : POINTER;
--				a_x                 : INTEGER;
--				a_y                 : INTEGER;
--				a_scroll_rect       : WIN32_RECT;
--				a_clip_rect         : WIN32_RECT;
--				a_rgn_update_handle : POINTER;
--				a_update_rect       : WIN32_RECT) : BOOLEAN is
--	The ScrollDC function scrolls a rectangle of bits horizontally and 
--	vertically. 
		external "C use <windows.h>"
		end -- ScrollDC

	ScrollWindow (	a_handle      : POINTER;
					a_x           : INTEGER;
					a_y           : INTEGER;
					a_scroll_rect : POINTER;
					a_clip_rect   : POINTER) : BOOLEAN is
--	ScrollWindow (	a_handle      : POINTER;
--					a_x           : INTEGER;
--					a_y           : INTEGER;
--					a_scroll_rect : WIN32_RECT;
--					a_clip_rect   : WIN32_RECT) : BOOLEAN is
--	The ScrollWindow function scrolls the content of the specified window's 
--	client area. This function exists for backward compatibility. For new 
--	applications, use the ScrollWindowEx function.
		external "C use <windows.h>"
		end -- ScrollWindow

	ScrollWindowEx (a_handle            : POINTER;
					a_x                 : INTEGER;
					a_y                 : INTEGER;
					a_scroll_rect       : POINTER;
					a_clip_rect         : POINTER;
					a_rgn_update_handle : POINTER;
					a_update_rect       : POINTER;
					a_scroll_flag       : INTEGER) : BOOLEAN is
--	ScrollWindowEx (a_handle            : POINTER;
--					a_x                 : INTEGER;
--					a_y                 : INTEGER;
--					a_scroll_rect       : WIN32_RECT;
--					a_clip_rect         : WIN32_RECT;
--					a_rgn_update_handle : POINTER;
--					a_update_rect       : WIN32_RECT;
--					a_scroll_flag       : INTEGER) : BOOLEAN is
--	The ScrollWindowEx function scrolls the content of the specified 
--	window's client area. This function is similar to the ScrollWindow 
--	function, but it has additional features. 
		external "C use <windows.h>"
		end -- ScrollWindowEx

	SetScrollInfo (	a_handle:			POINTER;
					a_scrollbar_type:	INTEGER;
					a_scroll_info:		POINTER;
					a_redraw_flag:		BOOLEAN): INTEGER is
--	SetScrollInfo (	a_handle:			POINTER;
--					a_scrollbar_type:	INTEGER;
--					a_scroll_info:		WIN32_SCROLLINFO;
--					a_redraw_flag:		BOOLEAN): INTEGER is
--	The SetScrollInfo function sets the parameters of a scroll bar, 
--	including the minimum and maximum scrolling positions, the page size, 
--	and the position of the scroll box (thumb). The function also redraws 
--	the scroll bar, if requested.
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- SetScrollInfo

	SetScrollPos (	a_handle         : POINTER;
					a_scrollbar_type : INTEGER;
					a_pos            : INTEGER;
					a_redraw         : BOOLEAN) : INTEGER is
--	The SetScrollPos function sets the position of the scroll box (thumb) 
--	in the specified scroll bar and, if requested, redraws the scroll bar 
--	to reflect the new position of the scroll box. The SetScrollPos 
--	function is provided for compatibility with Windows 3.x. Win32-based 
--	applications should use the SetScrollInfo function. 
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- SetScrollPos

	SetScrollRange (a_handle         : POINTER;
					a_scrollbar_type : INTEGER;
					a_min_pos        : INTEGER;
					a_max_pos        : INTEGER;
					a_redraw         : BOOLEAN) : BOOLEAN is
--	The SetScrollRange function sets the minimum and maximum position 
--	values for the specified scroll bar. It can also be used to hide or 
--	show a standard scroll bar.The SetScrollRange function is provided for 
--	compatibility with Windows 3.x. Win32-based applications should use the 
--	SetScrollInfo function.  
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- SetScrollRange


	ShowScrollBar (a_handle         : POINTER;
					a_scrollbar_type : INTEGER;
					a_show           : BOOLEAN) : BOOLEAN is
			-- The ShowScrollBar function shows or hides the specified
			-- scroll bar. 
		require
			valid_scrollbar_type:	a_scrollbar_type = SB_CTL or
									a_scrollbar_type = SB_HORZ or
									a_scrollbar_type = SB_VERT
		external "C use <windows.h>"
		end -- ShowScrollBar

end -- class WIN32_SCROLLBAR_FUNCTIONS