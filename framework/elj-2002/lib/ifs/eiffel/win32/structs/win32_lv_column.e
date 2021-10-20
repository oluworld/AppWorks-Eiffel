indexing
	contents: "WIN32 LV_COLUMN structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_COLUMN 

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
			c_inline_c ("_res = sizeof(LV_COLUMN);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_mask (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->mask = _val;%N")
		ensure
			value_set: mask = a_var
		end -- set_mask

	set_fmt (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->fmt = _val;%N")
		ensure
			value_set: fmt = a_var
		end -- set_fmt

	set_cx (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->cx = _val;%N")
		ensure
			value_set: cx = a_var
		end -- set_cx

	set_pszText (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->pszText = _val;%N")
		ensure
			value_set: pszText.is_equal (a_var)
		end -- set_pszText

	set_cchTextMax (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->cchTextMax = _val;%N")
		ensure
			value_set: cchTextMax = a_var
		end -- set_cchTextMax

	set_iSubItem (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_COLUMN*)_ptr)->iSubItem = _val;%N")
		ensure
			value_set: iSubItem = a_var
		end -- set_iSubItem

feature
		-- Getters

	mask : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_COLUMN*)_ptr)->mask;%N")
			Result := res
		end -- mask

	fmt : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_COLUMN*)_ptr)->fmt;%N")
			Result := res
		end -- fmt

	cx : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_COLUMN*)_ptr)->cx;%N")
			Result := res
		end -- cx

	pszText : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LV_COLUMN*)_ptr)->pszText;%N")
			Result := res
		end -- pszText

	cchTextMax : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_COLUMN*)_ptr)->cchTextMax;%N")
			Result := res
		end -- cchTextMax

	iSubItem : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_COLUMN*)_ptr)->iSubItem;%N")
			Result := res
		end -- iSubItem

end -- class WIN32_LV_COLUMN 

