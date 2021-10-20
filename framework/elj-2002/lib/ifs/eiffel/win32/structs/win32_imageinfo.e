indexing
	contents: "WIN32 iamgeinfo struct"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: no
	tested: no

class WIN32_IMAGEINFO

inherit
	-- uses
	C_STRUCTURE 
		redefine
			external_size
		end

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			c_inline_c ("_res = sizeof(IMAGEINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_hbmImage (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IMAGEINFO*)_ptr)->hbmImage = _val;%N")
		ensure
			value_set: hbmImage = a_var
		end -- set_hbmImage

	set_hbmMask (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IMAGEINFO*)_ptr)->hbmMask = _val;%N")
		ensure
			value_set: hbmMask = a_var
		end -- set_hbmMask

	set_Unused1 (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IMAGEINFO*)_ptr)->Unused1 = _val;%N")
		ensure
			value_set: Unused1 = a_var
		end -- set_Unused1

	set_Unused2 (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IMAGEINFO*)_ptr)->Unused2 = _val;%N")
		ensure
			value_set: Unused2 = a_var
		end -- set_Unused2

	set_rcImage (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IMAGEINFO*)_ptr)->rcImage = *((RECT*)_val);%N")
		ensure
			value_set: rcImage = a_var
		end -- set_rcImage

feature
		-- Getters

	hbmImage : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((IMAGEINFO*)_ptr)->hbmImage;%N")
			Result := res
		end -- hbmImage

	hbmMask : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((IMAGEINFO*)_ptr)->hbmMask;%N")
			Result := res
		end -- hbmMask

	Unused1 : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((IMAGEINFO*)_ptr)->Unused1;%N")
			Result := res
		end -- Unused1

	Unused2 : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((IMAGEINFO*)_ptr)->Unused2;%N")
			Result := res
		end -- Unused2

	rcImage : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)&(((IMAGEINFO*)_ptr)->rcImage);%N")
			Result := res
		end -- rcImage

end -- class WIN32_IMAGEINFO