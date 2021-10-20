indexing
	contents: "WIN32 EXTLOGFONT structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_EXTLOGFONT

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
			c_inline_c ("_res = sizeof(EXTLOGFONT);%N")
			Result := res
		end -- external_size
	
feature

	elfLogFont: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((EXTLOGFONT*)_ptr)->elfLogFont);%N")
			Result := res
		end -- elfLogFont
		
	elfFullName: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((EXTLOGFONT*)_ptr)->elfFullName;%N")
			Result := res
		end -- elfFullName
		
	elfStyle: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((EXTLOGFONT*)_ptr)->elfStyle;%N")
			Result := res
		end -- elfStyle
		
	elfVersion: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfVersion;%N")
			Result := res
		end -- elfVersion
		
	elfStyleSize: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfStyleSize;%N")
			Result := res
		end -- elfStyleSize
		
	elfMatch: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfMatch;%N")
			Result := res
		end -- elfMatch
		
	elfReserved: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfReserved;%N")
			Result := res
		end -- elfReserved
		
	elfVendorId: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfVendorId;%N")
			Result := res
		end -- elfVendorId
		
	elfCulture: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EXTLOGFONT*)_ptr)->elfCulture;%N")
			Result := res
		end -- elfCulture
		
	elfPanose: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((EXTLOGFONT*)_ptr)->elfPanose);%N")
			Result := res
		end -- elfPanose
		
feature

	set_elfLogFont (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*) _ptr)->elfLogFont = *((LOGFONT*) _val);%N")
		ensure
			value_set: elfLogFont = a_var
		end -- elfLogFont
		
	set_elfFullName (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("_tcsncpy ((TCHAR*)((EXTLOGFONT*) _ptr)->elfFullName, (TCHAR*)_val, LF_FULLFACESIZE);%N")
		ensure
			value_set: elfFullName = a_var
		end -- elfFullName
		
	set_elfStyle (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("_tcsncpy ((TCHAR*)((EXTLOGFONT*) _ptr)->elfStyle, (TCHAR*)_val, LF_FACESIZE);%N")
		ensure
			value_set: elfStyle = a_var
		end -- elfStyle
		
	set_elfVersion (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfVersion = _val;%N")
		ensure
			value_set: elfVersion = a_var
		end -- elfVersion
		
	set_elfStyleSize (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfStyleSize = _val;%N")
		ensure
			value_set: elfStyleSize = a_var
		end -- elfStyleSize
		
	set_elfMatch (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfMatch = _val;%N")
		ensure
			value_set: elfMatch = a_var
		end -- elfMatch
		
	set_elfReserved (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfReserved = _val;%N")
		ensure
			value_set: elfReserved = a_var
		end -- elfReserved
		
	set_elfVendorId (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfVendorId = _val;%N")
		ensure
			value_set: elfVendorId = a_var
		end -- elfVendorId
		
	set_elfCulture (a_var: INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfCulture = _val;%N")
		ensure
			value_set: elfCulture = a_var
		end -- elfCulture
		
	set_elfPanose (a_var: POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EXTLOGFONT*)_ptr)->elfPanose = *((PANOSE*)_val);%N")
		end -- elfPanose
		
end -- class WIN32_EXTLOGFONT