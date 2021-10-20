indexing
	contents: "WIN32 bitmapinfo struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAPINFO

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
			c_inline_c ("_res = sizeof(BITMAPINFO);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_bmiHeader (a_var: POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((BITMAPINFO*)_ptr)->bmiHeader = _val;%N")
		ensure
			value_set: bmiHeader = a_var
		end -- set_bmiHeader

	set_bmiColors (a_var: INTEGER; a_idx: INTEGER) is
		local
			val: INTEGER
			idx: INTEGER
			ptr: POINTER
		do
			val := a_var
			idx := a_idx
			ptr := pointer
			c_inline_c ("((BITMAPINFO*)_ptr)->bmiColors[_idx] = (RGBQUAD)_val;%N")
		ensure
			value_set: bmiColors (a_idx) = a_var
		end -- set_bmiColors

feature
		-- Getters

	bmiHeader: POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((BITMAPINFO*)_ptr)->bmiHeader);%N")
			Result := res
		end -- bmiHeader

	bmiColors (a_index: INTEGER): INTEGER is
		local
			res: INTEGER
			idx: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			idx := a_index
			c_inline_c ("_res=(EIF_INTEGER)((BITMAPINFO*)_ptr)->bmiColors[_idx];%N")
			Result := res
		end -- bmiColors

end -- class WIN32_BITMAPINFO

