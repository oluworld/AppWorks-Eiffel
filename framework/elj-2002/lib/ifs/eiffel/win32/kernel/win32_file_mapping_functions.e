class WIN32_FILE_MAPPING_FUNCTIONS

inherit
	WIN32_FILE_MAPPING_CONSTANTS

feature {NONE}

	-- CreateFileMapping

	CreateFileMapping (a_hFile : POINTER;
		a_pFileMappingAttributes : POINTER;
		a_flProtect : BIT 32;
		a_dwMaximumSizeHigh : INTEGER;
		a_dwMaximumSizeLow : INTEGER;
		a_pName : POINTER) : POINTER is
--	CreateFileMapping (a_hFile : POINTER;
--		a_pFileMappingAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_flProtect : INTEGER;
--		a_dwMaximumSizeHigh : INTEGER;
--		a_dwMaximumSizeLow : INTEGER;
--		a_pName : STRING) : POINTER is
			-- The CreateFileMapping function creates a named or
			-- unnamed file-mapping object for the specified file.
		external "C use <windows.h>"
		end -- CreateFileMapping

	-- FlushViewOfFile

	FlushViewOfFile (a_lpBaseAddress : POINTER;
		a_dwNumberOfBytesToFlush : INTEGER) : BOOLEAN is
			-- The FlushViewOfFile function writes to the disk a
			-- byte range within a mapped view of a file. 
		external "C use <windows.h>"
		end -- FlushViewOfFile

	-- MapViewOfFile

	MapViewOfFile (a_hFileMappingObject : POINTER;
		a_dwDesiredAccess : INTEGER;
		a_dwFileOffsetHigh : INTEGER;
		a_dwFileOffsetLow : INTEGER;
		a_dwNumberOfBytesToMap : INTEGER) : POINTER is
			-- The MapViewOfFile function maps a view of a file into
			-- the address space of the calling process. 
		external "C use <windows.h>"
		end -- MapViewOfFile

	-- MapViewOfFileEx

	MapViewOfFileEx (a_hFileMappingObject : POINTER;
		a_dwDesiredAccess : INTEGER;
		a_dwFileOffsetHigh : INTEGER;
		a_dwFileOffsetLow : INTEGER;
		a_dwNumberOfBytesToMap : INTEGER;
		a_lpBaseAddress : POINTER) : POINTER is
			-- The MapViewOfFileEx function maps a view of a file
			-- into the address space of the calling process. This
			-- extended function allows the calling process to specify
			-- a suggested memory address for the mapped view. This
			-- function is available for Win32-based applications
			-- only. 
		external "C use <windows.h>"
		end -- MapViewOfFileEx

	-- OpenFileMapping

	OpenFileMapping (a_dwDesiredAccess : INTEGER;
		a_bInheritHandle : BOOLEAN;
		a_pName : POINTER) : POINTER is
--	OpenFileMapping (a_dwDesiredAccess : INTEGER;
--		a_bInheritHandle : BOOLEAN;
--		a_pName : STRING) : POINTER is
			-- The OpenFileMapping function opens a named file-mapping
			-- object. 
		external "C use <windows.h>"
		end -- OpenFileMapping

	-- UnmapViewOfFile

	UnmapViewOfFile (a_lpBaseAddress : POINTER) : BOOLEAN is
			-- The UnmapViewOfFile function unmaps a mapped view
			-- of a file from the calling process's address space.
		external "C use <windows.h>"
		end -- UnmapViewOfFile

end -- class WIN32_FILE_MAPPING_FUNCTIONS