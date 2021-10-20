indexing
	contents:    "Cursor - Win32 Native Implementation"
	description: "Enables changing of onscreen cursor"
	library:     "AppWorks/Art/Win32"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_ART_CURSOR

inherit
	WIN32_CURSOR_FUNCTIONS
	APPWORKS_ART_CURSOR_CONSTANTS

feature

	from_std (s: STRING) is
			-- TODO: use constants/enum instead of strings
		do
			make_res
			if cursor_map.find (s) then
				my_cursor_handle := LoadCursor(default_pointer, cursor_map.item)
			else
				print ("~~ cant find cursor%N")
			end
		ensure
			valid_cursor_handle: my_cursor_handle /= default_pointer
		end
		
	enable is
		do
			my_prev_cursor_handle := SetCursor (my_cursor_handle)
		end -- enable

	disable is
		do
			my_cursor_handle := SetCursor (my_prev_cursor_handle)
		ensure 
			my_cursor_handle = old my_cursor_handle 
		end -- disable

	make_res is
		once
			!! cursor_map.make
			cursor_map.insert (CURSOR_NORMAL,		IDC_ARROW)
			cursor_map.insert (CURSOR_NS,			IDC_SIZENS)
			cursor_map.insert (CURSOR_WE,			IDC_SIZEWE)
			cursor_map.insert (CURSOR_ALL,			IDC_SIZEALL)
			cursor_map.insert (CURSOR_HAND,			IDC_HAND)
			cursor_map.insert (CURSOR_TEXT,			IDC_IBEAM)
			cursor_map.insert (CURSOR_WAIT,			IDC_WAIT)
			cursor_map.insert (CURSOR_CROSS,		IDC_CROSS)
			cursor_map.insert (CURSOR_UPARROW,		IDC_UPARROW)
			cursor_map.insert (CURSOR_NWSE,			IDC_SIZENWSE)
			cursor_map.insert (CURSOR_NESW,			IDC_SIZENESW)
			cursor_map.insert (CURSOR_NO,			IDC_NO)
			cursor_map.insert (CURSOR_HELP,			IDC_HELP)
			cursor_map.insert (CURSOR_APPSTARTING,	IDC_APPSTARTING)
		end

feature {NONE}

	my_prev_cursor_handle : POINTER
	my_cursor_handle      : POINTER
 
feature {APPWORKS_ART_CURSOR}

	cursor_map : RED_BLACK_TREE [STRING, POINTER]

end -- class APPWORKS_ART_CURSOR
