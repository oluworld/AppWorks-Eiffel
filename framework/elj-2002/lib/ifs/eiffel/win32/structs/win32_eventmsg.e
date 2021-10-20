class WIN32_EVENTMSG 

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
			c_inline_c ("_res = sizeof(EVENTMSG);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_message (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTMSG*)_ptr)->message = _val;%N")
		ensure
			value_set: message = a_var
		end -- set_message

	set_paramL (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTMSG*)_ptr)->paramL = _val;%N")
		ensure
			value_set: paramL = a_var
		end -- set_paramL

	set_paramH (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTMSG*)_ptr)->paramH = _val;%N")
		ensure
			value_set: paramH = a_var
		end -- set_paramH

	set_time (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTMSG*)_ptr)->time = _val;%N")
		ensure
			value_set: time = a_var
		end -- set_time

	set_hwnd (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTMSG*)_ptr)->hwnd = _val;%N")
		ensure
			value_set: hwnd = a_var
		end -- set_hwnd

feature
		-- Getters

	message : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTMSG*)_ptr)->message;%N")
			Result := res
		end -- message

	paramL : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTMSG*)_ptr)->paramL;%N")
			Result := res
		end -- paramL

	paramH : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTMSG*)_ptr)->paramH;%N")
			Result := res
		end -- paramH

	time : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTMSG*)_ptr)->time;%N")
			Result := res
		end -- time

	hwnd : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTMSG*)_ptr)->hwnd;%N")
			Result := res
		end -- hwnd

end -- class WIN32_EVENTMSG 

