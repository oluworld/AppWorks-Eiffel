class WIN32_MOUSEHOOKSTRUCT 

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
			c_inline_c ("_res = sizeof(MOUSEHOOKSTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_pt (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MOUSEHOOKSTRUCT*)_ptr)->pt = *((POINT*)_val);%N")
		ensure
--			value_set: pt.is_equal(a_var)
		end -- set_pt

	set_hwnd (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MOUSEHOOKSTRUCT*)_ptr)->hwnd = _val);%N")
		ensure
			value_set: hwnd = a_var
		end -- set_hwnd

	set_wHitTestCode (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MOUSEHOOKSTRUCT*)_ptr)->wHitTestCode = _val);%N")
		ensure
			value_set: wHitTestCode = a_var
		end -- set_wHitTestCode

	set_dwExtraInfo (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MOUSEHOOKSTRUCT*)_ptr)->dwExtraInfo = _val);%N")
		ensure
			value_set: dwExtraInfo = a_var
		end -- set_dwExtraInfo

feature
		-- Getters

	pt : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MOUSEHOOKSTRUCT*)_ptr)->pt);%N")
			Result := res
		end -- pt

	hwnd : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MOUSEHOOKSTRUCT*)_ptr)->hwnd;%N")
			Result := res
		end -- hwnd

	wHitTestCode : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MOUSEHOOKSTRUCT*)_ptr)->wHitTestCode;%N")
			Result := res
		end -- wHitTestCode

	dwExtraInfo : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MOUSEHOOKSTRUCT*)_ptr)->dwExtraInfo;%N")
			Result := res
		end -- dwExtraInfo

end -- class WIN32_MOUSEHOOKSTRUCT 

