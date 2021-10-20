class WIN32_MENUITEMTEMPLATEHEADER

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
			c_inline_c ("_res = sizeof(MENUITEMTEMPLATEHEADER);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_versionNumber (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMTEMPLATEHEADER*)_ptr)->versionNumber = _val;%N")
		ensure
			value_set: versionNumber = a_var
		end -- set_versionNumber

	set_offset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MENUITEMTEMPLATEHEADER*)_ptr)->offset = _val;%N")
		ensure
			value_set: offset = a_var
		end -- set_offset


feature {ANY}
		-- getters

	versionNumber : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMTEMPLATEHEADER*)_ptr)->versionNumber;%N")
			Result := res
		end -- versionNumber

	offset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MENUITEMTEMPLATEHEADER*)_ptr)->offset;%N")
			Result := res
		end -- offset

end -- class WIN32_MENUITEMTEMPLATEHEADER