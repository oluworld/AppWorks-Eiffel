indexing

    description:

        "access and casts to/from raw byte data"

    library:    "ELJ"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/19 03:10:01 $"
    revision:   "$Revision: 1.2 $"
    last:       "$Author: usander $"

deferred class ELJ_MEM_ACCESS

feature
-- read access

	as_large_integer (a_offset: INTEGER): INTEGER_64 is
	-- returns the contents of the buffer at offset
	-- a_offset as integer
		require
			valid_offset: fits_into_buffer (a_offset, integer_length * 2)
			has_storage: pointer.is_not_null
		local
			ptr: POINTER
			off: INTEGER
			res: BIT 64
		do
			ptr := pointer
			off := a_offset
			
			c_inline_c ("*((__int64*)&_res) = (*(_int64*)(((char*) _ptr) + _off));%N")
			
			Result.set_storage (res)
		end -- as_large_integer
		
	as_integer (a_offset: INTEGER): INTEGER is
	-- returns the contents of the buffer at offset
	-- a_offset as integer
		require
			valid_offset: fits_into_buffer (a_offset, integer_length)
			has_storage: pointer.is_not_null
		do
			Result := c_as_integer (pointer, a_offset)
		end -- as_integer
		
	as_character (a_offset: INTEGER): CHARACTER is
	-- returns the contents of the buffer at offset
	-- a_offset as character
		require
			valid_offset: fits_into_buffer (a_offset, character_length)
			has_storage: pointer.is_not_null
		do
			Result := c_as_character (pointer, a_offset)
		end -- as_character
		
	as_real (a_offset: INTEGER): REAL is
	-- returns the contents of the buffer at offset
	-- a_offset as real
		require
			valid_offset: fits_into_buffer (a_offset, real_length)
			has_storage: pointer.is_not_null
		do
			Result := c_as_real (pointer, a_offset)
		end -- as_real
		
	as_double (a_offset: INTEGER): DOUBLE is
	-- returns the contents of the buffer at offset
	-- a_offset as double
		require
			valid_offset: fits_into_buffer (a_offset, double_length)
			has_storage: pointer.is_not_null
		do
			Result := c_as_double (pointer, a_offset)
		end -- as_double
		
	as_string (a_offset, a_length: INTEGER): STRING is
	-- returns the contents of the buffer at offset
	-- a_offset as string
		require
			valid_offset: fits_into_buffer (a_offset, a_length)
			has_storage: pointer.is_not_null
		do
			Result := result_buffer
			Result.make_filled ('%U', a_length)
			c_as_raw (pointer, a_offset, Result.to_external, a_length)
		end -- as_string
		
	as_short (a_offset: INTEGER): INTEGER is
	-- returns the contents of the buffer at offset
	-- a_offset as integer
	-- if short differs in length from integer, only the
	-- count of bytes which make a short are used
		require
			valid_offset: fits_into_buffer (a_offset, short_length)
			has_storage: pointer.is_not_null
		do
			Result := c_as_short (pointer, a_offset)
		end -- as_short
		
	as_raw (a_offset: INTEGER; a_val: POINTER; a_count: INTEGER) is
	-- results in a simple memcpy
		require
			valid_offset: fits_into_buffer (a_offset, a_count)
			has_storage: pointer.is_not_null
		do
			c_as_raw (pointer, a_offset, a_val, a_count)
		end -- set_raw
	
	raw_pointer (a_offset: INTEGER): POINTER is
		require
			has_storage: pointer.is_not_null
		do
			Result := c_raw_pointer (pointer, a_offset)
		end -- raw_pointer

feature {NONE}

	c_as_integer (a_ptr: POINTER; a_offset: INTEGER): INTEGER is
		external "C inline"
		alias "(*(int*)(((char*) $a_ptr) + $a_offset))"
		end -- c_as_integer
		
	c_as_character (a_ptr: POINTER; a_offset: INTEGER): CHARACTER is
		external "C inline"
		alias "((char*) $a_ptr)[$a_offset]"
		end -- c_as_character
		
	c_as_real (a_ptr: POINTER; a_offset: INTEGER): REAL is
		external "C inline"
		alias "(*(float*)(((char*) $a_ptr) + $a_offset))"
		end -- c_as_real
		
	c_as_double (a_ptr: POINTER; a_offset: INTEGER): DOUBLE is
		external "C inline"
		alias "(*(double*)(((char*) $a_ptr) + $a_offset))"
		end -- c_as_double
		
	c_as_short (a_ptr: POINTER; a_offset: INTEGER): INTEGER is
		external "C inline"
		alias "(*(short*)(((char*) $a_ptr) + $a_offset))"
		end -- c_as_short
		
	c_as_raw (a_ptr: POINTER; a_offset: INTEGER; a_val: POINTER; a_count: INTEGER) is
		external "C inline"
		alias "memcpy($a_val, ((char*) $a_ptr) + $a_offset, $a_count)"
		end -- c_as_raw
	
	c_raw_pointer (a_ptr: POINTER; a_offset: INTEGER): POINTER is
		external "C inline"
		alias "(void*)(((char*) $a_ptr) + $a_offset)"
		end -- c_raw_pointer

