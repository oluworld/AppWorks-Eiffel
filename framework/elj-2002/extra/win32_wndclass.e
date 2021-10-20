class WIN32_WNDCLASS

inherit
	C_STRUCTURE
		redefine external_size
		end

creation
	make_external

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			c_inline_c ("_res = sizeof(WNDCLASS);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lpszMenuName (a_var : STRING) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			if a_var = Void then
				val := default_pointer
			else
				val := a_var.to_external
			end
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->lpszMenuName = _val;%N")
		ensure
--			value_set: hwnd = a_var
		end -- set_hwnd

	set_style (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var.to_integer
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->style = _val;%N")
		ensure
		--	value_set: message = a_var
		end -- set_message

	set_cbWndExtra (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->cbWndExtra = _val;%N")
		ensure
			--value_set: wParam = a_var
		end -- set_wParam

	set_cbClsExtra (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->cbClsExtra = _val;%N")
		ensure
			--value_set: wParam = a_var
		end -- set_wParam

	set_hInstance (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->hInstance = (_val);%N")
		end -- set_pt

	set_hIcon (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->hIcon = (_val);%N")
		end -- set_pt

	set_hbrBackground (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->hbrBackground = (_val);%N")
		end -- set_pt

	set_lpfnWndProc (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->lpfnWndProc = (_val);%N")
		end -- set_pt

	set_hCursor (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr, val: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->lpszMenuName = _val;%N")
		end -- set_pt_int

	set_lpszClassName (a_var : STRING) is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr, val: POINTER
		do
			if a_var = Void then
				val := default_pointer
			else
				val := a_var.to_external
			end
			ptr := pointer
			c_inline_c ("((WNDCLASS*)_ptr)->lpszClassName = _val;%N")
		end -- set_pt_int

feature
		-- Getters

	hwnd : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((WNDCLASS*)_ptr)->hwnd;%N")
			Result := res
		end -- hwnd

	message : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((WNDCLASS*)_ptr)->message;%N")
			Result := res
		end -- message

	wParam : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((WNDCLASS*)_ptr)->wParam;%N")
			Result := res
		end -- wParam

	lParam : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((WNDCLASS*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

	time : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((WNDCLASS*)_ptr)->time;%N")
			Result := res
		end -- time

	pt : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((WNDCLASS*)_ptr)->pt);%N")
			Result := res
		end -- pt

end -- class WIN32_WNDCLASS