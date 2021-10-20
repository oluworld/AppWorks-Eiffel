indexing
	contents: "WIN32 MNDAYSTATE struct"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_MNDAYSTATE

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
			c_inline_c ("_res = sizeof(NMDAYSTATE);%N")
			Result := res
		end -- external_size

feature {ANY}
		-- setters

	set_nmhdr (a_var : POINTER) is
			-- NOTE: a_var is pointer from WIN32_NMHDR
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((NMDAYSTATE*)_ptr)->nmhdr = _val;%N")
		ensure
			value_set: nmhdr = a_var
		end -- set_nmhdr

	set_stStart (a_var : POINTER) is
			-- NOTE: a_var is pointer from WIN32_SYSTEMTIME
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((NMDAYSTATE*)_ptr)->stStart = _val;%N")
		ensure
			value_set: stStart = a_var
		end -- set_stStart

	set_cDayState (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((NMDAYSTATE*)_ptr)->cDayState = _val;%N")
		ensure
			value_set: cDayState = a_var
		end -- set_cDayState

	set_prgDayState (a_var : POINTER) is
			-- NOTE: a_var is pointer from ARRAY of INTEGERs
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((NMDAYSTATE*)_ptr)->prgDayState = _val;%N")
		ensure
--			value_set: prgDayState.is_equal(a_var)
		end -- set_prgDayState

feature {ANY}
		-- getters

	nmhdr : POINTER is
			-- NOTE: a_var is pointer from WIN32_NMHDR
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((NMDAYSTATE*)_ptr)->nmhdr;%N")
			Result := res
		end -- nmhdr

	stStart : POINTER is
			-- NOTE: pointer is for WIN32_SYSTEMTIME
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((NMDAYSTATE*)_ptr)->stSelStart;%N")
			Result := res
		end -- stStart

	cDayState : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((NMDAYSTATE*)_ptr)->cDayState;%N")
			Result := res
		end -- cDayState

	prgDayState : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((NMDAYSTATE*)_ptr)->prgDayState%N")
			Result := res
		end -- prgDayState

end -- class WIN32_MNDAYSTATE