feature
-- write access

	set_large_integer (a_offset: INTEGER; a_val: INTEGER_64) is
	-- sets the contents of the buffer at offset
	-- a_offset as integer
		require
			valid_offset: fits_into_buffer (a_offset, integer_length)
			has_storage: pointer.is_not_null
		local
			ptr: POINTER
			off: INTEGER
			val: BIT 64
		do
			ptr := pointer
			off := a_offset
			val := a_val.storage

			c_inline_c ("*(__int64*)(((char*) _ptr) + _off) = *((__int64*)&_val);%N")
		ensure
			value_set: as_large_integer (a_offset) = a_val
		end -- set_large_integer
		
	set_integer (a_offset: INTEGER; a_val: INTEGER) is
	-- sets the contents of the buffer at offset
	-- a_offset as integer
		require
			valid_offset: fits_into_buffer (a_offset, integer_length)
			has_storage: pointer.is_not_null
		do
			c_set_integer (pointer, a_offset, a_val)
		ensure
			value_set: as_integer (a_offset) = a_val
		end -- set_integer
		
	set_character (a_offset: INTEGER; a_val: CHARACTER) is
	-- sets the contents of the buffer at offset
	-- a_offset as character
		require
			valid_offset: fits_into_buffer (a_offset, character_length)
			has_storage: pointer.is_not_null
		do
			c_set_character (pointer, a_offset, a_val)
		ensure
			value_set: as_character (a_offset) = a_val
		end -- set_character
		
	set_real (a_offset: INTEGER; a_val: REAL) is
	-- sets the contents of the buffer at offset
	-- a_offset as real
		require
			valid_offset: fits_into_buffer (a_offset, real_length)
			has_storage: pointer.is_not_null
		do
			c_set_real (pointer, a_offset, a_val)
		ensure
			value_set: as_real (a_offset) = a_val
		end -- set_real
		
	set_double (a_offset: INTEGER; a_val: DOUBLE) is
	-- sets the contents of the buffer at offset
	-- a_offset as double
		require
			valid_offset: fits_into_buffer (a_offset, double_length)
			has_storage: pointer.is_not_null
		do
			c_set_double (pointer, a_offset, a_val)
		ensure
			value_set: as_double (a_offset) = a_val
		end -- set_double
		
	set_string (a_offset: INTEGER; a_val: STRING) is
	-- sets the contents of the buffer at offset
	-- a_offset as string
		require
			string_to_set: a_val /= Void
			valid_offset: fits_into_buffer (a_offset, a_val.count)
			has_storage: pointer.is_not_null
		do
			c_set_raw (pointer, a_offset, a_val.to_external, a_val.count)
		ensure
			value_set: a_val.is_equal (as_string (a_offset, a_val.count))
		end -- set_string
		
	set_short (a_offset: INTEGER; a_val: INTEGER) is
	-- sets the contents of the buffer at offset
	-- a_offset as short
		require
			valid_offset: fits_into_buffer (a_offset, short_length)
			has_storage: pointer.is_not_null
		do
			c_set_short (pointer, a_offset, a_val)
		ensure
			value_set: as_short (a_offset) = a_val
		end -- set_short
	
	set_raw (a_offset: INTEGER; a_val: POINTER; a_count: INTEGER) is
	-- results in a simple mecpy
		require
			valid_offset: fits_into_buffer (a_offset, a_count)
			has_storage: pointer.is_not_null
		do
			c_set_raw (pointer, a_offset, a_val, a_count)
		end -- set_raw
	
