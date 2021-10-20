class WIN32_DEVNAMES 

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
			c_inline_c ("_res = sizeof(DEVNAMES);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_wDriverOffset (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVNAMES*)_ptr)->wDriverOffset = _val;%N")
		ensure
			value_set: wDriverOffset = a_var
		end -- set_wDriverOffset

	set_wDeviceOffset (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVNAMES*)_ptr)->wDeviceOffset = _val;%N")
		ensure
			value_set: wDeviceOffset = a_var
		end -- set_wDeviceOffset

	set_wOutputOffset (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVNAMES*)_ptr)->wOutputOffset = _val;%N")
		ensure
			value_set: wOutputOffset = a_var
		end -- set_wOutputOffset

	set_wDefault (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVNAMES*)_ptr)->wDefault = _val;%N")
		ensure
			value_set: wDefault = a_var
		end -- set_wDefault

feature
		-- Getters

	wDriverOffset : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVNAMES*)_ptr)->wDriverOffset;%N")
			Result := res
		end -- wDriverOffset

	wDeviceOffset : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVNAMES*)_ptr)->wDeviceOffset;%N")
			Result := res
		end -- wDeviceOffset

	wOutputOffset : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVNAMES*)_ptr)->wOutputOffset;%N")
			Result := res
		end -- wOutputOffset

	wDefault : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVNAMES*)_ptr)->wDefault;%N")
			Result := res
		end -- wDefault

end -- class WIN32_DEVNAMES 

