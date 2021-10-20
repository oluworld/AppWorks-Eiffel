indexing
	purpose: "consolidate native features"

deferred class APPWORKS_ART_WINDOW_NATIVE_MIXIN

feature -- native handle

	get_native_handle: POINTER is
		do
			Result := my_native_handle
		end -- get_native_handle

	set_native_handle (h: POINTER) is
		require -- TODO: next might not be correct
			valid_handle: h /= default_pointer
		do
			my_native_handle := h
			window_server.notify_native_handle (ws_handle, h)
		ensure
			get_native_handle = h
		end -- set_native_handle

feature {NONE}
	my_native_handle: POINTER

end -- class APPWORKS_ART_WINDOW_NATIVE_MIXIN
