class WIN32_MDICREATESTRUCT 

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
			c_inline_c ("_res = sizeof(MDICREATESTRUCT );%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_szClass (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->szClass = _val;%N")
		ensure
--			value_set: szClass.is_equal(a_var)
		end -- set_szClass

	set_szTitle (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->szTitle = _val;%N")
		ensure
--			value_set: szTitle.is_equal(a_var)
		end -- set_szTitle

	set_hOwner (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->hOwner = _val;%N")
		ensure
			value_set: hOwner = a_var
		end -- set_hOwner

	set_x (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->x = _val;%N")
		ensure
			value_set: x = a_var
		end -- set_x

	set_y (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->y = _val;%N")
		ensure
			value_set: y = a_var
		end -- set_y

	set_cx (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->cx = _val;%N")
		ensure
			value_set: cx = a_var
		end -- set_cx

	set_cy (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->cy = _val;%N")
		ensure
			value_set: cy = a_var
		end -- set_cy

	set_style (a_var : BIT 32) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: BIT 32
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->style = _val;%N")
		ensure
			value_set: style = a_var
		end -- set_style

	set_lParam (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MDICREATESTRUCT*)_ptr)->lParam = _val;%N")
		ensure
			value_set: lParam = a_var
		end -- set_lParam

feature
		-- Getters

	szClass : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->abcA;%N")
			Result := res
		end -- szClass

	szTitle : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->szTitle;%N")
			Result := res
		end -- szTitle

	hOwner : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MDICREATESTRUCT*)_ptr)->hOwner;%N")
			Result := res
		end -- hOwner

	x : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->x;%N")
			Result := res
		end -- x

	y : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->y;%N")
			Result := res
		end -- y

	cx : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->cx;%N")
			Result := res
		end -- cx

	cy : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->cy;%N")
			Result := res
		end -- cy

	style : BIT 32 is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: BIT 32
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->style;%N")
			Result := res
		end -- style

	lParam : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MDICREATESTRUCT*)_ptr)->lParam;%N")
			Result := res
		end -- lParam

end -- class WIN32_MDICREATESTRUCT 

