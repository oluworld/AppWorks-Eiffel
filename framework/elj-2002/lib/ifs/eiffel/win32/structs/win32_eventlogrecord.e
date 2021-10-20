class WIN32_EVENTLOGRECORD 

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
			c_inline_c ("_res = sizeof(EVENTLOGRECORD);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_Length (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->Length = _val;%N")
		ensure
			value_set: Length = a_var
		end -- set_Length

	set_Reserved (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->Reserved = _val;%N")
		ensure
			value_set: Reserved = a_var
		end -- set_Reserved

	set_RecordNumber (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->RecordNumber = _val;%N")
		ensure
			value_set: RecordNumber = a_var
		end -- set_RecordNumber

	set_TimeGenerated (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->TimeGenerated = _val;%N")
		ensure
			value_set: TimeGenerated = a_var
		end -- set_TimeGenerated

	set_TimeWritten (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->TimeWritten = _val;%N")
		ensure
			value_set: TimeWritten = a_var
		end -- set_TimeWritten

	set_EventID (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->EventID = _val;%N")
		ensure
			value_set: EventID = a_var
		end -- set_EventID

	set_EventType (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->EventType = _val;%N")
		ensure
			value_set: EventType = a_var
		end -- set_EventType

	set_NumStrings (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->NumStrings = _val;%N")
		ensure
			value_set: NumStrings = a_var
		end -- set_NumStrings

	set_EventCategory (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->EventCategory = _val;%N")
		ensure
			value_set: EventCategory = a_var
		end -- set_EventCategory

	set_ReservedFlags (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->ReservedFlags = _val;%N")
		ensure
			value_set: ReservedFlags = a_var
		end -- set_ReservedFlags

	set_ClosingRecordNumber (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->ClosingRecordNumber = _val;%N")
		ensure
			value_set: ClosingRecordNumber = a_var
		end -- set_ClosingRecordNumber

	set_StringOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->StringOffset = _val;%N")
		ensure
			value_set: StringOffset = a_var
		end -- set_StringOffset

	set_UserSidLength (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->UserSidLength = _val;%N")
		ensure
			value_set: UserSidLength = a_var
		end -- set_UserSidLength

	set_UserSidOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->UserSidOffset = _val;%N")
		ensure
			value_set: UserSidOffset = a_var
		end -- set_UserSidOffset

	set_DataLength (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->DataLength = _val;%N")
		ensure
			value_set: DataLength = a_var
		end -- set_DataLength

	set_DataOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((EVENTLOGRECORD*)_ptr)->DataOffset = _val;%N")
		ensure
			value_set: DataOffset = a_var
		end -- set_DataOffset

feature
		-- Getters

	Length : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->Length;%N")
			Result := res
		end -- Length

	Reserved : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->Reserved;%N")
			Result := res
		end -- Reserved

	RecordNumber : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->RecordNumber;%N")
			Result := res
		end -- RecordNumber

	TimeGenerated : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->TimeGenerated;%N")
			Result := res
		end -- TimeGenerated

	TimeWritten : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->TimeWritten;%N")
			Result := res
		end -- TimeWritten

	EventID : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->EventID;%N")
			Result := res
		end -- EventID

	EventType : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->EventType;%N")
			Result := res
		end -- EventType

	NumStrings : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->NumStrings;%N")
			Result := res
		end -- NumStrings

	EventCategory : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->EventCategory;%N")
			Result := res
		end -- EventCategory

	ReservedFlags : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->ReservedFlags;%N")
			Result := res
		end -- ReservedFlags

	ClosingRecordNumber : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->ClosingRecordNumber;%N")
			Result := res
		end -- ClosingRecordNumber

	StringOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->StringOffset;%N")
			Result := res
		end -- StringOffset

	UserSidLength : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->UserSidLength;%N")
			Result := res
		end -- UserSidLength

	UserSidOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->UserSidOffset;%N")
			Result := res
		end -- UserSidOffset

	DataLength : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->DataLength;%N")
			Result := res
		end -- DataLength

	DataOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((EVENTLOGRECORD*)_ptr)->DataOffset;%N")
			Result := res
		end -- DataOffset

end -- class WIN32_EVENTLOGRECORD 

