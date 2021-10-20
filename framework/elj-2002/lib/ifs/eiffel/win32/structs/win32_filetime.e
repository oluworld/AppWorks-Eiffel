class WIN32_FILETIME

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
			c_inline_c ("_res = sizeof(FILETIME);%N")
			Result := res
		end -- external_size
	
feature
		-- setters

	set_dwLowDateTime (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((FILETIME*)_ptr)->dwLowDateTime = _val;%N")
		end -- set_dwLowDateTime

	set_dwHighDateTime (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((FILETIME*)_ptr)->dwHighDateTime = _val;%N")
		end -- set_dwHighDateTime

feature
		-- getters

	dwLowDateTime : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((FILETIME*)_ptr)->dwLowDateTime;%N")
			Result := res
		end -- c_dwLowDateTime

	dwHighDateTime : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((FILETIME*)_ptr)->dwHighDateTime;%N")
			Result := res
		end -- dwHighDateTime

end -- class WIN32_FILETIME