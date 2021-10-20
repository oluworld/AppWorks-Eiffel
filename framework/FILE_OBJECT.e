indexing
	contents:    "AppWorks FileObject"
	description: "A helper class for RC_DBi_Handler"
	library:     "AppWorks/Unofficial"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   probably
	tested:      should work
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"
	notes: "we should connect to a AwxFile object instead"

class FILE_OBJECT

inherit
	GG_UTILS

creation
	make_read
feature
	make_read (fn : STRING) is
		do
			!! my_file_obj.connect_to (fn)
		end

	good : BOOLEAN is
		do
			Result := my_file_obj.is_connected
		end

	close is
		do
			my_file_obj.disconnect
		end

	readline : STRING is
		do
			if good then
				if not my_file_obj.end_of_input then				
					!! Result.make (256) -- TODO: should we use blank here?
					my_file_obj.read_line_in (Result)
				else
					Result := Void 
				end
--				print_all (<<"FILE_OBJECT reads %N%T", Result, "%N">>)
			end
		ensure
			void_result: Result = Void implies my_file_obj.end_of_input
		end
		
feature

	my_file_obj : TEXT_FILE_READ

end -- class FILE_OBJECT
