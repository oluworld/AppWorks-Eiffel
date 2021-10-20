class WIN32_CPINFO 

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
			c_inline_c ("_res = sizeof(CPINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_MaxCharSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CPINFO*)_ptr)->MaxCharSize = _val;%N")
		ensure
			value_set: MaxCharSize = a_var
		end -- set_MaxCharSize

	set_DefaultChar (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CPINFO*)_ptr)->] = _val;%N")
		ensure
			value_set: DefaultChar = a_var
		end -- set_DefaultChar[MAX_DEFAULTCHAR]

	set_LeadByte (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CPINFO*)_ptrLeadByte = _val;%N")
		ensure
			value_set: LeadByte = a_var
		end -- set_LeadByte

feature
		-- Getters

	MaxCharSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CPINFO*)_ptr)->MaxCharSize;%N")
			Result := res
		end -- MaxCharSize

	DefaultChar : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CPINFO*)_ptr)->DefaultChar;%N")
			Result := res
		end -- DefaultChar

	LeadByte : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CPINFO*)_ptr)->LeadByte;%N")
			Result := res
		end -- LeadByte

end -- class WIN32_CPINFO 

