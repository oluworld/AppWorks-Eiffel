class WIN32_WINDOW_PROCEDURE_FUNCTIONS

feature {NONE}

	-- CallWindowProc

	CallWindowProc (a_PrevWndFunc : POINTER;
					a_hWnd : POINTER;
					a_Msg : INTEGER;
					a_wParam : INTEGER;
					a_lParam : INTEGER) : INTEGER is
			-- The CallWindowProc function passes message information
			-- to the specified window procedure.
		external "C use <windows.h>"
		end -- CallWindowProc

end -- class WIN32_WINDOW_PROCEDURE_FUNCTIONS