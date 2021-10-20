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

class APPWORKS_FILE_DESC

creation
	make
feature

	make is
		do
		end

	get_file_name : STRING is
		do
--			Result := my_fullname.substring (my_fullname.rfind ('/'), my_fullname.count)
			Result := my_fullname
			if my_fullname /= Void then 
				check Result /= Void end
			end
		end
	set_file_name (s: STRING) is	
		do
			my_fullname := get_dir_name+s
		end

	-- fullname
	set_full_name (s: STRING) is	
		do
		end
	get_full_name : STRING is
		do
		end
	
	-- dirname
	set_dir_name (s: STRING) is	
		local
			ss : STRING
		do
			ss := get_file_name
			set_full_name (s + "/" + ss)
		end
	get_dir_name  : STRING is
			-- TODO: fix this
		do
--			Result := my_fullname.substring (0, my_fullname.rfind ('/'))
			Result := ""
		end
	
	-- type
	set_type (t: like my_type) is
		do
			my_type := t
		end
	get_type : like my_type is
		do
			Result := my_type
		end

	--host
	get_host : APPWORKS_FILE_DIRHANDLER is
		do
			Result := my_host
		end
	set_host (h: APPWORKS_FILE_DIRHANDLER) is
		do
			my_host := h
		end

	--default_action
	find_default_action is
		local
			act, req : STRING
		do
			req := "~/FileTypes/" + my_type.to_string + "/Shell/Default"
			act := my_host.shared_inforation_database.get_str (req)
			if act /= Void then
				my_action.set_cmd (act)
			else
				
			end		
		end
	get_default_action : APPWORKS_BASE_ACTION is
		do
			Result := my_action
		end
	do_default_action_and_wait : APPWORKS_BASE_EVENT is
		do
			Result := my_action.exec_and_wait
		end
	do_default_action is
		do
			my_action.exec
		end

	-- size
	get_file_size : INTEGER	is
		do
			Result := my_size
		end
	set_file_size (s: INTEGER) is
		do
			my_size := s
		end

	from_string (s: STRING) is
		local
			parse : STRING
			xc,i  : INTEGER
			c     : CHARACTER
		do
			!! my_type.make_filled (' ', 10)
			-- what we want: get *up to* 10 chars
			!! parse.copy (s)
			parse.head (10)

			if parse.count = 10 then
				parse.tail (6) -- remove first 4
			else
				parse.tail (parse.count-2) -- remove first 2
			end

			from 
				i := 3
			until
				i = 1
			loop
				c := parse.first
				parse.tail (parse.count-1)

				if c.is_digit then
					xc := c.to_integer
				elseif c.is_hexadecimal_digit then
					xc := c.hexadecimal_value
				end

				xc := xc * 16
				
				c := parse.first
				parse.tail (parse.count-1)

				if c.is_digit then
					xc := xc+c.to_integer
				elseif c.is_hexadecimal_digit then
					xc := xc+c.hexadecimal_value
				end

				xc := xc * 16

--				my_type.acc_array.put (4-i, xc)
				my_type.put (xc.to_character, 4-i)
				
				i := i - 1
			end
			
		end
feature

	my_host 	: APPWORKS_FILE_DIRHANDLER
	my_fullname : STRING
	my_type 	: STRING -- AbxFileType
	my_action   : APPWORKS_BASE_ACTION 
	my_size     : INTEGER

--	AbxFileSize filesize;
--	AbxFileTime mtime, atime, ctime;
--	AbxAccess	myPerms; // TODO: AbxFileAccess/Perms(??)

end -- class APPWORKS_FILE_DESC
