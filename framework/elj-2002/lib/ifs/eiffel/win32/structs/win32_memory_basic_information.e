class WIN32_MEMORY_BASIC_INFORMATION 

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
			c_inline_c ("_res = sizeof(MEMORY_BASIC_INFORMATION);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_BaseAddress (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->BaseAddress = _val;%N")
		ensure
			value_set: BaseAddress = a_var
		end -- set_BaseAddress

	set_AllocationBase (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->AllocationBase = _val;%N")
		ensure
			value_set: AllocationBase = a_var
		end -- set_AllocationBase

	set_AllocationProtect (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->AllocationProtect = _val;%N")
		ensure
			value_set: AllocationProtect = a_var
		end -- set_AllocationProtect

	set_RegionSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->RegionSize = _val;%N")
		ensure
			value_set: RegionSize = a_var
		end -- set_RegionSize

	set_State (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->State = _val;%N")
		ensure
			value_set: State = a_var
		end -- set_State

	set_Protect (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->Protect = _val;%N")
		ensure
			value_set: Protect = a_var
		end -- set_Protect

	set_Type (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MEMORY_BASIC_INFORMATION*)_ptr)->Type = _val;%N")
		ensure
			value_set: Type = a_var
		end -- set_Type

feature
		-- Getters

	BaseAddress : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MEMORY_BASIC_INFORMATION*)_ptr)->BaseAddress;%N")
			Result := res
		end -- BaseAddress

	AllocationBase : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((MEMORY_BASIC_INFORMATION*)_ptr)->AllocationBase;%N")
			Result := res
		end -- AllocationBase

	AllocationProtect : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORY_BASIC_INFORMATION*)_ptr)->AllocationProtect;%N")
			Result := res
		end -- AllocationProtect

	RegionSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORY_BASIC_INFORMATION*)_ptr)->RegionSize;%N")
			Result := res
		end -- RegionSize

	State : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORY_BASIC_INFORMATION*)_ptr)->State;%N")
			Result := res
		end -- State

	Protect : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORY_BASIC_INFORMATION*)_ptr)->Protect;%N")
			Result := res
		end -- Protect

	Type : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MEMORY_BASIC_INFORMATION*)_ptr)->Type;%N")
			Result := res
		end -- Type

end -- class WIN32_MEMORY_BASIC_INFORMATION 

