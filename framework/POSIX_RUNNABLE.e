class POSIX_RUNNABLE

feature
	get_argc : INTEGER is
		local
			r : INTEGER
		do
			c_inline_c("_r = __argc;")
			Result := r
		end -- get_argc
		
	get_argv : POINTER is
		local
			r: POINTER
		do
			c_inline_c("_r = __argv;")
			Result := r		
		end -- get_argv
	
	set_result(i: INTEGER) is
		external "C"
		end -- set_result
	
end -- class POSIX_RUNNABLE
