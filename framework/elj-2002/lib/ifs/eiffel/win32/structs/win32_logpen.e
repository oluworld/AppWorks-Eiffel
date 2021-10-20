class WIN32_LOGPEN 

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
			c_inline_c ("_res = sizeof(LOGPEN);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lopnStyle (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGPEN*)_ptr)->lopnStyle = _val;%N")
		ensure
			value_set: lopnStyle = a_var
		end -- set_lopnStyle

	set_lopnWidth (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGPEN*)_ptr)->lopnWidth.x = _val;%N")
		ensure
--			value_set: lopnWidth.is_equal(a_var)
		end -- set_lopnWidth

	set_lopnColor (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGPEN*)_ptr)->lopnColor = _val;%N")
		ensure
			value_set: lopnColor = a_var
		end -- set_lopnColor

feature
		-- Getters

	lopnStyle : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGPEN*)_ptr)->lopnStyle;%N")
			Result := res
		end -- lopnStyle

	lopnWidth : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGPEN*)_ptr)->lopnWidth.x;%N")
			Result := res
		end -- lopnWidth

	lopnColor : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGPEN*)_ptr)->lopnColor;%N")
			Result := res
		end -- lopnColor

end -- class WIN32_LOGPEN 

