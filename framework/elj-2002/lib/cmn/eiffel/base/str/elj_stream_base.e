indexing

    description:

        "basic stream interface"

    library:    "ELJ CCL"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"

deferred class ELJ_STREAM_BASE

inherit
	INPUT_STREAM
	OUTPUT_STREAM

feature
-- queries
	after: BOOLEAN is
		do
			Result := position = count + 1
		end -- before

	before: BOOLEAN is
		do
			Result := position = 0
		end -- before
		
	count: INTEGER is
		deferred
		end -- count

	position: INTEGER is
		deferred
		end -- position
		
feature
-- commands
	clear is
		do
			set_position (1)
			set_count (0)
		ensure
			cleared: position = 1 and then after
		end -- clear

feature
-- setters
	set_count (a_count: INTEGER) is
		
		require
			obey_position: a_count >= position - 1
		deferred
		end -- set_count

	set_position (a_pos: INTEGER) is
		require
			in_range: a_pos <= count + 1
		deferred
		end -- set_position
	
invariant

	valid_position: position >= 0 and then position <= count + 1

end -- deferred class ELJ_STREAM_BASE
