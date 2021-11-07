indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "An area which allows two smaller areas to be proportionally resized"
	library:     "AppWorks/Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

class APPWORKS_ART_GENERIC_SPLITTER

inherit
	APPWORKS_ART_NATIVE_WINDOW
		undefine
			imp_on_mousemove,
			imp_on_mousedown,
			imp_on_mouseup
		redefine
			get_style,
			get_register_brush,
			post_create,
			set_initial_properties,
			on_size,
			end_select
		end

feature
	
	splitter_window_class  : STRING  is deferred end
	splitter_title         : STRING  is deferred end
	splitter_cursor_name   : STRING  is deferred end
	splitter_initial_coord : INTEGER is deferred end

	set_initial_properties is 
		do
			Precursor
			set_prop("WindowClass", splitter_window_class)
			set_prop("title", 		splitter_title)
		end -- set_initial_properties

	post_create is 
		do
			Precursor
			register
			create_std_window
			splitter_pos := splitter_initial_coord // 2
			!! my_cursor
			my_cursor.from_std (splitter_cursor_name)
--			show
		end -- post_create

	get_style : INTEGER_32 is
		do
			Result := WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN.to_bit
		end -- get_style

	get_register_brush : POINTER is
		do
			Result := GetStockObject (LTGRAY_BRUSH)
		end

feature 

	end_select is
		local
			rect : WIN32_RECT
		do
			Precursor
			if get_children.count = 2 then
				!! rect.make
				get_client_rect_in (rect)
--				on_size (rect.right, rect.bottom)
				on_size (rect.bottom-rect.top, rect.right-rect.left)
			else
				print ("less than 2 children in end_select of GENERIC_SPLITTER%N")
			end
		end -- end_select

feature 

	imp_on_mousedown (button, clicks : INTEGER) is
		do
			print ("==============================%N")
			print ("on_mouse_down in G_SPLITTER%N")
			print ("==============================%N")
			if button = LEFT_MOUSE_BUTTON then
				my_cursor.enable
				lock_focus
				is_moving := TRUE
			end	
		end -- imp_on_mousedown
	imp_on_mouseup (button, clicks : INTEGER) is
		do
			print ("==============================%N")
			print ("on_mouse_up in G_SPLITTER%N")
			print ("==============================%N")
			if button = LEFT_MOUSE_BUTTON then
				my_cursor.disable
				unlock_focus
				is_moving := FALSE
			end
		end -- imp_on_mouseup 


	set_children (w1, w2 : APPWORKS_ART_WINDOW) is
			-- a convienence funtion
		do
			-- we might also want tot set options here
--			begin_select
			insert_child (w1, "1", true)
			insert_child (w2, "2", true)
--			end_select
		end -- set_children

feature 

	is_dynamic : BOOLEAN is
		do
			-- return (not) FALSE if prop not present
--			Result := not get_bool_prop_or ("static", false)
			Result := TRUE
		end
		
	on_size (h, w : INTEGER) is
		do
			Precursor (h, w)
			if is_dynamic then
--				recalc_splitter_pos (SYMMETRIC)
				splitter_pos := splitter_initial_coord // 2
			else
				-- a static splitter will leave the 
				-- splitbar where it is when resized
			end
		end -- on_size
		
feature 

	first_window : APPWORKS_ART_WINDOW is
		do
			if get_children.count>0 and then get_children.find ("1") then
				Result := get_children.item
--				print ("first found")
			else
				print ("first not found%N")
				Result := Void
			end
		end
	second_window : APPWORKS_ART_WINDOW is
		do
			if get_children.count>0 and then get_children.find ("2") then 
				Result := get_children.item
--				io.put_string ("second found")
			else
				print ("second not found%N")
				Result := Void
			end
		end

feature {NONE}
	splitter_pos 	: INTEGER
	is_moving    	: BOOLEAN

feature 
	my_cursor 		: APPWORKS_ART_CURSOR
	
end -- class APPWORKS_ART_GENERIC_SPLITTER
