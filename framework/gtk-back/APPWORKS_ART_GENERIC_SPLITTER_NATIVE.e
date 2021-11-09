deferred class APPWORKS_ART_GENERIC_SPLITTER_NATIVE

feature

	set_initial_properties is 
		do
		end -- set_initial_properties

feature 

	end_select is
		local
			rect : GTK_RECT
		do
			--Precursor  -- TODO
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

	get_client_rect_in(a_rect: GTK_RECT) is
		deferred
		end -- get_client_rect_in

end -- class APPWORKS_ART_GENERIC_SPLITTER_NATIVE
