class WIN32_DRAWTEXTPARAMS 

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
			c_inline_c ("_res = sizeof(DRAWTEXTPARAMS);%N")
			Result := res
		end -- external_size
	
feature {NONE}
		-- Setters

	set_cbSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := a_ptr
			val := a_val
			c_inline_c("((DRAWTEXTPARAMS*)_ptr)->cbSize = _val;%N")
		end -- set_cbSize

	set_iTabLength (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := a_ptr
			val := a_val
			c_inline_c("((DRAWTEXTPARAMS*)_ptr)->iTabLength = _val;%N")
		end -- set_iTabLength

	set_iLeftMargin (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := a_ptr
			val := a_val
			c_inline_c("((DRAWTEXTPARAMS*)_ptr)->iLeftMargin = _val;%N")
		end -- set_iLeftMargin

	set_iRightMargin (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := a_ptr
			val := a_val
			c_inline_c("((DRAWTEXTPARAMS*)_ptr)->iRightMargin = _val;%N")
		end -- set_iRightMargin

	set_uiLengthDrawn (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := a_ptr
			val := a_val
			c_inline_c("((DRAWTEXTPARAMS*)_ptr)->uiLengthDrawn = _val;%N")
		end -- set_uiLengthDrawn

feature {NONE}
		-- Getters

	cbSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := a_ptr
			c_inline_c("_res = (EIF_INTEGER) ((DRAWTEXTPARAMS*)_ptr)->cbSize;%N")
			Result := res
		end -- cbSize

	iTabLength : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := a_ptr
			c_inline_c("_res = (EIF_INTEGER) ((DRAWTEXTPARAMS*)_ptr)->iTabLength;%N")
			Result := res
		end -- iTabLength

	iLeftMargin : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := a_ptr
			c_inline_c("_res = (EIF_INTEGER) ((DRAWTEXTPARAMS*)_ptr)->iLeftMargin;%N")
			Result := res
		end -- iLeftMargin

	iRightMargin : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := a_ptr
			c_inline_c("_res = (EIF_INTEGER) ((DRAWTEXTPARAMS*)_ptr)->iRightMargin;%N")
			Result := res
		end -- iRightMargin

	uiLengthDrawn : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := a_ptr
			c_inline_c("_res = (EIF_INTEGER) ((DRAWTEXTPARAMS*)_ptr)->uiLengthDrawn;%N")
			Result := res
		end -- uiLengthDrawn

end -- class WIN32_DRAWTEXTPARAMS 

