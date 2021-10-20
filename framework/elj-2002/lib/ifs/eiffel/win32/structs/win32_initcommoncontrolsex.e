class WIN32_INITCOMMONCONTROLSEX 

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
			c_inline_c ("_res = sizeof(INITCOMMONCONTROLSEX);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dwSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((INITCOMMONCONTROLSEX*)_ptr)->dwSize = _val;%N")
		ensure
			value_set: dwSize = a_var
		end -- set_dwSize

	set_dwICC (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((INITCOMMONCONTROLSEX*)_ptr)->dwICC = _val;%N")
		ensure
			value_set: dwICC = a_var
		end -- set_dwICC

feature
		-- Getters

	dwSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((INITCOMMONCONTROLSEX*)_ptr)->dwSize;%N")
			Result := res
		end -- dwSize

	dwICC : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((INITCOMMONCONTROLSEX*)_ptr)->dwICC;%N")
			Result := res
		end -- dwICC

end -- class WIN32_INITCOMMONCONTROLSEX 
