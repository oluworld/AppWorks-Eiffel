indexing
	contents: "WIN32 updown control functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_UPDOWN_FUNCTIONS

--	------------------------------------------------------------------------
--	The following function is used with up-down controls.
--	
--	CreateUpDownControl
--	------------------------------------------------------------------------

inherit
	WIN32_UPDOWN_CONSTANTS
	
feature {NONE}

	CreateUpDownControl (a_style:	BIT 32;
							a_x:		INTEGER;
							a_y:		INTEGER;
							a_cx:		INTEGER;
							a_cy:		INTEGER;
							a_parent:	POINTER;
							a_id:		INTEGER;
							a_instance:	POINTER;
							a_buddy:	POINTER;
							a_upper:	INTEGER;
							a_lower:	INTEGER;
							a_pos:		INTEGER): POINTER is
			-- The CreateUpDownControl function creates an up-down control.
		external "C use <windows.h>"
		end -- CreateUpDownControl
		
end -- class WIN32_UPDOWN_FUNCTIONS