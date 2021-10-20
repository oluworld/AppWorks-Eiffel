class ELJ_STRING_LIST[T]

inherit
	ELJ_CUSTOM_STRING_LIST[T]
		redefine
			make,
			add,
			delete,
			sort,
			clear,
			exchange,
			insert,
			index_of,
			item,
			count
		end
	ELJ_COMMON_TOOLS
--	ELJ_TOOLS
	
	
creation
	make
	
feature {NONE}
-- creation
	make is
		do
			precursor
			!!strings.make (1, 0)
		end -- make

feature
-- modifiers
	add (a_string: STRING) is
		-- adds one string to the list and returns
		-- the index of the added one
		-- sorts in if sorted is true
		do
			begin_update
			if not sorted then
				strings.add_last (a_string)
				last_added := strings.upper
			else
				from	last_added := strings.lower
				until	last_added > strings.upper or else
						compare_no_case (a_string, strings.item (last_added)) <= 0
				loop
					last_added := last_added + 1
				end -- loop
				
				strings.add (a_string, last_added)
			end -- if
			end_update
		end -- add
		
	delete (a_index: INTEGER) is
		-- removes the string with index a_index from
		-- the list and the attached object, if existing
		do
			begin_update
			if objects /= Void then
				objects.remove (strings.item (a_index))
			end -- if
			strings.remove (a_index)
			end_update
		end -- delete
		
	sort is
		-- sorts the list regardless if 'sorted'
		-- is true or false
		local
			sorter: COLLECTION_SORTER[STRING]
		do
			if not sorted then
				begin_update
				sorter.sort (strings)
				end_update
			end -- if
		end -- sort
		
	clear is
		-- clears the list and all attached objects
		do
			begin_update
			strings.clear
			if objects /= Void then
				objects.clear
			end -- if
			end_update
		end -- clear
		
	exchange (a_idx_1, a_idx_2: INTEGER) is
		-- swaps strings at a_idx_1 and a_idx_2
		require
			not_sorted: not sorted
			valid_index_1: 1 <= a_idx_1 and a_idx_1 <= count
			valid_index_2: 1 <= a_idx_2 and a_idx_2 <= count
		do
			begin_update
			strings.swap (a_idx_1, a_idx_2)
			end_update
		end -- exchange
		
	insert (a_string: STRING; a_index: INTEGER) is
		-- insert a_string at the specified index
		-- the string at index a_index and all following
		-- will be moved in tail direction to make a hole
		require
			not_sorted: not sorted
		do
			begin_update
			strings.put (a_string, a_index)
			end_update
		end -- insert
		
	set_item (a_string: STRING; a_index: INTEGER) is
		do
			begin_update
			strings.add (a_string, a_index)
			end_update
		end -- insert
		
feature

	index_of (a_string: STRING): INTEGER is
		-- returns index of a_string in list strings
		-- 0 if not in list
		do
			from	Result := strings.upper
			until	Result < strings.lower or else 
					a_string.same_as (strings.item (Result))
			loop
				Result := Result - 1
			end -- loop
		end -- index_of
				
	item (a_index: INTEGER): STRING is
		-- returns a copy of the string at the
		-- specified index
		require
			valid_index: 1 <= a_index and a_index <= count
		do
			!!Result.copy (strings.item (a_index))
		end -- items
		
	count: INTEGER is
		-- how many strings are recorded
		do
			Result := strings.count
		end -- count
		
feature {NONE}

	strings: ARRAY[STRING]

end -- class ELJ_STRING_LIST
