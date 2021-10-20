indexing
	contents:    ""
	description: "parsed `.rc' format files for the DBi service"
	library:     "AppWorks-Services"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_RC_DBI_HANDLER

inherit
	APPWORKS_DBI_HANDLER
	MEMORY
		redefine 
			dispose
		end
	GG_UTILS
	
creation
	make
	
feature

	make (s : APPWORKS_SERVICES_DBI_SERVER) is
		do
			set_server (s)
			!! my_files.make
		end -- make

	dispose is
		do
			set_server (Void)
		end
	
	begin (s: STRING) is
		local
			root : STRING
		do
--			print ("INSIDE begin%N")
			!! root.make_from_string (s)
			if root.has_suffix("/") then
				root.remove_suffix ("/")
			end
			if not (my_files.count>0) or else not my_files.find (root) then
--				my_files.insert (root, Void)
--				self._files[root] = {}
--				self._files[root]['max'] = 0
				do_begin (root) -- the real worker bee
			end
		end -- begin

	get_file_object (fn : STRING) : FILE_OBJECT is
			-- return an object that supports `readline' """
			-- TODO: this function is capable of opening *any* file on a system!!!
		local
			in : STRING
		do
			!! Result.make_read (get_file_name (fn))
			if Result.good then
				in := Result.readline
				if in /= Void and then not in.is_equal(RCSIG) then
					in := Result.readline
					if in /= Void and then not in.is_equal(RCSIG) then
						Result := Void
					end
				end
			else
				Result := Void
			end
		end -- get_file_object 

	get_file_name (root: STRING) : STRING is
		do
			if root.has_prefix ("~/") then
				Result := get_server.get_root_path + root.substring (2, root.count) + RCEXT
			elseif root.has_prefix ("/local/DBi/") then
				Result := get_server.get_root_path + root.substring (11, root.count) + RCEXT
			else
				Result := root + RCEXT
			end
		end -- get_file_name 
		
	do_begin (root: STRING) is
		local
			s           : FILE_OBJECT
			linenum     : INTEGER -- one based!!
			line        : STRING
			saved_line  : STRING
			endloop     : BOOLEAN
			name, value : STRING
			newval      : APPWORKS_DBI_VALUE
			nvdata      : APPWORKS_RC_DBI_HANDLER_DATA
			k		    : APPWORKS_RC_DBI_HANDLER_FILE
		do
			!! saved_line.make (0)
			
			s := get_file_object (root)

			if s /= Void then -- can we refactor this if??
				from
--					endloop := FALSE
				until
					endloop = TRUE
				loop
					line := s.readline
					if line = Void then
						print ("** end of file **")
						endloop := TRUE
					else
						linenum := linenum + 1
						if line.count < 2 or else line @ 1 = '#' then
							print_all (<<"skipping [", line, "]%N">>)
						else
						-- should use CONTINUED_LINE_READER
--							from
--								saved_line := line
--							until
--								not line.has_suffix ("\")
--							loop
--								line := clone(s.readline)
--								line.remove_suffix ("\")
--								if line /= Void then
--									saved_line := saved_line + line
--								end
--							end
--							line  := saved_line

							name  := clone ("")
							value := clone("")

							splitline (line, name, value)
--							print_all (<<"line  = [",  line, "]%N", 
--										 "name  = [",  name, "]%N", 
--										 "value = [", value, "]%N">>)
							
							!! nvdata.make (root, linenum)
							!! newval.make (root+"/"+name, value, Current, nvdata)
							if my_files.count>0 and then my_files.find (root) then
								k := my_files.item
								k.insert_line (linenum, newval)
								k.try_set_max (linenum)
							else
								!! k.make
								k.insert_line (linenum, newval)
								k.try_set_max (linenum)
								my_files.insert (root, k)
							end
							--end
							notify_new_value (newval)
						end
					end
				end
				s.close
			end
		end -- do_begin

	can_open (a_top : STRING; open_kind : INTEGER) : BOOLEAN is
		do
			Result := TRUE
		end -- can_open

	add_to_locker (newval: APPWORKS_DBI_VALUE) is
		do
--			not_yet_implemented
--			if is_locked then
--				get_locker.insert (value.path, value)
--			end			
		end -- add_to_locker 
		
	notify_new_value (newval: APPWORKS_DBI_VALUE) is
		do
			get_server.add (newval)
			add_to_locker  (newval)
		end -- notify_new_value

	get_quoted (line, name, value : STRING) is
		local
			i  : INTEGER
			ch : CHARACTER
		do
			from 	
				i  := 2
				ch := line @ 1
			until
				line @ (i-1) /= '\' 
					and then
				line @ i = ch
			loop
				i := i + 1
			end
			name.copy  (line.substring (1, i))
			if line.count > i+2 then
				value.copy (line.substring (i+2, line.count))
			end
		end

feature {NONE}

	RCSIG : STRING is "#AwxRCDBi"
	RCEXT : STRING is ".rc"
		
feature {NONE}

	my_files : RED_BLACK_TREE [STRING, APPWORKS_RC_DBI_HANDLER_FILE]
	
end -- class APPWORKS_RC_DBI_HANDLER
