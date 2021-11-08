indexing
	contents:    "AppWorks Table Class - Win32 Native Widget Implementation"
	description: "An area that presents information in columns"
	library:     "AppWorks-Art (Win32)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

class APPWORKS_ART_TABLE_PLATFORM

inherit
	-- tags
	APPWORKS_ART_TABLE_BASE
		redefine get_header
		end
	-- impls
	APPWORKS_ART_NATIVE_WINDOW
		redefine 
			set_initial_properties,
			initial_title,
			register,
			post_create
		end
	-- imports
--	WIN32_LISTVIEW_MACROS


feature -- properties

	initial_title: STRING is 
		do Result := "<TABLE>" end
	
	set_initial_properties is 
		do
			Precursor
			set_width    (150)
			set_height   ( 50)
		end -- set_initial_properties

feature -- creation

	register is
		do
			init_list_view
			Precursor
		end

	post_create is 
		do
			create_std_window
			Precursor
			show
		end -- post_create

feature -- table ops

	clear is
		do
--			bool_res := ListView_DeleteAllItems (get_native_handle)
		end -- clear
	show_header is
		do
		end
	hide_header is
		do
		end
	
feature -- column ops

	insert_column_named (index: INTEGER; title : STRING) is
			-- maybe refactor into insert_column??
		local
--			col   : WIN32_LV_COLUMN 
			dummy : INTEGER 
		do
--			!!col.make
--			col.set_mask    (LVCF_WIDTH or LVCF_TEXT)
--			col.set_pszText (title)
--			col.set_cx      (100)
--			col.set_fmt     (LVCFMT_LEFT)
--			dummy := ListView_InsertColumn (get_native_handle, index, col)
--			cols := cols +1
		end -- insert_column

	insert_column (index: INTEGER; col: APPWORKS_ART_TABLE_HEADER) is
		do
--			win32_dummy := ListView_InsertColumn (get_native_handle, index, col.item)
--			cols := cols +1
		end -- add_column

	set_text (a_row, a_col: INTEGER; a_text : STRING) is
		require
			valid_row_check: valid_row(a_row)
			valid_col_check: valid_col(a_col)
			valid_string: a_text /= Void
		do
--			ListView_SetItemText (get_native_handle, a_row, a_col, a_text.to_external)
		end -- set_text

feature -- items

	set_item (an_item: APPWORKS_ART_TABLE_ITEM_PLATFORM) is
		do
--			bool_res := ListView_SetItem (get_native_handle, 
--				an_item.item.to_external)
		end -- add_item

	add_item (an_item: APPWORKS_ART_TABLE_ITEM_PLATFORM) is
		do
--			win32_dummy := ListView_InsertItem (get_native_handle, 
--				an_item.item.to_external)
			rows := rows + 1
		end -- add_item

feature 

	get_text (r, c : INTEGER): STRING is
		local
			item: APPWORKS_ART_TABLE_ITEM
		do
			item := get(r,c)
			if item /= Void then
				Result := item.text
			end
		end -- get_text
	
	get (r, c : INTEGER): APPWORKS_ART_TABLE_ITEM is
		require
			valid_row_check: valid_row(r)
			valid_col_check: valid_col(c)
		local
			itm_buf: STRING
		do
			if False then
				!! Result.make (Current)
				Result.get(r,c)
			else
				!! Result.make
				!! itm_buf.make (256)
				
--				ListView_GetItemText (get_native_handle, r, c, itm_buf, itm_buf.capacity)
				
--				Result.item.set (r, c, itm_buf)
--				Result.item.set_mask (LVIF_TEXT)
--				Result.item.set_cchTextMax (256)
			end
		end -- get

feature

	column_count: INTEGER is
		do
			Result := cols
		end
	
	row_count: INTEGER is
		do
			Result := rows
		end

feature

	last_row: APPWORKS_ART_TABLE_ROW
	add_row is
		do
			!!last_row.make(Current)
			rows := rows + 1
		ensure
			last_row /= Void
			last_row /= old last_row
		end

feature -- public header functions

	get_header: APPWORKS_ART_TABLE_HEADER is
		do
			if my_header = Void then
				int_get_header
			end
			Result := my_header
		end -- get_header

feature {NONE} -- private header functions
	
	int_get_header is
		do
--			my_header := ListView_GetHeader(get_native_handle)
		end
	
feature {NONE} -- static variables
	bool_res	: BOOLEAN
	
end -- class APPWORKS_ART_TABLE_PLATFORM
