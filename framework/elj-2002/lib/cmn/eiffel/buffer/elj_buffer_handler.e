indexing

    description:

        "moves a 'window' over a range of data"

    library:    "ELJ common"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/04/06 15:59:26 $"
    revision:   "$Revision: 1.1.1.1 $"
    last:       "$Author: usander $"

deferred class ELJ_BUFFER_HANDLER[T->ELJ_FLAGGED_BUFFER]

inherit
	ELJ_BUFFER_FLAGS

feature {NONE}

	make (a_reserved: INTEGER) is
		-- creation for effective descendents
		require
			meaningful_reserve: a_reserved >= 0
		do
			reserved  := a_reserved
			
			set_current (reserved)
			
			!!buffers.make (0, -1)
		end -- make

feature {NONE}

	read_current_buffer is
		-- reads the current external but does not move external cursor
		-- sets 'last_buffer_read' to False if no current
		deferred
		ensure
			not_moved: current_buffer = old current_buffer
		end -- read_current_buffer
	
	read_next_buffer is
		-- moves external cursor to logical next and reads buffer in;
		-- sets 'last_buffer_read' to False if no next
		deferred
		ensure
			not_moved: current_buffer = old current_buffer
		end -- read_next_buffer

	read_previous_buffer is
		-- moves external cursor to logical prior and reads buffer in
		-- sets 'last_buffer_read' to False if no prior
		deferred
		ensure
			not_moved: current_buffer = old current_buffer
		end -- read_previous_buffer
	
feature {NONE}

	active_buffer: INTEGER is
		deferred
		end -- active_buffer

	current_buffer: INTEGER is
		deferred
		end -- current_buffer

	set_active (a_value: INTEGER) is
		deferred
		end -- set_active

	set_current (a_value: INTEGER) is
		deferred
		end -- set_current

	set_current_buffer (a_index: INTEGER) is
		-- synchronizes external cursor to buffer at 'a_index'
		require
			valid_buffer: buffer_flag (a_index) = bf_current
		deferred
		end -- set_current_buffer
	
feature {NONE}

	put_buffer (a_index: INTEGER) is
		deferred
		ensure
			filled: buffers @ a_index /= Void
		end -- put_buffer

	release_buffer (a_index: INTEGER) is
		deferred
		end -- release_buffer

feature
-- getters
	buffer (a_index: INTEGER): T is
		-- accesses one buffer
		require
			a_index >= 0 and then a_index < buffer_count + reserved
		do
			Result := buffers.item (a_index)
		end -- buffer
	
	buffer_flag (a_index: INTEGER): INTEGER is
		-- buffer flags tell if this buffer has been filled
		require
			a_index >= 0 and then a_index < buffer_count + reserved
		do
			Result := buffers.item (a_index).flag
		end -- buffer_flag

	buffer_count: INTEGER is
		-- count of 'user' buffers, 'reserved' is stripped from Result
		do
			Result := (0).max (buffers.count - reserved)
		ensure
			meaningful_count: Result >= 0
		end -- buffer_count
	
	is_empty: BOOLEAN is
		do
			Result := buffers.count = 0 or else buffer_flag (reserved) /= bf_current
		end -- is_empty

	reserved: INTEGER
		-- how much buffers are reserved for internal usage

