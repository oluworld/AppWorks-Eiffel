class WIN32_ICONINFO

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
			c_inline_c ("_res = sizeof(ICONINFO);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_fIcon (a_var : BOOLEAN) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BOOLEAN
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONINFO*)_ptr)->fIcon = _val;%N")
		ensure
			value_set: fIcon = a_var
		end -- set_fIcon

	set_xHotspot (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONINFO*)_ptr)->xHotspot = _val;%N")
		ensure
			value_set: xHotspot = a_var
		end -- set_xHotspot

	set_yHotspot (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONINFO*)_ptr)->yHotspot = _val;%N")
		ensure
			value_set: yHotspot = a_var
		end -- set_yHotspot

	set_hbmMask (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONINFO*)_ptr)->hbmMask = _val;%N")
		ensure
			value_set: hbmMask = a_var
		end -- set_hbmMask

	set_hbmColor (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ICONINFO*)_ptr)->hbmColor = _val;%N")
		ensure
			value_set: hbmColor = a_var
		end -- set_hbmColor


feature {ANY}
		-- getters

	fIcon : BOOLEAN is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BOOLEAN
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_BOOLEAN)((ICONINFO*)_ptr)->abcA;%N")
			Result := res
		end -- fIcon

	xHotspot : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONINFO*)_ptr)->xHotspot;%N")
			Result := res
		end -- xHotspot

	yHotspot : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ICONINFO*)_ptr)->yHotspot;%N")
			Result := res
		end -- yHotspot

	hbmMask : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ICONINFO*)_ptr)->hbmMask;%N")
			Result := res
		end -- hbmMask

	hbmColor : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ICONINFO*)_ptr)->hbmColor;%N")
			Result := res
		end -- hbmColor

end -- class WIN32_ICONINFO