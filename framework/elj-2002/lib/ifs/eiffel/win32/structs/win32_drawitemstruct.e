class WIN32_DRAWITEMSTRUCT 

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
			c_inline_c ("_res = sizeof(DRAWITEMSTRUCT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_CtlType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->CtlType = _val;%N")
		ensure
			value_set: CtlType = a_var
		end -- set_CtlType

	set_CtlID (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->CtlID = _val;%N")
		ensure
			value_set: CtlID = a_var
		end -- set_CtlID

	set_itemID (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->itemID = _val;%N")
		ensure
			value_set: itemID = a_var
		end -- set_itemID

	set_itemAction (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->itemAction = _val;%N")
		ensure
			value_set: itemAction = a_var
		end -- set_itemAction

	set_itemState (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->itemState = _val;%N")
		ensure
			value_set: itemState = a_var
		end -- set_itemState

	set_hwndItem (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->hwndItem = _val;%N")
		ensure
			value_set: hwndItem = a_var
		end -- set_hwndItem

	set_hDC (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->hDC = _val;%N")
		ensure
			value_set: hDC = a_var
		end -- set_hDC

	set_rcItem (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->rcItem = *((RECT*)_val);%N")
		ensure
			value_set: rcItem = a_var
		end -- set_rcItem

	set_itemData (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DRAWITEMSTRUCT*)_ptr)->itemData = _val;%N")
		ensure
			value_set: itemData = a_var
		end -- set_itemData

feature
		-- Getters

	CtlType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->CtlType;%N")
			Result := res
		end -- CtlType

	CtlID : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->CtlID;%N")
			Result := res
		end -- CtlID

	itemID : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->itemID;%N")
			Result := res
		end -- itemID

	itemAction : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->itemAction;%N")
			Result := res
		end -- itemAction

	itemState : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->itemState;%N")
			Result := res
		end -- itemState

	hwndItem : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->hwndItem;%N")
			Result := res
		end -- hwndItem

	hDC : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->hDC;%N")
			Result := res
		end -- hDC

	rcItem : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((DRAWITEMSTRUCT*)_ptr)->rcItem);%N")
			Result := res
		end -- rcItem

	itemData : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DRAWITEMSTRUCT*)_ptr)->itemData;%N")
			Result := res
		end -- itemData

end -- class WIN32_DRAWITEMSTRUCT 

