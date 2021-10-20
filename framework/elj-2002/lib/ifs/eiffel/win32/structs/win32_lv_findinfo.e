indexing
	contents: "WIN32 LV_FINDINFO structure"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no
	
class WIN32_LV_FINDINFO 

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
			c_inline_c ("_res = sizeof(LV_FINDINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_flags (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_FINDINFO*)_ptr)->flags = _val;%N")
		ensure
			value_set: flags = a_var
		end -- set_flags

	set_psz (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_FINDINFO*)_ptr)->psz = _val;%N")
		ensure
			value_set: psz = a_var
		end -- set_psz

	set_lParam (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_FINDINFO*)_ptr)->lParam = _val;%N")
		ensure
			value_set: lParam = a_var
		end -- set_lParam

	set_pt (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_FINDINFO*)_ptr)->pt = *((POINT*)_val);%N")
		ensure
			value_set: pt = a_var
		end -- set_pt

	set_vkDirection (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LV_FINDINFO*)_ptr)->vkDirection = _val;%N")
		ensure
			value_set: vkDirection = a_var
		end -- set_vkDirection

feature
		-- Getters

	flags : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_FINDINFO*)_ptr)->flags;%N")
			Result := res
		end -- flags

	psz : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LV_FINDINFO*)_ptr)->psz;%N")
			Result := res
		end -- psz

	lParam : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_FINDINFO*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

	pt : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)&(((LV_FINDINFO*)_ptr)->pt);%N")
			Result := res
		end -- pt

	vkDirection : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LV_FINDINFO*)_ptr)->vkDirection;%N")
			Result := res
		end -- vkDirection

end -- class WIN32_LV_FINDINFO 

