class WIN32_FINDTEXTEX

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
			c_inline_c ("_res = sizeof(FINDTEXTEX);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_chrg (a_value: POINTER) is
		local
			ptr: POINTER
			val: POINTER
		do
			ptr := pointer
			val := a_value
			c_inline_c ("((FINDTEXTEX*)_ptr)->chrg=*((CHARRANGE*)_val);%N")
		end -- set_chrg

	set_chrgText (a_value: POINTER) is
		local
			ptr: POINTER
			val: POINTER
		do
			ptr := pointer
			val := a_value
			c_inline_c ("((FINDTEXTEX*)_ptr)->chrgText=*((CHARRANGE*)_val);%N")
		end -- set_chrgText

	set_lpstrText (a_value: POINTER) is
		local
			ptr: POINTER
			val: POINTER
		do
			ptr := pointer
			val := a_value
			c_inline_c ("((FINDTEXTEX*)_ptr)->lpstrText=(char*)_val;%N")
		end -- set_lpstrText

feature
		--Getters

	chrg: POINTER is
		local
			ptr: POINTER
			res: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=&((FINDTEXTEX*)_ptr)->chrg;%N")
			Result := res
		end -- chrg

	chrgText: POINTER is
		local
			ptr: POINTER
			res: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=&((FINDTEXTEX*)_ptr)->chrgText;%N")
			Result := res
		end -- chrgText

	lpstrText: POINTER is
		local
			ptr: POINTER
			res: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=((FINDTEXTEX*)_ptr)->lpstrText;%N")
			Result := res
		end -- lpstrText

end -- class WIN32_FINDTEXTEX