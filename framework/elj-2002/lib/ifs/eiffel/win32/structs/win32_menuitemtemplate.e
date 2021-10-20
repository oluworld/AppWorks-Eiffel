class WIN32_MENUITEMTEMPLATE

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
			c_inline_c ("_res = sizeof(MENUITEMTEMPLATE);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_mtOption (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMTEMPLATE*)_ptr)->mtOption = _val;%N")
		ensure
			value_set: mtOption = a_var
		end -- set_mtOption

	set_mtID (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMTEMPLATE*)_ptr)->mtID = _val;%N")
		ensure
			value_set: mtID = a_var
		end -- set_mtID

	set_mtString (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("wcscpy ((WCHAR*)((MENUITEMTEMPLATE*) _ptr)->mtString, (WCHAR*)_val);%N")
		ensure
--			value_set: mtString.is_equal(a_var)
		end -- set_mtString


feature {ANY}
		-- getters

	mtOption : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMTEMPLATE*)_ptr)->mtOption;%N")
			Result := res
		end -- mtOption

	mtID : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMTEMPLATE*)_ptr)->mtID;%N")
			Result := res
		end -- mtID

	mtString : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MENUITEMTEMPLATE*)_ptr)->mtString;%N")
			Result := res
		end -- mtString

end -- class WIN32_MENUITEMTEMPLATE