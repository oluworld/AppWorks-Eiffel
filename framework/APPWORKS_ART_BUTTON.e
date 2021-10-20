indexing
	contents:    "AppWorks Button Class - Win32 Native Widget Implementation"
	description: "An area that reacts to clicks"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

class APPWORKS_ART_BUTTON

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

creation 
	make
	
feature
	make (a_title, a_message: STRING) is
		do
			window_make
			initial_title := a_title
			set_prop ("button_message", a_message)
		end -- make

feature
	
	set_initial_properties is
	--loaded is 
			-- we use sip to influence size of button in Createwindow call
		do
			Precursor
			set_width    (150)
			set_height   (50)
		end -- set_initial_properties

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

	handle (evt: EVENT) : EVENT is
		local
			e : EVENT
		do
			if evt.get_main_msg.is_equal ("expose onclick") then
				--print ("button clicked%N")
				!! e.make (Current)
				e.set_msg (get_msg)
				e.add_str ("button-id", get_target_id)
				fire_to   (e, my_parent)
				Result := good_event
			else
				Result := Precursor (evt)
			end
		end -- handle

feature
	
	get_msg: STRING is
		do
			Result := get_prop_or ("button_message", "notify buttonclick")
		end  -- get_msg
	
	set_msg (n: STRING) is
		do
			set_prop ("button_message", n)
		end -- set_msg
	
feature

	option_name_value (n, v : STRING) is
		do
			if n.is_equal ("button_message") then
				set_msg (v)
			else
				-- TODO: Who knows
			end
		end -- option_name_value
	
feature -- initial preoperties

	get_style : BIT 32 is
		do
			Result := WS_CHILD or WS_VISIBLE or WS_CLIPSIBLINGS.to_bit -- or BS_DEFPUSHBUTTON 
		end -- get_style

	initial_title: STRING
	initial_win32_wndclass: STRING is "BUTTON"
	
feature

	old_proc : POINTER
			
end -- class APPWORKS_ART_BUTTON
