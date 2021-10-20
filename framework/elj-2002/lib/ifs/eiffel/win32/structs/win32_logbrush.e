class WIN32_LOGBRUSH

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
			c_inline_c ("_res = sizeof(LOGBRUSH);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_lbStyle (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGBRUSH*)_ptr)->lbStyle = _val;%N")
		ensure
			value_set: lbStyle = a_var
		end -- set_lbStyle

	set_lbColor (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGBRUSH*)_ptr)->lbColor = _val;%N")
		ensure
			value_set: lbColor = a_var
		end -- set_lbColor

	set_lbHatch (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGBRUSH*)_ptr)->lbHatch = _val;%N")
		ensure
			value_set: lbHatch = a_var
		end -- set_lbHatch


feature {ANY}
		-- getters

	lbStyle : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGBRUSH*)_ptr)->lbStyle;%N")
			Result := res
		end -- lbStyle

	lbColor : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGBRUSH*)_ptr)->lbColor;%N")
			Result := res
		end -- lbColor

	lbHatch : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGBRUSH*)_ptr)->lbHatch;%N")
			Result := res
		end -- lbHatch

end -- class WIN32_LOGBRUSH