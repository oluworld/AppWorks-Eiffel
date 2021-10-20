indexing
	contents:    "Cursor Names"
	description: "Contains the cursor names"
	library:     "AppWorks/Art/Win32"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      yes
	todo:		 "use enums instead of strings"
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

expanded class APPWORKS_ART_CURSOR_CONSTANTS

feature
	
	CURSOR_NORMAL      : STRING is "normal"
	CURSOR_NS          : STRING is "size_ns"
	CURSOR_WE          : STRING is "size_we"
	CURSOR_ALL         : STRING is "size_all"
	CURSOR_HAND        : STRING is "hand"
	CURSOR_TEXT        : STRING is "text"
	CURSOR_WAIT        : STRING is "wait"
	CURSOR_CROSS       : STRING is "cross"
	CURSOR_UPARROW     : STRING is "uparrow"
	CURSOR_NWSE        : STRING is "nwse"
	CURSOR_NESW        : STRING is "nesw"
	CURSOR_NO          : STRING is "illegal"
	CURSOR_HELP        : STRING is "assist"
	CURSOR_APPSTARTING : STRING is "waitforapp"

end -- class APPWORKS_ART_CURSOR_CONSTANTS
