indexing

    description:

        "represents a short integer (16 Bit) type"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

expanded class CMEM_16

feature {NONE}

	storage: BIT 16
	
	ptr (a_ptr: POINTER): POINTER is
		do
			Result := a_ptr
		end -- ptr

feature

	to_integer: INTEGER is
		do
			Result := c_to_integer ($storage)
		end -- to_integer

	to_external: POINTER is
		do
			Result := ptr ($storage)
		end -- to_external

feature {NONE}

	c_to_integer (a_val: POINTER): INTEGER is
		external "C inline"
		alias "*((short*)$a_val)"
		end -- c_to_integer

end -- expanded class CMEM_16