class WIN32_EDITSTREAM 

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
			c_inline_c ("_res = sizeof(EDITSTREAM);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dwCookie (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EDITSTREAM*)_ptr)->dwCookie = _val;%N")
		ensure
			value_set: dwCookie = a_var
		end -- set_dwCookie

	set_dwError (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EDITSTREAM*)_ptr)->dwError = _val;%N")
		ensure
			value_set: dwError = a_var
		end -- set_dwError

	set_pfnCallback (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EDITSTREAM*)_ptr)->pfnCallback = _val;%N")
		ensure
			value_set: pfnCallback = a_var
		end -- set_pfnCallback

feature
		-- Getters

	dwCookie : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EDITSTREAM*)_ptr)->dwCookie;%N")
			Result := res
		end -- dwCookie

	dwError : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EDITSTREAM*)_ptr)->dwError;%N")
			Result := res
		end -- dwError

	pfnCallback : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((EDITSTREAM*)_ptr)->pfnCallback;%N")
			Result := res
		end -- pfnCallback

end -- class WIN32_EDITSTREAM 

