indexing
	contents: "generic buffer for API purposes"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: yes
	
class ELJ_GENERIC_BUFFER

inherit
	ELJ_MEM_ACCESS
		redefine
			pointer,
			set_buffer_size,
			size
		end
	MEMORY
		redefine
			dispose
		end

creation
	make,
	make_default,
	make_shared

feature
-- creation, destroying and resizing
	make_shared (a_pointer: POINTER; a_size: INTEGER) is
		local
			ptr: POINTER
		do
			if pointer /= default_pointer and then not shared then
				ptr := pointer
				c_inline_c ("free (_ptr);%N")
			end -- if

			pointer := a_pointer
			size    := a_size
			shared  := True
			
			buffer_size := size
		end -- make_shared

	make_default is
		local
			ptr: POINTER
		do
			if pointer /= default_pointer and then not shared then
				ptr := pointer
				c_inline_c ("free (_ptr);%N")
			end -- if

			pointer := default_pointer
			size    := 0
			shared  := False

			buffer_size := size
		end -- make_default

	make (a_size: INTEGER) is
	-- allocates new buffer
	-- it is safe to use this one as a reinitialization routine
		require
			meaningful_size: a_size > 0
		local
			ptr: POINTER
			sze: INTEGER
		do
			if pointer /= default_pointer and then not shared then
				ptr := pointer
				c_inline_c ("free (_ptr);%N")
			end -- if

			sze := a_size

			c_inline_c ("_ptr = (void*) malloc(_sze);%N")
			c_inline_c ("memset(_ptr, '\0', _sze);%N")

			pointer := ptr
			size    := a_size
			shared  := False
			
			buffer_size := size
		end -- make
		
	resize (a_size: INTEGER) is
	-- resizes previous allocated buffer
	-- contents of old buffer will not be lost
		require
			meaningful_size: a_size > 0
		local
			ptr: POINTER
			sze: INTEGER
		do
			if size /= a_size then
				sze := a_size
				ptr := pointer
	
				c_inline_c ("_ptr = (void*) realloc(_ptr, _sze);%N")
	
				pointer := ptr
	
				shared := False
				
				size        := a_size
				buffer_size := a_size
			end -- if
		end -- resize
		
	dispose is
	-- object destruction - frees the attached c memory
		local
			ptr: POINTER
		do
			if pointer /= default_pointer and then not shared then
				ptr := pointer
				c_inline_c ("free (_ptr);%N")
				pointer := default_pointer
			end -- if
		end -- dispose

	clear is
		-- fills the c buffer with 0 chars
		local
			ptr: POINTER
			len: INTEGER
		do
			ptr := pointer
			len := size

			c_inline_c ("memset (_ptr, 0, _len);%N")
		end -- clear

	set_null_flag (a_value: BOOLEAN) is
		do
			is_null := a_value
		end -- set_null_flag

feature
-- object information

	size: INTEGER
	-- the length of the buffer in bytes

	pointer: POINTER
	-- access to the c side

	is_null: BOOLEAN
	-- true if buffer must be seen as empty

	shared: BOOLEAN
	-- true if buffer will not be freed at collecting time

feature {NONE}

	buffer_size: INTEGER

	set_buffer_size (a_value: INTEGER) is
		do
			if a_value > buffer_size then
				resize (a_value)
			end -- if

			size := a_value
		end -- set_pointer

end -- class ELJ_GENERIC_BUFFER