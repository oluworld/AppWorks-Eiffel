class WIN32_COMMCONFIG 

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
			c_inline_c ("_res = sizeof(COMMCONFIG);%N")
			Result := res
		end -- external_size
	
feature
		-- Setters

	set_dwSize (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->dwSize = _val;%N")
		end -- set_dwSize

	set_wVersion (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->wVersion = _val;%N")
		end -- set_wVersion

	set_wReserved (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->wReserved = _val;%N")
		end -- set_wReserved

	set_dcb (a_val : POINTER) is		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->dcb = *((DCB *) _val);%N")
		end -- set_dcb

	set_dwProviderSubType (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->dwProviderSubType = _val;%N")
		end -- set_dwProviderSubType

	set_dwProviderOffset (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->dwProviderOffset = _val;%N")
		end -- set_dwProviderOffset

	set_dwProviderSize (a_val : INTEGER) is		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((COMMCONFIG*)_ptr)->dwProviderSize = _val;%N")
		end -- set_dwProviderSize

feature {NONE}
		-- Getters

	dwSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->dwSize;%N")
			Result := res
		end -- dwSize

	wVersion : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->wVersion;%N")
			Result := res
		end -- wVersion

	wReserved : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->wReserved;%N")
			Result := res
		end -- wReserved

	dcb : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) &((COMMCONFIG*)_ptr)->dcb;%N")
			Result := res
		end -- dcb

	dwProviderSubType : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->dwProviderSubType;%N")
			Result := res
		end -- dwProviderSubType

	dwProviderOffset : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->dwProviderOffset;%N")
			Result := res
		end -- dwProviderOffset

	dwProviderSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((COMMCONFIG*)_ptr)->dwProviderSize;%N")
			Result := res
		end -- dwProviderSize

end -- class WIN32_COMMCONFIG 

