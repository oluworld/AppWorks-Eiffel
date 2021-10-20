indexing
	description: "win32 impl for table header"
	library:     "AppWorks-Art (win32)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      not_complete
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_ART_TABLE_HEADER_PLATFORM

inherit
	-- interface
	APPWORKS_ART_TABLE_HEADER
	-- imports
	WIN32_LISTVIEW_MACROS

creation
	make

feature

	make is
		do
			!ARRAY[WIN32_LV_COLUMN]!items.make(0,9)
		end -- make

feature

	add_native_column (a_column: WIN32_LV_COLUMN) is
		do
			items.add_last(a_column)
		end -- add_native_column 

feature

	get_title_of (index: INTEGER): STRING is
		local
			col: WIN32_LV_COLUMN
		do
			if ListView_GetColumn (get_native_handle, index, col) then
				Result := col.pszText
			else
				win32_fail(430)
			end
		end
	
	set_title_of (i: INTEGER; s: STRING) is
		local
			col: WIN32_LV_COLUMN
		do
			--col := items @ i
			if ListView_GetColumn (get_table_handle, index, col) then
				col.set_pszText(title)
				if not ListView_SetColumn (get_table_handle, index, col) then
					win32_fail (421)
				end
			else
				win32_fail (420)
			end
		end -- set_title
	
	get_table_handle: POINTER is
		do
			Result := my_table.get_native_handle
		end
	
feature

	win32_failure: INTEGER
	win32_fail (i: INTEGER) is
		do
			win32_failure := i
		end

feature {APPWORKS_ART_TABLE_PLATFORM, APPWORKS_ART_TABLE_HEADER_PLATFORM}

--	item    : WIN32_LV_COLUMN 
	items   : COLLECTION[WIN32_LV_COLUMN ]
	
	my_table: APPWORKS_ART_TABLE_PLATFORM

feature {NONE} -- static variables
	bool_res	: BOOLEAN
	win32_dummy : INTEGER

end -- class APPWORKS_ART_TABLE_HEADER_PLATFORM
