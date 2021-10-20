indexing
	contents: "WIN32 button functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_BUTTON_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with buttons. 
--	
--	CheckDlgButton
--	CheckRadioButton
--	IsDlgButtonChecked 
--	------------------------------------------------------------------------

inherit
	WIN32_BUTTON_CONSTANTS

feature {NONE}
	
	CheckDlgButton (a_parent:	POINTER;
					a_id:		INTEGER;
					a_state:	INTEGER): BOOLEAN is
			--	The CheckDlgButton function changes the check state
			-- of a button control.
		external "C use <windows.h>"
		end -- CheckDlgButton

	CheckRadioButton (	a_parent:	POINTER;
						a_first_id:	INTEGER;
						a_last_id:	INTEGER;
						a_check_id:	INTEGER): BOOLEAN is
			--	The CheckRadioButton function adds a check mark to (checks)
			-- a specified radio button in a group and removes a check
			-- mark from (clears) all other radio buttons in the group. 
		external "C use <windows.h>"
		end -- CheckRadioButton

	IsDlgButtonChecked (a_parent:	POINTER;
						a_id:		INTEGER): INTEGER is
			--	The IsDlgButtonChecked function determines whether a button
			-- control has a check mark next to it or whether a three-state
			-- button control is grayed, checked, or neither. 
		external "C use <windows.h>"
		end -- IsDlgButtonChecked

end -- class WIN32_BUTTON_FUNCTIONS