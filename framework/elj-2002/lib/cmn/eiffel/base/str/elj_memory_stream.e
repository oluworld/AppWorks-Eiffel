indexing

    description:

        "implementation of stream interface as pure in-memory stream"

    library:    "ELJ CCL"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/22 15:54:50 $"
    revision:   "$Revision: 1.2 $"
    last:       "$Author: bsander $"

-- NOTE: even if this class implements line based operations, you are not forced to
-- use them; therefor line based reading should only be used if you are absolutely
-- sure that the stream has been constructed line based

class ELJ_MEMORY_STREAM

inherit
	ELJ_STREAM_BASE
		redefine
			is_connected,
			end_of_input,
			read_character,
			last_character,
			put_character,
			unread_character
		end
		
creation
	make
		
feature {NONE}

	make is
		do
			position := 1
		end -- make

feature
-- queries
	count: INTEGER
		-- size of stream in bytes
		
	eol: STRING is "%R%N"
		-- if line based, then divided by %R%N

	end_of_input: BOOLEAN
		-- true, if no more bytes to read
		
	is_connected: BOOLEAN is True
		-- always true
	last_character: CHARACTER is
		do
			Result := memory
		end -- last_character
		
	
	name: STRING is ""
		-- a memory stream has no name
	on_end_of_line: BOOLEAN is
		-- current position on the first char of a %R%N pair?
		do
			Result := memory = '%R'
			
			if Result and position < count - 1 then
				Result := storage.item (position + 1) = '%N'
			end -- if
		end -- on_end_of_line
	
	position: INTEGER
		-- current read position, used for the next 'read_character'

	to_external: POINTER is
		-- access to underlying memory
		do
			Result := storage.to_pointer
		end -- to_external

feature
-- commands
	flush is
		-- we have nothing to flush
		do
		end -- flush
	
	insert_character (a_char: CHARACTER) is
		require
			not_before: not before
		do
			if after then
				put_character (a_char)
			else
				ensure_size (count + 1)
				storage.move (position - 1, count - 1, 1)
				set_character (a_char, position - 1)
			end -- if
			end_of_input := position > count
		end -- insert_character

	insert_string (a_string: STRING) is
		local
			idx: INTEGER
		do
			from
				idx := a_string.lower
			until
				idx > a_string.upper
			loop
				insert_character (a_string @ idx)
				position := position + 1
				idx := idx + 1
			end -- loop
			end_of_input := position > count
		end -- insert_string
	
	put_character (c: CHARACTER) is
		do
			ensure_size (count + 1)
			set_character (c, count - 1)
			end_of_input := position > count
		end -- put_character
		
	read_character is
		do
			if after then
				end_of_input := True
			else
				memory := storage.item (position - 1)
				position := position + 1
			end -- if
		end -- read_character
		
	read_line is
		do
			last_string.clear

			read_line_in (last_string)
			
			if not end_of_input then
				position := position + 2
			end -- if
		end -- read_line
	
	read_line_in (a_buffer: STRING) is
		do
			from  
				if not end_of_input and then not on_end_of_line then
					read_character
				end -- if
			until
				end_of_input or else on_end_of_line
			loop
				a_buffer.extend(last_character)
				read_character
			end
		end -- read_line_in
	
	read_new_line is
		do
			if on_end_of_line then
				last_string.copy (eol)
				position := position + 2
			end -- if
		end -- read_new_line
	
	shrink is
		local
			sze: INTEGER
		do
			sze := count + count // 2
			storage := storage.realloc (size, sze)
			size := sze
		end -- shrink
	
	set_character (a_char: CHARACTER; a_pos: INTEGER) is
		require
			in_range: a_pos >= 0 and then a_pos < count
		do
			storage.put (a_char, a_pos)
		end -- set_character
	
	set_count (a_count: INTEGER) is
		do
			ensure_size (a_count)
		end -- set_count

	set_position (a_pos: INTEGER) is
		do
			position := a_pos
			end_of_input := position > count
		end -- set_position
	
	unread_character (a_item: CHARACTER) is
		do
			position := position - 1
			end_of_input := position > count
		end -- unread_character

feature {NONE}

	ensure_size (a_size: INTEGER) is
		local
			sze: INTEGER
		do
			if a_size > size then
				if size = 0 then
					size := a_size + a_size // 2
					storage := storage.calloc (size)
				else
					sze := a_size + a_size // 2
					storage := storage.realloc (size, sze)
					size := sze
				end  -- if
			end -- if
			
			count := a_size
		end -- ensure_size

	memory:		CHARACTER
	size:		INTEGER
	storage:	NATIVE_ARRAY[CHARACTER]

end -- class ELJ_MEMORY_STREAM
