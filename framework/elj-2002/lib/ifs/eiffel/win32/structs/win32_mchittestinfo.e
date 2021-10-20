indexing
	contents: "WIN32 MCHITTESTINFO struct"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_MCHITTESTINFO

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
			c_inline_c ("_res = sizeof(MCHITTESTINFO);%N")
			Result := res
		end -- external_size

feature {ANY}
		-- setters

	set_cbSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MCHITTESTINFO*)_ptr)->cbSize = _val;%N")
		ensure
			value_set: cbSize = a_var
		end -- set_AclRevision


	set_pt (a_var : POINTER) is
			-- NOTE: a_var is pointer from WIN32_POINT
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MCHITTESTINFO*)_ptr)->pt = _val;%N")
		ensure
			value_set: pt = a_var
		end -- set_pt

	set_uHit (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MCHITTESTINFO*)_ptr)->uHit = _val;%N")
		ensure
			value_set: uHit = a_var
		end -- set_uHit

	set_st (a_var : POINTER) is
			-- NOTE: a_var is pointer from WIN32_SYSTEMTIME
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MCHITTESTINFO*)_ptr)->st = _val;%N")
		ensure
			value_set: st = a_var
		end -- set_st

feature
		-- getters

	cbSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MCHITTESTINFO*)_ptr)->cbSize;%N")
			Result := res
		end -- cbSize

	pt : POINTER is
			-- NOTE: pointer is for WIN32_POINT
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MCHITTESTINFO*)_ptr)->pt;%N")
			Result := res
		end -- pt

	uHit : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MCHITTESTINFO*)_ptr)->uHit;%N")
			Result := res
		end -- uHit

	st : POINTER is
			-- NOTE: pointer is for WIN32_SYSTEMTIME
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MCHITTESTINFO*)_ptr)->st;%N")
			Result := res
		end -- st

end -- class WIN32_MCHITTESTINFO