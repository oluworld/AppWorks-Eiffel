class WIN32_CLIENTCREATESTRUCT 

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
			c_inline_c ("_res = sizeof(CLIENTCREATESTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_hWindowMenu (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CLIENTCREATESTRUCT*)_ptr)->hWindowMenu = _val;%N")
		end -- set_hWindowMenu

	set_idFirstChild (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CLIENTCREATESTRUCT*)_ptr)->idFirstChild = _val;%N")
		end -- set_idFirstChild

feature
		-- Getters

	hWindowMenu : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CLIENTCREATESTRUCT*)_ptr)->hWindowMenu;%N")
			Result := res
		end -- hWindowMenu

	idFirstChild : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CLIENTCREATESTRUCT*)_ptr)->idFirstChild;%N")
			Result := res
		end -- idFirstChild

end -- class WIN32_CLIENTCREATESTRUCT 

