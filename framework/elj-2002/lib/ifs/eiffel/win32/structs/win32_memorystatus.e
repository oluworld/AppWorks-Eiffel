class WIN32_MEMORYSTATUS 

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
			c_inline_c ("_res = sizeof(MEMORYSTATUS);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dwLength (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->abcA = _val;%N")
		ensure
			value_set: dwLength = a_var
		end -- set_dwLength

	set_dwMemoryLoad (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwMemoryLoad = _val;%N")
		ensure
			value_set: dwMemoryLoad = a_var
		end -- set_dwMemoryLoad

	set_dwTotalPhys (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwTotalPhys = _val;%N")
		ensure
			value_set: dwTotalPhys = a_var
		end -- set_dwTotalPhys

	set_dwAvailPhys (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwAvailPhys = _val;%N")
		ensure
			value_set: dwAvailPhys = a_var
		end -- set_dwAvailPhys

	set_dwTotalPageFile (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwTotalPageFile = _val;%N")
		ensure
			value_set: dwTotalPageFile = a_var
		end -- set_dwTotalPageFile

	set_dwAvailPageFile (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwAvailPageFile = _val;%N")
		ensure
			value_set: dwAvailPageFile = a_var
		end -- set_dwAvailPageFile

	set_dwTotalVirtual (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwTotalVirtual = _val;%N")
		ensure
			value_set: dwTotalVirtual = a_var
		end -- set_dwTotalVirtual

	set_dwAvailVirtual (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORYSTATUS*)_ptr)->dwAvailVirtual = _val;%N")
		ensure
			value_set: dwAvailVirtual = a_var
		end -- set_dwAvailVirtual

feature
		-- Getters

	dwLength : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwLength;%N")
			Result := res
		end -- dwLength

	dwMemoryLoad : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwMemoryLoad;%N")
			Result := res
		end -- dwMemoryLoad

	dwTotalPhys : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwTotalPhys;%N")
			Result := res
		end -- dwTotalPhys

	dwAvailPhys : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwAvailPhys;%N")
			Result := res
		end -- dwAvailPhys

	dwTotalPageFile : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwTotalPageFile;%N")
			Result := res
		end -- dwTotalPageFile

	dwAvailPageFile : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwAvailPageFile;%N")
			Result := res
		end -- dwAvailPageFile

	dwTotalVirtual : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwTotalVirtual;%N")
			Result := res
		end -- dwTotalVirtual

	dwAvailVirtual : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORYSTATUS*)_ptr)->dwAvailVirtual;%N")
			Result := res
		end -- dwAvailVirtual

end -- class WIN32_MEMORYSTATUS 

