class WIN32_HANDLES_AND_OBJECTS_FUNCTIONS


feature {NONE}

	-- CloseHandle

	CloseHandle (a_hObject_deref : POINTER) : BOOLEAN is
			-- The CloseHandle function closes an open object handle.
		external "C use <windows.h>"
		end -- CloseHandle

	-- DuplicateHandle

	DuplicateHandle (a_hSourceProcessHandle_deref : POINTER;
				a_hSourceHandle_deref : POINTER;
				a_hTargetProcessHandle_deref : POINTER;
				a_TargetHandle : POINTER;
				a_dwDesiredAccess : INTEGER;
				a_bInheritHandle : BOOLEAN;
				a_dwOptions : INTEGER) : BOOLEAN is
			-- The DuplicateHandle function duplicates an object
			-- handle. 
		external "C use <windows.h>"
		end -- DuplicateHandle

	 TargetHandle : INTEGER

	-- GetHandleInformation

	GetHandleInformation (a_hObject_deref : POINTER;
				a_dwFlags : POINTER) : BOOLEAN is
--	GetHandleInformation (a_hObject_deref : WIN32_HANDLE;
--				a_dwFlags : INTEGER_REF) : BOOLEAN is
			-- The GetHandleInformation function obtains information
			-- about certain properties of an object handle. The information
			-- is obtained as a set of bit flags. [New - Windows NT]
		external "C use <windows.h>"
		end -- GetHandleInformation

	-- SetHandleInformation

	SetHandleInformation (a_hObject_deref : POINTER;
				a_dwMask : INTEGER;
				a_dwFlags : INTEGER) : BOOLEAN is
--	SetHandleInformation (a_hObject_deref : WIN32_HANDLE;
--				a_dwMask : INTEGER;
--				a_dwFlags : INTEGER) : BOOLEAN is
			-- The SetHandleInformation function sets certain properties
			-- of an object handle. The information is specified as
			-- a set of bit flags. [New - Windows NT]
		external "C use <windows.h>"
		end -- SetHandleInformation

end -- class WIN32_HANDLES_AND_OBJECTS_FUNCTIONS