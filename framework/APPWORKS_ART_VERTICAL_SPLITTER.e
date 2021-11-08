indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "An area which allows two smaller areas to be proportionally resized"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

class APPWORKS_ART_VERTICAL_SPLITTER

inherit
	APPWORKS_ART_GENERIC_SPLITTER
		redefine
			splitter_window_class,
			splitter_title, 
			splitter_cursor_name,
			splitter_initial_coord,
			on_size,
			imp_on_mousemove
		end

insert
	APPWORKS_ART_CURSOR_CONSTANTS

creation 
	make
	
feature {APPWORKS_ART_GENERIC_SPLITTER}

	splitter_initial_coord : INTEGER is 
		do
			Result := get_int_prop ("width")
		end

	splitter_window_class  : STRING is "AppWorksVerticalSplitter"
	splitter_title         : STRING is "VSplitter"
	splitter_cursor_name   : STRING is 
		do
			Result := CURSOR_WE
		end

feature
	
	on_size (h, w : INTEGER) is
		do
			print ("==============================%N")
			print ("on_size in V_SPLITTER%N")
			print ("w = ")
			print (w)
			print ("%T h = ")
			print (h)
			print ("%N==============================%N")
			Precursor (h, w)
			if first_window /= Void then
				first_window.settop    (0, 0)
				first_window.set_size  (h, splitter_pos-1)
			end
			if second_window /= Void then 
				second_window.settop   (splitter_pos+2, 0)
				second_window.set_size (h, w-splitter_pos-2)
			end
		end -- set_size

	imp_on_mousemove (x, y, button : INTEGER) is
		local
			rect : WIN32_RECT
		do
			print ("==============================%N")
			print ("on_mouse_move in V_SPLITTER%N")
			print ("button = ")
			print (button)
			print ("%T is_moving = ")
			print (is_moving)
			print ("%N==============================%N")
			if is_moving and then button = LEFT_MOUSE_BUTTON then
				my_cursor.enable
				rect := get_client_rect
				if TRUE then
--				if (x <= rect.right) then
					splitter_pos := x
					set_size (get_int_prop("height"), rect.right-rect.left)
					-- TODO: this should be automatic
					on_size  (get_int_prop("height"), rect.right-rect.left)
				end -- if
			end -- if
		end -- imp_on_mousemove 

end -- class APPWORKS_ART_VERTICAL_SPLITTER
