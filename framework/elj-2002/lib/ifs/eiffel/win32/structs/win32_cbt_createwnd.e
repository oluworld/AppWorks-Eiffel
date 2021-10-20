indexing
	contents: "WIN32 cbt_createwnd struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_CBT_CREATEWND

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
			c_inline_c ("_res = sizeof(CBT_CREATEWND);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lpcs (a_var: POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CBT_CREATEWND*)_ptr)->lpcs = (LPCREATESTRUCT)_val;%N")
		ensure
			value_set: lpcs = a_var
		end -- set_lpcs

	set_hwndInsertAfter (a_var: POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CBT_CREATEWND*)_ptr)->hwndInsertAfter = _val;%N")
		ensure
			value_set: hwndInsertAfter = a_var
		end -- set_hwndInsertAfter


feature
		-- Getters

	lpcs : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CBT_CREATEWND*)_ptr)->lpcs;%N")
			Result := res
		end -- lpcs

	hwndInsertAfter : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CBT_CREATEWND*)_ptr)->hwndInsertAfter;%N")
			Result := res
		end -- hwndInsertAfter

end -- class WIN32_CBT_CREATEWND

	