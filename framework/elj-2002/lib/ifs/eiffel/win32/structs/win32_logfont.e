class WIN32_LOGFONT

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
			c_inline_h ("#include <tchar.h>")
			c_inline_c ("_res = sizeof(LOGFONT);%N")
			Result := res
		end -- external_size
	
feature {ANY}
		-- setters

	lfHeight : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfHeight;%N")
			Result := res
		end -- lfHeight

	lfWidth : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfWidth;%N")
			Result := res
		end -- lfWidth

	lfEscapement : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfEscapement;%N")
			Result := res
		end -- lfEscapement

	lfOrientation : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfOrientation;%N")
			Result := res
		end -- lfOrientation

	lfWeight : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfWeight;%N")
			Result := res
		end -- lfWeight

	lfItalic : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfItalic;%N")
			Result := res
		end -- lfItalic

	lfUnderline : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfUnderline;%N")
			Result := res
		end -- lfUnderline

	lfStrikeOut : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfStrikeOut;%N")
			Result := res
		end -- lfStrikeOut

	lfCharSet : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfCharSet;%N")
			Result := res
		end -- lfCharSet

	lfOutPrecision : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfOutPrecision;%N")
			Result := res
		end -- lfOutPrecision

	lfClipPrecision : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfClipPrecision;%N")
			Result := res
		end -- lfClipPrecision

	lfQuality : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfQuality;%N")
			Result := res
		end -- lfQuality

	lfPitchAndFamily : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((LOGFONT*)_ptr)->lfPitchAndFamily;%N")
			Result := res
		end -- lfPitchAndFamily

	lfFaceName : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((LOGFONT*)_ptr)->lfFaceName;%N")
			Result := res
		end -- lfFaceName

feature {ANY}
		-- getters

	set_lfHeight (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfHeight = _val;%N")
		ensure
			value_set: lfHeight = a_var
		end -- set_lfHeight

	set_lfWidth (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfWidth = _val;%N")
		ensure
			value_set: lfWidth = a_var
		end -- set_lfWidth

	set_lfEscapement (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfEscapement = _val;%N")
		ensure
			value_set: lfEscapement = a_var
		end -- set_lfEscapement

	set_lfOrientation (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfOrientation = _val;%N")
		ensure
			value_set: lfOrientation = a_var
		end -- set_lfOrientation

	set_lfWeight (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfWeight = _val;%N")
		ensure
			value_set: lfWeight = a_var
		end -- set_lfWeight

	set_lfItalic (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfItalic = _val;%N")
		ensure
			value_set: lfItalic = a_var
		end -- set_lfItalic

	set_lfUnderline (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfUnderline = _val;%N")
		ensure
			value_set: lfUnderline = a_var
		end -- set_lfUnderline

	set_lfStrikeOut (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfStrikeOut = _val;%N")
		ensure
			value_set: lfStrikeOut = a_var
		end -- set_lfStrikeOut

	set_lfCharSet (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfCharSet = _val;%N")
		ensure
			value_set: lfCharSet = a_var
		end -- set_lfCharSet

	set_lfOutPrecision (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfOutPrecision = _val;%N")
		ensure
			value_set: lfOutPrecision = a_var
		end -- set_lfOutPrecision

	set_lfClipPrecision (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfClipPrecision = _val;%N")
		ensure
			value_set: lfClipPrecision = a_var
		end -- set_lfClipPrecision

	set_lfQuality (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfQuality = _val;%N")
		ensure
			value_set: lfQuality = a_var
		end -- set_lfQuality

	set_lfPitchAndFamily (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((LOGFONT*)_ptr)->lfPitchAndFamily = _val;%N")
		ensure
			value_set: lfPitchAndFamily = a_var
		end -- set_lfPitchAndFamily

	set_lfFaceName (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("_tcsncpy ((TCHAR*)((LOGFONT*) _ptr)->lfFaceName, (TCHAR*)_val, LF_FACESIZE);%N")
		end -- set_lfFaceName

end -- class WIN32_LOGFONT