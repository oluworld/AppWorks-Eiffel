class WIN32_CRITICAL_SECTION_DEBUG

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
			c_inline_c ("_res = sizeof(CRITICAL_SECTION_DEBUG);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_Type (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->Type = _val;%N")
		ensure
			value_set: Type = a_var
		end -- set_Type

	set_CreatorBackTraceIndex (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->CreatorBackTraceIndex = _val;%N")
		ensure
			value_set: CreatorBackTraceIndex = a_var
		end -- set_CreatorBackTraceIndex

	set_CriticalSection (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->CriticalSection = _val;%N")
		ensure
			value_set: CriticalSection = a_var
		end -- set_CriticalSection

	set_ProcessLocksList (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->ProcessLocksList = _val;%N")
		ensure
			value_set: ProcessLocksList = a_var
		end -- set_ProcessLocksList

	set_EntryCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->EntryCount = _val;%N")
		ensure
			value_set: EntryCount = a_var
		end -- set_EntryCount

	set_ContentionCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->ContentionCount = _val;%N")
		ensure
			value_set: ContentionCount = a_var
		end -- set_ContentionCount

	set_Depth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION_DEBUG*)_ptr)->Depth = _val;%N")
		ensure
			value_set: Depth = a_var
		end -- set_Depth

feature
		-- Getters

	Type : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION_DEBUG*)_ptr)->Type;%N")
			Result := res
		end -- Type

	CreatorBackTraceIndex : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION_DEBUG*)_ptr)->CreatorBackTraceIndex;%N")
			Result := res
		end -- CreatorBackTraceIndex

	CriticalSection : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CRITICAL_SECTION_DEBUG*)_ptr)->CriticalSection;%N")
			Result := res
		end -- CriticalSection

	ProcessLocksList : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CRITICAL_SECTION_DEBUG*)_ptr)->ProcessLocksList;%N")
			Result := res
		end -- ProcessLocksList

	EntryCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION_DEBUG*)_ptr)->EntryCount;%N")
			Result := res
		end -- EntryCount

	ContentionCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION_DEBUG*)_ptr)->ContentionCount;%N")
			Result := res
		end -- ContentionCount

	Depth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION_DEBUG*)_ptr)->Depth;%N")
			Result := res
		end -- Depth

end -- class WIN32_CRITICAL_SECTION_DEBUG