class WIN32_FINDREPLACE

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
			c_inline_c ("_res = sizeof(FINDREPLACE);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	lStructSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FINDREPLACE*)_ptr)->lStructSize;%N")
			Result := res
		end -- lStructSize

	hwndOwner : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->hwndOwner;%N")
			Result := res
		end -- hwndOwner

	hInstance : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->hInstance;%N")
			Result := res
		end -- hInstance

	Flags : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FINDREPLACE*)_ptr)->Flags;%N")
			Result := res
		end -- Flags

	lpstrFindWhat : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->lpstrFindWhat;%N")
			Result := res
		end -- lpstrFindWhat

	lpstrReplaceWith : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->lpstrReplaceWith;%N")
			Result := res
		end -- lpstrReplaceWith

	wFindWhatLen : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FINDREPLACE*)_ptr)->wFindWhatLen;%N")
			Result := res
		end -- wFindWhatLen

	wReplaceWithLen : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FINDREPLACE*)_ptr)->wReplaceWithLen;%N")
			Result := res
		end -- wReplaceWithLen

	lCustData : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FINDREPLACE*)_ptr)->lCustData;%N")
			Result := res
		end -- lCustData

	lpfnHook : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->lpfnHook;%N")
			Result := res
		end -- lpfnHook

	lpTemplateName : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((FINDREPLACE*)_ptr)->lpTemplateName;%N")
			Result := res
		end -- lpTemplateName


feature {ANY}
		-- getters

	set_lStructSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lStructSize = _val;%N")
		ensure
			value_set: lStructSize = a_var
		end -- set_lStructSize

	set_hwndOwner (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->hwndOwner = _val;%N")
		ensure
			value_set: hwndOwner = a_var
		end -- set_hwndOwner

	set_hInstance (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->hInstance = _val;%N")
		ensure
			value_set: hInstance = a_var
		end -- set_hInstance

	set_Flags (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->Flags = _val;%N")
		ensure
			value_set: Flags = a_var
		end -- set_Flags

	set_lpstrFindWhat (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lpstrFindWhat = _val;%N")
		ensure
			value_set: lpstrFindWhat = a_var
		end -- set_lpstrFindWhat

	set_lpstrReplaceWith (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lpstrReplaceWith = _val;%N")
		ensure
			value_set: lpstrReplaceWith = a_var
		end -- set_lpstrReplaceWith

	set_wFindWhatLen (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->wFindWhatLen = _val;%N")
		ensure
			value_set: wFindWhatLen = a_var
		end -- set_wFindWhatLen

	set_wReplaceWithLen (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->wReplaceWithLen = _val;%N")
		ensure
			value_set: wReplaceWithLen = a_var
		end -- set_wReplaceWithLen

	set_lCustData (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lCustData = _val;%N")
		ensure
			value_set: lCustData = a_var
		end -- set_lCustData

	set_lpfnHook (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lpfnHook = _val;%N")
		ensure
			value_set: lpfnHook = a_var
		end -- set_lpfnHook

	set_lpTemplateName (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FINDREPLACE*)_ptr)->lpTemplateName = _val;%N")
		ensure
			value_set: lpTemplateName = a_var
		end -- set_lpTemplateName

end -- class WIN32_FINDREPLACE