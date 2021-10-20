indexing
	contents: "WIN32 coloradjustment struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_COLORADJUSTMENT 

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
			c_inline_c ("_res = sizeof(COLORADJUSTMENT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_caSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caSize = _val;%N")
		ensure
			value_set: caSize = a_var
		end -- set_caSize

	set_caFlags (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caFlags = _val;%N")
		ensure
			value_set: caFlags = a_var
		end -- set_caFlags

	set_caIlluminantIndex (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caIlluminantIndex = _val;%N")
		ensure
			value_set: caIlluminantIndex = a_var
		end -- set_caIlluminantIndex

	set_caRedGamma (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caRedGamma = _val;%N")
		ensure
			value_set: caRedGamma = a_var
		end -- set_caRedGamma

	set_caGreenGamma (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caGreenGamma = _val;%N")
		ensure
			value_set: caGreenGamma = a_var
		end -- set_caGreenGamma

	set_caBlueGamma (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caBlueGamma = _val;%N")
		ensure
			value_set: caBlueGamma = a_var
		end -- set_caBlueGamma

	set_caReferenceBlack (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caReferenceBlack = _val;%N")
		ensure
			value_set: caReferenceBlack = a_var
		end -- set_caReferenceBlack

	set_caReferenceWhite (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caReferenceWhite = _val;%N")
		ensure
			value_set: caReferenceWhite = a_var
		end -- set_caReferenceWhite

	set_caContrast (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caContrast = _val;%N")
		ensure
			value_set: caContrast = a_var
		end -- set_caContrast

	set_caBrightness (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caBrightness = _val;%N")
		ensure
			value_set: caBrightness = a_var
		end -- set_caBrightness

	set_caColorfulness (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caColorfulness = _val;%N")
		ensure
			value_set: caColorfulness = a_var
		end -- set_caColorfulness

	set_caRedGreenTint (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((COLORADJUSTMENT*)_ptr)->caRedGreenTint = _val;%N")
		ensure
			value_set: caRedGreenTint = a_var
		end -- set_caRedGreenTint

feature
		-- Getters

	caSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caSize;%N")
			Result := res
		end -- caSize

	caFlags : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caFlags;%N")
			Result := res
		end -- caFlags

	caIlluminantIndex : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caIlluminantIndex;%N")
			Result := res
		end -- caIlluminantIndex

	caRedGamma : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caRedGamma;%N")
			Result := res
		end -- caRedGamma

	caGreenGamma : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caGreenGamma;%N")
			Result := res
		end -- caGreenGamma

	caBlueGamma : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caBlueGamma;%N")
			Result := res
		end -- caBlueGamma

	caReferenceBlack : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caReferenceBlack;%N")
			Result := res
		end -- caReferenceBlack

	caReferenceWhite : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caReferenceWhite;%N")
			Result := res
		end -- caReferenceWhite

	caContrast : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caContrast;%N")
			Result := res
		end -- caContrast

	caBrightness : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caBrightness;%N")
			Result := res
		end -- caBrightness

	caColorfulness : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caColorfulness;%N")
			Result := res
		end -- caColorfulness

	caRedGreenTint : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((COLORADJUSTMENT*)_ptr)->caRedGreenTint;%N")
			Result := res
		end -- caRedGreenTint

end -- class WIN32_COLORADJUSTMENT 
