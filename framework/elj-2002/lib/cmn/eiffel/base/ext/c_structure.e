indexing

    description:

        "C structure creation and destruction management"

    library:    "lib/common/eiffel/common"
    author:     "Uwe Sander, usander@online.de, Paul Cohen, paco@enea.se, Geoff Eldridge, geoff@elj.com"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

deferred class C_STRUCTURE

feature

	make_external is
			-- Create and allocate memory. When garbage
			-- collected, free the allocated memory.
		do
			mem := mem.calloc (external_size)
			pointer := mem.to_pointer
			count := external_size
		ensure
			pointer_valid: pointer.is_not_null
		end -- make

	make_default is
		do
			pointer := default_pointer
			count := 0
		ensure
			pointer_null: pointer.is_null
		end -- make_default

	from_external (a_pointer: POINTER; a_size: INTEGER) is
			-- Create with `pointer' pointing to already
			-- allocated memory. When garbage collected,
			-- do not free the allocated memory.
		require
			pointer_not_void: a_pointer.is_not_null
		do
			pointer := a_pointer
			count := a_size
		ensure
			pointer_valid: pointer = a_pointer
		end -- make_shared

	make_with_size (a_size: INTEGER) is
			-- for structs without a fixed size ..
		do
			mem := mem.calloc (a_size)
			count := a_size
			pointer := mem.to_external
		end -- make_with_size 

feature -- Access

	mem: NATIVE_ARRAY[CHARACTER]

	count: INTEGER
	
	to_external: POINTER is
		do
			Result := pointer
		end -- to_external

	pointer: POINTER

	external_size : INTEGER is
			-- size 'external_size' bytes of the memory area occupied
			-- by the structure.
		deferred
		end -- external_size

end -- deferred class C_STRUCTURE
