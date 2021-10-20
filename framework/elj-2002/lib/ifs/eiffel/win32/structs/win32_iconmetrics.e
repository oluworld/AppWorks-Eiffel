class WIN32_ICONMETRICS

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
			c_inline_c ("_res = sizeof(ICONMETRICS);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_cbSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONMETRICS*)_ptr)->cbSize = _val;%N")
		ensure
			value_set: cbSize = a_var
		end -- set_cbSize

	set_iHorzSpacing (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONMETRICS*)_ptr)->iHorzSpacing = _val;%N")
		ensure
			value_set: iHorzSpacing = a_var
		end -- set_iHorzSpacing

	set_iVertSpacing (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONMETRICS*)_ptr)->iVertSpacing = _val;%N")
		ensure
			value_set: iVertSpacing = a_var
		end -- set_iVertSpacing

	set_iTitleWrap (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONMETRICS*)_ptr)->iTitleWrap = _val;%N")
		ensure
			value_set: iTitleWrap = a_var
		end -- set_iTitleWrap

	set_lfFont (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONMETRICS*)_ptr)->lfFont = *((LOGFONT)_val);%N")
		ensure
			value_set: lfFont = a_var
		end -- set_lfFont


feature {ANY}
		-- getters

	cbSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONMETRICS*)_ptr)->cbSize;%N")
			Result := res
		end -- cbSize

	iHorzSpacing : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONMETRICS*)_ptr)->iHorzSpacing;%N")
			Result := res
		end -- iHorzSpacing

	iVertSpacing : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONMETRICS*)_ptr)->iVertSpacing;%N")
			Result := res
		end -- iVertSpacing

	iTitleWrap : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONMETRICS*)_ptr)->iTitleWrap;%N")
			Result := res
		end -- iTitleWrap

	lfFont : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((ICONMETRICS*)_ptr)->lfFont);%N")
			Result := res
		end -- lfFont

end -- class WIN32_ICONMETRICS