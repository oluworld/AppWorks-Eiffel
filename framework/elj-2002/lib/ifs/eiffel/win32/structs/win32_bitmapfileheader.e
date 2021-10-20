indexing
	contents: "WIN32 bitmapfileheader struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAPFILEHEADER 

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
			c_inline_c ("_res = sizeof(BITMAPFILEHEADER);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_bfType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPFILEHEADER*)_ptr)->bfType = _val;%N")
		ensure
			value_set: bfType = a_var
		end -- set_bfType

	set_bfSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPFILEHEADER*)_ptr)->bfSize = _val;%N")
		ensure
			value_set: bfSize = a_var
		end -- set_bfSize

	set_bfReserved1 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPFILEHEADER*)_ptr)->bfReserved1 = _val;%N")
		ensure
			value_set: bfReserved1 = a_var
		end -- set_bfReserved1

	set_bfReserved2 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPFILEHEADER*)_ptr)->bfReserved2 = _val;%N")
		ensure
			value_set: bfReserved2 = a_var
		end -- set_bfReserved2

	set_bfOffBits (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPFILEHEADER*)_ptr)->bfOffBits = _val;%N")
		ensure
			value_set: bfOffBits = a_var
		end -- set_bfOffBits

feature
		-- Getters

	bfType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPFILEHEADER*)_ptr)->bfType;%N")
			Result := res
		end -- bfType

	bfSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPFILEHEADER*)_ptr)->bfSize;%N")
			Result := res
		end -- bfSize

	bfReserved1 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPFILEHEADER*)_ptr)->bfReserved1;%N")
			Result := res
		end -- bfReserved1

	bfReserved2 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPFILEHEADER*)_ptr)->bfReserved2;%N")
			Result := res
		end -- bfReserved2

	bfOffBits : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPFILEHEADER*)_ptr)->bfOffBits;%N")
			Result := res
		end -- bfOffBits

end -- class WIN32_BITMAPFILEHEADER 

