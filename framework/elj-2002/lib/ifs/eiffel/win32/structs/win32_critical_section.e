class WIN32_CRITICAL_SECTION

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
			c_inline_c ("_res = sizeof(CRITICAL_SECTION);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_DebugInfo (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->DebugInfo = _val;%N")
		ensure
			value_set: DebugInfo = a_var
		end -- set_DebugInfo

	set_LockCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->LockCount = _val;%N")
		ensure
			value_set: LockCount = a_var
		end -- set_LockCount

	set_RecursionCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->RecursionCount = _val;%N")
		ensure
			value_set: RecursionCount = a_var
		end -- set_RecursionCount

	set_OwningThread (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->OwningThread = _val;%N")
		ensure
			value_set: OwningThread = a_var
		end -- set_OwningThread

	set_LockSemaphore (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->LockSemaphore = _val;%N")
		ensure
			value_set: LockSemaphore = a_var
		end -- set_LockSemaphore

	set_Reserved (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CRITICAL_SECTION*)_ptr)->Reserved = _val;%N")
		ensure
			value_set: Reserved = a_var
		end -- set_Reserved

feature
		-- Getters

	DebugInfo : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CRITICAL_SECTION*)_ptr)->abcA;%N")
			Result := res
		end -- DebugInfo

	LockCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION*)_ptr)->LockCount;%N")
			Result := res
		end -- LockCount

	RecursionCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION*)_ptr)->RecursionCount;%N")
			Result := res
		end -- RecursionCount

	OwningThread : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CRITICAL_SECTION*)_ptr)->OwningThread;%N")
			Result := res
		end -- OwningThread

	LockSemaphore : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CRITICAL_SECTION*)_ptr)->LockSemaphore;%N")
			Result := res
		end -- LockSemaphore

	Reserved : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CRITICAL_SECTION*)_ptr)->Reserved;%N")
			Result := res
		end -- Reserved

end -- class WIN32_CRITICAL_SECTION