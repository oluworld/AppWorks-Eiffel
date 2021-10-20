class WIN32_COMMPROP 

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
			c_inline_c ("_res = sizeof(COMMPROP);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_wPacketLength (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->wPacketLength = _val;%N")
		end -- set_wPacketLength

	set_wPacketVersion (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->wPacketVersion = _val;%N")
		end -- set_wPacketVersion

	set_dwServiceMask (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwServiceMask = _val;%N")
		end -- set_dwServiceMask

	set_dwReserved1 (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwReserved1 = _val;%N")
		end -- set_dwReserved1

	set_dwMaxTxQueue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwMaxTxQueue = _val;%N")
		end -- set_dwMaxTxQueue

	set_dwMaxRxQueue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwMaxRxQueue = _val;%N")
		end -- set_dwMaxRxQueue

	set_dwMaxBaud (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwMaxBaud = _val;%N")
		end -- set_dwMaxBaud

	set_dwProvSubType (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwProvSubType = _val;%N")
		end -- set_dwProvSubType

	set_dwProvCapabilities (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwProvCapabilities = _val;%N")
		end -- set_dwProvCapabilities

	set_dwSettableParams (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwSettableParams = _val;%N")
		end -- set_dwSettableParams

	set_dwSettableBaud (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwSettableBaud = _val;%N")
		end -- set_dwSettableBaud

	set_wSettableData (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->wSettableData = _val;%N")
		end -- set_wSettableData

	set_wSettableStopParity (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->wSettableStopParity = _val;%N")
		end -- set_wSettableStopParity

	set_dwCurrentTxQueue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwCurrentTxQueue = _val;%N")
		end -- set_dwCurrentTxQueue

	set_dwCurrentRxQueue (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwCurrentRxQueue = _val;%N")
		end -- set_dwCurrentRxQueue

	set_dwProvSpec1 (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwProvSpec1 = _val;%N")
		end -- set_dwProvSpec1

	set_dwProvSpec2 (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMPROP*)_ptr)->dwProvSpec2 = _val;%N")
		end -- set_dwProvSpec2

feature {NONE}
		-- Getters

	wPacketLength : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->wPacketLength;%N")
			Result := res
		end -- wPacketLength

	wPacketVersion : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->wPacketVersion;%N")
			Result := res
		end -- wPacketVersion

	dwServiceMask : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwServiceMask;%N")
			Result := res
		end -- dwServiceMask

	dwReserved1 : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwReserved1;%N")
			Result := res
		end -- dwReserved1

	dwMaxTxQueue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwMaxTxQueue;%N")
			Result := res
		end -- dwMaxTxQueue

	dwMaxRxQueue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwMaxRxQueue;%N")
			Result := res
		end -- dwMaxRxQueue

	dwMaxBaud : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwMaxBaud;%N")
			Result := res
		end -- dwMaxBaud

	dwProvSubType : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwProvSubType;%N")
			Result := res
		end -- dwProvSubType

	dwProvCapabilities : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwProvCapabilities;%N")
			Result := res
		end -- dwProvCapabilities

	dwSettableParams : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwSettableParams;%N")
			Result := res
		end -- dwSettableParams

	dwSettableBaud : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwSettableBaud;%N")
			Result := res
		end -- dwSettableBaud

	wSettableData : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->wSettableData;%N")
			Result := res
		end -- wSettableData

	wSettableStopParity : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->wSettableStopParity;%N")
			Result := res
		end -- wSettableStopParity

	dwCurrentTxQueue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwCurrentTxQueue;%N")
			Result := res
		end -- dwCurrentTxQueue

	dwCurrentRxQueue : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwCurrentRxQueue;%N")
			Result := res
		end -- dwCurrentRxQueue

	dwProvSpec1 : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwProvSpec1;%N")
			Result := res
		end -- dwProvSpec1

	dwProvSpec2 : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMPROP*)_ptr)->dwProvSpec2;%N")
			Result := res
		end -- dwProvSpec2

end -- class WIN32_COMMPROP 

