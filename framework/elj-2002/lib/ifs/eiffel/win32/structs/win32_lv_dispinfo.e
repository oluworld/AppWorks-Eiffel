indexing
	contents: "WIN32 LV_DISPINFO structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_DISPINFO 

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
			c_inline_c ("_res = sizeof(LV_DISPINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_hdr (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_DISPINFO*)_ptr)->hdr = *((NMHDR*)_val);%N")
		ensure
			value_set: hdr = a_var
		end -- set_hdr

	set_item (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_DISPINFO*)_ptr)->hdr = *((LV_ITEM*)_val);%N")
		ensure
			value_set: item = a_var
		end -- set_item

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
			c_inline_c ("_res=(EIF_POINTER)&(((LV_DISPINFO*)_ptr)->hdr);%N")
			Result := res
		end -- hdr

	item : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((LV_DISPINFO*)_ptr)->hdr);%N")
			Result := res
		end -- item

end -- class WIN32_LV_DISPINFO 

