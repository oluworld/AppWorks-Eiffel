class ELJ_FILE_STAT

feature {ELJ_BINARY_FILE_STREAM}

	set_handle (a_handle: INTEGER) is
		require
			valid_handle: a_handle /= 0
		do
			handle := a_handle
			buffer := buffer.calloc (c_stat_size)
			struct := buffer.to_pointer
		ensure
			handle_set: handle = a_handle
		end -- make
	
	size: INTEGER is
		do
			c_read_buffer (handle, struct)
			Result := c_size (struct)
		end -- size

feature

	handle: INTEGER

feature {NONE}

	struct: POINTER

	buffer: NATIVE_ARRAY[CHARACTER]
		-- storage for _stat struct
	
	c_stat_size: INTEGER is
		external "C inline use %"sys/stat.h%""
		alias "sizeof(struct stat)"
		end -- c_stat_size
	
	c_size (a_struct: POINTER): INTEGER is
		external "C inline use %"sys/stat.h%""
		alias "((struct stat*)$a_struct)->st_size"
		end -- c_size
	
	c_read_buffer (a_handle: INTEGER; a_struct: POINTER) is
		external "C use %"io.h%""
		alias "fstat"
		end -- c_size

end -- class ELJ_FILE_STAT
