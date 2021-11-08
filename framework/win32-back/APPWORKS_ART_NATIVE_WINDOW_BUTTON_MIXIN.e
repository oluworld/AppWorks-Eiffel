indexing
	contents:    "AppWorks Button Class - Win32 Native Widget Implementation"
	description: "An area that reacts to clicks"
	library:     "AppWorks-Art-win32"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"
    
class APPWORKS_ART_NATIVE_WINDOW_BUTTON_MIXIN

inherit
	APPWORKS_ART_NATIVE_WINDOW
		rename 
			make as window_make
		redefine
			set_initial_properties, --loaded, 
			initial_title, initial_win32_wndclass,
			validate_native_handle_in_post_create,
			get_style,
			handle,
			WndProc
		end
	WIN32_BUTTON_CONSTANTS
	WIN32_WINDOW_PROCEDURE_FUNCTIONS

feature

   	validate_native_handle_in_post_create is 
		do
			Precursor
			create_std_window
			old_proc := i2p (SetWindowLong (get_native_handle, GWL_WNDPROC,
						p2i (make_instance (Current.to_pointer, $WndProc))))
			check
				old_proc /= default_pointer
			end
		end -- post_create

	WndProc ( hWnd:		POINTER;
			  uMsg:		INTEGER;
			  wParam:	INTEGER;
			  lParam:	INTEGER): INTEGER is
		do
			Result := 1
			
			print ("== AwxButton::WndProc%N")
			inspect uMsg
				when WM_LBUTTONDOWN then
					print ("button down%N")
					fire_string_to ("expose onclick", Current)
					Result := 0
				else
					--Result := Precursor (hWnd, uMsg, wParam, lParam)
					--if Result /= 0 then -- if not handled, CallWindowProc
						Result := CallWindowProc (old_proc, get_native_handle, uMsg, wParam, lParam)	
					--end
			end			
		end -- WndProc

feature -- initial preoperties

	get_style : BIT 32 is
		do
			Result := WS_CHILD or WS_VISIBLE or WS_CLIPSIBLINGS.to_bit -- or BS_DEFPUSHBUTTON 
		end -- get_style

	initial_title: STRING
	initial_win32_wndclass: STRING is "BUTTON"
	
feature

	old_proc : POINTER

end -- class APPWORKS_ART_NATIVE_WINDOW_BUTTON_MIXIN