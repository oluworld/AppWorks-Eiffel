class WIN32_ERROR_FUNCTIONS

feature {NONE}

--	Beep


--	ExitWindows


--	ExitWindowsEx


--	FlashWindow

	FlashWindow (a_window: POINTER;
					 a_inversion: BOOLEAN) : BOOLEAN is
		external "C use <windows.h>"
		end -- FlashWindow

--	GetLastError

	GetLastError : INTEGER is
		external "C use <windows.h>"
		end -- GetLastError

--	MessageBeep

	MessageBeep (a_flag : INTEGER) : BOOLEAN is
		external "C use <windows.h>"
		end -- MessageBeep

--	SetErrorMode

	SetLastError (a_val : INTEGER) is
		external "C use <windows.h>"
		end -- SetLastError

--	SetLastErrorEx 

end -- class WIN32_ERROR_FUNCTIONS