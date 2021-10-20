class ELJ_DATA_PAGE

feature {ELJ_PAGE_MANAGER}

	setup (a_client: ELJ_PAGE_MANAGER_CLIENT; a_pos: INTEGER) is
		require
			not_in_use: not in_use
			clean: not is_dirty
		do
			client   := a_client
			position := a_pos
		end -- setup

	same_id (a_client: ELJ_PAGE_MANAGER_CLIENT; a_pos: INTEGER): BOOLEAN is
		do
			Result := a_client = client and then a_pos = position
		end -- same_id

	use is
		do
			in_use := True
		end -- mark_in_use
	
	unuse is
		do
			in_use := False
		end -- unuse

	set_size (a_size: INTEGER) is
		do
			if a_size > real_size then
				data := data.calloc (a_size)
				real_size := a_size
			end -- if
			
			size := a_size
		end -- set_size

feature {ELJ_PAGE_MANAGER_CLIENT, ELJ_PAGE_MANAGER}

	is_dirty: BOOLEAN
	
	position: INTEGER
	
	in_use: BOOLEAN

feature {NONE}

	real_size: INTEGER

feature

	client: ELJ_PAGE_MANAGER_CLIENT

	data: NATIVE_ARRAY[CHARACTER]
	
	size: INTEGER
	
end -- class ELJ_DATA_PAGE
