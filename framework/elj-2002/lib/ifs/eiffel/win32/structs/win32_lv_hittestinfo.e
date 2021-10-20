indexing
	contents: "WIN32 LV_HITTESTINFO structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_HITTESTINFO 

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
			c_inline_c ("_res = sizeof(LV_HITTESTINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_pt (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_HITTESTINFO *)_ptr)->pt = *((POINT*)_val);%N")
		ensure
			value_set: pt = a_var
		end -- set_pt

	set_flags (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_HITTESTINFO *)_ptr)->flags = _val;%N")
		ensure
			value_set: flags = a_var
		end -- set_flags

	set_iItem (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_HITTESTINFO *)_ptr)->iItem = _val;%N")
		ensure
			value_set: iItem = a_var
		end -- set_iItem

feature
		-- Getters

	pt : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((LV_HITTESTINFO*)_ptr)->abcA);%N")
			Result := res
		end -- pt

	flags : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_HITTESTINFO*)_ptr)->flags;%N")
			Result := res
		end -- flags

	iItem : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_HITTESTINFO*)_ptr)->iItem;%N")
			Result := res
		end -- iItem

end -- class WIN32_LV_HITTESTINFO 

