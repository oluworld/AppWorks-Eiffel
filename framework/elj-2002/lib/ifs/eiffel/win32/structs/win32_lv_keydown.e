indexing
	contents: "WIN32 LV_KEYDOWN structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_KEYDOWN 

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
			c_inline_c ("_res = sizeof(LV_KEYDOWN);%N")
			Result := res
		end -- external_size
	
feature
		-- Getters

	hdr : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((LV_KEYDOWN*)_ptr)->hdr);%N")
			Result := res
		end -- hdr

	wVKey : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_KEYDOWN*)_ptr)->wVKey;%N")
			Result := res
		end -- wVKey

	flags : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_KEYDOWN*)_ptr)->flags;%N")
			Result := res
		end -- flags

end -- class WIN32_LV_KEYDOWN 

