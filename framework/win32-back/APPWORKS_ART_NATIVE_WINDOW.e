indexing
	contents:    "AppWorks Native Window - Win32 Implementation"
	description: "Implements basic interop with GDI/USER32 subsystem"
	library:     "AppWorks-Art (Win32)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_ART_NATIVE_WINDOW

inherit
	APPWORKS_ART_NATIVE_BASE
		rename 
			set_initial_properties as native_base_set_initial_properties 
		end
	APPWORKS_ART_WINDOW
		rename
			show as window_show,
			set_title as window_set_title
			set_size as window_set_size,
			settop as window_set_top,
			--set_initial_properties as container_set_initial_properties 
		undefine
			valid_handle
		redefine
			set_initial_properties 
		end

feature

	set_initial_properties is
		do
			native_base_set_initial_properties
			Precursor--container_set_initial_properties
		end -- set_initial_properties

end -- class APPWORKS_ART_NATIVE_WINDOW
