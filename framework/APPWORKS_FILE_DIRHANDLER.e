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

class APPWORKS_FILE_DIRHANDLER
--  AppWorks::File::iDirHandler

feature

	get_class_type : STRING is "AppClass.DirHandler"

	get_root : STRING is
		do
			Result := my_root
		end -- get_root

-- APPWORKS_FILE_PERMS
	can_open (path : STRING; perm : INTEGER) : BOOLEAN is
		deferred
--		do
--			Result := FALSE
		end

	enumerate (spec : STRING) : COLLECTION[APPWORKS_FILE_DESC] is
		deferred
		ensure
			valid_result: Result /= Void
		end -- enumerate
		
	enumerate_first_by_name (spec : STRING) : APPWORKS_FILE_DESC is
		deferred
		ensure
			valid_result: Result /= Void
		end -- enumerate_first_by_name

	insert (desc : APPWORKS_FILE_DESC) : BOOLEAN is
		require
			FALSE
		do
		end -- insert

	unlink (desc : APPWORKS_FILE_DESC) : BOOLEAN is
		require
			FALSE
		do
		end -- unlink

	open   (desc 	: APPWORKS_FILE_DESC;
	 		perms   : INTEGER;
			flags   : INTEGER) : APPWORKS_FILE_HANDLE is
		require
			FALSE
		do
		end -- open

	reopen (handle 	: APPWORKS_FILE_HANDLE;
	 		perms   : INTEGER;
			flags   : INTEGER) : APPWORKS_FILE_HANDLE is
		require
			FALSE
		do
		end -- reopen
		
	close (handle 	: APPWORKS_FILE_HANDLE) : BOOLEAN is 
		require
			FALSE
		do
		end -- close
		
	write (	handle 	: APPWORKS_FILE_HANDLE; 
			data 	: APPWORKS_UTIL_BYTESTREAM; 
			size	: INTEGER) : INTEGER is
		require
			FALSE
		do
		end -- write
		
	read (handle : APPWORKS_FILE_HANDLE; size : INTEGER) : APPWORKS_UTIL_BYTESTREAM is
		require
			FALSE
		do
		end -- read

--	def seek(self, amt, dir, pos):
--		""" amt:uint dir:(*forward*, backward) pos:(beg, end, *cur*) """
--		require
--			FALSE

	set_params(handle : APPWORKS_FILE_HANDLE; params : ANY) is
		require
			FALSE
		do
		end -- set_params

	handle (evt : EVENT) : EVENT is
		require
			FALSE
		do
		end -- handle
		
	shared_information_database : APPWORKS_SERVICES_DBI_SERVER is
			-- it is a possibility that we should be
			-- supplied with this by MAIN_LOGIC (co sima)
		once 
			!! Result.make (Current)
		end -- shared_information_database 
		
end -- class APPWORKS_FILE_DIRHANDLER
