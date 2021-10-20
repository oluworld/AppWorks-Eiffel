class WIN32_METAFILEPICT 

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
			c_inline_c ("_res = sizeof(METAFILEPICT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_mm (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((METAFILEPICT*)_ptr)->mm = _val;%N")
		ensure
			value_set: mm = a_var
		end -- set_mm

	set_xExt (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((METAFILEPICT*)_ptr)->xExt = _val;%N")
		ensure
			value_set: xExt = a_var
		end -- set_xExt

	set_yExt (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((METAFILEPICT*)_ptr)->yExt = _val;%N")
		ensure
			value_set: yExt = a_var
		end -- set_yExt

	set_hMF (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((METAFILEPICT*)_ptr)->hMF = _val;%N")
		ensure
			value_set: hMF = a_var
		end -- set_hMF

feature
		-- Getters

	mm : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((METAFILEPICT*)_ptr)->mm;%N")
			Result := res
		end -- mm

	xExt : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((METAFILEPICT*)_ptr)->xExt;%N")
			Result := res
		end -- xExt

	yExt : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((METAFILEPICT*)_ptr)->yExt;%N")
			Result := res
		end -- yExt

	hMF : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((METAFILEPICT*)_ptr)->hMF;%N")
			Result := res
		end -- hMF

end -- class WIN32_METAFILEPICT 

