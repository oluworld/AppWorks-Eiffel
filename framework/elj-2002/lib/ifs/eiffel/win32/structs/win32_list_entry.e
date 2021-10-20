class WIN32_LIST_ENTRY

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
			c_inline_c ("_res = sizeof(LIST_ENTRY);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_Flink (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LIST_ENTRY*)_ptr)->Flink = _val;%N")
		ensure
--			value_set: Flink.is_equal(a_var)
		end -- set_Flink

	set_Blink (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LIST_ENTRY*)_ptr)->Blink = _val;%N")
		ensure
--			value_set: Blink.is_equal(a_var)
		end -- set_Blink


feature {ANY}
		-- getters

	Flink : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LIST_ENTRY*)_ptr)->Flink;%N")
			Result := res
		end -- Flink

	Blink : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LIST_ENTRY*)_ptr)->Blink;%N")
			Result := res
		end -- Blink

end -- class WIN32_LIST_ENTRY