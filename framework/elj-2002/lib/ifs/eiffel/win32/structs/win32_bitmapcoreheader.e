indexing
	contents: "WIN32 bitmapcoreheader struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAPCOREHEADER 

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
			c_inline_c ("_res = sizeof(BITMAPCOREHEADER);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_bcSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPCOREHEADER*)_ptr)->bcSize = _val;%N")
		ensure
			value_set: bcSize = a_var
		end -- set_bcSize

	set_bcWidth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPCOREHEADER*)_ptr)->bcWidth = _val;%N")
		ensure
			value_set: bcWidth = a_var
		end -- set_bcWidth

	set_bcHeight (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPCOREHEADER*)_ptr)->bcHeight = _val;%N")
		ensure
			value_set: bcHeight = a_var
		end -- set_bcHeight

	set_bcPlanes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPCOREHEADER*)_ptr)->bcPlanes = _val;%N")
		ensure
			value_set: bcPlanes = a_var
		end -- set_bcPlanes

	set_bcBitCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPCOREHEADER*)_ptr)->bcBitCount = _val;%N")
		ensure
			value_set: bcBitCount = a_var
		end -- set_bcBitCount

feature
		-- Getters

	bcSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPCOREHEADER*)_ptr)->bcSize;%N")
			Result := res
		end -- bcSize

	bcWidth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPCOREHEADER*)_ptr)->bcWidth;%N")
			Result := res
		end -- bcWidth

	bcHeight : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPCOREHEADER*)_ptr)->bcHeight;%N")
			Result := res
		end -- bcHeight

	bcPlanes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPCOREHEADER*)_ptr)->bcPlanes;%N")
			Result := res
		end -- bcPlanes

	bcBitCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPCOREHEADER*)_ptr)->bcBitCount;%N")
			Result := res
		end -- bcBitCount

end -- class WIN32_BITMAPCOREHEADER 

