indexing

    description:

        "base class for all string lists"

    library:    "ELJ CCL/abstract"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"
    last:		"$Author: usander $"

deferred class ELJ_CUSTOM_STRING_LIST[T]

feature

	dup_accecpt:	INTEGER is 0
	dup_ignore:		INTEGER is 1
	dup_error:		INTEGER is 2

feature
-- creation
	make is
		do
			separator := ','
		end -- make

feature
-- modifiers
	add (a_string: STRING) is
		-- adds one string to the list and returns
		-- the index of the added one in 'last_added'
		-- sorts in if sorted is true
		deferred
		ensure
			count > old count
		end -- add
		
	add_object (a_string: STRING; a_object: T) is
		-- same as add, but assigns an objects of T to
		-- a_string
		do
			begin_update

			add (a_string)

			if objects = Void then
				!!objects.make
			end -- if

			search_buffer.copy (a_string)
			search_buffer.to_upper
			
			objects.put (a_object, search_buffer.twin)

			end_update
		ensure
			have_objects: objects /= Void
			object_added: object (last_added) = a_object
		end -- add_object
		
	assign (a_other: ELJ_CUSTOM_STRING_LIST[T]) is
		local
			i: INTEGER
		do
			from	begin_update
					clear
					i := 1
			until	i > a_other.count
			loop
				add (a_other.item (i))
				i := i + 1
			end -- loop

			end_update
		end -- assign
		
	delete (a_index: INTEGER) is
		-- removes the string with index a_index from
		-- the list and the attached object, if existing
		require
			valid_index: 1 <= a_index and a_index <= count
		deferred
		ensure
			count = old count - 1
		end -- delete
		
	set_separator (a_separator: CHARACTER) is
		-- changes separator for comma_text features
		do
			separator := a_separator
		end -- set_separator
		
	set_sorted (a_value: BOOLEAN) is
		-- controls wether the string list is sorted
		-- or not
		do
			if sorted /= a_value then
				sorted := a_value
				if sorted then
					sort
				end -- if
			end -- if
		end -- set_sorted
		
	set_comma_text (a_text: STRING) is
		-- clears the list and rebuilds it from a_string
		-- it is assumed that the substrings in a_string
		-- are separated by 'separator'
		-- all objects will be lost
		local
			work_text:	STRING
			idx:		INTEGER
		do
			from	!!work_text.copy (a_text)
					begin_update
					clear
					idx := work_text.index_of (separator, 1)
			until idx = 0
			loop
				add (work_text.substring (1, idx - 1))
				work_text.remove_first (idx)
				idx := work_text.index_of (separator, 1)
			end -- loop
			
			add (work_text)

			end_update
		end -- set_comma_text
		
	sort is
		-- sorts the list regardless if 'sorted'
		-- is true or false
		deferred
		end -- sort
		
	clear is
		-- clears the list and all attached objects
		deferred
		end -- clear
		
	exchange (a_idx_1, a_idx_2: INTEGER) is
		-- swaps strings at a_idx_1 and a_idx_2
		require
			not_sorted: not sorted
			valid_index_1: 1 <= a_idx_1 and a_idx_1 <= count
			valid_index_2: 1 <= a_idx_2 and a_idx_2 <= count
		deferred
		end -- exchange
		
	insert (a_string: STRING; a_index: INTEGER) is
		-- insert a_string at the specified index
		-- the string at index a_index and all following
		-- will be moved in tail direction to make a hole
		require
			not_sorted: not sorted
		deferred
		end -- insert
		
	set_item (a_string: STRING; a_index: INTEGER) is
		-- sets a_string at the specified index
		-- the string at index a_index will be removed
		require
			not_sorted: not sorted
		deferred
		ensure
			count = old count
		end -- set_item
	
	set_item_object (a_string: STRING; a_index: INTEGER) is
		-- replaces the string at index a_index
		-- if there was an object attached to the item, it will
		-- be attached to the new item value
		local
			old_itm: STRING
			old_obj: T
		do
			old_itm := item (a_index)

			search_buffer.copy (old_itm)
			search_buffer.to_upper

			if objects.has (search_buffer) then
				old_obj := objects.at (search_buffer)
				objects.remove (search_buffer)

				search_buffer.copy (a_string)
				search_buffer.to_upper

				objects.put (old_obj, search_buffer.twin)
			end -- if
			
			set_item (a_string, a_index)
		end -- set_item
	
	insert_object (a_string: STRING; a_object: T; a_index: INTEGER) is
		-- same as insert, but assigns an objects of T to
		-- a_string
		do
			begin_update
			insert (a_string, a_index)
			if objects = Void then
				!!objects.make
			end -- if

			search_buffer.copy (a_string)
			search_buffer.to_upper

			objects.put (a_object, search_buffer.twin)

			end_update
		end -- insert_object
		
	set_text (a_text: STRING) is
		-- clears the list and rebuilds it from a_string
		-- it is assumed that the substrings in a_string
		-- are separated by '%N'
		-- all objects will be lost
		local
			sep: CHARACTER
		do
			sep := separator
			separator := '%N'
			
			set_comma_text (a_text)
			
			separator := sep
		end -- set_text
	
	set_seperator (a_chr: CHARACTER) is
		obsolete "wrong spelling"
		do
			separator := a_chr
		end -- set_seperator
	
	to_collection (a_collection: COLLECTION[STRING]) is
		require
			non_void_collection: a_collection /= Void
		local
			idx: INTEGER
		do
			from
				idx := lower
				a_collection.clear
			until
				idx > upper
			loop
				a_collection.add_last (item (idx))
				idx := idx + 1
			end -- loop
		end -- to_collection
		
	load_from_file (a_file: STRING) is
		-- clears list and loads list from file 'a_file'
		-- every line in 'a_file' becomes an item of list
		require
			has_file: file_exists (a_file)
		local
			file_stream: KL_TEXT_INPUT_FILE
		do
			!!file_stream.make (a_file)
			file_stream.open_read
			check
				file_connected: file_stream.is_open_read
			end -- check
			
			load_from_stream (file_stream)
			file_stream.close
		end -- load_from_file
		
	load_from_stream (a_stream: KI_TEXT_INPUT_STREAM) is
		do
			from	begin_update
					clear
					a_stream.read_line
			until	a_stream.end_of_input
			loop
				add (a_stream.last_string.twin)
				a_stream.read_line
			end -- loop
			
			if not a_stream.last_string.is_empty then
				add (a_stream.last_string)
			end -- if
				
			end_update
		end -- load_from_stream
	
