class WIN32_COMSTAT 

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
			c_inline_c ("_res = sizeof(COMSTAT);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_fCtsHold (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fCtsHold = _val;%N")
		end -- set_fCtsHold

	set_fDsrHold (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fDsrHold = _val;%N")
		end -- set_fDsrHold

	set_fRlsdHold (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fRlsdHold = _val;%N")
		end -- set_fRlsdHold

	set_fXoffHold (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fXoffHold = _val;%N")
		end -- set_fXoffHold

	set_fXoffSent (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fXoffSent = _val;%N")
		end -- set_fXoffSent

	set_fEof (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fEof = _val;%N")
		end -- set_fEof

	set_fTxim (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fTxim = _val;%N")
		end -- set_fTxim

	set_fReserved (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->fReserved = _val;%N")
		end -- set_fReserved

	set_cbInQue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->cbInQue = _val;%N")
		end -- set_cbInQue

	set_cbOutQue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMSTAT*)_ptr)->cbOutQue = _val;%N")
		end -- set_cbOutQue

feature
		-- Getters

	fCtsHold : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fCtsHold;%N")
			Result := res
		end -- fCtsHold

	fDsrHold : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fDsrHold;%N")
			Result := res
		end -- fDsrHold

	fRlsdHold : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fRlsdHold;%N")
			Result := res
		end -- fRlsdHold

	fXoffHold : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fXoffHold;%N")
			Result := res
		end -- fXoffHold

	fXoffSent : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fXoffSent;%N")
			Result := res
		end -- fXoffSent

	fEof : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fEof;%N")
			Result := res
		end -- fEof

	fTxim : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fTxim;%N")
			Result := res
		end -- fTxim

	fReserved : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->fReserved;%N")
			Result := res
		end -- fReserved

	cbInQue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->cbInQue;%N")
			Result := res
		end -- cbInQue

	cbOutQue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMSTAT*)_ptr)->cbOutQue;%N")
			Result := res
		end -- cbOutQue

end -- class WIN32_COMSTAT 

