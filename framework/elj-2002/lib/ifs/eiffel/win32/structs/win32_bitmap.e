indexing
	contents: "WIN32 bitmap struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAP

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
			c_inline_c ("_res = sizeof(BITMAP);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_bmHeight (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmHeight = _val;%N")
		ensure
			value_set: bmHeight = a_var
		end -- set_bmHeight

	set_bmBits (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmBits = _val;%N")
		ensure
			value_set: bmBits = a_var
		end -- set_bmBits

	set_bmType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmType = _val;%N")
		ensure
			value_set: bmType = a_var
		end -- set_bmType

	set_bmPlanes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmPlanes = _val;%N")
		ensure
			value_set: bmPlanes = a_var
		end -- set_bmPlanes

	set_bmBitsPixel (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmBitsPixel = _val;%N")
		ensure
			value_set: bmBitsPixel = a_var
		end -- set_bmBitsPixel

	set_bmWidthBytes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmWidthBytes = _val;%N")
		ensure
			value_set: bmWidthBytes = a_var
		end -- set_bmWidthBytes

	set_bmWidth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAP*)_ptr)->bmWidth = _val;%N")
		ensure
			value_set: bmWidth = a_var
		end -- set_bmWidth

feature
		-- Getters

	bmHeight : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmHeight;%N")
			Result := res
		end -- bmHeight

	bmBits : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((BITMAP*)_ptr)->bmHeight;%N")
			Result := res
		end -- bmBits

	bmType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmType;%N")
			Result := res
		end -- bmType

	bmPlanes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmPlanes;%N")
			Result := res
		end -- bmPlanes

	bmBitsPixel : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmBitsPixel;%N")
			Result := res
		end -- bmBitsPixel

	bmWidthBytes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmWidthBytes;%N")
			Result := res
		end -- bmWidthBytes

	bmWidth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAP*)_ptr)->bmWidth;%N")
			Result := res
		end -- bmWidth

end -- class WIN32_BITMAP

