class WIN32_MINMAXINFO 

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
			c_inline_c ("_res = sizeof(MINMAXINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_ptReserved (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MINMAXINFO*)_ptr)->ptReserved = *((POINT*)_val);%N")
		ensure
		--
		end -- set_ptReserved

	set_ptMaxSize (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MINMAXINFO*)_ptr)->ptMaxSize = *((POINT*)_val);%N")
		ensure
		--
		end -- set_ptMaxSize

	set_ptMaxPosition (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MINMAXINFO*)_ptr)->ptMaxPosition = *((POINT*)_val);%N")
		ensure
		--
		end -- set_ptMaxPosition

	set_ptMinTrackSize (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MINMAXINFO*)_ptr)->ptMinTrackSize = *((POINT*)_val);%N")
		ensure
		--
		end -- set_ptMinTrackSize

	set_ptMaxTrackSize (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MINMAXINFO*)_ptr)->ptMaxTrackSize = *((POINT*)_val);%N")
		ensure
		--
		end -- set_ptMaxTrackSize

feature
		-- Getters

	ptReserved : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MINMAXINFO*)_ptr)->ptReserved);%N")
			Result := res
		end -- ptReserved

	ptMaxSize : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MINMAXINFO*)_ptr)->ptMaxSize);%N")
			Result := res
		end -- ptMaxSize

	ptMaxPosition : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MINMAXINFO*)_ptr)->ptMaxPosition);%N")
			Result := res
		end -- ptMaxPosition

	ptMinTrackSize : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MINMAXINFO*)_ptr)->ptMinTrackSize);%N")
			Result := res
		end -- ptMinTrackSize

	ptMaxTrackSize : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((MINMAXINFO*)_ptr)->ptMaxTrackSize);%N")
			Result := res
		end -- ptMaxTrackSize

end -- class WIN32_MINMAXINFO 
