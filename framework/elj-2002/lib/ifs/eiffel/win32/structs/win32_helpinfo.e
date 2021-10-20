class WIN32_HELPINFO

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
			c_inline_c ("_res = sizeof(HELPINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters
	set_iContextType (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->iContextType=_val;%N")
		end -- set_iContextType
	
	set_iCtrlId (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->iCtrlId=_val;%N")
		end -- set_iCtrlId

	set_hItemHandle (a_value: POINTER) is
		local
			ptr: POINTER
			val: POINTER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->hItemHandle=_val;%N")
		end -- set_hItemHandle

	set_dwContextId (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->dwContextId=_val;%N")
		end -- set_dwContextId

	set_MousePos (a_value: WIN32_POINT) is
		local
			ptr: POINTER
			val: POINTER
		do
			ptr := pointer
			val := a_value.pointer
			
			c_inline_c ("((HELPINFO*)_ptr)->MousePos=(*(POINT*)_val);%N")
		end -- set_MousePos

	set_MousePosX (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->MousePos.x=_val;%N")
		end -- set_MousePosX

	set_MousePosY (a_value: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_value
			
			c_inline_c ("((HELPINFO*)_ptr)->MousePos.y=_val;%N")
		end -- set_MousePosY

feature
		-- Getters

	iContextType: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->iContextType;%N")
			
			Result := res
		end -- iContextType
	
	iCtrlId: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->iCtrlId;%N")
			
			Result := res
		end -- iCtrlId

	hItemHandle: POINTER is
		local
			ptr: POINTER
			res: POINTER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->hItemHandle;%N")
			
			Result := res
		end -- hItemHandle

	dwContextId: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->dwContextId;%N")
			
			Result := res
		end -- dwContextId

	MousePos: POINTER is
		local
			ptr: POINTER
			res: POINTER
		do
			ptr := pointer
			
			c_inline_c ("_res=&((HELPINFO*)_ptr)->MousePos;%N")
			
			Result := res
		end -- MousePos

	MousePosX: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->MousePos.x;%N")
			
			Result := res
		end -- MousePosX

	MousePosY: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res=((HELPINFO*)_ptr)->MousePos.y;%N")
			
			Result := res
		end -- MousePosY

end -- class WIN32_HELPINFO
