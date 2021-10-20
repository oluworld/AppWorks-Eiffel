indexing
	contents:    "Cursor - Gtk Implementation"
	description: "Enables changing of onscreen cursor"
	library:     "AppWorks/Art/Gtk"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_ART_CURSOR

inherit
	GDK_CURSOR 
		export 
			{NONE} all
		end
	GDK_CURSOR_ENUM

feature

	from_std (s: STRING) is
			-- TODO: use constants/enum instead of strings, like Gdk
		do
			make_res
			if cursor_map.find (s) then
				my_cursor_handle := gdk_cursor_new (cursor_map.item)
			else
				print ("~~ cant find cursor%N")
			end
		ensure
			valid_cursor_handle: my_cursor_handle /= default_pointer
		end
		
	enable (win: APPWORKS_ART_WINDOW) is
		do
			my_prev_cursor_handle := gdk_set_cursor (win.gdk_handle, my_cursor_handle)
		end -- enable

	disable  (win: APPWORKS_ART_WINDOW) is
		do
			my_cursor_handle := gdk_set_cursor (win.gdk_handle, my_prev_cursor_handle)
		ensure 
			my_cursor_handle = old my_cursor_handle 
		end -- disable

	make_res is
		once
			!! cursor_map.make 
			cursor_map.insert (CURSOR_NORMAL,		Gdk_arrow)
			cursor_map.insert (CURSOR_NS,			Gdk_sb_v_double_arrow)
			cursor_map.insert (CURSOR_WE,			Gdk_sb_h_double_arrow)
			cursor_map.insert (CURSOR_ALL,			0)--IDC_SIZEALL)
			cursor_map.insert (CURSOR_HAND,			0)--IDC_HAND)
			cursor_map.insert (CURSOR_TEXT,			0)--IDC_IBEAM)
			cursor_map.insert (CURSOR_WAIT,			0)--IDC_WAIT)
			cursor_map.insert (CURSOR_CROSS,		Gdk_crosshair)
			cursor_map.insert (CURSOR_UPARROW,		0)--IDC_UPARROW)
			cursor_map.insert (CURSOR_NWSE,			Gdk_top_left_corner)
			cursor_map.insert (CURSOR_NESW,			Gdk_bottom_left_corner)
			cursor_map.insert (CURSOR_NO,			0)--IDC_NO)
			cursor_map.insert (CURSOR_HELP,			0)--IDC_HELP)
			--~ cursor_map.insert (CURSOR_APPSTARTING,	Gdk_clock)
		end

feature {NONE} -- externals

	gdk_cursor_new (cursor_type : INTEGER) : POINTER is
		external "C_WithoutCurrent"
		end
	gdk_set_cursor (win : POINTER; cur : INTEGER) is
		external "C_WithoutCurrent"
		end
	
feature {NONE}
	my_prev_cursor_handle : POINTER
	my_cursor_handle      : POINTER
 
feature {APPWORKS_ART_CURSOR}

	cursor_map : RED_BLACK_TREE [STRING, INTEGER]

end -- class APPWORKS_ART_CURSOR