feature {NONE}

	c_set_integer (a_ptr: POINTER; a_offset: INTEGER; a_val: INTEGER) is
		external "C inline"
		alias "(*(int*)(((char*) $a_ptr) + $a_offset)) = $a_val"
		end -- c_set_integer
		
	c_set_character (a_ptr: POINTER; a_offset: INTEGER; a_val: CHARACTER) is
		external "C inline"
		alias "((char*) $a_ptr)[$a_offset] = $a_val"
		end -- c_set_character
		
	c_set_real (a_ptr: POINTER; a_offset: INTEGER; a_val: REAL) is
		external "C inline"
		alias "(*(float*)(((char*) $a_ptr) + $a_offset)) = $a_val"
		end -- c_set_real
		
	c_set_double (a_ptr: POINTER; a_offset: INTEGER; a_val: DOUBLE) is
		external "C inline"
		alias "(*(double*)(((char*) $a_ptr) + $a_offset)) = $a_val"
		end -- c_set_double
		
	c_set_short (a_ptr: POINTER; a_offset: INTEGER; a_val: INTEGER) is
		external "C inline"
		alias "(*(short*)(((char*) $a_ptr) + $a_offset)) = $a_val"
		end -- c_set_short
	
	c_set_raw (a_ptr: POINTER; a_offset: INTEGER; a_val: POINTER; a_count: INTEGER) is
		external "C inline"
		alias "memcpy(((char*) $a_ptr) + $a_offset, $a_val, $a_count)"
		end -- c_set_raw
	
feature

	change_size_at (a_offset, a_old_len, a_new_len: INTEGER) is
		require
			has_storage: pointer.is_not_null
			offset_not_negative: a_offset >= 0
			meaningful_old_length: a_old_len > 0
			meaningful_new_length: a_new_len > 0
			valid_offset: fits_into_buffer (a_offset, a_old_len)
		local
			ptr:		POINTER
			off:		INTEGER
			len:		INTEGER
			sze:		INTEGER
			old_len:	INTEGER
			new_len:	INTEGER
			old_sze:	INTEGER
		do
			if a_old_len /= a_new_len then
				off := a_offset
				ptr := pointer

				old_len := a_old_len
				new_len := a_new_len
				
				len := new_len - old_len
				
				sze := size + len
				old_sze := size

				set_buffer_size (sze)
				ptr := pointer
				
				len := old_sze - (a_offset + a_old_len)

				c_inline_c ("memmove(((char*) _ptr) + _off + _new_len, ((char*) _ptr) + _off + _old_len, _len);%N")
			end -- if
		end -- change_size_at		
		
feature

	fits_into_buffer (a_offset, a_length: INTEGER): BOOLEAN is
	-- internal validation routine
		do
			Result := a_offset + a_length <= size
		end -- fits_into_buffer
	
	integer_length: INTEGER is
	-- returns length of an integer in bytes
	-- calculation bases on integer_bits from PLATFORM
		do
			Result := Integer_bits // 8
		end -- integer_length
		
	real_length: INTEGER is
	-- returns length of a real in bytes
	-- calculation bases on real_bits from PLATFORM
		do
			Result := Real_bits // 8
		end -- real_length
		
	double_length: INTEGER is
	-- returns length of a double in bytes
	-- calculation bases on double_bits from PLATFORM
		do
			Result := Double_bits // 8
		end -- double_length
		
	character_length: INTEGER is
	-- returns length of a character in bytes
	-- calculation bases on character_bits from PLATFORM
		do
			Result := Character_bits // 8
		end -- character_length

	short_length: INTEGER is
	-- returns length of a short in bytes
	-- calculation checks wether an int consists of
	-- two or four bytes
		do
			if integer_length = 4 then
				Result := integer_length // 2
			else
				Result := integer_length
			end -- if
		end -- short_length

feature
-- the memory accesses
	pointer: POINTER is
		deferred
		end -- pointer
	
	size: INTEGER is
		deferred
		end -- size

feature {NONE}

	set_buffer_size (a_value: INTEGER) is
		-- it is up to the implementation of 'set_buffer_size' how to handle
		-- requests that would result in shrinking the available space;
		-- a suggestion may be never to shrink the memory, but to set
		-- attribute 'size'and store the real buffer size in another attribute
		deferred
		end -- set_size

feature
-- internal string buffering
	string_buffer: STRING
	
	result_buffer: STRING is
		do
			if string_buffer = Void then
				!!string_buffer.make (256)
			end -- if

			Result := string_buffer
		end -- result_buffer

end -- deferred class ELJ_MEM_ACCESS