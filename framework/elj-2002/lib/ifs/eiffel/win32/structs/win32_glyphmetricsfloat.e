class WIN32_GLYPHMETRICSFLOAT 

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
			c_inline_c ("_res = sizeof(GLYPHMETRICSFLOAT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_gmfBlackBoxX (a_var : REAL) is
		local
			ptr : POINTER
			val : REAL
		do
			ptr := pointer
			val := a_var
			c_inline_c("((GLYPHMETRICSFLOAT*)_ptr)->gmfBlackBoxX = _val;%N")
		ensure
			value_set: gmfBlackBoxX = a_var
		end -- set_gmfBlackBoxX

	set_gmfBlackBoxY (a_var : REAL) is
		local
			ptr : POINTER
			val : REAL
		do
			ptr := pointer
			val := a_var
			c_inline_c("((GLYPHMETRICSFLOAT*)_ptr)->gmfBlackBoxY = _val;%N")
		ensure
			value_set: gmfBlackBoxY = a_var
		end -- set_gmfBlackBoxY

	set_gmfptGlyphOrigin (a_var : POINTER) is
		local
			ptr : POINTER
			val : POINTER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((GLYPHMETRICSFLOAT*)_ptr)->gmfptGlyphOrigin = _val;%N")
		ensure
			value_set: gmfptGlyphOrigin = a_var
		end -- set_gmfptGlyphOrigin

	set_gmfCellIncX (a_var : REAL) is
		local
			ptr : POINTER
			val : REAL
		do
			ptr := pointer
			val := a_var
			c_inline_c("((GLYPHMETRICSFLOAT*)_ptr)->gmfCellIncX = _val;%N")
		ensure
			value_set: gmfCellIncX = a_var
		end -- set_gmfCellIncX

	set_gmfCellIncY (a_var : REAL) is
		local
			ptr : POINTER
			val : REAL
		do
			ptr := pointer
			val := a_var
			c_inline_c("((GLYPHMETRICSFLOAT*)_ptr)->gmfCellIncY = _val;%N")
		ensure
			value_set: gmfCellIncY = a_var
		end -- set_gmfCellIncY

feature
		-- Getters

	gmfBlackBoxX : REAL is
		local
			ptr : POINTER
			res : REAL
		do
			ptr := pointer
			c_inline_c("_res = (EIF_REAL) ((GLYPHMETRICSFLOAT*)_ptr)->gmfBlackBoxX;%N")
			Result := res
		end -- gmfBlackBoxX

	gmfBlackBoxY : REAL is
		local
			ptr : POINTER
			res : REAL
		do
			ptr := pointer
			c_inline_c("_res = (EIF_REAL) ((GLYPHMETRICSFLOAT*)_ptr)->gmfBlackBoxY;%N")
			Result := res
		end -- gmfBlackBoxY

	gmfptGlyphOrigin : POINTER is
		local
			ptr : POINTER
			res : POINTER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_POINTER) ((GLYPHMETRICSFLOAT*)_ptr)->gmfptGlyphOrigin;%N")
			Result := res
		end -- gmfptGlyphOrigin

	gmfCellIncX : REAL is
		local
			ptr : POINTER
			res : REAL
		do
			ptr := pointer
			c_inline_c("_res = (EIF_REAL) ((GLYPHMETRICSFLOAT*)_ptr)->gmfCellIncX;%N")
			Result := res
		end -- gmfCellIncX

	gmfCellIncY : REAL is
		local
			ptr : POINTER
			res : REAL
		do
			ptr := pointer
			c_inline_c("_res = (EIF_REAL) ((GLYPHMETRICSFLOAT*)_ptr)->gmfCellIncY;%N")
			Result := res
		end -- gmfCellIncY

end -- class WIN32_GLYPHMETRICSFLOAT