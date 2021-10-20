class WIN32_CONSOLE_FUNCTIONS

feature {NONE}

	-- AllocConsole

	AllocConsole : BOOLEAN is
			-- The AllocConsole function allocates a new console
			-- for the calling process. 
		external "C use <windows.h>"
		alias "AllocConsole"
		end -- AllocConsole

	-- GetStdHandle

	GetStdHandle (a_nStdHandle : INTEGER) : POINTER is
			-- The GetStdHandle function returns a handle for the
			-- standard input, standard output, or standard error
			-- device. 
		external "C use <windows.h>"
		alias "GetStdHandle"
		end -- GetStdHandle

	-- SetStdHandle

	SetStdHandle (a_IDStdHandle : INTEGER;
		a_hHandle : POINTER) : BOOLEAN is
			-- The SetStdHandle function is used to set the handle
			-- for the standard input, standard output, or standard
			-- error device. The specified handle can be used by subsequent
			-- calls to the GetStdHandle function to refer to the
			-- input, output, or error device. 
		external "C use <windows.h>"
		end -- SetStdHandle

end -- class WIN32_CONSOLE_FUNCTIONS