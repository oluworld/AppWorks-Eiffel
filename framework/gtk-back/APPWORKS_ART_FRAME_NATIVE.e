indexing
	contents:    "AppWorks Frame Window - Win32 Native Widget Implementation"
	description: "A window that appears over all other windows"
	library:     "AppWorks-Art (Gtk)"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently

deferred class APPWORKS_ART_FRAME_NATIVE

feature

	get_default_desktop: APPWORKS_ART_CONTAINER is
		once
			!!Result.make
--			Result.set_native_handle (GetDesktopWindow)
		end -- get_default_desktop 

end -- class APPWORKS_ART_FRAME
