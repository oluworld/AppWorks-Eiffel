indexing
	contents: "WIN32 bitmapinfoheader struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAPINFOHEADER 

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
			c_inline_c ("_res = sizeof(BITMAPINFOHEADER);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_biSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biSize = _val;%N")
		ensure
			value_set: biSize = a_var
		end -- set_biSize

	set_biWidth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biWidth = _val;%N")
		ensure
			value_set: biWidth = a_var
		end -- set_biWidth

	set_biHeight (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biWidth = _val;%N")
		ensure
			value_set: biHeight = a_var
		end -- set_biHeight

	set_biPlanes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biPlanes = _val;%N")
		ensure
			value_set: biPlanes = a_var
		end -- set_biPlanes

	set_biBitCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biBitCount = _val;%N")
		ensure
			value_set: biBitCount = a_var
		end -- set_biBitCount

	set_biCompression (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biCompression = _val;%N")
		ensure
			value_set: biCompression = a_var
		end -- set_biCompression

	set_biSizeImage (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biSizeImage = _val;%N")
		ensure
			value_set: biSizeImage = a_var
		end -- set_biSizeImage

	set_biXPelsPerMeter (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biXPelsPerMeter = _val;%N")
		ensure
			value_set: biXPelsPerMeter = a_var
		end -- set_biXPelsPerMeter

	set_biYPelsPerMeter (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biYPelsPerMeter = _val;%N")
		ensure
			value_set: biYPelsPerMeter = a_var
		end -- set_biYPelsPerMeter

	set_biClrUsed (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biClrUsed = _val;%N")
		ensure
			value_set: biClrUsed = a_var
		end -- set_biClrUsed

	set_biClrImportant (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFOHEADER*)_ptr)->biClrImportant = _val;%N")
		ensure
			value_set: biClrImportant = a_var
		end -- set_biClrImportant

feature
		-- Getters

	biSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biSize;%N")
			Result := res
		end -- biSize

	biWidth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biWidth;%N")
			Result := res
		end -- biWidth

	biHeight : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biHeight;%N")
			Result := res
		end -- biHeight

	biPlanes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biPlanes;%N")
			Result := res
		end -- biPlanes

	biBitCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biBitCount;%N")
			Result := res
		end -- biBitCount

	biCompression : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biCompression;%N")
			Result := res
		end -- biCompression

	biSizeImage : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biSizeImage;%N")
			Result := res
		end -- biSizeImage

	biXPelsPerMeter : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biXPelsPerMeter;%N")
			Result := res
		end -- biXPelsPerMeter

	biYPelsPerMeter : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biYPelsPerMeter;%N")
			Result := res
		end -- biYPelsPerMeter

	biClrUsed : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biClrUsed;%N")
			Result := res
		end -- biClrUsed

	biClrImportant : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFOHEADER*)_ptr)->biClrImportant;%N")
			Result := res
		end -- biClrImportant

end -- class WIN32_BITMAPINFOHEADER 

