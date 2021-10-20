indexing

    description:

        "represents a 32 Bit integer type"
        "conversion routines from and to pointer implemented"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

expanded class CMEM_32

feature { NONE }

	mem_32: BIT 32
	
	ptr (a_value: POINTER): POINTER is
		do
			Result := a_value
		end -- ptr

feature { ANY }

	to_external: POINTER is
		do
			Result := ptr ($mem_32);
		end -- to_external


feature { ANY }

	to_integer: INTEGER is
		do
			Result := mem_32.to_integer
		end

	to_real: REAL is
		do
			Result := to_integer.to_real
		end

	to_double: DOUBLE is
		do
			Result := to_integer.to_double
		end

	as_pointer: POINTER is
		local
			res: POINTER
			val: INTEGER
		do
			val := mem_32.to_integer
			c_inline_c ("_res = (void*)_val;%N")
			Result := res
		end

	from_integer (a_value: INTEGER) is
		do
			mem_32 := a_value.to_bit
		end

	from_pointer (a_value: POINTER) is
		local
			tgt: INTEGER
			val: POINTER
		do
			val := a_value
			c_inline_c ("_tgt = (int)_val;%N")
			mem_32 := tgt.to_bit
		end

end -- expanded class CMEM_32