feature
-- setters
	move_by (a_distance: INTEGER) is
		-- scrolls a cursor over a 'window' opened to the buffers;
		-- if the movement is within the range of the current 'window'
		-- buffers are not read again
		require
			meaningful_command: a_distance /= 0
		local
			new_buffer: INTEGER
		do
			new_buffer := active_buffer + a_distance
			
			if new_buffer < reserved then
				from
					read_bos_index := True
					set_to_lowest
					flag_buffers_empty
					last_buffer_read := True
				until
					new_buffer = reserved or else not last_buffer_read
				loop
					read_previous
					
					if last_buffer_read then
						read_bos_index := False
						read_eos_index := False
						new_buffer := new_buffer + 1
					end -- if
				end -- loop
				
				set_active (reserved)
				
				last_buffer_read := True

				read_current
				
				if last_buffer_read then
					read_next_buffers
					read_previous_buffers
				end -- if
			elseif new_buffer > highest_filled then
				from
					read_eos_index := True
					set_to_highest
					flag_buffers_empty
					last_buffer_read := True
				until
					new_buffer - buffers.upper = 0 or else not last_buffer_read
				loop
					read_next

					if last_buffer_read then
						read_bos_index := False
						read_eos_index := False
						new_buffer := new_buffer - 1
					end -- if
				end -- loop
				
				set_active (buffers.upper)

				last_buffer_read := True

				read_current
				
				if last_buffer_read then
					read_previous_buffers
					read_next_buffers
				end -- if
			else
				if new_buffer < active_buffer then
					read_eos_index := False
				else
					read_bos_index := False
				end -- if
				set_active (new_buffer)
			end -- if
			check
				valid_position: active_buffer >= reserved
			end -- check
			
			from
			until
				active_buffer = reserved or else buffer_flag (active_buffer) = bf_current
			loop
				set_active (active_buffer - 1)
			end -- loop
		end -- move_by
	
	set_buffer_count (a_count: INTEGER) is
		-- adjust count of 'public' buffers; reserved count is silently added;
		-- set to '0' to call 'release_buffer' for all buffers
		require
			meaningful_count: a_count >= 0
		local
			lmt: INTEGER
			dif: INTEGER
			idx: INTEGER
		do
			dif := a_count - (buffers.count - reserved)
			
			if dif /= 0 then
				lmt := a_count + reserved - 1
				
				if dif > 0 then
					from
						idx := buffers.upper + 1
						buffers.resize (0, lmt)
					until
						idx > buffers.upper
					loop
						check
							free_slot: buffers.item (idx) = Void
						end -- check
						
						put_buffer (idx)
						idx := idx + 1
					end -- loop
				else
					check
						shrink: dif < 0
					end -- check
					
					from
						idx := buffers.upper
					until
						idx = lmt
					loop
						release_buffer (idx)
						idx := idx - 1
					end -- loop

					buffers.resize (0, lmt)
				end -- if
			end -- if
		ensure
			value_set: buffer_count = a_count
		end -- set_buffer_count

feature {ELJ_DATA_PROVIDER}

	buffers: ARRAY[T]
		-- the buffers
	
feature {NONE}

	read_bos_index:		BOOLEAN
	read_eos_index:		BOOLEAN
	
	check_buffers (a_distance: INTEGER): BOOLEAN is
		-- internal check routine for 'shift_buffers'
		-- returns true if and only if filled buffers (bf_current) are
		-- adjusted to the top of the buffer window, followed only by
		-- empty buffers (bf_empty)
		local
			idx: INTEGER
		do
			from
				Result := True
				idx := reserved - 1
			until
				idx = buffers.upper or else not Result
			loop
				idx := idx + 1
				Result := buffer_flag (idx) = bf_current
			end -- loop

			from
				Result := Result or else buffer_flag (idx) /= bf_current
			until
				idx > buffers.upper or else not Result
			loop
				Result := buffer_flag (idx) /= bf_current
				idx := idx + 1
			end -- loop
		end -- check_buffers

	last_buffer_read: BOOLEAN
		-- last read successful?

	highest_filled: INTEGER is
		do
			from
				Result := buffers.upper
			until
				Result = 0 or else not (<<bf_empty, bf_eos, bf_bos>>).fast_has (buffer_flag (Result))
			loop
				Result := Result - 1
			end -- loop
		end -- highest_filled

