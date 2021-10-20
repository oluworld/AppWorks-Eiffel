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

class APPWORKS_BASE_APP_MAIN_FRAME

feature

	set_main_frame is
		do
			my_main_frame := TRUE
		end -- set_main_frame
	
	unset_main_frame is
		do
			my_main_frame := FALSE
		end -- set_main_frame
	
	is_main_frame : BOOLEAN is
		do
			Result := (my_main_frame = TRUE)
		end -- set_main_frame
	
feature {APPWORKS_BASE_APP_MAIN_FRAME}
	
	my_main_frame   : BOOLEAN
	
end -- class APPWORKS_BASE_APP_MAIN_FRAME