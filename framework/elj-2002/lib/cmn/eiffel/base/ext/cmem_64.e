indexing

    description:

        "64 Bit floating point number"
		"address of value is accessible and can be passed and read from"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

expanded class CMEM_64

feature { NONE }

	mem_64: BIT 64
	
	ptr (a_value: POINTER): POINTER is
		do
			Result := a_value
		end -- ptr
	
	c_to_double (a_ptr: POINTER): DOUBLE is
		external "C inline"
		alias "*((double*)$a_ptr)"
		end -- c_to_double
	
	c_from_double (a_value: DOUBLE; a_ptr: POINTER) is
		external "C inline"
		alias "*((double*)$a_ptr) = $a_value"
		end -- c_from_double

feature

	to_external: POINTER is
		do
			Result := ptr ($mem_64);
		end -- to_external

feature

	to_double: DOUBLE is
		do
			Result := c_to_double ($mem_64)
		end -- to_double

	from_double (a_value: DOUBLE) is
		do
			c_from_double (a_value, $mem_64)
		end -- from_double

end -- expanded class CMEM_64
