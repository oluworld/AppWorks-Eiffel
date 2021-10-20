indexing

    description:

        "second version for C structure handling base class"
		"see also class C_STRUCTURE"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

deferred class C_STRUCT_BASE

inherit
	ANY
		redefine
			copy,
			is_equal
		end

feature

	copy (a_other: like Current) is
		do
			storage := storage.calloc (size)
			storage.copy_from (a_other.storage, size)
		end -- copy
	
	is_equal (a_other: like Current): BOOLEAN is
		do
			Result := storage.fast_memcmp (a_other.storage, size)
		end -- is_equal
	
	size: INTEGER is
		deferred
		end -- size

feature {C_STRUCT_BASE}

	storage: NATIVE_ARRAY[CHARACTER]
	
	struct: POINTER is
		do
			Result := storage.to_pointer
		end -- struct

end -- deferred class C_STRUCT_BASE
