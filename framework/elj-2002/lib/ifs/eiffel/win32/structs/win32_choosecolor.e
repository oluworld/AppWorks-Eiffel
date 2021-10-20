class WIN32_CHOOSECOLOR

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
			c_inline_c ("_res = sizeof(CHOOSECOLOR);%N")
			Result := res
		end -- external_size
	
feature
		-- setters

	set_lStructSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->lStructSize = _val;%N")
		end -- set_lStructSize

	set_hwndOwner (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->hwndOwner = _val;%N")
		end -- set_hwndOwner

	set_hInstance (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->hInstance = _val;%N")
		end -- set_hInstance

	set_rgbResult (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->rgbResult = _val;%N")
		end -- set_rgbResult

	set_lpCustColors (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->lpCustColors = _val;%N")
		end -- set_lpCustColors

	set_Flags (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->Flags = _val;%N")
		end -- set_Flags

	set_lCustData (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->lCustData = _val;%N")
		end -- set_lCustData

	set_lpfnHook (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->lpfnHook = _val;%N")
		end -- set_lpfnHook

	set_lpTemplateName (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSECOLOR*)_ptr)->lpTemplateName = _val;%N")
		end -- set_lpTemplateName

feature
		-- getters

	lStructSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSECOLOR*)_ptr)->lStructSize;%N")
			Result := res
		end -- lStructSize

	hwndOwner : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSECOLOR*)_ptr)->hwndOwner;%N")
			Result := res
		end -- hwndOwner

	hInstance : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSECOLOR*)_ptr)->hInstance;%N")
			Result := res
		end -- hInstance

	rgbResult : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSECOLOR*)_ptr)->rgbResult;%N")
			Result := res
		end -- rgbResult

	lpCustColors : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSECOLOR*)_ptr)->lpCustColors;%N")
			Result := res
		end -- lpCustColors

	Flags : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSECOLOR*)_ptr)->Flags;%N")
			Result := res
		end -- Flags

	lCustData : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSECOLOR*)_ptr)->lCustData;%N")
			Result := res
		end -- lCustData

	lpfnHook : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSECOLOR*)_ptr)->lpfnHook;%N")
			Result := res
		end -- lpfnHook

	lpTemplateName : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSECOLOR*)_ptr)->lpTemplateName;%N")
			Result := res
		end -- lpTemplateName

end -- class WIN32_CHOOSECOLOR