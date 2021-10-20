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

class APPWORKS_DBI_HANDLE

creation
	make
	
feature

	make (a : APPWORKS_BASE_APP) is
		do
			my_server := a.shared_information_database --get_dbi_server
			check
				valid_dbi_server: my_server /= Void
			end
		end -- make
		
--	enum (s: STRING) : COLLECTION[APPWORKS_DBI_VALUE] is
--		do
--		end -- enum

	enum_str (s: STRING) : COLLECTION[STRING] is
		do
			Result := my_server.enum_str (s, my_root)
		end -- enum_str

	get_str (s: STRING) : STRING is
		do
			Result := "XX"
		end -- get_str

	lock (s: STRING) is
		do
		end -- lock

	unlock (s: STRING) is
		do
		end -- unlock

	set_root (s : STRING) is
		require
			s /= Void
		do
			my_root := s
		end
		
	root_is_set : BOOLEAN is
		do
			Result := (my_root /= Void)
		end -- root_is_set
	
feature {NONE}

	my_root   : STRING
	my_server : APPWORKS_SERVICES_DBI_SERVER
	
end -- class APPWORKS_DBI_HANDLE
