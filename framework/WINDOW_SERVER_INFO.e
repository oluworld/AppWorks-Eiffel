class WINDOW_SERVER_INFO

creation
	make
feature
	make is
		do
		end -- make

feature

	desktop_window: APPWORKS_WINDOW_CONTAINER
	set_desktop_window (a_desktop_window: APPWORKS_WINDOW_CONTAINER) is
		do
			desktop_window := a_desktop_window
		end -- set_desktop_window 

feature

	native_handle: POINTER
	set_native_handle (a_pointer: POINTER) is
		do
			native_handle := a_pointer
		end -- set_native_handle

end -- class WINDOW_SERVER_INFO