feature
-- information
	separator:	CHARACTER
	duplicates:	INTEGER
	sorted:		BOOLEAN

	index_of (a_string: STRING): INTEGER is
		-- returns index of a_string in list strings
		-- 0 if not in list
		deferred
		end -- index_of
				
	index_of_object (a_object: T): INTEGER is
		-- returns index of a_object
		-- 0 if not in list
		local
			i:		INTEGER
			cmp:	T
		do
			from	i := 1
			until	i > count or else Result > 0
			loop
				cmp := object (i)
				if cmp /= Void and then cmp = a_object then
					Result := i
				else
					i := i + 1
				end -- if
			end -- loop
		end -- index_of_object
				
	item (a_index: INTEGER): STRING is
		-- returns a copy of the string at the
		-- specified index
		require
			valid_index: 1 <= a_index and a_index <= count
		deferred
		end -- items
	
	lower: INTEGER is 1
		
	object (a_index: INTEGER): T is
		-- returns the object at the specified index
		-- or void if the string at index a_index has
		-- no attached object
		require
			valid_index: 1 <= a_index and a_index <= count
		do
			search_buffer.copy (item (a_index))
			search_buffer.to_upper
			
			if objects /= Void and then objects.has (search_buffer) then
				Result := objects.at (search_buffer)
			end -- if
		end -- object
		
	object_by_name (a_string: STRING): T is
		-- returns the object attached to string a_string
		-- or void if the string has no attached object
		do
			search_buffer.copy (a_string)
			search_buffer.to_upper
			
			if objects /= Void and then objects.has (search_buffer) then
				Result := objects.at (search_buffer)
			end -- if
		end -- object_by_name
	
	upper: INTEGER is
		do
			Result := count
		end -- upper
		
	comma_text: STRING is
		-- returns the whole list of strings as one
		-- large string separated by 'separator'
		local
			i: INTEGER
		do
			from	!!Result.make (0)
					i := 1
					if i <= count then
						Result.append (item (i))
						i := i + 1
					end -- if
			until	i > count
			loop
				Result.append_character (separator)
				Result.append (item (i))
				i := i + 1
			end -- loop
		end -- comma_text
		
	count: INTEGER is
		-- how many strings are recorded
		deferred
		end -- count
		
	begin_update is
		-- if update is 0 then the event on_changing
		-- will be fired; update will be
		-- incremented by one
		do
			update := update + 1
		end -- begin_update
		
	end_update is
		-- decrements update by one and fires on_changed
		-- if update reaches 0
		do
			if update > 0 then
				update := update - 1
			end -- if
		end -- end_update
		
	last_added: INTEGER
	
	text: STRING is
		-- returns the whole list of strings as one
		-- large string separated by '%N'
		local
			sep: CHARACTER
		do
			sep := separator
			separator := '%N'

			Result := comma_text

			separator := sep
		end -- text
		
	save_to_file (a_file: STRING) is
		local
			file_stream: KL_TEXT_OUTPUT_FILE
		do
			!!file_stream.make (a_file)
			file_stream.open_write
			
			save_to_stream (file_stream)
			
			file_stream.close
		end -- save_to_file

	save_to_stream (a_stream: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			from	i := 1
			until	i > count
			loop
				a_stream.put_string (item (i))
				a_stream.put_new_line
				i := i + 1
			end -- loop
		end -- save_to_file

feature

	as_collection: ARRAY[STRING] is
		local
			idx: INTEGER
		do
			Result := array_buffer
			Result.clear
			
			from
				idx := lower
			until
				idx > upper
			loop
				Result.add_last (item (idx))
				idx := idx + 1
			end -- loop
		end -- as_collection

feature {ELJ_CUSTOM_STRING_LIST}

	do_on_changing is
		do
			if change_event /= Void then
				change_event.notification (Current)
			end -- if
		end -- do_on_changing
		
	do_on_changed is
		do
			if changed_event /= Void then
				changed_event.notification (Current)
			end -- if
		end -- do_on_changed
		
	objects:	DICTIONARY[T, STRING]
	update:		INTEGER

feature {NONE}

	array_buffer: ARRAY[STRING] is
		do
			if internal_array = Void then
				!!internal_array.make (1, 0)
			end -- if
			
			Result := internal_array
		end -- search_buffer

	search_buffer: STRING is
		once
			!!Result.make (32)
		end -- search_buffer
	
	internal_array: ARRAY[STRING]
		
end -- deferred class ELJ_CUSTOM_STRING_LIST
