indexing
	contents: "WIN32 in_addr structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_IN_ADDR 

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
			c_inline_c ("_res = sizeof(IN_ADDR);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_s_b1 (a_var : CHARACTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: CHARACTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_b1 = _val;%N")
		ensure
			value_set: s_b1 = a_var
		end -- set_s_b1

	set_s_b2 (a_var : CHARACTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: CHARACTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_b2 = _val;%N")
		ensure
			value_set: s_b2 = a_var
		end -- set_s_b2

	set_s_b3 (a_var : CHARACTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: CHARACTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_b3 = _val;%N")
		ensure
			value_set: s_b3 = a_var
		end -- set_s_b3

	set_s_b4 (a_var : CHARACTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: CHARACTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_b4 = _val;%N")
		ensure
			value_set: s_b4 = a_var
		end -- set_s_b4

	set_s_w1 (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_w1 = _val;%N")
		ensure
			value_set: s_w1 = a_var
		end -- set_s_w1

	set_s_w2 (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->s_w2 = _val;%N")
		ensure
			value_set: s_w2 = a_var
		end -- set_s_w2

	set_S_addr (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IN_ADDR*)_ptr)->S_addr = _val;%N")
		ensure
			value_set: S_addr = a_var
		end -- set_S_addr

feature
		-- Getters

	s_b1 : CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: CHARACTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_CHARACTER)((IN_ADDR*)_ptr)->s_b1;%N")
			Result := res
		end -- s_b1

	s_b2 : CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: CHARACTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_CHARACTER)((IN_ADDR*)_ptr)->s_b2;%N")
			Result := res
		end -- s_b2

	s_b3 : CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: CHARACTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_CHARACTER)((IN_ADDR*)_ptr)->s_b3;%N")
			Result := res
		end -- s_b3

	s_b4 : CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: CHARACTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_CHARACTER)((IN_ADDR*)_ptr)->s_b4;%N")
			Result := res
		end -- s_b4

	s_w1 : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((IN_ADDR*)_ptr)->s_w1;%N")
			Result := res
		end -- s_w1

	s_w2 : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((IN_ADDR*)_ptr)->s_w2;%N")
			Result := res
		end -- s_w2

	S_addr : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((IN_ADDR*)_ptr)->S_addr;%N")
			Result := res
		end -- S_addr

end -- class WIN32_IN_ADDR 

