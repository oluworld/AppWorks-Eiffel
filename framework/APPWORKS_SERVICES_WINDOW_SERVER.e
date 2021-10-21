indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_SERVICES_WINDOW_SERVER

inherit
	APPWORKS_ART_WINDOW_SERVER_CONSTANTS

creation 
	make

feature

	make is
		do
			!! my_window_map.make
			!! my_service_windows.make
			service_memory := 1
		end -- make

	notify_post_create (target_id: STRING; window_obj: APPWORKS_ART_WINDOW) is
		do
			my_window_map.insert (target_id, window_obj)
		end -- notify_post_create 

	target_id_to_window_obj (target_id : STRING) : APPWORKS_ART_WINDOW is
		do
			if my_window_map.find (target_id) then
				Result := my_window_map.item
			end
		ensure
			Result = Void implies not my_window_map.find(target_id)
		end -- target_id_to_window_obj 

feature

	lock_service_windows is do end
	unlock_service_windows is do end
	
	get_window_info (a_service_number: INTEGER): WINDOW_SERVER_INFO is
		require
			valid_service_number: a_service_number /= 0
		do
			lock_service_windows
			if my_service_windows.has (a_service_number) then
				Result := my_service_windows.at (a_service_number)
			end
		end -- get_window_info 
	
	service_memory: INTEGER --WINDOW_SERVER_HANDLE


	get_service_number: INTEGER --WINDOW_SERVER_HANDLE

 is
		do
			service_memory := service_memory*2
			Result := service_memory
		ensure
			Result /= 0
		end

	notify_native_handle (a_service_number: INTEGER; a_native_pointer: POINTER) is
		local
			wsi: WINDOW_SERVER_INFO
		do
			wsi := get_window_info (a_service_number)
			if wsi /= Void then
				wsi.set_native_handle (a_native_pointer)
			else
				!!wsi.make
				wsi.set_native_handle (a_native_pointer)
				my_service_windows.put_at (wsi, a_service_number)
			end
		end -- notify_native_handle 

feature

	bool_to_sws_status (a_boolean: BOOLEAN): INTEGER is
		do
			if a_boolean then
				Result := sws_ok
			else
				Result := sws_failed
			end
		end -- bool_to_sws_status 

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

feature

	get_desktop_for (a_service_number: INTEGER --WINDOW_SERVER_HANDLE

): APPWORKS_WINDOW_CONTAINER is
		local
			wsi: WINDOW_SERVER_INFO
		do
			lock_service_windows
			if my_service_windows.has (a_service_number) then
				wsi := my_service_windows.at (a_service_number)
				Result := wsi.desktop_window
			end
			lock_service_windows
		ensure
			Result /= Void impiles my_service_windows.has (a_service_number)
		end -- get_desktop_for

feature {NONE}

	my_window_map: RED_BLACK_TREE [STRING, APPWORKS_ART_WINDOW]

feature

	my_service_windows: APPWORKS_UTIL_DICTIONARY [INTEGER --WINDOW_SERVER_HANDLE

, 
		WINDOW_SERVER_INFO]

end -- class APPWORKS_SERVICES_WINDOW_SERVER
