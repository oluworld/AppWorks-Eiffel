indexing
	contents: "WIN32 LV_ITEM structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_ITEM 

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
			c_inline_c ("_res = sizeof(LV_ITEM);%N")
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
			c_inline_c ("((LV_ITEM*)_ptr)->mask = _val;%N")
		ensure
			value_set: mask = a_var
		end -- set_mask

	set_iItem (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->iItem = _val;%N")
		ensure
			value_set: iItem = a_var
		end -- set_iItem

	set_iSubItem (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->iSubItem = _val;%N")
		ensure
			value_set: iSubItem = a_var
		end -- set_iSubItem

	set_state (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->state = _val;%N")
		ensure
			value_set: state = a_var
		end -- set_state

	set_stateMask (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->stateMask = _val;%N")
		ensure
			value_set: stateMask = a_var
		end -- set_stateMask

	set_pszText (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->pszText = _val;%N")
		ensure
			value_set: a_var /= Void implies pszText.is_equal (a_var)
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
			c_inline_c ("((LV_ITEM*)_ptr)->cchTextMax = _val;%N")
		ensure
			value_set: cchTextMax = a_var
		end -- set_cchTextMax

	set_iImage (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->iImage = _val;%N")
		ensure
			value_set: iImage = a_var
		end -- set_iImage

	set_lParam (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_ITEM*)_ptr)->lParam = _val;%N")
		ensure
			value_set: lParam = a_var
		end -- set_lParam

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
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->mask;%N")
			Result := res
		end -- mask

	iItem : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->iItem;%N")
			Result := res
		end -- iItem

	iSubItem : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->iSubItem;%N")
			Result := res
		end -- iSubItem

	state : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->state;%N")
			Result := res
		end -- state

	stateMask : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->stateMask;%N")
			Result := res
		end -- stateMask

	pszText : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LV_ITEM*)_ptr)->pszText;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->cchTextMax;%N")
			Result := res
		end -- cchTextMax

	iImage : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->iImage;%N")
			Result := res
		end -- iImage

	lParam : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_ITEM*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

end -- class WIN32_LV_ITEM 

