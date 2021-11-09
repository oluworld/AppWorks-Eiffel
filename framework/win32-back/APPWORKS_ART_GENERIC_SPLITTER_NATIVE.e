deferred class APPWORKS_ART_GENERIC_SPLITTER_NATIVE

feature

	set_initial_properties is 
		do
			set_prop("WindowClass", splitter_window_class)
		end -- set_initial_properties

feature

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

	get_children: RED_BLACK_TREE [STRING, APPWORKS_ART_WINDOW] is
		deferred
		end -- get_children
	
	on_size(h, w: INTEGER) is
		deferred
		end -- on_size

end -- class APPWORKS_ART_GENERIC_SPLITTER_NATIVE
