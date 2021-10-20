indexing
	contents:    "AppWorks Table[Base] Class"
	description: "A table presents information in rows and resizable columns"
	library:     "AppWorks-Art"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"

deferred class APPWORKS_ART_TABLE_BASE

inherit
	APPWORKS_ART_WINDOW_TAG
	
feature

	clear is
		deferred
		end -- clear
	show_header is
		deferred
		end
	hide_header is
		deferred
		end

feature

	get_column_title (index: INTEGER): STRING is
		do
			my_header.get_title_of (index)
		ensure
			Result /= Void
		end -- get_column_title

	insert_column_named (index: INTEGER; title : STRING) is
			-- put new column title before index
		deferred
		ensure
			column_count = old column_count+1
		end -- insert_column
	
	insert_column (index: INTEGER; col: APPWORKS_ART_TABLE_HEADER) is
		deferred
		ensure
			column_count = old column_count+1
		end -- add_column
	
	add_item (an_item: APPWORKS_ART_TABLE_ITEM) is
		deferred
		ensure
			row_count = old row_count + 1
		end -- add_item

	set_text (a_row, a_col: INTEGER; a_text : STRING) is
		require
			valid_row_check: valid_row(a_row)
			valid_col_check: valid_col(a_col)
		deferred
		end -- set_text
	
	set_item (an_item: APPWORKS_ART_TABLE_ITEM_PLATFORM) is
			-- ack! what a kludge!!
		deferred
		end -- add_item

feature

	column_count: INTEGER is
		deferred
		ensure
			Result >= 0
		end -- column_count
	
	row_count: INTEGER is
		deferred
		end

feature

	set_column_title (index: INTEGER; title: STRING) is
		do
			my_header.set_title (index, title)
		ensure
			get_column_title(index).is_equal (title)
		end -- set_column_title 

	add_column (title: STRING) is
		do
			insert_column_named (cols, title)
		ensure
			column_count = old column_count+1
		end -- add_column 

feature

	my_header: APPWORKS_ART_TABLE_HEADER
	
	valid_row (r : INTEGER) : BOOLEAN is
		do
			Result := ((r >= 0) and (r <= rows))
		end -- valid_row
	
	valid_col (c : INTEGER) : BOOLEAN is
		do
			Result := ((c >= 0) and (c <= cols))
		end -- valid_col
	
	rows, cols: INTEGER
	
feature

feature -- public header functions

	set_header (h : APPWORKS_ART_TABLE_HEADER) is
		require 
			h /= Void -- ??
		do 
			my_header := h
		ensure
			my_header = h
		end -- set_header

	get_header: APPWORKS_ART_TABLE_HEADER is
		do
			Result := my_header
		ensure
			non_null_result: Result /= Void
			correct_result:  Result = my_header 
		end -- get_header

end -- class APPWORKS_ART_TABLE_BASE
