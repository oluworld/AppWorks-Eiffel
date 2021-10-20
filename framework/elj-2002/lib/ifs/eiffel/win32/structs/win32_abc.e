class WIN32_ABC 

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
			c_inline_c ("_res = sizeof(ABC);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_abcA (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABC*)_ptr)->abcA = _val;%N")
		ensure
			value_set: abcA = a_var
		end -- set_abcA

	set_abcB (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABC*)_ptr)->abcB = _val;%N")
		ensure
			value_set: abcB = a_var
		end -- set_abcB

	set_abcC (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ABC*)_ptr)->abcC = _val;%N")
		ensure
			value_set: abcC = a_var
		end -- set_abcC

feature
		-- Getters

	abcA : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ABC*)_ptr)->abcA;%N")
			Result := res
		end -- abcA

	abcB : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ABC*)_ptr)->abcB;%N")
			Result := res
		end -- abcB

	abcC : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ABC*)_ptr)->abcC;%N")
			Result := res
		end -- abcC

end -- class WIN32_ABC 
