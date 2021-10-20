indexing
	contents: "WIN32 timer functions"
	author: "Birgit Sander, bsander@online.de"
	completed: no
	tested: yes
	
class WIN32_TIMER_FUNCTIONS

feature {NONE}

	GetTickCount: INTEGER is
		external "C use <windows.h>"
		end -- GetTickCount
		
	KillTimer (a_window: POINTER;
				  a_event: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- KillTimer

	QueryPerformanceCounter (a_performance_count : POINTER) : BOOLEAN is
		external "C use <windows.h>"
		end -- QueryPerformanceCounter

	QueryPerformanceFrequency (a_frequency: POINTER) : BOOLEAN is
		external "C use <windows.h>"
		end -- QueryPerformanceFrequency

	SetTimer(a_window     : POINTER; 
				a_event      : INTEGER;
				a_elapse     : INTEGER;
				a_timer_func : POINTER): INTEGER is
		external "C use <windows.h>"
		end -- SetTimer

end -- class WIN32_TIMER_FUNCTIONS