feature {NONE}

	flag_buffers_empty is
		-- mark all buffers as unread
		local
			idx: INTEGER
		do
			from
				idx := buffers.lower
			until
				idx > buffers.upper
			loop
				buffers.item (idx).set_flag (bf_empty)
				idx := idx + 1
			end -- loop
		end -- flag_buffers_empty
	
	free_tmp_buffers is
		-- finalization, frees reserved buffers
		local
			idx: INTEGER
		do
			from
				idx := reserved - 1
			until
				idx < 0
			loop
				release_buffer (idx)
				idx := idx - 1
			end -- loop
			
			buffers.resize (0, -1)
		end -- free_tmp_buffers

	read_current is
		-- reads current buffer and flags it according to read result
		do
			read_current_buffer

			if last_buffer_read then
				buffers.item (current_buffer).set_flag (bf_current)
			else
				buffers.item (current_buffer).set_flag (bf_empty)
			end -- if
		ensure
			flagged: last_buffer_read implies buffers.item (current_buffer).flag = bf_current
			not_flagged: not last_buffer_read implies buffers.item (current_buffer).flag = bf_empty
		end -- read_current
	
	read_next is
		-- reads next buffer and flags it according to read result
		do
			read_next_buffer

			if last_buffer_read then
				buffers.item (current_buffer).set_flag (bf_current)
			else
				buffers.item (current_buffer).set_flag (bf_eos)
			end -- if
		ensure
			flagged: last_buffer_read implies buffers.item (current_buffer).flag = bf_current
			not_flagged: not last_buffer_read implies buffers.item (current_buffer).flag = bf_eos
		end -- read_next
	
	read_next_buffers is
		-- start at active_buffer + 1 and read as much following as possible
		do
			from
				last_buffer_read := True
				if buffer_flag (active_buffer) = bf_current then
					set_current_buffer (active_buffer)
				end -- if
				set_current (active_buffer + 1)
			until
				current_buffer > buffers.upper or else not last_buffer_read
			loop
				read_next

				if last_buffer_read then
					set_current (current_buffer + 1)
				end -- if
			end -- loop
		end -- read_next_buffers
		
	read_previous is
		-- reads previous buffer and flags it according to read result
		do
			read_previous_buffer

			if last_buffer_read then
				buffers.item (current_buffer).set_flag (bf_current)
			else
				buffers.item (current_buffer).set_flag (bf_bos)
			end -- if
		ensure
			flagged: last_buffer_read implies buffers.item (current_buffer).flag = bf_current
			not_flagged: not last_buffer_read implies buffers.item (current_buffer).flag = bf_bos
		end -- read_previous
	
	read_previous_buffers is
		-- start at active_buffer - 1 and read as much preceding as possible
		do
			from
				last_buffer_read := True
				if buffer_flag (active_buffer) = bf_current then
					set_current_buffer (active_buffer)
				end -- if
				set_current (active_buffer - 1)
			until
				current_buffer < reserved or else not last_buffer_read
			loop
				read_previous

				if last_buffer_read then
					set_current (current_buffer - 1)
				end -- if
			end -- loop
			
			if current_buffer >= reserved then
				shift_buffers (current_buffer + 1)
			end -- if
		end -- read_previous_buffers
		
	shift_buffers (a_start: INTEGER) is
		-- adjust filled buffers to lowest index following the reserved
		-- indexes
		require
			meaningful_command: a_start > reserved
		local
			dis: INTEGER
			idx: INTEGER
		do
			from
				dis := a_start - reserved
				idx := a_start
			until
				idx > buffers.upper
			loop
				buffers.swap (idx, idx - dis)
				idx := idx + 1
			end -- loop
			
			check
				buffers_shifted: check_buffers (dis)
			end -- check
			
			set_active (active_buffer - dis)
		end -- shift_buffers

	set_to_lowest is
		-- synchronizes external cursor to buffer with lowest index if
		-- not empty
		do
			if buffer_flag (reserved) = bf_current then
				set_current_buffer (reserved)
			end -- if

			set_current (reserved)
		end -- set_to_lowest
	
	set_to_highest is
		-- tries to find the highest filled index and synchronizes 
		-- external cursor to that buffer
		local
			idx: INTEGER
		do
			from
				idx := buffers.upper
			until
				idx < reserved or else buffer_flag (idx) = bf_current
			loop
				idx := idx - 1
			end -- loop
			
			if idx >= reserved then
				set_current_buffer (idx)
			end -- if

			set_current (buffers.upper)
		end -- set_to_highest

feature {ELJ_BUFFER_READER}

	accessible (a_index: INTEGER): BOOLEAN is
		-- is a_index a valid and filled buffer
		do
			Result := a_index >= reserved and then a_index < buffer_count + reserved
			Result := Result and then (buffer_flag (a_index) = bf_current or else buffer_flag (a_index) = bf_insert)
		end -- accessible

	set_active_buffer (a_index: INTEGER) is
		-- sets active_buffer to a new one within the range
		-- 0 .. buffers.upper
		require
			a_index >= 0 and then a_index < buffer_count + reserved
		do
			set_active (a_index)
		end -- set_active_buffer

end -- deferred class ELJ_BUFFER_HANDLER