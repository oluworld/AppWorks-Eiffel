class WIN32_COMPAREITEMSTRUCT 

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
			c_inline_c ("_res = sizeof(COMPAREITEMSTRUCT);%N")
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
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->CtlType = _val;%N")
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
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->CtlID = _val;%N")
		ensure
			value_set: CtlID = a_var
		end -- set_CtlID

	set_hwndItem (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->hwndItem = _val;%N")
		ensure
			value_set: hwndItem = a_var
		end -- set_hwndItem

	set_itemID1 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->itemID1 = _val;%N")
		ensure
			value_set: itemID1 = a_var
		end -- set_itemID1

	set_itemData1 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->itemData1 = _val;%N")
		ensure
			value_set: itemData1 = a_var
		end -- set_itemData1

	set_itemID2 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->itemID2 = _val;%N")
		ensure
			value_set: itemID2 = a_var
		end -- set_itemID2

	set_itemData2 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COMPAREITEMSTRUCT*)_ptr)->itemData2 = _val;%N")
		ensure
			value_set: itemData2 = a_var
		end -- set_itemData2

feature
		-- Getters

	CtlType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->CtlType;%N")
			Result := res
		end -- CtlType

	CtlID : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->CtlID;%N")
			Result := res
		end -- CtlID

	hwndItem : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((COMPAREITEMSTRUCT*)_ptr)->hwndItem;%N")
			Result := res
		end -- hwndItem

	itemID1 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->itemID1;%N")
			Result := res
		end -- itemID1

	itemData1 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->itemData1;%N")
			Result := res
		end -- itemData1

	itemID2 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->itemID2;%N")
			Result := res
		end -- itemID2

	itemData2 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COMPAREITEMSTRUCT*)_ptr)->itemData2;%N")
			Result := res
		end -- itemData2

end -- class WIN32_COMPAREITEMSTRUCT 

