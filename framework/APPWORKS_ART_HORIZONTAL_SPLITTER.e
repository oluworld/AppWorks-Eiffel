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

class APPWORKS_ART_HORIZONTAL_SPLITTER

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
	APPWORKS_ART_CURSOR_CONSTANTS
	WIN32_DEVICE_CONTEXT_FUNCTIONS
	WIN32_LINE_AND_CURVE_FUNCTIONS

creation 
	make
	
feature {APPWORKS_ART_GENERIC_SPLITTER}

	splitter_initial_coord : INTEGER is 
		do
			Result := get_int_prop ("height")
		end

	splitter_window_class  : STRING is "AppWorksHorizontalSplitter"
	splitter_title         : STRING is "HSplitter"
	splitter_cursor_name   : STRING is 
		do
			Result := CURSOR_NS
		end

feature 

	on_size (h, w : INTEGER) is
		do
			print ("==============================%N")
			print ("on_size in H_SPLITTER%N")
			print ("w = ")
			print (w)
			print ("%T h = ")
			print (h)
			print ("%N==============================%N")
			Precursor (h, w)
			if first_window /= Void then
				first_window.settop    (0, 0)
				first_window.set_size  (splitter_pos-1, w)
			end
			if second_window /= Void then 
				second_window.settop   (0, splitter_pos+2)
				second_window.set_size (h-splitter_pos-2, w)
			end
		end -- set_size

	imp_on_mousemove (x, y, button : INTEGER) is
		local
			rect : WIN32_RECT
		do
			print ("==============================%N")
			print ("on_mouse_move in H_SPLITTER%N")
			print ("button = ")
			print (button)
			print ("%T is_moving = ")
			print (is_moving)
			print ("%N==============================%N")
			
			my_cursor.enable
			
			if is_moving and then button = LEFT_MOUSE_BUTTON then
				my_cursor.enable
				rect := get_client_rect
				if (y <= rect.bottom) then
					splitter_pos := y
					set_size (rect.bottom-rect.top, get_int_prop("width"))
					-- TODO: this should be automatic
					repaint (y)
					--on_size (rect.bottom-rect.top, get_int_prop("width"))
				end -- if
			end -- if
		end -- imp_on_mousemove
	
	repaint (y_coord: INTEGER) is
		local
			hdc: POINTER
			win32_bool: BOOLEAN
			rpt: WIN32_POINT
		do
			-- create (compatible?) dc and use a xor pen to draw 
			-- over last point and onto current point
			hdc := GetDC(get_native_handle)
			!!rpt.make
			win32_bool := MoveToEx(hdc, 0, y_coord, rpt)
			win32_bool := LineTo(hdc, get_width, y_coord)
		end -- repaint

end -- class APPWORKS_ART_HORIZONTAL_SPLITTER
