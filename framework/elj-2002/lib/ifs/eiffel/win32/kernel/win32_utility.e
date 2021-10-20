class WIN32_UTILITY

feature {NONE}

	last_error_message : STRING is
		local
			ptr: POINTER
		do
			ptr := c_GetLastErrorMessage
			!!Result.from_external_copy (ptr)
			c_FreeMsgBuffer (ptr)
		end -- last_error_message

	last_error_code : INTEGER is
		external "C use <windows.h>"
		alias "GetLastError"
		end -- last_error_code

feature {NONE}

	make_instance (a_object: POINTER; a_method: POINTER): POINTER is
		require
			all_assigned: a_object /= Void and a_method /= Void
		external "C"
		alias "c_make_instance"
		ensure
			Result /= default_pointer
		end -- c_make_instance
		
	free_instance (a_instance: POINTER) is
		require
			a_instance /= default_pointer
		external "C"
		alias "c_free_instance"
		end -- c_free_instance
		
feature {NONE}

	c_GetLastErrorMessage : POINTER is
		external "C"
		end -- c_GetLastErrorMessage
	
	c_FreeMsgBuffer (a_ptr: POINTER) is
		external "C"
		end -- c_FreeMsgBuffer
	
end -- class WIN32_UTILITY