class WIN32_ABCFLOAT 

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
			c_inline_c ("_res = sizeof(ABCFLOAT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_abcfA (a_var : REAL) is
		local
			val: REAL
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABCFLOAT*)_ptr)->abcfA = _val;%N")
		ensure
			value_set: abcfA = a_var
		end -- set_abcfA

	set_abcfB (a_var : REAL) is
		local
			val: REAL
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABCFLOAT*)_ptr)->abcfB = _val;%N")
		ensure
			value_set: abcfB = a_var
		end -- set_abcfB

	set_abcfC (a_var : REAL) is
		local
			val: REAL
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABCFLOAT*)_ptr)->abcfC = _val;%N")
		ensure
			value_set: abcfC = a_var
		end -- set_abcfC

feature
		-- Getters

	abcfA : REAL is
		local
			res: REAL
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_REAL)((ABCFLOAT*)_ptr)->abcfA;%N")
			Result := res
		end -- abcfA

	abcfB : REAL is
		local
			res: REAL
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_REAL)((ABCFLOAT*)_ptr)->abcfB;%N")
			Result := res
		end -- abcfB

	abcfC : REAL is
		local
			res: REAL
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_REAL)((ABCFLOAT*)_ptr)->abcfC;%N")
			Result := res
		end -- abcfC

end -- class WIN32_ABCFLOAT 

