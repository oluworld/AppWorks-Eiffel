class WIN32_COMMTIMEOUTS 

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
			c_inline_c ("_res = sizeof(COMMTIMEOUTS);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_ReadIntervalTimeout (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMTIMEOUTS*)_ptr)->ReadIntervalTimeout = _val;%N")
		end -- set_ReadIntervalTimeout
	
	set_ReadTotalTimeoutMultiplier (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMTIMEOUTS*)_ptr)->ReadTotalTimeoutMultiplier = _val;%N")
		end -- set_ReadTotalTimeoutMultiplier

	set_ReadTotalTimeoutConstant (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMTIMEOUTS*)_ptr)->ReadTotalTimeoutConstant = _val;%N")
		end -- set_ReadTotalTimeoutConstant

	set_WriteTotalTimeoutMultiplier (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMTIMEOUTS*)_ptr)->WriteTotalTimeoutMultiplier = _val;%N")
		end -- set_WriteTotalTimeoutMultiplier

	set_WriteTotalTimeoutConstant (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMTIMEOUTS*)_ptr)->WriteTotalTimeoutConstant = _val;%N")
		end -- set_WriteTotalTimeoutConstant

feature {NONE}
		-- Getters

	ReadIntervalTimeout : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMTIMEOUTS*)_ptr)->ReadIntervalTimeout;%N")
			Result := res
		end -- ReadIntervalTimeout

	ReadTotalTimeoutMultiplier : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMTIMEOUTS*)_ptr)->ReadTotalTimeoutMultiplier;%N")
			Result := res
		end -- ReadTotalTimeoutMultiplier

	ReadTotalTimeoutConstant : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMTIMEOUTS*)_ptr)->ReadTotalTimeoutConstant;%N")
			Result := res
		end -- ReadTotalTimeoutConstant

	WriteTotalTimeoutMultiplier : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMTIMEOUTS*)_ptr)->WriteTotalTimeoutMultiplier;%N")
			Result := res
		end -- WriteTotalTimeoutMultiplier

	WriteTotalTimeoutConstant : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMTIMEOUTS*)_ptr)->WriteTotalTimeoutConstant;%N")
			Result := res
		end -- WriteTotalTimeoutConstant

end -- class WIN32_COMMTIMEOUTS 

