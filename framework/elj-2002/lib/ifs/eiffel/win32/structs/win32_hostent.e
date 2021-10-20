indexing
	contents: "WIN32 hostent structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_HOSTENT 

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
			c_inline_c ("_res = sizeof(HOSTENT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_h_name (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HOSTENT*)_ptr)->h_name = _val;%N")
		ensure
			value_set: h_name = a_var
		end -- set_h_name

	set_h_aliases (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HOSTENT*)_ptr)->h_aliases = _val;%N")
		ensure
			value_set: h_aliases = a_var
		end -- set_h_aliases

	set_h_addrtype (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HOSTENT*)_ptr)->h_addrtype = _val;%N")
		ensure
			value_set: h_addrtype = a_var
		end -- set_h_addrtype

	set_h_length (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HOSTENT*)_ptr)->h_length = _val;%N")
		ensure
			value_set: h_length = a_var
		end -- set_h_length

	set_h_addr_list (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HOSTENT*)_ptr)->h_addr_list = _val;%N")
		ensure
			value_set: h_addr_list = a_var
		end -- set_h_addr_list

feature
		-- Getters

	h_name : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((HOSTENT*)_ptr)->h_name;%N")
			Result := res
		end -- h_name

	h_aliases : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((HOSTENT*)_ptr)->h_aliases;%N")
			Result := res
		end -- h_aliases

	h_addrtype : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((HOSTENT*)_ptr)->h_addrtype;%N")
			Result := res
		end -- h_addrtype

	h_length : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((HOSTENT*)_ptr)->h_length;%N")
			Result := res
		end -- h_length

	h_addr_list : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((HOSTENT*)_ptr)->h_addr_list;%N")
			Result := res
		end -- h_addr_list

end -- class WIN32_HOSTENT 

