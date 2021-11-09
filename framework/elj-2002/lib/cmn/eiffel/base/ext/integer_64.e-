indexing

    description:

        "int 64 implementation"

    library:    "ELJ"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Stable"
	complete:   "yes"

expanded class INTEGER_64

inherit
	COMPARABLE
		redefine
			is_equal
		end
	NUMERIC
		redefine
			fill_tagged_out_memory
		end

feature

	infix "<" (other: like Current): BOOLEAN is
		-- Is `Current' strictly less than `other'?
		local
			i1: BIT 64
			i2: BIT 64
			i3: BOOLEAN
		do
			i1 := storage
			i2 := other.storage

			c_inline_c ("_i3 = *((__int64*)&_i1) < *((__int64*)&_i2);%N")

			Result := i3
		end
   
	infix "@<" (other: INTEGER): BOOLEAN is
		-- Is `Current' strictly less than `other'?
		local
			i1: INTEGER_64
		do
			i1.from_integer (other)

			Result := Current < i1
		end
   
	is_equal (other: like Current): BOOLEAN is
		do
			Result := storage = other.storage
		end -- is_equal

	infix "+" (other: like Current): like Current is
		-- Sum with 'other' (commutative).
		local
			i1: BIT 64
			i2: BIT 64
			i3: BIT 64
		do
			i1 := storage
			i2 := other.storage

			c_inline_c ("*((__int64*)&_i3) = *((__int64*)&_i1) + *((__int64*)&_i2);%N")

			Result.set_storage (i3)
		end
   
	infix "-" (other: like Current): like Current is
		-- Result of substracting `other'.
		local
			i1: BIT 64
			i2: BIT 64
			i3: BIT 64
		do
			i1 := storage
			i2 := other.storage

			c_inline_c ("*((__int64*)&_i3) = *((__int64*)&_i1) - *((__int64*)&_i2);%N")

			Result.set_storage (i3)
		end

	infix "*" (other: like Current): like Current is
		-- Product by `other'.
		local
			i1: BIT 64
			i2: BIT 64
			i3: BIT 64
		do
			i1 := storage
			i2 := other.storage

			c_inline_c ("*((__int64*)&_i3) = *((__int64*)&_i1) * *((__int64*)&_i2);%N")

			Result.set_storage (i3)
		end
   
	infix "/" (other: like Current): NUMERIC is
		-- Division by `other'.
		local
			i1: BIT 64
			i2: BIT 64
			i3: DOUBLE
		do
			i1 := storage
			i2 := other.storage

			c_inline_c ("_i3 = *((__int64*)&_i1) / *((__int64*)&_i2);%N")

			Result := i3
		end

	infix "@+" (other: INTEGER): like Current is
		-- Sum with 'other' (commutative).
		local
			i1: INTEGER_64
		do
			i1.from_integer (other)

			Result := Current + i1
		end
   
	infix "@-" (other: INTEGER): like Current is
		-- Result of substracting `other'.
		local
			i1: INTEGER_64
		do
			i1.from_integer (other)

			Result := Current - i1
		end

	infix "@*" (other: INTEGER): like Current is
		-- Product by `other'.
		local
			i1: INTEGER_64
		do
			i1.from_integer (other)

			Result := Current * i1
		end
   
	infix "@/" (other: INTEGER): NUMERIC is
		-- Division by `other'.
		local
			i1: INTEGER_64
		do
			i1.from_integer (other)

			Result := Current / i1
		end

	divisible(other: like Current): BOOLEAN is
		-- May `Current' be divided by `other' ?
		do
			Result := other /= zero
		end

	one: like Current is
         -- Neutral element for "*" and "/".
		do
			Result.from_integer (1)
		end

	zero: like Current is
		-- Neutral element for "+" and "-".
		do
		end
   
	sign: INTEGER is
		-- Sign of Current (0 -1 or 1).
		do
			if is_equal (zero) then
				Result := 0
			elseif Current < zero then
				Result := -1
			else
				Result := 1
			end -- if
		end

	from_integer (a_int: INTEGER) is
		local
			str: BIT 64
			val: INTEGER
		do
			val := a_int
			
			c_inline_c ("*((unsigned long*)&_str) = *((unsigned long*)&_val);%N")
			
			storage := str
		end -- from_integer
	
	from_pointer (a_ptr: POINTER) is
		-- assumes that a_ptr points to a valid 64 bit value
		local
			i1: BIT 64
			i2: POINTER
		do
			i1 := storage
			i2 := a_ptr

			c_inline_c ("*((__int64*)&_i2) = *((__int64*)_i2);%N")
		end -- from_integer
	
	fill_tagged_out_memory is
		do
			tagged_out_memory.append (storage.to_string)
		end -- fill_tagged_out_memory

	low_integer: INTEGER is
		local
			str: BIT 64
			res: INTEGER
		do
			str := storage
			
			c_inline_c ("*((unsigned long*)&_res) = *((unsigned long*)&_str);%N")
			
			Result := res
		end -- low_integer

	set_storage (a_val: BIT 64) is
		do
			storage := a_val
		end -- set_storage

	set_storage_swapped (a_val: BIT 64) is
		local
			str: BIT 64
			val: BIT 64
		do
			val := a_val
			
			c_inline_c ("*((unsigned long*)&(*((char*)&_str + 4))) = *((unsigned long*)&_val);%N")
			c_inline_c ("*((unsigned long*)&_str) = *((unsigned long*)&(*((char*)&_val + 4)));%N")
			
			storage := str
		end -- set_storage

	storage: BIT 64
	
	swapped_storage: BIT 64 is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > 32
			loop
				Result.put (storage.item (i), i + 32)
				Result.put (storage.item (i + 32), i)
				i := i + 1
			end -- loop
		end -- swapped_storage
	
	to_external: POINTER is
		do
			Result := ptr ($storage)
		end -- to_external

feature {NONE}

	ptr (a_ptr: POINTER): POINTER is
		do
			Result := a_ptr
		end -- ptr

end -- expanded class INTEGER_64
