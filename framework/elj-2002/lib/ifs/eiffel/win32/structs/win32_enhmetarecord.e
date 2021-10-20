indexing
	contents: "WIN32 enhmetarecord struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_ENHMETARECORD

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
			c_inline_c ("_res = sizeof(ENHMETARECORD);%N")
			Result := res
		end -- count

feature
		--Setters

	set_iType (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETARECORD*)_ptr)->iType = _val;%N")
		ensure
			value_set: iType = a_var
		end -- set_iType

	set_nSize (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETARECORD*)_ptr)->nSize = _val;%N")
		ensure
			value_set: nSize = a_var
		end -- set_nSize

	set_dParm (a_var: INTEGER; a_index: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			idx := a_index
			ptr := pointer
			c_inline_c ("((ENHMETARECORD*)_ptr)->dParm[_idx] = _val;%N")
		ensure
			value_set: dParm (a_index) = a_var
		end -- set_dParm


feature
		--Getters

	iType : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((ENHMETARECORD*)_ptr)->iType;%N")
			Result := res
		end -- iType

	nSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((ENHMETARECORD*)_ptr)->nSize;%N")
			Result := res
		end -- nSize

	dParm (a_index: INTEGER) : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			idx: INTEGER
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			idx := a_index
			c_inline_c ("_res = ((ENHMETARECORD*)_ptr)->dParm[_idx];%N")
			Result := res
		end -- dParm
		
end -- class WIN32_ENHMETARECORD