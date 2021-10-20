class WIN32_HELP_FUNCTIONS

feature {NONE}

	-- GetMenuContextHelpId

	GetMenuContextHelpId : INTEGER is
			-- The GetMenuContextHelpId function retrieves the help
			-- context identifier associated with the specified menu.
		external "C use <windows.h>"
		end -- GetMenuContextHelpId

	-- GetWindowContextHelpId

	GetWindowContextHelpId : INTEGER is
			-- The GetWindowContextHelpId function retrieves the
			-- help context identifier, if any, associated with the
			-- specified window.
		external "C use <windows.h>"
		end -- GetWindowContextHelpId

	-- SetMenuContextHelpId

	SetMenuContextHelpId : BOOLEAN is
			-- The SetMenuContextHelpId function associates a help
			-- context identifier with a menu. All items in the menu
			-- share this identifier. It is not possible to attach
			-- a help context identifier to the individual menu items.
		external "C use <windows.h>"
		end -- SetMenuContextHelpId

	-- SetWindowContextHelpId

	SetWindowContextHelpId : BOOLEAN is
			-- The SetWindowContextHelpId function associates a help
			-- context identifier with the specified window.
		external "C use <windows.h>"
		end -- SetWindowContextHelpId

	-- WinHelp

	WinHelp (a_hwnd : POINTER;
		a_pszHelp : POINTER;
		a_uCommand : INTEGER;
		a_dwData : INTEGER) : BOOLEAN is
--	WinHelp (a_hwnd : POINTER;
--		a_pszHelp : STRING;
--		a_uCommand : INTEGER;
--		a_dwData : INTEGER) : BOOLEAN  is
			-- The WinHelp function starts Windows Help (WINHELP.EXE)
			-- and passes additional data indicating the nature of
			-- the help requested by the application. The application
			-- specifies the name and, where required, the directory
			-- path of the help file to display. 
		external "C use <windows.h>"
		end -- WinHelp

end -- class WIN32_HELP_FUNCTIONS