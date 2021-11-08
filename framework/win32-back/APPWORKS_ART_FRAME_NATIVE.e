indexing
	contents:    "AppWorks Frame Window - Win32 Native Part Implementation"
	description: "A window that appears on the top level"
	library:     "AppWorks-Art (Win32)"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently

deferred class APPWORKS_ART_FRAME_NATIVE

inherit
	WIN32_WINDOW_STYLE_CONSTANTS
	
feature
		
	get_style : INTEGER_32 is
		do
			Result := WS_OVERLAPPEDWINDOW
		end -- get_style

feature

	get_default_desktop: APPWORKS_ART_CONTAINER is
		once
			!!Result.make
			Result.set_native_handle (GetDesktopWindow)
		end -- get_default_desktop 
	
end -- class APPWORKS_ART_FRAME_NATIVE
