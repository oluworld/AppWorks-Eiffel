class WIN32_GCP_RESULTS 

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
			c_inline_c ("_res = sizeof(GCP_RESULTS);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lStructSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lStructSize = _val;%N")
		ensure
			value_set: lStructSize = a_var
		end -- set_lStructSize

	set_lpOutString (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpOutString = _val;%N")
		ensure
			value_set: lpOutString = a_var
		end -- set_lpOutString

	set_lpOrder (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpOrder = _val;%N")
		ensure
			value_set: lpOrder = a_var
		end -- set_*lpOrder

	set_lpDx (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpDx = _val;%N")
		ensure
			value_set: lpDx = a_var
		end -- set_*lpDx

	set_lpCaretPos (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpCaretPos = _val;%N")
		ensure
			value_set: lpCaretPos = a_var
		end -- set_*lpCaretPos

	set_lpClass (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpClass = _val;%N")
		ensure
			value_set: lpClass = a_var
		end -- set_lpClass

	set_lpGlyphs (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->lpGlyphs = _val;%N")
		ensure
			value_set: lpGlyphs = a_var
		end -- set_*lpGlyphs

	set_nGlyphs (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->nGlyphs = _val;%N")
		ensure
			value_set: nGlyphs = a_var
		end -- set_nGlyphs

	set_nMaxFit (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GCP_RESULTS*)_ptr)->nMaxFit = _val;%N")
		ensure
			value_set: nMaxFit = a_var
		end -- set_nMaxFit

feature
		-- Getters

	lStructSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->lStructSize;%N")
			Result := res
		end -- lStructSize

	lpOutString : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((GCP_RESULTS*)_ptr)->lpOutString;%N")
			Result := res
		end -- lpOutString

	lpOrder : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->lpOrder;%N")
			Result := res
		end -- *lpOrder

	lpDx : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->lpDx;%N")
			Result := res
		end -- *lpDx

	lpCaretPos : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->lpCaretPos;%N")
			Result := res
		end -- *lpCaretPos

	lpClass : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((GCP_RESULTS*)_ptr)->lpClass;%N")
			Result := res
		end -- lpClass

	lpGlyphs : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->lpGlyphs;%N")
			Result := res
		end -- *lpGlyphs

	nGlyphs : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->nGlyphs;%N")
			Result := res
		end -- nGlyphs

	nMaxFit : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GCP_RESULTS*)_ptr)->nMaxFit;%N")
			Result := res
		end -- nMaxFit

end -- class WIN32_GCP_RESULTS 

