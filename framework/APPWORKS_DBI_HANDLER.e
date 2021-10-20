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

class APPWORKS_DBI_HANDLER

--creation
--	make
	
feature

	get_server : APPWORKS_SERVICES_DBI_SERVER is
		do
			Result := my_server
		end -- get_server
		
	set_server (s : APPWORKS_SERVICES_DBI_SERVER) is
		do
			my_server := s
		end -- set_server
		
	begin (s: STRING) is
		deferred
		end -- begin

	can_open (a_top : STRING; open_kind : INTEGER) : BOOLEAN is
		deferred
		end -- can_open

feature {NONE}

	my_root   : STRING
	my_server : APPWORKS_SERVICES_DBI_SERVER
	
end -- class APPWORKS_DBI_HANDLER
