class WIN32_MSG 

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
			c_inline_c ("_res = sizeof(MSG);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_hwnd (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->hwnd = _val;%N")
		ensure
			value_set: hwnd = a_var
		end -- set_hwnd

	set_message (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->message = _val;%N")
		ensure
			value_set: message = a_var
		end -- set_message

	set_wParam (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->wParam = _val;%N")
		ensure
			value_set: wParam = a_var
		end -- set_wParam

	set_lParam (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->lParam = _val;%N")
		ensure
			value_set: lParam = a_var
		end -- set_lParam

	set_time (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->time = _val;%N")
		ensure
			value_set: time = a_var
		end -- set_time

	set_pt (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->pt = *((POINT*)_val);%N")
		end -- set_pt

	set_pt_int (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MSG*)_ptr)->pt.x = (*((POINTS*)&_val)).x;%N")
			c_inline_c ("((MSG*)_ptr)->pt.y = (*((POINTS*)&_val)).y;%N")
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
			c_inline_c ("_res=(EIF_POINTER)((MSG*)_ptr)->hwnd;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MSG*)_ptr)->message;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MSG*)_ptr)->wParam;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MSG*)_ptr)->lParam;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MSG*)_ptr)->time;%N")
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
			c_inline_c ("_res=(EIF_POINTER)&(((MSG*)_ptr)->pt);%N")
			Result := res
		end -- pt

end -- class WIN32_MSG 

