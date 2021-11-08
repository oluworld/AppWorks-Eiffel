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

end -- class APPWORKS_ART_GENERIC_SPLITTER_NATIVE
