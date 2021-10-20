indexing
	contents: "WIN32 fd_set structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_FD_SET

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
			c_inline_c ("_res = sizeof(FD_SET);%N")
			Result := res
		end -- external_size
	
feature

	fd_count : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((FD_SET*)_ptr)->fd_count;%N")
			Result := res
		end -- fd_count

	fd_array (a_index: INTEGER) : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			idx := a_index
			c_inline_c ("_res=(EIF_INTEGER)((FD_SET*)_ptr)->fd_array[_idx];%N")
			Result := res
		end -- fd_array

feature

	set_fd_count (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((FD_SET*)_ptr)->fd_count = _val;%N")
		ensure
			value_set: fd_count = a_var
		end -- set_fd_count

	set_fd_array (a_index:INTEGER; a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			idx := a_index
			ptr := pointer
			c_inline_c ("((FD_SET*)_ptr)->fd_array[_idx] = _val;%N")
		ensure
			value_set: fd_count = a_var
		end -- set_fd_array
		
end -- class WIN32_FD_SET