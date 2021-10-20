class ELJ_BUFFERED_DATA_ARRAY

inherit
	ELJ_PAGE_MANAGER_CLIENT

creation
	make

feature {NONE}

	make (a_count, a_size: INTEGER) is
		
		do
			block_size  := a_size
			block_count := a_count
		end -- make

feature {ELJ_PAGE_MANAGER}

	page_size: INTEGER is
		do
			Result := block_size * block_count
		end -- page_size
	
	write_page (a_page: ELJ_DATA_PAGE) is
		do
			if a_page.position + page_size > file.size then
				file.set_min_size (a_page.position + page_size)
			end -- if
			
			file.move_to (a_page.position)
			
			file.put_buffer (a_page.data.to_pointer, page_size)
		end -- write_page

	read_page (a_page: ELJ_DATA_PAGE; a_position: INTEGER) is
		do
			if a_position + page_size > file.size then
				file.set_min_size (a_position + page_size)
			end -- if
			
			file.move_to (a_position)
			
			file.read_buffer (a_page.data.to_pointer, page_size)
		end -- read_page

feature

	read_only_item (a_index: INTEGER): NATIVE_ARRAY[CHARACTER] is
		local
			itm: ELJ_DATA_PAGE
			idx: INTEGER
		do
			itm := manager.read (Current, a_index * block_size)

			idx := a_index \\ block_size
			
			Result := Result.from_pointer (itm.data.to_pointer + idx * block_count)
		end -- read_only_item

	lock_item (a_index: INTEGER): NATIVE_ARRAY[CHARACTER] is
		local
			min: INTEGER
			max: INTEGER
			idx: INTEGER
		do
			if page /= Void then
				min := page.position // block_size
				max := min + block_count
				
				if a_index < min or else a_index > max then
					manager.put (page)
					page := manager.check_out (Current, a_index * block_size)
				end -- if
			else
				page := manager.check_out (Current, a_index * block_size)
			end -- if
			
			idx := a_index \\ block_size
			
			Result := Result.from_pointer (page.data.to_pointer + idx * block_count)
		end -- lock_item
	
	release_item is
		do
			if page /= Void then
				manager.put (page)
				page := Void
			end -- if
		end -- release_item

feature

	open (a_file: STRING) is
		do
			create file
			file.open (a_file)
		end -- open

	open_temp is
		do
			create file
			file.open_temp_file
		end -- open
	
	close is
		require
			non_void_file: file /= Void
		do
			release_item
			if file.is_open then
				file.close
			end -- if
			file := Void
		end -- close

feature

	file: ELJ_BINARY_FILE_STREAM

	block_size: INTEGER
	
	block_count: INTEGER
	
	manager: ELJ_PAGE_MANAGER is
		once
			create Result.make
		end -- manager
	
feature {NONE}

	page: ELJ_DATA_PAGE

end -- class ELJ_BUFFERED_DATA_ARRAY
