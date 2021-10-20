class WIN32_MENUITEMINFO

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
			c_inline_c ("_res = sizeof(MENUITEMINFO);%N")
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
			c_inline_c ("((MENUITEMINFO*)_ptr)->cbSize = _val;%N")
		ensure
			value_set: cbSize = a_var
		end -- set_cbSize

	set_fMask (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->fMask = _val;%N")
		ensure
			value_set: fMask = a_var
		end -- set_fMask

	set_fType (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->fType = _val;%N")
		ensure
			value_set: fType = a_var
		end -- set_fType

	set_fState (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->fState = _val;%N")
		ensure
			value_set: fState = a_var
		end -- set_fState

	set_wID (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->wID = _val;%N")
		ensure
			value_set: wID = a_var
		end -- set_wID

	set_hSubMenu (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->hSubMenu = _val;%N")
		ensure
			value_set: hSubMenu = a_var
		end -- set_hSubMenu

	set_hbmpChecked (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->hbmpChecked = _val;%N")
		ensure
			value_set: hbmpChecked = a_var
		end -- set_hbmpChecked

	set_hbmpUnchecked (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->hbmpUnchecked = _val;%N")
		ensure
			value_set: hbmpUnchecked = a_var
		end -- set_hbmpUnchecked

	set_dwItemData (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->dwItemData = _val;%N")
		ensure
			value_set: dwItemData = a_var
		end -- set_dwItemData

	set_dwTypeData (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->dwTypeData = _val;%N")
		ensure
--			value_set: dwTypeData.is_equal(a_var)
		end -- set_dwTypeData

	set_cch (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMINFO*)_ptr)->cch = _val;%N")
		ensure
			value_set: cch = a_var
		end -- set_cch


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
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->cbSize;%N")
			Result := res
		end -- cbSize

	fMask : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->fMask;%N")
			Result := res
		end -- fMask

	fType : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->fType;%N")
			Result := res
		end -- fType

	fState : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->fState;%N")
			Result := res
		end -- fState

	wID : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->wID;%N")
			Result := res
		end -- wID

	hSubMenu : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MENUITEMINFO*)_ptr)->hSubMenu;%N")
			Result := res
		end -- hSubMenu

	hbmpChecked : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MENUITEMINFO*)_ptr)->hbmpChecked;%N")
			Result := res
		end -- hbmpChecked

	hbmpUnchecked : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MENUITEMINFO*)_ptr)->hbmpUnchecked;%N")
			Result := res
		end -- hbmpUnchecked

	dwItemData : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->dwItemData;%N")
			Result := res
		end -- dwItemData

	dwTypeData : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MENUITEMINFO*)_ptr)->dwTypeData;%N")
			Result := res
		end -- dwTypeData

	cch : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMINFO*)_ptr)->cch;%N")
			Result := res
		end -- cch

end -- class WIN32_MENUITEMINFO