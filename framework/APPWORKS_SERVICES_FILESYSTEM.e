indexing
	contents:    "AppWorks FileSystem"
	description: "Oversees basically all FileSystem operations (open, read, write, etc)"
	library:     "AppWorks/File && AppWorks/Services"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_SERVICES_FILESYSTEM

creation
	make
	
feature
	make is
		do
			!! my_handlers.make
		end -- make

	ENUMERATE_PERM : INTEGER is 4
	
	enumerate (spec : STRING) : COLLECTION[APPWORKS_FILE_DESC] is
		local
			iter  : ITERATOR_ON_LINKED_LIST[APPWORKS_FILE_DIRHANDLER]
			found : BOOLEAN
		do
			if my_handlers.count > 0 then
				from
					!! iter.make (my_handlers)
					iter.start
				until
					found or else iter.is_off
				loop
					if iter.item.can_open (spec, ENUMERATE_PERM) then
						Result := iter.item.enumerate (spec)
						found  := True
					end
					iter.next
				end
			end			
		end -- enumerate
		
	enumerate_first_by_name (spec : STRING) : APPWORKS_FILE_DESC is
		do
			
		end -- enumerate_first_by_name

	open (	a_file_name : STRING;
			a_mode 		: APPWORKS_FILE_PERMS;
			a_flag_spec	: APPWORKS_FILE_OPENFLAGS
			) : APPWORKS_FILE_HANDLE
 is
		do
			
print ("oixfs.open ")
			print (a_file_name)
			print ("%N")
		end -- open

	xopen (a_file_name : STRING) : APPWORKS_FILE_HANDLE is
		do
			
print ("oixfs.open ")
			print (a_file_name)
			print ("%N")
		end -- open

feature {NONE}

	xunlink (desc : APPWORKS_FILE_DESC) : BOOLEAN is
		do
			desc.get_host.unlink (desc)
		end -- unlink

feature

	my_handlers : LINKED_LIST[APPWORKS_FILE_DIRHANDLER]

end -- class APPWORKS_SERVICES_FILESYSTEM
