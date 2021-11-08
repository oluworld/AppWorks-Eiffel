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

class APPWORKS_SERVICES_DBI_SERVER

creation
	make
	
feature

	make (an_app: APPWORKS_BASE_APP) is do end
	xmake (an_app: APPWORKS_BASE_APP) is
		local
			--rch : APPWORKS_RC_DBI_HANDLER
		do
			!! my_locked_list.make
			my_root := "/home/olu/oix/DBi"
			!! handlers.make
			!! my_entries.make
			unlock
			
			--!! rch.make (Current)
			--handlers.add_last (rch)
			--print (rch)
			--print ('%N')
		end -- make
		
feature

	enum_str (a_topkey, a_root: STRING) : COLLECTION[STRING] is
		local
			r         : COLLECTION[APPWORKS_DBI_VALUE]
			x         : LINKED_LIST[STRING]			
			r_iter    : ITERATOR_ON_TRAVERSABLE[APPWORKS_DBI_VALUE]
		do
			r := enum (a_topkey, a_root)
			!! x.make
			from
				!! r_iter.make (r)
			until
				r_iter.is_off
			loop
				x.add_last (r_iter.item.to_string)
				r_iter.next
			end
			Result := x
		ensure
			Result /= Void
		end -- enum_str

	enum (a_topkey, a_root: STRING) : COLLECTION[APPWORKS_DBI_VALUE] is
		local
			r 				: COLLECTION[APPWORKS_DBI_VALUE]
			top 			: STRING
			flag            : BOOLEAN
			handler_iter 	: ITERATOR_ON_TRAVERSABLE[APPWORKS_DBI_HANDLER]
		do
			top := translate_path (a_topkey, a_root)
			lock
			r   := my_locked_list
--			print (handlers.count)
			from
				!! handler_iter.make (handlers)
				handler_iter.start
			until
				flag = True or else handler_iter.is_off
			loop
				if handler_iter.item.can_open(top, for_enum) then
					flag := True
					print (flag)
					handler_iter.item.begin (top)
				else
					handler_iter.next
				end				
			end
			unlock			
			Result := r
		end -- enum

	get_str_or_nil, get_str (a_path, a_root : STRING) : STRING is
		local
			intermediate : APPWORKS_DBI_VALUE
		do
			Result := Void
			intermediate := get (a_path, a_root)
			if intermediate /= Void then
				Result := intermediate.to_string
			end			
		end -- get_str

	get (a_path, a_root : STRING) : APPWORKS_DBI_VALUE is
		local
			search : STRING
		do
			search := translate_path (a_path, a_root)
			if my_entries.find (search) then
				Result := my_entries.item
			else
				Result := lookup (search)
				if Result = Void then
					-- python throws an exception here
				else
					my_entries.insert (search, Result)
				end
			end
		end  -- get

	xsplit (a_str, a_sep : STRING) : LINKED_LIST[STRING] is
		local
			i       : INTEGER
			working : STRING
		do						
			from
				!! Result.make
				!! working.make
				working.copy(a_str)
			until
				i = a_str.count + 1
			loop
				i := working.index_of_string (a_sep)
				Result.add_last (working)
				working.shrink (i+a_sep.count, working.count)			
			end
			Result.reverse
		end

	progressive_parse (a_str, a_sep : STRING; a_col : COLLECTION[STRING]) is
			-- IGNORE: it is the callers' job to clear the collection
		local
			r: LINKED_LIST[STRING]
			x: INTEGER
		do
			a_col.clear			
			r := xsplit (a_str, a_sep)
			if r /= Void then			
				check
					r.count > 0
				end
				
				from 
					x := r.count
				until 
					x = 0
				loop
					x.add_last(r.item)
					x := x - 1
				end
			end
		end -- progressive_parse

	lookup (a_path : STRING) : APPWORKS_DBI_VALUE is
		local
			new_action 		: BOOLEAN
			flag            : BOOLEAN
			handler_iter 	: ITERATOR_ON_TRAVERSABLE[APPWORKS_DBI_HANDLER]
			b               : COLLECTION[STRING]
			parse_path      : ITERATOR_ON_TRAVERSABLE[STRING]
			top             : STRING
		do
			Result := Void
			new_action := True -- False
			if new_action then
				b := progressive_parse (a_path, "/")
--				for parsePath in b:
--					if fileSystem.exists(parsePath):
--						h = self.handlerForPath(parsePath)
--						if h:
--							rv = h.getValue(path)
--						else:
--							self.log('No handler for path %s' % parsePath)
			else
				from
					!! handler_iter.make (handlers)
					handler_iter.start
				until
					handler_iter.is_off or else flag = True
				loop					
					if handler_iter.item.can_open(top, for_get) then
						-- place iterdata at top of handler stack
						flag   := True
						Result := handler_iter.item.get_value (a_path)
					else
						handler_iter.next
					end				
				end
				-- throws an exception in AbxLib
			end				
		end  -- lookup

	translate_path (a_path, a_root : STRING): STRING is
		local
			path, root : STRING
		do
			!!Result
			!!path.make
			path.copy(a_path)
			!!root.make
			root.copy(a_root)
			
			--path   := 
			fix_path_int (path, root)
			if not path.has_prefix (root) then
				if root.count > 0 then
					Result.append_string (root)
				end
				if not Result.has_suffix ("/") then
					Result.append_character ('/')
				end
			end
			Result.append_string (path)
		end
		
	get_root_path : STRING is
		do
			Result := my_root
		end

	add (line: APPWORKS_DBI_VALUE) is
		do
			my_entries.insert (line.path, line)
--			if self.locked:
--				self.lockedlist.append(line)
--			end		
		end
		
feature {NONE}

	fix_path_int (a_path, a_root : STRING) is -- : STRING is
		do
			if a_root = Void then
				a_root.copy("/local/DBi/")
			end
			a_root.copy( replace_begin (a_root, "~/", "/local/DBi/") )
			a_path.copy( replace_begin (a_path, "~/", "/local/DBi/") )
--			a_path.copy( replace_begin (a_path, "./", a_root) )
		ensure
			a_path /= Void
			a_root /= Void
		end
					
	replace_begin (instr, replacethis, withthis : STRING) : STRING is
		do
			if instr.has_prefix (replacethis) then
				Result := withthis + instr.substring (replacethis.count+1, instr.count)
			else
				Result := instr
			end
		end
		
	lock is
		do
			my_locked := True
		end -- lock

	unlock  is
		do
			my_locked := False
			my_locked_list.clear
		end -- unlock

feature

	for_enum : INTEGER is 1
	for_get  : INTEGER is 0
		
feature {NONE}

	my_root        : STRING
	my_locked      : BOOLEAN
	my_locked_list : LINKED_LIST [APPWORKS_DBI_VALUE]
	handlers       : LINKED_LIST [APPWORKS_DBI_HANDLER]
	my_entries     : RED_BLACK_TREE [STRING, APPWORKS_DBI_VALUE] 
	
end -- class APPWORKS_SERVICES_DBI_SERVER
