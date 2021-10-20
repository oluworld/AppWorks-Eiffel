class WIN32_CHOOSEFONT

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
			c_inline_c ("_res = sizeof(CHOOSEFONT);%N")
			Result := res
		end -- external_size
	
feature

	set_lStructSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lStructSize = _val;%N")
		end -- set_lStructSize

	set_hwndOwner (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->hwndOwner = _val;%N")
		end -- set_hwndOwner

	set_hDC (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->hDC = _val;%N")
		end -- set_hDC

	set_lpLogFont (a_val : WIN32_LOGFONT) is
		local
			ptr : POINTER
			val : WIN32_LOGFONT
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lpLogFont = *((LPLOGFONT *) _val);%N")
		end -- set_lpLogFont

	set_iPointSize (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->iPointSize = _val;%N")
		end -- set_iPointSize

	set_Flags (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->Flags = _val;%N")
		end -- set_Flags

	set_rgbColors (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->rgbColors = _val;%N")
		end -- set_rgbColors

	set_lCustData (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lCustData = _val;%N")
		end -- set_lCustData

	set_lpfnHook (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lpfnHook = _val;%N")
		end -- set_lpfnHook

	set_lpTemplateName (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lpTemplateName = _val;%N")
		end -- set_lpTemplateName

	set_hInstance (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->hInstance = _val;%N")
		end -- set_hInstance

	set_lpszStyle (a_val : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->lpszStyle = _val;%N")
		end -- set_lpszStyle

	set_nFontType (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->nFontType = _val;%N")
		end -- set_nFontType

	set_MISSING_ALIGNMENT (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->MISSING_ALIGNMENT = _val;%N")
		end -- set_MISSING_ALIGNMENT

	set_nSizeMin (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->nSizeMin = _val;%N")
		end -- set_nSizeMin

	set_nSizeMax (a_val : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_val
			c_inline_c("((CHOOSEFONT*)_ptr)->nSizeMax = _val;%N")
		end -- set_nSizeMax

feature
		-- getters

	lStructSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->lStructSize;%N")
			Result := res
		end -- lStructSize

	hwndOwner : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->hwndOwner;%N")
			Result := res
		end -- hwndOwner

	hDC : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->hDC;%N")
			Result := res
		end -- hDC

	lpLogFont : WIN32_LOGFONT is
		local
			ptr : POINTER
			res : WIN32_LOGFONT
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) &((CHOOSEFONT*)_ptr)->lpLogFont;%N")
			Result := res
		end -- lpLogFont

	iPointSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->iPointSize;%N")
			Result := res
		end -- iPointSize

	Flags : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->Flags;%N")
			Result := res
		end -- Flags

	rgbColors : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->rgbColors;%N")
			Result := res
		end -- rgbColors

	lCustData : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->lCustData;%N")
			Result := res
		end -- lCustData

	lpfnHook : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->lpfnHook;%N")
			Result := res
		end -- lpfnHook

	lpTemplateName : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->lpTemplateName;%N")
			Result := res
		end -- lpTemplateName

	hInstance : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->hInstance;%N")
			Result := res
		end -- hInstance

	lpszStyle : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((CHOOSEFONT*)_ptr)->lpszStyle;%N")
			Result := res
		end -- lpszStyle

	nFontType : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->nFontType;%N")
			Result := res
		end -- nFontType

	MISSING_ALIGNMENT : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->MISSING_ALIGNMENT;%N")
			Result := res
		end -- MISSING_ALIGNMENT

	nSizeMin : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->nSizeMin;%N")
			Result := res
		end -- nSizeMin

	nSizeMax : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((CHOOSEFONT*)_ptr)->nSizeMax;%N")
			Result := res
		end -- nSizeMax

end -- class WIN32_CHOOSEFONT