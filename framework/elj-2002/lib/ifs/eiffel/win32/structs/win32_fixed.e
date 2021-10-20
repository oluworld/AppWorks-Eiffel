indexing
	contents: "WIN32 FIXED structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_FIXED

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
			c_inline_c ("_res = sizeof(FIXED);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_fract (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FIXED*)_ptr)->abcA = _val;%N")
		ensure
			value_set: fract = a_var
		end -- set_fract

	set_value (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FIXED*)_ptr)->value = _val;%N")
		ensure
			value_set: value = a_var
		end -- set_value

feature
		-- Getters

	fract : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FIXED*)_ptr)->abcA;%N")
			Result := res
		end -- fract

	value : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FIXED*)_ptr)->value;%N")
			Result := res
		end -- value

end -- class WIN32_FIXED 
