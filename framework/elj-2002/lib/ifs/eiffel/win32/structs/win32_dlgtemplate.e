class WIN32_DLGTEMPLATE

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
			c_inline_c ("_res = sizeof(DLGTEMPLATE);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_style (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->style = _val;%N")
		ensure
			value_set: style = a_var
		end -- set_style

	set_dwExtendedStyle (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->dwExtendedStyle = _val;%N")
		ensure
			value_set: dwExtendedStyle = a_var
		end -- set_dwExtendedStyle

	set_cdit (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->cdit = _val;%N")
		ensure
			value_set: cdit = a_var
		end -- set_cdit

	set_x (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->x = _val;%N")
		ensure
			value_set: x = a_var
		end -- set_x

	set_y (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->y = _val;%N")
		ensure
			value_set: y = a_var
		end -- set_y

	set_cx (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->cx = _val;%N")
		ensure
			value_set: cx = a_var
		end -- set_cx

	set_cy (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATE*)_ptr)->cy = _val;%N")
		ensure
			value_set: cy = a_var
		end -- set_cy

feature
		-- Getters

	style : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->style;%N")
			Result := res
		end -- style

	dwExtendedStyle : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->dwExtendedStyle;%N")
			Result := res
		end -- dwExtendedStyle

	cdit : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->cdit;%N")
			Result := res
		end -- cdit

	x : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->x;%N")
			Result := res
		end -- x

	y : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->y;%N")
			Result := res
		end -- y

	cx : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->cx;%N")
			Result := res
		end -- cx

	cy : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATE*)_ptr)->cy;%N")
			Result := res
		end -- cy

end -- class WIN32_DLGTEMPLATE

