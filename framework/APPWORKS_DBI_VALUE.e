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

class APPWORKS_DBI_VALUE

creation
	make
	
feature

	make (name, value : STRING; handler : APPWORKS_DBI_HANDLER; data : ANY) is 
			-- (a : APPWORKS_BASE_APP) is
		do
--			my_server := a.get_dbi_server
			my_path := name
		end -- make

	to_string : STRING is
		do
		end

	path : STRING is
		do
			Result := my_path
		end
					
feature {NONE}


	my_path : STRING
end -- class APPWORKS_DBI_VALUE
