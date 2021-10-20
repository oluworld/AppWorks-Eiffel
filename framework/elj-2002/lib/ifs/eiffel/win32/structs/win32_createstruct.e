class WIN32_CREATESTRUCT 

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
			c_inline_c ("_res = sizeof(CREATESTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_lpCreateParams (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->lpCreateParams = _val;%N")
		ensure
			value_set: lpCreateParams = a_var
		end -- set_lpCreateParams

	set_hInstance (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->hInstance = _val;%N")
		ensure
			value_set: hInstance = a_var
		end -- set_hInstance

	set_hMenu (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->hMenu = _val;%N")
		ensure
			value_set: hMenu = a_var
		end -- set_hMenu

	set_hwndParent (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->hwndParent = _val;%N")
		ensure
			value_set: hwndParent = a_var
		end -- set_hwndParent

	set_cy (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->cy = _val;%N")
		ensure
			value_set: cy = a_var
		end -- set_cy

	set_cx (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->cx = _val;%N")
		ensure
			value_set: cx = a_var
		end -- set_cx

	set_y (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->y = _val;%N")
		ensure
			value_set: y = a_var
		end -- set_y

	set_x (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->x = _val;%N")
		ensure
			value_set: x = a_var
		end -- set_x

	set_style (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->style = _val;%N")
		ensure
			value_set: style = a_var
		end -- set_style

	set_lpszName (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->lpszName = _val;%N")
		ensure
			value_set: lpszName = a_var
		end -- set_lpszName

	set_lpszClass (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->lpszClass = _val;%N")
		ensure
			value_set: lpszClass = a_var
		end -- set_lpszClass

	set_dwExStyle (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CREATESTRUCT*)_ptr)->dwExStyle = _val;%N")
		ensure
			value_set: dwExStyle = a_var
		end -- set_dwExStyle

feature
		-- Getters

	lpCreateParams : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->lpCreateParams;%N")
			Result := res
		end -- lpCreateParams

	hInstance : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->hInstance;%N")
			Result := res
		end -- hInstance

	hMenu : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->hMenu;%N")
			Result := res
		end -- hMenu

	hwndParent : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->hwndParent;%N")
			Result := res
		end -- hwndParent

	cy : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->cy;%N")
			Result := res
		end -- cy

	cx : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->cx;%N")
			Result := res
		end -- cx

	y : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->y;%N")
			Result := res
		end -- y

	x : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->x;%N")
			Result := res
		end -- x

	style : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->style;%N")
			Result := res
		end -- style

	lpszName : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->lpszName;%N")
			Result := res
		end -- lpszName

	lpszClass : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CREATESTRUCT*)_ptr)->lpszClass;%N")
			Result := res
		end -- lpszClass

	dwExStyle : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CREATESTRUCT*)_ptr)->dwExStyle;%N")
			Result := res
		end -- dwExStyle

end -- class WIN32_CREATESTRUCT