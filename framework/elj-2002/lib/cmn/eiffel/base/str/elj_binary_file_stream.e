indexing

    description:

        "binary file read / write"

    library:    "ELJ/dbs"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"

class ELJ_BINARY_FILE_STREAM

inherit
	KI_INPUT_STREAM[CHARACTER]
		rename
			is_open_read as is_open
		end
	KI_OUTPUT_STREAM[CHARACTER]
		rename
			is_open_write as is_open
		undefine
			is_open
		end

feature

	close is
		require
			open: is_open
		do
			close_file (file_handle)
			file_handle := default_pointer
		ensure
			closed: not is_open
		end -- close

	end_of_input: BOOLEAN is
		require
			open: is_open
		do
			Result := eof (file_handle) /= 0
		end -- end_of_input

	error_text: STRING is
		-- returns textual description of last error
		require
			error_number_set: has_error
		do
			if error_number /= 0 then
				create Result.from_external_copy (strerror (error_number))
			end -- if
		end -- error_text
	
	flush is
		-- forces flushing of file buffers to disk
		require
			open: is_open
		do
			flush_file (file_handle)
		end -- flush
	
	has_error: BOOLEAN is
		-- error code available?
		do
			Result := error_number /= 0
		end -- has_error
	
	is_open: BOOLEAN is
		do
			Result := file_handle.is_not_null
		end -- is_open

	last_item: CHARACTER
	
	move_to (a_position: INTEGER) is
		-- moves io cursor to given position
		require
			open: is_open
			in_range: a_position >= 0 and then a_position < size
		do
			if set_file_position (file_handle, a_position, From_beginning) /= 0 then
				error_number := errno
			end -- if
		ensure
			moved: not has_error implies position = a_position
		end -- move_to
	
	name: STRING
	
	open (a_name: STRING) is
		do
			if not file_exists (a_name) then
				file_handle := open_file (a_name.to_external, (once "wb+").to_external)
			else
				file_handle := open_file (a_name.to_external, (once "rb+").to_external)
			end -- if
			
			if is_open then
				name := a_name.twin
			else
				error_number := errno
			end -- if
		end -- open
	
	open_temp_file is
		-- creates an anonymous file which will be deleted when closed
		do
			file_handle := temp_file

			if is_open then
				name := (once "TEMPORARY").twin
			else
				error_number := errno
			end -- if
		end -- open_temp_file
	
	position: INTEGER is
		-- current io cursor
		require
			open: is_open
		do
			Result := file_position (file_handle)
		end -- position
	
	put (a_value: CHARACTER) is
		do
			if write_character (a_value, file_handle) = eof_indicator then
				error_number := errno
				written_characters := 0
			else
				written_characters := 1
			end -- if
		ensure
			count adjusted: not has_error implies written_characters = 1
		end -- put
	
	put_buffer (a_buffer: POINTER; a_size: INTEGER) is
		-- raw writing; buffers will be flushed afetr writing
		require
			open: is_open
		do
			written_characters := write_buffer (a_buffer, a_size, file_handle)
			if written_characters /= a_size then
				error_number := errno
			end -- if
			flush
		ensure
			count adjusted: not has_error implies written_characters = a_size
		end -- put_buffer
	
	put_data (a_values: ARRAY[CHARACTER]) is
		-- raw writing; buffers will be flushed afetr writing
		require
			open: is_open
			non_void_value: a_values /= Void
		local
			idx: INTEGER
		do
			from
				written_characters := 0
				idx := a_values.lower
			until
				idx > a_values.upper or else error_number /= 0
			loop
				if write_character (a_values @ idx, file_handle) = eof_indicator then
					error_number := errno
				end -- if
				idx := idx +1
			end -- loop
			
			written_characters := idx - a_values.lower

			flush
		ensure
			count adjusted: not has_error implies written_characters = a_values.size
		end -- put_data

	read is
		local
			err: INTEGER
		do
			last_item := read_character (file_handle)

			err := errno

			if err /= 0 then
				error_number := errno
				read_characters := 0
			else
				read_characters := 1
			end -- if
		ensure
			count adjusted: not has_error implies read_characters = 1
		end -- read
	
	read_buffer (a_buffer: POINTER; a_size: INTEGER) is
		-- raw reading
		do
			read_characters := read_block (a_buffer, a_size, file_handle)
			if read_characters /= a_size then
				error_number := errno
			end -- if
		ensure
			count adjusted: not has_error implies read_characters = a_size
		end -- read_buffer
	
	reset_error is
		do
			error_number := 0
		end -- reset_error
	
	set_min_size (a_size: INTEGER) is
		-- try to enlarge the stream, if given size is larger than current one;
		-- never shrink the stream
		local
			pos: INTEGER
		do
			from
			until
				eof (file_handle) /= 0
			loop
				read
			end -- loop
			
			from
				pos := position
			until
				pos >= a_size
			loop
				if write_character ('%U', file_handle) = eof_indicator then
					error_number := errno
				end -- if
				pos := pos + 1
			end -- loop
		ensure
			size >= old size
		end -- set_min_size
	
	size: INTEGER is
		local
			buf: expanded ELJ_FILE_STAT
		do
			buf.set_handle (stat_handle (file_handle))
			Result := buf.size
		end -- size
	
	unread (a_item: CHARACTER) is
		do
		end -- unread
	
	valid_unread_item (a_item: CHARACTER): BOOLEAN is
		do
			Result := False
		end -- valid_unread_item

