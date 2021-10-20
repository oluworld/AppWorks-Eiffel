class APPWORKS_ART_VBOX
inherit
	APPWORKS_ART_WINDOW
creation
	make
feature
	on_resize is
		do
			layout_container (Current)
		end -- on_resize

	layout_container (a_window: APPWORKS_ART_WINDOW) is
		local
			child: APPWORKS_ART_WINDOW
			index: INTEGER
			dim  : INTEGER
		do
			from
				dim := a_window.height // a_window.get_children.count
			until
				index = a_window.get_children.count
			loop
				index := index + 1
				child := a_window.get_children @ index
				child.set_height (dim)
			end
		end
	
end -- class APPWORKS_ART_VBOX
