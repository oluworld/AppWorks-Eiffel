indexing
	contents: "WIN32 enum_service_status struct"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_ENUM_SERVICE_STATUS

inherit
	-- uses
	C_STRUCTURE 
		redefine
			external_size
		end

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			c_inline_c ("_res = sizeof(ENUM_SERVICE_STATUS);%N")
			Result := res
		end -- count
	
feature 

	lpServiceName : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUM_SERVICE_STATUS*)_ptr)->lpServiceName;%N")
			Result := res
		end -- ServiceName

	lpDisplayName : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUM_SERVICE_STATUS*)_ptr)->lpDisplayName;%N")
			Result := res
		end -- DisplayName

	ServiceStatus : POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((ENUM_SERVICE_STATUS*)_ptr)->ServiceStatus;%N")
			Result := res
		end -- ServiceStatus

feature

	set_lpServiceName (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENUM_SERVICE_STATUS*)_ptr)->lpServiceName = _val;%N")
		ensure
			value_set: lpServiceName = a_var
		end -- set_spServiceName

	set_lpDisplayName (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENUM_SERVICE_STATUS*)_ptr)->lpDisplayName = _val;%N")
		ensure
			value_set: lpDisplayName = a_var
		end -- set_lpDisplayName

	set_ServiceStatus (a_var : POINTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((ENUM_SERVICE_STATUS*)_ptr)->ServiceStatus = _val;%N")
		ensure
			value_set: ServiceStatus = a_var
		end -- set_ServiceStatus

end -- class WIN32_ENUM_SERVICE_STATUS