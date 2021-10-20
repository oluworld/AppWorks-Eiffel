class WIN32_ACL 

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
			c_inline_c ("_res = sizeof(ACL);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_AclRevision (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ACL*)_ptr)->AclRevision = _val;%N")
		ensure
			value_set: AclRevision = a_var
		end -- set_AclRevision

	set_Sbz1 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ACL*)_ptr)->Sbz1 = _val;%N")
		ensure
			value_set: Sbz1 = a_var
		end -- set_Sbz1

	set_AclSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ACL*)_ptr)->AclSize = _val;%N")
		ensure
			value_set: AclSize = a_var
		end -- set_AclSize

	set_AceCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ACL*)_ptr)->AceCount = _val;%N")
		ensure
			value_set: AceCount = a_var
		end -- set_AceCount

	set_Sbz2 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ACL*)_ptr)->Sbz2 = _val;%N")
		ensure
			value_set: Sbz2 = a_var
		end -- set_Sbz2

feature
		-- Getters

	AclRevision : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ACL*)_ptr)->AclRevision;%N")
			Result := res
		end -- AclRevision

	Sbz1 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ACL*)_ptr)->Sbz1;%N")
			Result := res
		end -- Sbz1

	AclSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ACL*)_ptr)->AclSize;%N")
			Result := res
		end -- AclSize

	AceCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ACL*)_ptr)->AceCount;%N")
			Result := res
		end -- AceCount

	Sbz2 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((ACL*)_ptr)->Sbz2;%N")
			Result := res
		end -- Sbz2

end -- class WIN32_ACL 

