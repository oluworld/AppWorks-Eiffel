indexing
	contents: "WIN32 LOGPALETTE structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_LOGPALETTE

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
			c_inline_c ("_res = sizeof(LOGPALETTE);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	set_palVersion (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGPALETTE*)_ptr)->palVersion = _val;%N")
		ensure
			value_set: palVersion = a_var
		end -- set_palVersion

	set_palNumEntries (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGPALETTE*)_ptr)->palNumEntries = _val;%N")
		ensure
			value_set: palNumEntries = a_var
		end -- set_palNumEntries

	set_palPalEntry (a_var : POINTER; a_idx: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			idx := a_idx
			ptr := pointer
			c_inline_c ("((LOGPALETTE*)_ptr)->palPalEntry[_idx] = *((PALETTEENTRY*)_val);%N")
		ensure
--			value_set: palPalEntry (a_idx) = a_var
		end -- set_palPalEntry

feature {ANY}
		-- getters

	palVersion : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGPALETTE*)_ptr)->palVersion;%N")
			Result := res
		end -- palVersion

	palNumEntries : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGPALETTE*)_ptr)->palNumEntries;%N")
			Result := res
		end -- palNumEntries

	palPalEntry (a_index : INTEGER) : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			idx := a_index
			c_inline_c ("_res=(EIF_POINTER)&(((LOGPALETTE*)_ptr)->palPalEntry[_idx]);%N")
			Result := res
		end -- palPalEntry

end -- class WIN32_LOGPALETTE