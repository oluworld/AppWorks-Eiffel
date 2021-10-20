indexing
	contents: "WIN32 ip_mreq structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_IP_MREQ 

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
			c_inline_c ("_res = sizeof(IP_MREQ);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_imr_multiaddr (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IP_MREQ*)_ptr)->imr_multiaddr = *((IN_ADDR)_val);%N")
		ensure
			value_set: imr_multiaddr = a_var
		end -- set_imr_multiaddr

	set_imr_interface (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((IP_MREQ*)_ptr)->imr_multiaddr = *((IN_ADDR)_val);%N")
		ensure
			value_set: imr_interface = a_var
		end -- set_imr_interface

feature
		-- Getters

	imr_multiaddr : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((IP_MREQ*)_ptr)->imr_multiaddr);%N")
			Result := res
		end -- imr_multiaddr

	imr_interface : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)&(((IP_MREQ*)_ptr)->imr_interface);%N")
			Result := res
		end -- imr_interface

end -- class WIN32_IP_MREQ 
