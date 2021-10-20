indexing
	contents: "WIN32 MAT2 structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_MAT2

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
			c_inline_c ("_res = sizeof(MAT2);%N")
			Result := res
		end -- external_size
	
feature

	eM11: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_val=&(((MAT2*)_ptr)->eM11);%N")
			Result := val
		end -- eM11
		
	eM12: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_val=&(((MAT2*)_ptr)->eM12);%N")
			Result := val
		end -- eM12
		
	eM21: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_val=&(((MAT2*)_ptr)->eM21);%N")
			Result := val
		end -- eM21
		
	eM22: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_val=&(((MAT2*)_ptr)->eM22);%N")
			Result := val
		end -- eM22
		
feature

	set_eM11 (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MAT2*)_ptr)->eM11 = *((FIXED)_val);%N")
		ensure
		--
		end -- eM11
		
	set_eM12 (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MAT2*)_ptr)->eM12 = *((FIXED)_val);%N")
		ensure
		--
		end -- eM12
		
	set_eM21 (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MAT2*)_ptr)->eM21 = *((FIXED)_val);%N")
		ensure
		--
		end -- eM21
		
	set_eM22 (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MAT2*)_ptr)->eM22 = *((FIXED)_val);%N")
		ensure
		--
		end -- eM22
		
end -- class WIN32_MAT2