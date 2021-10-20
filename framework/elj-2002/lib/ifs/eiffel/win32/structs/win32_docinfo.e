class WIN32_DOCINFO

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
			c_inline_c ("_res = sizeof(DOCINFO);%N")
			Result := res
		end -- external_size
	
feature
		-- setters

	set_cbSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DOCINFO*)_ptr)->cbSize = _val;%N")
		end -- set_cbSize

	set_lpszDocName (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DOCINFO*)_ptr)->lpszDocName = _val;%N")
		end -- set_lpszDocName

	set_lpszOutput (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DOCINFO*)_ptr)->lpszOutput = _val;%N")
		end -- set_lpszOutput

	set_lpszDatatype (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DOCINFO*)_ptr)->lpszDatatype = _val;%N")
		end -- set_lpszDatatype

	set_fwType (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DOCINFO*)_ptr)->fwType = _val;%N")
		end -- set_fwType


feature {NONE}
		-- getters

	cbSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DOCINFO*)_ptr)->cbSize;%N")
			Result := res
		end -- cbSize

	lpszDocName : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((DOCINFO*)_ptr)->lpszDocName;%N")
			Result := res
		end -- lpszDocName

	lpszOutput : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((DOCINFO*)_ptr)->lpszOutput;%N")
			Result := res
		end -- lpszOutput

	lpszDatatype : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((DOCINFO*)_ptr)->lpszDatatype;%N")
			Result := res
		end -- lpszDatatype

	fwType : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) &((DOCINFO*)_ptr)->fwType;%N")
			Result := res
		end -- fwType

end -- class WIN32_DOCINFO