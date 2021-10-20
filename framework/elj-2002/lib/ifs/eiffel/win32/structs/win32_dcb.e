class WIN32_DCB 

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
			c_inline_c ("_res = sizeof(DCB);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_DCBlength (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->DCBlength = _val;%N")
		end -- set_DCBlength

	set_BaudRate (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->BaudRate = _val;%N")
		end -- set_BaudRate

	set_fBinary (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fBinary = _val;%N")
		end -- set_fBinary

	set_fParity (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fParity = _val;%N")
		end -- set_fParity

	set_fOutxCtsFlow (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fOutxCtsFlow = _val;%N")
		end -- set_fOutxCtsFlow

	set_fOutxDsrFlow (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fOutxDsrFlow = _val;%N")
		end -- set_fOutxDsrFlow

	set_fDtrControl (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fDtrControl = _val;%N")
		end -- set_fDtrControl

	set_fDsrSensitivity (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fDsrSensitivity = _val;%N")
		end -- set_fDsrSensitivity

	set_fTXContinueOnXoff (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fTXContinueOnXoff = _val;%N")
		end -- set_fTXContinueOnXoff

	set_fOutX (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fOutX = _val;%N")
		end -- set_fOutX

	set_fInX (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fInX = _val;%N")
		end -- set_fInX

	set_fErrorChar (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fErrorChar = _val;%N")
		end -- set_fErrorChar

	set_fNull (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fNull = _val;%N")
		end -- set_fNull

	set_fRtsControl (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fRtsControl = _val;%N")
		end -- set_fRtsControl

	set_fAbortOnError (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fAbortOnError = _val;%N")
		end -- set_fAbortOnError

	set_fDummy2 (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->fDummy2 = _val;%N")
		end -- set_fDummy2

	set_wReserved (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->wReserved = _val;%N")
		end -- set_wReserved

	set_XonLim (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->XonLim = _val;%N")
		end -- set_XonLim

	set_XoffLim (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->XoffLim = _val;%N")
		end -- set_XoffLim

	set_ByteSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->ByteSize = _val;%N")
		end -- set_ByteSize

	set_Parity (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->Parity = _val;%N")
		end -- set_Parity

	set_StopBits (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->StopBits = _val;%N")
		end -- set_StopBits

	set_XonChar (a_val : CHARACTER) is
		local
			ptr : POINTER
			val : CHARACTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->XonChar = _val;%N")
		end -- set_XonChar

	set_XoffChar (a_val : CHARACTER) is
		local
			ptr : POINTER
			val : CHARACTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->XoffChar = _val;%N")
		end -- set_XoffChar

	set_ErrorChar (a_val : CHARACTER) is
		local
			ptr : POINTER
			val : CHARACTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->ErrorChar = _val;%N")
		end -- set_ErrorChar

	set_EofChar (a_val : CHARACTER) is
		local
			ptr : POINTER
			val : CHARACTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->EofChar = _val;%N")
		end -- set_EofChar

	set_EvtChar (a_val : CHARACTER) is
		local
			ptr : POINTER
			val : CHARACTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->EvtChar = _val;%N")
		end -- set_EvtChar

	set_wReserved1 (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((DCB*)_ptr)->wReserved1 = _val;%N")
		end -- set_wReserved1

feature
		-- Getters

	DCBlength : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->DCBlength;%N")
			Result := res
		end -- DCBlength

	BaudRate : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->BaudRate;%N")
			Result := res
		end -- BaudRate

	fBinary : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fBinary;%N")
			Result := res
		end -- fBinary

	fParity : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fParity;%N")
			Result := res
		end -- fParity

	fOutxCtsFlow : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fOutxCtsFlow;%N")
			Result := res
		end -- fOutxCtsFlow

	fOutxDsrFlow : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fOutxDsrFlow;%N")
			Result := res
		end -- fOutxDsrFlow

	fDtrControl : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fDtrControl;%N")
			Result := res
		end -- fDtrControl

	fDsrSensitivity : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fDsrSensitivity;%N")
			Result := res
		end -- fDsrSensitivity

	fTXContinueOnXoff : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fTXContinueOnXoff;%N")
			Result := res
		end -- fTXContinueOnXoff

	fOutX : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fOutX;%N")
			Result := res
		end -- fOutX

	fInX : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fInX;%N")
			Result := res
		end -- fInX

	fErrorChar : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fErrorChar;%N")
			Result := res
		end -- fErrorChar

	fNull : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fNull;%N")
			Result := res
		end -- fNull

	fRtsControl : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fRtsControl;%N")
			Result := res
		end -- fRtsControl

	fAbortOnError : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fAbortOnError;%N")
			Result := res
		end -- fAbortOnError

	fDummy2 : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->fDummy2;%N")
			Result := res
		end -- fDummy2

	wReserved : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->wReserved;%N")
			Result := res
		end -- wReserved

	XonLim : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->XonLim;%N")
			Result := res
		end -- XonLim

	XoffLim : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->XoffLim;%N")
			Result := res
		end -- XoffLim

	ByteSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->ByteSize;%N")
			Result := res
		end -- ByteSize

	Parity : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->Parity;%N")
			Result := res
		end -- Parity

	StopBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->StopBits;%N")
			Result := res
		end -- StopBits

	XonChar : CHARACTER is
		local
			ptr : POINTER
			res : CHARACTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_CHARACTER) ((DCB*)_ptr)->XonChar;%N")
			Result := res
		end -- XonChar

	XoffChar : CHARACTER is
		local
			ptr : POINTER
			res : CHARACTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_CHARACTER) ((DCB*)_ptr)->XoffChar;%N")
			Result := res
		end -- XoffChar

	ErrorChar : CHARACTER is
		local
			ptr : POINTER
			res : CHARACTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_CHARACTER) ((DCB*)_ptr)->ErrorChar;%N")
			Result := res
		end -- ErrorChar

	EofChar : CHARACTER is
		local
			ptr : POINTER
			res : CHARACTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_CHARACTER) ((DCB*)_ptr)->EofChar;%N")
			Result := res
		end -- EofChar

	EvtChar : CHARACTER is
		local
			ptr : POINTER
			res : CHARACTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_CHARACTER) ((DCB*)_ptr)->EvtChar;%N")
			Result := res
		end -- EvtChar

	wReserved1 : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((DCB*)_ptr)->wReserved1;%N")
			Result := res
		end -- wReserved1

end -- class WIN32_DCB 

