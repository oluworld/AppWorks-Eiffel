indexing
	contents: "WIN32 statusbar functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_STATUSBAR_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with status windows.
--	
--	CreateStatusWindow
--	DrawStatusText
--	MenuHelp
--	------------------------------------------------------------------------

inherit
	WIN32_STATUSBAR_CONSTANTS
	
feature {NONE}

	CreateStatusWindow (a_style:	BIT 32;
						a_text:		POINTER;
						a_parent:	POINTER;
						a_id:		INTEGER): POINTER is
--	CreateStatusWindow (a_style:	BIT 32;
--						a_text:		STRING;
--						a_parent:	POINTER;
--						a_id:		INTEGER): POINTER is
--		The CreateStatusWindow function creates a status window, which is 
--		typically used to display the status of an application. The window 
--		generally appears at the bottom of the parent window, and it contains 
--		the specified text.
		external "C use <windows.h>"
		end -- CreateStatusWindow
		
	DrawStatusText (a_dc:		POINTER;
					a_rect:		POINTER;
					a_text:		POINTER;
					a_flag_set:	BIT 32) is
--	DrawStatusText (a_dc:		POINTER;
--					a_rect:		WIN32_RECT;
--					a_text:		STRING;
--					a_flag_set:	BIT 32) is
--		The DrawStatusText function draws the specified text in the style of a 
--		status window with borders.
		external "C use <windows.h>"
		end -- DrawStatusText
		
	MenuHelp (	a_msg:		INTEGER;
				a_wparam:	INTEGER;
				a_lparam:	INTEGER;
				a_menu:		POINTER;
				a_instance:	POINTER;
				a_window:	POINTER;
				a_ids:		POINTER) is
--	MenuHelp (	a_msg:		INTEGER;
--				a_wparam:	INTEGER;
--				a_lparam:	INTEGER;
--				a_menu:		POINTER;
--				a_instance:	POINTER;
--				a_window:	POINTER;
--				a_ids:		ARRAY[INTEGER]) is
--		The MenuHelp function processes WM_MENUSELECT and WM_COMMAND messages 
--		and displays help text about the current menu in the specified status 
--		window.
		external "C use <windows.h>"
		end -- MenuHelp
		
end -- WIN32_STATUSBAR_FUNCTIONS