class WIN32_CHARRANGE

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
			c_inline_c ("_res = sizeof(CHARRANGE);%N")
			Result := res
		end -- external_size
	
feature
		--Setters
	
	set_cpMin (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			c_inline_c ("((CHARRANGE*)_ptr)->cpMin=_val;%N")
		end -- set_cpMin

	set_cpMax (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			c_inline_c ("((CHARRANGE*)_ptr)->cpMax=_val;%N")
		end -- set_cpMax

feature
		--Getters

	cpMin: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			c_inline_c ("_res=((CHARRANGE*)_ptr)->cpMin;%N")
			Result := res
		end -- cpMin

	cpMax: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			c_inline_c ("_res=((CHARRANGE*)_ptr)->cpMax;%N")
			Result := res
		end -- cpMax

end -- class WIN32_CHARRANGE