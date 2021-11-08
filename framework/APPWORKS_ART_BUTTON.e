indexing
	contents:    "AppWorks Button Class - Win32 Native Widget Implementation"
	description: "An area that reacts to clicks"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

class APPWORKS_ART_BUTTON

inherit
	APPWORKS_ART_NATIVE_WINDOW_BUTTON_MIXIN	

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
				
end -- class APPWORKS_ART_BUTTON
