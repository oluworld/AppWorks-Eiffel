indexing
	contents: "WIN32 cwpretstruct struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_CWPRETSTRUCT 

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
			c_inline_c ("_res = sizeof(CWPRETSTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lResult (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CWPRETSTRUCT*)_ptr)->lResult = _val;%N")
		ensure
			value_set: lResult = a_var
		end -- set_lResult

	set_lParam (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CWPRETSTRUCT*)_ptr)->lParam = _val;%N")
		ensure
			value_set: lParam = a_var
		end -- set_lParam

	set_wParam (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CWPRETSTRUCT*)_ptr)->wParam = _val;%N")
		ensure
			value_set: wParam = a_var
		end -- set_wParam

	set_message (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CWPRETSTRUCT*)_ptr)->message = _val;%N")
		ensure
			value_set: message = a_var
		end -- set_message

	set_hwnd (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CWPRETSTRUCT*)_ptr)->hwnd = _val;%N")
		ensure
			value_set: hwnd = a_var
		end -- set_hwnd

feature
		-- Getters

	lResult : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CWPRETSTRUCT*)_ptr)->lResult;%N")
			Result := res
		end -- lResult

	lParam : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CWPRETSTRUCT*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

	wParam : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CWPRETSTRUCT*)_ptr)->wParam;%N")
			Result := res
		end -- wParam

	message : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CWPRETSTRUCT*)_ptr)->message;%N")
			Result := res
		end -- message

	hwnd : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CWPRETSTRUCT*)_ptr)->hwnd;%N")
			Result := res
		end -- hwnd

end -- class WIN32_CWPRETSTRUCT 

