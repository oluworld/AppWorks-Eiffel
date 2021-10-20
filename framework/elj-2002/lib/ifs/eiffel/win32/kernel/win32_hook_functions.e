indexing
	contents: "WIN32 hook functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_HOOK_FUNCTIONS
		
feature {NONE}

	CallMsgFilter (a_msg: POINTER;
					a_code: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- CallMsgFilter

	CallNextHookEx (a_hk: POINTER;
					a_code: INTEGER;
					a_wparam: INTEGER;
					a_lparam: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CallNextHookEx

	SetWindowsHookEx (a_id_hook: INTEGER;
						a_pfn: POINTER;
						a_mod: INTEGER;
						a_thread_id: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- SetWindowsHookEx

	UnhookWindowsHookEx (a_hk: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- UnhookWindowsHookEx

end -- class WIN32_HOOK_FUNCTIONS