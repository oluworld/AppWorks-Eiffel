indexing
	contents: "WIN32 enhmetaheader struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_ENHMETAHEADER 

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
			c_inline_c ("_res = sizeof(ENHMETAHEADER);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_iType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->iType = _val;%N")
		ensure
			value_set: iType = a_var
		end -- set_iType

	set_nSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nSize = _val;%N")
		ensure
			value_set: nSize = a_var
		end -- set_nSize

	set_rclBounds (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->rclBounds = *((RECTL*)_val);%N")
		ensure
			value_set: rclBounds = a_var
		end -- set_rclBounds

	set_rclFrame (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->rclFrame = *((RECTL*)_val);%N")
		ensure
			value_set: rclFrame = a_var
		end -- set_rclFrame

	set_dSignature (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->dSignature = _val;%N")
		ensure
			value_set: dSignature = a_var
		end -- set_dSignature

	set_nVersion (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nVersion = _val;%N")
		ensure
			value_set: nVersion = a_var
		end -- set_nVersion

	set_nBytes (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nBytes = _val;%N")
		ensure
			value_set: nBytes = a_var
		end -- set_nBytes

	set_nRecords (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nRecords = _val;%N")
		ensure
			value_set: nRecords = a_var
		end -- set_nRecords

	set_nHandles (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nHandles = _val;%N")
		ensure
			value_set: nHandles = a_var
		end -- set_nHandles

	set_sReserved (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->sReserved = _val;%N")
		ensure
			value_set: sReserved = a_var
		end -- set_sReserved

	set_nDescription (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nDescription = _val;%N")
		ensure
			value_set: nDescription = a_var
		end -- set_nDescription

	set_offDescription (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->offDescription = _val;%N")
		ensure
			value_set: offDescription = a_var
		end -- set_offDescription

	set_nPalEntries (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->nPalEntries = _val;%N")
		ensure
			value_set: nPalEntries = a_var
		end -- set_nPalEntries

	set_szlDevice (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->szlDevice = *((SIZEL*)_val);%N")
		ensure
			value_set: szlDevice = a_var
		end -- set_szlDevice

	set_szlMillimeters (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->szlMillimeters = *((SIZEL*)_val);%N")
		ensure
			value_set: szlMillimeters = a_var
		end -- set_szlMillimeters

	set_cbPixelFormat (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->cbPixelFormat = _val;%N")
		ensure
			value_set: cbPixelFormat = a_var
		end -- set_cbPixelFormat

	set_offPixelFormat (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->offPixelFormat = _val;%N")
		ensure
			value_set: offPixelFormat = a_var
		end -- set_offPixelFormat

	set_bOpenGL (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENHMETAHEADER*)_ptr)->bOpenGL = _val;%N")
		ensure
			value_set: bOpenGL = a_var
		end -- set_bOpenGL

feature
		-- Getters

	iType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->iType;%N")
			Result := res
		end -- iType

	nSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nSize;%N")
			Result := res
		end -- nSize

	rclBounds : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((ENHMETAHEADER*)_ptr)->rclBounds);%N")
			Result := res
		end -- rclBounds

	rclFrame : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((ENHMETAHEADER*)_ptr)->rclFrame);%N")
			Result := res
		end -- rclFrame

	dSignature : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->dSignature;%N")
			Result := res
		end -- dSignature

	nVersion : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nVersion;%N")
			Result := res
		end -- nVersion

	nBytes : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nBytes;%N")
			Result := res
		end -- nBytes

	nRecords : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nRecords;%N")
			Result := res
		end -- nRecords

	nHandles : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nHandles;%N")
			Result := res
		end -- nHandles

	sReserved : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->sReserved;%N")
			Result := res
		end -- sReserved

	nDescription : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nDescription;%N")
			Result := res
		end -- nDescription

	offDescription : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->offDescription;%N")
			Result := res
		end -- offDescription

	nPalEntries : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->nPalEntries;%N")
			Result := res
		end -- nPalEntries

	szlDevice : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((ENHMETAHEADER*)_ptr)->szlDevice);%N")
			Result := res
		end -- szlDevice

	szlMillimeters : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((ENHMETAHEADER*)_ptr)->szlMillimeters);%N")
			Result := res
		end -- szlMillimeters

	cbPixelFormat : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->cbPixelFormat;%N")
			Result := res
		end -- cbPixelFormat

	offPixelFormat : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->offPixelFormat;%N")
			Result := res
		end -- offPixelFormat

	bOpenGL : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ENHMETAHEADER*)_ptr)->bOpenGL;%N")
			Result := res
		end -- bOpenGL

end -- class WIN32_ENHMETAHEADER 
