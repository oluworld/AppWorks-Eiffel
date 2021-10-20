class WIN32_BY_HANDLE_FILE_INFORMATION 

inherit 
	C_STRUCTURE 
		redefine
			external_size
		end

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			c_inline_c ("_res = sizeof(BY_HANDLE_FILE_INFORMATION);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dwFileAttributes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->dwFileAttributes = _val;%N")
		ensure
			value_set: dwFileAttributes = a_var
		end -- set_dwFileAttributes

	set_ftCreationTime (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftCreationTime = *((FILETIME*)_val);%N")
		ensure
			value_set: ftCreationTime = a_var
		end -- set_ftCreationTime

	set_ftLastAccessTime (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftLastAccessTime = *((FILETIME*)_val);%N")
		ensure
			value_set: ftLastAccessTime = a_var
		end -- set_ftLastAccessTime

	set_ftLastWriteTime (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftLastWriteTime = *((FILETIME*)_val);%N")
		ensure
			value_set: ftLastWriteTime = a_var
		end -- set_ftLastWriteTime

	set_dwVolumeSerialNumber (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->dwVolumeSerialNumber = _val;%N")
		ensure
			value_set: dwVolumeSerialNumber = a_var
		end -- set_dwVolumeSerialNumber

	set_nFileSizeHigh (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileSizeHigh = _val;%N")
		ensure
			value_set: nFileSizeHigh = a_var
		end -- set_nFileSizeHigh

	set_nFileSizeLow (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileSizeLow = _val;%N")
		ensure
			value_set: nFileSizeLow = a_var
		end -- set_nFileSizeLow

	set_nNumberOfLinks (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->nNumberOfLinks = _val;%N")
		ensure
			value_set: nNumberOfLinks = a_var
		end -- set_nNumberOfLinks

	set_nFileIndexHigh (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileIndexHigh = _val;%N")
		ensure
			value_set: nFileIndexHigh = a_var
		end -- set_nFileIndexHigh

	set_nFileIndexLow (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileIndexLow = _val;%N")
		ensure
			value_set: nFileIndexLow = a_var
		end -- set_nFileIndexLow

feature
		-- Getters

	dwFileAttributes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->dwFileAttributes;%N")
			Result := res
		end -- dwFileAttributes

	ftCreationTime : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftCreationTime);%N")
			Result := res
		end -- ftCreationTime

	ftLastAccessTime : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftLastAccessTime);%N")
			Result := res
		end -- ftLastAccessTime

	ftLastWriteTime : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((BY_HANDLE_FILE_INFORMATION*)_ptr)->ftLastWriteTime);%N")
			Result := res
		end -- ftLastWriteTime

	dwVolumeSerialNumber : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->dwVolumeSerialNumber;%N")
			Result := res
		end -- dwVolumeSerialNumber

	nFileSizeHigh : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileSizeHigh;%N")
			Result := res
		end -- nFileSizeHigh

	nFileSizeLow : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileSizeLow;%N")
			Result := res
		end -- nFileSizeLow

	nNumberOfLinks : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->nNumberOfLinks;%N")
			Result := res
		end -- nNumberOfLinks

	nFileIndexHigh : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileIndexHigh;%N")
			Result := res
		end -- nFileIndexHigh

	nFileIndexLow : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BY_HANDLE_FILE_INFORMATION*)_ptr)->nFileIndexLow;%N")
			Result := res
		end -- nFileIndexLow

end -- class WIN32_BY_HANDLE_FILE_INFORMATION 

