class WIN32_LINGER

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
			c_inline_c ("_res = sizeof(LINGER);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_l_onoff (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LINGER*)_ptr)->l_onoff = _val;%N")
		ensure
			value_set: l_onoff = a_var
		end -- set_l_onoff

	set_l_linger (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LINGER*)_ptr)->l_linger = _val;%N")
		ensure
			value_set: l_linger = a_var
		end -- set_l_linger


feature {ANY}
		-- getters

	l_onoff : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LINGER*)_ptr)->l_onoff;%N")
			Result := res
		end -- l_onoff

	l_linger : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LINGER*)_ptr)->l_linger;%N")
			Result := res
		end -- l_linger

end -- class WIN32_LINGER