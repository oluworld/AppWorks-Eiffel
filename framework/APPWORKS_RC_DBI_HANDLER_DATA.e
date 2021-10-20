indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_RC_DBI_HANDLER_DATA

creation
	make
feature

	make (s: STRING; i: INTEGER) is
		do
			my_s := s
			my_i := i
		end -- make

feature

	my_s : STRING
	my_i : INTEGER
	
end -- class APPWORKS_RC_DBI_HANDLER_DATA
