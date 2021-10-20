class WIN32_MEASUREITEMSTRUCT 

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
			c_inline_c ("_res = sizeof(MEASUREITEMSTRUCT );%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_CtlType (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->CtlType = _val;%N")
		ensure
			value_set: CtlType = a_var
		end -- set_CtlType

	set_CtlID (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->CtlID = _val;%N")
		ensure
			value_set: CtlID = a_var
		end -- set_CtlID

	set_itemID (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->itemID = _val;%N")
		ensure
			value_set: itemID = a_var
		end -- set_itemID

	set_itemWidth (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->itemWidth = _val;%N")
		ensure
			value_set: itemWidth = a_var
		end -- set_itemWidth

	set_itemHeight (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->itemHeight = _val;%N")
		ensure
			value_set: itemHeight = a_var
		end -- set_itemHeight

	set_itemData (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEASUREITEMSTRUCT *)_ptr)->itemData = _val;%N")
		ensure
			value_set: itemData = a_var
		end -- set_itemData

feature
		-- Getters

	CtlType : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->CtlType;%N")
			Result := res
		end -- CtlType

	CtlID : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->CtlID;%N")
			Result := res
		end -- CtlID

	itemID : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->itemID;%N")
			Result := res
		end -- itemID

	itemWidth : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->itemWidth;%N")
			Result := res
		end -- itemWidth

	itemHeight : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->itemHeight;%N")
			Result := res
		end -- itemHeight

	itemData : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEASUREITEMSTRUCT*)_ptr)->itemData;%N")
			Result := res
		end -- itemData

end -- class WIN32_MEASUREITEMSTRUCT 

