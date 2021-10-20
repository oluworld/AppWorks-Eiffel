class WIN32_DIBSECTION

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
			c_inline_c ("_res = sizeof(DIBSECTION);%N")
			Result := res
		end -- external_size
	
feature

	dsBm: POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=&(((DIBSECTION*)_ptr)->dsBm);%N")
			Result := res
		end -- dsBm
	
	dsBmih: POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=&(((DIBSECTION*)_ptr)->dsBmih);%N")
			Result := res
		end -- dsBmih
	
	dsBitFields (a_index: INTEGER): INTEGER is
		require
			valid_index: 0 <= a_index and a_index <= 2
		local
			res: INTEGER
			idx: INTEGER
			ptr: POINTER
		do
			idx := a_index
			ptr := pointer
			c_inline_c ("_res=((DIBSECTION*)_ptr)->dsBitfields[_idx];%N")
			Result := res
		end -- dsBitFields
	
	dsBitFieldPtr: POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(void*)((DIBSECTION*)_ptr)->dsBitfields;%N")
			Result := res
		end -- dsBitFields
	
	dshSection: POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=((DIBSECTION*)_ptr)->dshSection;%N")
			Result := res
		end -- dshSection
	
	dsOffset: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=((DIBSECTION*)_ptr)->dsOffset;%N")
			Result := res
		end -- dsOffset

feature

	set_dsBitFields (a_value, a_index: INTEGER) is
		require
			valid_index: 0 <= a_index and a_index <= 2
		local
			val: INTEGER
			idx: INTEGER
			ptr: POINTER
		do
			idx := a_index
			ptr := pointer
			val := a_value

			c_inline_c ("((DIBSECTION*)_ptr)->dsBitfields[_idx]=_val;%N")
		end -- set_dsBitFields
	
end -- class WIN32_DIBSECTION