feature

	written_characters: INTEGER
		-- number of characters written with last operation
	read_characters: INTEGER
		-- number of characters read with last operation

feature {NONE}

	file_handle: POINTER
	
	error_number: INTEGER

	close_file (a_handle: POINTER) is
		external "C use %"stdio.h%""
		alias "fclose"
		end -- close_file
	
	eof (a_handle: POINTER): INTEGER is
		external "C use %"stdio.h%""
		alias "feof"
		end -- eof
	
	eof_indicator: INTEGER is
		external "C macro use %"stdio.h%""
		alias "EOF"
		end -- eof_indicator
	
	errno: INTEGER is
		external "C macro use %"errno.h%""
		alias "errno"
		end -- errno
	
	file_position (a_handle: POINTER): INTEGER is
		external "C use %"stdio.h%""
		alias "ftell"
		end -- file_position

	file_size (a_handle: POINTER): INTEGER is
		external "C use %"stdio.h%""
		alias "ftell"
		end -- file_position

	flush_file (a_handle: POINTER) is
		external "C use %"stdio.h%""
		alias "fflush"
		end -- flush_file
	
	From_beginning: INTEGER is
		external "C macro use %"stdio.h%""
		alias "SEEK_SET"
		end -- From_beginning
	
	open_file (a_name, a_mode: POINTER): POINTER is
		external "C use %"stdio.h%""
		alias "fopen"
		end -- open_file

	read_block (a_value: POINTER; a_size: INTEGER; a_handle: POINTER): INTEGER is
		external "C inline use %"stdio.h%""
		alias "fread ($a_value, 1, $a_size, $a_handle)"
		end -- read_block

	read_character (a_handle: POINTER): CHARACTER is
		external "C use %"stdio.h%""
		alias "fgetc"
		end -- read_character

	set_file_position (a_handle: POINTER; a_offset, a_whence: INTEGER): INTEGER is
		external "C use %"stdio.h%""
		alias "fseek"
		end -- set_file_position

	stat_handle (a_handle: POINTER): INTEGER is
		external "C use %"stdio.h%""
		alias "fileno"
		end -- stat_handle

	strerror (a_code: INTEGER): POINTER is
		external "C use %"string.h%""
		alias "strerror"
		end -- strerror

	temp_file: POINTER is
		external "C use %"stdio.h%""
		alias "tmpfile"
		end -- temp_file

	write_buffer (a_value: POINTER; a_size: INTEGER; a_handle: POINTER): INTEGER is
		external "C inline use %"stdio.h%""
		alias "fwrite ($a_value, 1, $a_size, $a_handle)"
		end -- write_buffer

	write_character (a_value: CHARACTER; a_handle: POINTER): INTEGER is
		external "C use %"stdio.h%""
		alias "fputc"
		end -- write_character

end -- class ELJ_BINARY_FILE_STREAM
