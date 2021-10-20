indexing
	contents: "WIN32 cbtactivatestruct struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_CBTACTIVATESTRUCT 

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
			c_inline_c ("_res = sizeof(CBTACTIVATESTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_fMouse (a_var : BOOLEAN) is
		local
			val: BOOLEAN
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CBTACTIVATESTRUCT*)_ptr)->fMouse = _val;%N")
		ensure
			value_set: fMouse = a_var
		end -- set_fMouse

	set_hWndActive (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CBTACTIVATESTRUCT*)_ptr)->hWndActive = _val;%N")
		ensure
			value_set: hWndActive = a_var
		end -- set_hWndActive

feature
		-- Getters

	fMouse : BOOLEAN is
		local
			res: BOOLEAN
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CBTACTIVATESTRUCT*)_ptr)->fMouse;%N")
			Result := res
		end -- fMouse

	hWndActive : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CBTACTIVATESTRUCT*)_ptr)->hWndActive;%N")
			Result := res
		end -- hWndActive

end -- class WIN32_CBTACTIVATESTRUCT 

