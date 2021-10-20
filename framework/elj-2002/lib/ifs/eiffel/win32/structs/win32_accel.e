class WIN32_ACCEL

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
			c_inline_c ("_res = sizeof(ACCEL);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_fVirt (a_mod: BIT 32) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_mod.to_integer
			
			c_inline_c ("((ACCEL*)_ptr)->fVirt = (BYTE)_val;%N")
		ensure
			value_set: a_mod = fVirt
		end -- set_fVirt
	
	set_key (a_key: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_key
			
			c_inline_c ("((ACCEL*)_ptr)->key = (WORD)_val;%N")
		ensure
			value_set: a_key = key
		end -- set_key
	
	set_cmd (a_cmd: INTEGER) is
		local
			ptr: POINTER
			val: INTEGER
		do
			ptr := pointer
			val := a_cmd
			
			c_inline_c ("((ACCEL*)_ptr)->cmd = (WORD)_val;%N")
		ensure
			value_set: a_cmd = cmd
		end -- set_cmd

feature
		--Getters

	fVirt: BIT 32 is
		local
			ptr: POINTER
			res: BIT 32
		do
			ptr := pointer
			
			c_inline_c ("_res = (EIF_INTEGER)((ACCEL*)_ptr)->fVirt;%N")
			
			Result := res
		end -- fVirt
	
	key: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res = (EIF_INTEGER)((ACCEL*)_ptr)->key;%N")
			
			Result := res
		end -- key
	
	cmd: INTEGER is
		local
			ptr: POINTER
			res: INTEGER
		do
			ptr := pointer
			
			c_inline_c ("_res = (EIF_INTEGER)((ACCEL*)_ptr)->cmd;%N")
			
			Result := res
		end -- cmd

end -- class WIN32_ACCEL