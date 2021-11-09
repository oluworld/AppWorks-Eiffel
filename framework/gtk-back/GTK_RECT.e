class GTK_RECT

inherit
    C_STRUCTURE
		redefine external_size
		end

creation
    make_external

feature
    make is
        do
        end -- make

	external_size : INTEGER is 
		external "C inline"
		alias "sizeof(apw_gtk_rect)"
		end -- external_size

feature --Setters

	set_left (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		external "C inline"
		alias "((apw_gtk_rect*)$pointer)->left = $a_var;"
		ensure
			value_set: left = a_var
		end -- set_hwnd

	xset_left (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((apw_gtk_rect*)_ptr)->left = _val;%N")
		ensure
			value_set: left = a_var
		end -- set_hwnd

	set_bottom (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((apw_gtk_rect*)_ptr)->bottom = _val;%N")
		ensure
			value_set: left = a_var
		end -- set_hwnd

	set_top (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((apw_gtk_rect*)_ptr)->top = _val;%N")
		ensure
			value_set: left = a_var
		end -- set_hwnd

	set_right (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((apw_gtk_rect*)_ptr)->right = _val;%N")
		ensure
			value_set: left = a_var
		end -- set_hwnd

feature
		-- Getters

	left: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((apw_gtk_rect*)_ptr)->left;%N")
			Result := res
		end -- message

	right: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((apw_gtk_rect*)_ptr)->right;%N")
			Result := res
		end -- wParam

	top: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((apw_gtk_rect*)_ptr)->top;%N")
			Result := res
		end -- lParam

	bottom: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((apw_gtk_rect*)_ptr)->bottom;%N")
			Result := res
		end -- time

end -- class GTK_RECT
