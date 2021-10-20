class WIN32_KERNINGPAIR 

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
			c_inline_c ("_res = sizeof(KERNINGPAIR);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_wFirst (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((KERNINGPAIR*)_ptr)->wFirst = _val;%N")
		ensure
			value_set: wFirst = a_var
		end -- set_wFirst

	set_wSecond (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((KERNINGPAIR*)_ptr)->wSecond = _val;%N")
		ensure
			value_set: wSecond = a_var
		end -- set_wSecond

	set_iKernAmount (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((KERNINGPAIR*)_ptr)->iKernAmount = _val;%N")
		ensure
			value_set: iKernAmount = a_var
		end -- set_iKernAmount

feature
		-- Getters

	wFirst : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((iKernAmount*)_ptr)->wFirst;%N")
			Result := res
		end -- wFirst

	wSecond : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((iKernAmount*)_ptr)->wSecond;%N")
			Result := res
		end -- wSecond

	iKernAmount : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((iKernAmount*)_ptr)->iKernAmount;%N")
			Result := res
		end -- iKernAmount

end -- class WIN32_KERNINGPAIR 

