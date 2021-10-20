class AUX_RGBIMAGEREC

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
			c_inline_c ("_res = sizeof(AUX_RGBImageRec);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_sizeX (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((AUX_RGBImageRec*)_ptr)->sizeX = (GLint) _val;%N")
		ensure
			value_set: sizeX = a_var
		end -- set_sizeX

	set_sizeY (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((AUX_RGBImageRec*)_ptr)->sizeY = (GLint) _val;%N")
		ensure
			value_set: sizeY = a_var
		end -- set_sizeY

	set_data (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((AUX_RGBImageRec*)_ptr)->data = (unsigned char *) _val;%N")
		ensure
			value_set: data = a_var
		end -- set_data

feature
		-- Getters

	sizeX : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((AUX_RGBImageRec*)_ptr)->sizeX;%N")
			Result := res
		end -- sizeX

	sizeY : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((AUX_RGBImageRec*)_ptr)->sizeY;%N")
			Result := res
		end -- sizeY

	data : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((AUX_RGBImageRec*)_ptr)->data;%N")
			Result := res
		end -- data

end -- class AUX_RGBIMAGEREC 

