class WIN32_GLYPHMETRICS 

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
			c_inline_c ("_res = sizeof(GLYPHMETRICS);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_gmBlackBoxX (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GLYPHMETRICS*)_ptr)->gmBlackBoxX = _val;%N")
		ensure
			value_set: gmBlackBoxX = a_var
		end -- set_gmBlackBoxX

	set_gmBlackBoxY (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GLYPHMETRICS*)_ptr)->gmBlackBoxY = _val;%N")
		ensure
			value_set: gmBlackBoxY = a_var
		end -- set_gmBlackBoxY

	set_gmptGlyphOrigin (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GLYPHMETRICS*)_ptr)->gmptGlyphOrigin = _val;%N")
		ensure
			value_set: gmptGlyphOrigin = a_var
		end -- set_gmptGlyphOrigin

	set_gmCellIncX (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GLYPHMETRICS*)_ptr)->gmCellIncX = _val;%N")
		ensure
			value_set: gmCellIncX = a_var
		end -- set_gmCellIncX

	set_gmCellIncY (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((GLYPHMETRICS*)_ptr)->gmCellIncY = _val;%N")
		ensure
			value_set: gmCellIncY = a_var
		end -- set_gmCellIncY

feature
		-- Getters

	gmBlackBoxX : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GLYPHMETRICS*)_ptr)->abcA;%N")
			Result := res
		end -- gmBlackBoxX

	gmBlackBoxY : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GLYPHMETRICS*)_ptr)->gmBlackBoxY;%N")
			Result := res
		end -- gmBlackBoxY

	gmptGlyphOrigin : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((GLYPHMETRICS*)_ptr)->gmptGlyphOrigin;%N")
			Result := res
		end -- gmptGlyphOrigin

	gmCellIncX : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GLYPHMETRICS*)_ptr)->gmCellIncX;%N")
			Result := res
		end -- gmCellIncX

	gmCellIncY : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((GLYPHMETRICS*)_ptr)->gmCellIncY;%N")
			Result := res
		end -- gmCellIncY

end -- class WIN32_GLYPHMETRICS 

