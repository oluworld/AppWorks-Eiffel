deferred class APPWORKS_SERVICES_WINDOW_SERVER_NATIVE

feature

    native_set_pos (a_service_number: INTEGER --WINDOW_SERVER_HANDLE

; a_x, a_y: INTEGER): INTEGER is
		local
			wsi: WINDOW_SERVER_INFO
		do
			wsi := get_window_info (a_service_number)
			if wsi /= Void then
				Result := bool_to_sws_status (
					SetWindowPos(wsi.native_handle, default_pointer, 
						a_x, a_y, 0, 0,
						SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER))
			else
				Result := sws_invalid_handle
			end
			unlock_service_windows
		end -- native_set_pos

feature -- deferred features

    bool_to_sws_status (a_boolean: BOOLEAN): INTEGER is
        deferred
        end -- bool_to_sws_status

end -- class APPWORKS_SERVICES_WINDOW_SERVER_NATIVE