indexing
	contents: "WIN32 debughookinfo struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_DEBUGHOOKINFO 

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
			c_inline_c ("_res = sizeof(DEBUGHOOKINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_idThread (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEBUGHOOKINFO*)_ptr)->idThread = _val;%N")
		ensure
			value_set: idThread = a_var
		end -- set_idThread

	set_idThreadInstaller (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEBUGHOOKINFO*)_ptr)->idThreadInstaller = _val;%N")
		ensure
			value_set: idThreadInstaller = a_var
		end -- set_idThreadInstaller

	set_lParam (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEBUGHOOKINFO*)_ptr)->lParam = _val;%N")
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
			c_inline_c ("((DEBUGHOOKINFO*)_ptr)->wParam = _val;%N")
		ensure
			value_set: wParam = a_var
		end -- set_wParam

	set_code (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEBUGHOOKINFO*)_ptr)->code = _val;%N")
		ensure
			value_set: code = a_var
		end -- set_code

feature
		-- Getters

	idThread : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEBUGHOOKINFO*)_ptr)->idThread;%N")
			Result := res
		end -- idThread

	idThreadInstaller : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEBUGHOOKINFO*)_ptr)->idThreadInstaller;%N")
			Result := res
		end -- idThreadInstaller

	lParam : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEBUGHOOKINFO*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

	wParam : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEBUGHOOKINFO*)_ptr)->wParam;%N")
			Result := res
		end -- wParam

	code : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEBUGHOOKINFO*)_ptr)->code;%N")
			Result := res
		end -- code

end -- class WIN32_DEBUGHOOKINFO 

