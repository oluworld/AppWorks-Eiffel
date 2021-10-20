indexing
	contents: "WIN32 ENUMLOGFONT structure"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: no
	
class WIN32_ENUMLOGFONT

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
			c_inline_c ("_res = sizeof(ENUMLOGFONT);%N")
			Result := res
		end -- count
	
feature

	elfLogFont: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUMLOGFONT*)_ptr)->elfLogFont;%N")
			Result := res
		end -- elfLogFont
		
	elfFullName: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUMLOGFONT*)_ptr)->elfFullName;%N")
			Result := res
		end -- elfFullName
		
	elfStyle: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUMLOGFONT*)_ptr)->elfStyle;%N")
			Result := res
		end -- elfStyle
		
end -- class WIN32_ENUMLOGFONT