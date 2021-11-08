indexing
	contents:    "AppWorks Native Window - Gtk Implementation"
	description: "Does nothing now"
	library:     "AppWorks-Art (Gtk)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"

class APPWORKS_ART_NATIVE_CONTAINER

--inherit
--	APPWORKS_ART_NATIVE_BASE
--		rename 
--			set_initial_properties as native_base_set_initial_properties 
--		redefine
----			set_initial_properties
--		end
--	APPWORKS_ART_CONTAINER
--		rename
--			set_size as window_set_size,
--	--		set_initial_properties as container_set_initial_properties 
--		undefine
--			valid_handle, set_title, get_title
--		redefine
--			set_initial_properties
--		end
	
feature

--	set_initial_properties is
--		do
			--native_base_set_initial_properties
			--Precursor--container_set_initial_properties
--		end -- set_initial_properties

end -- class APPWORKS_ART_NATIVE_CONTAINER
