indexing
	contents: "WIN32 handletable struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_HANDLETABLE 

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
			c_inline_c ("_res = sizeof(HANDLETABLE);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_size (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((HANDLETABLE*)_ptr)->size = _val;%N")
		ensure
			value_set: size = a_var
		end -- set_size

	set_objectHandle (a_var : POINTER; a_index: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			val: POINTER
			ptr: POINTER
		do
			idx := a_index
			val := a_var
			ptr := pointer
			c_inline_c ("((HANDLETABLE*)_ptr)->objectHandle[_idx] = _val;%N")
		ensure
			value_set: objectHandle(a_index) = a_var
		end -- set_objectHandle

feature
		-- Getters

	size: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((HANDLETABLE*)_ptr)->size;%N")
			Result := res
		end -- size

	objectHandle (a_index: INTEGER) : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			res: POINTER
			ptr: POINTER
		do
			idx := a_index
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((HANDLETABLE*)_ptr)->objectHandle[_idx];%N")
			Result := res
		end -- objectHandle

end -- class WIN32_HANDLETABLE 

