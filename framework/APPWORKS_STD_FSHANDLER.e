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

class APPWORKS_STD_FSHANDLER

feature

-- APPWORKS_FILE_PERMS
	can_open (path : STRING; perm : INTEGER) : BOOLEAN is
		deferred
--		do
--			Result := FALSE
		end

	enumerate (spec : STRING) : COLLECTION[APPWORKS_FILE_DESC] is
		require
			FALSE
		ensure
			valid_result: Result /= Void
		end -- enumerate
		
	enumerate_first_by_name (spec : STRING) : APPWORKS_FILE_DESC is
		require
			FALSE
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

	handle (evt : EVENT) : EVENT is
		require
			FALSE
		do
		end -- handle
		
end -- class APPWORKS_STD_FSHANDLER
