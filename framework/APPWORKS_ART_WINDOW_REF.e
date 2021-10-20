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

class APPWORKS_ART_WINDOW_REF

creation
	make
feature
	make is
		do
		end
	set (w : APPWORKS_ART_WINDOW) is
		do
			my_window_id     := w.get_target_id
			my_window_server := w.get_owner.shared_window_server
		end
	get : APPWORKS_ART_WINDOW is
		do
			Result := my_window_server.target_id_to_window_obj (my_window_id)
		end
		
feature {NONE}

	my_window_id     : STRING
	my_window_server : APPWORKS_SERVICES_WINDOW_SERVER 
	
end -- class APPWORKS_ART_WINDOW_REF
