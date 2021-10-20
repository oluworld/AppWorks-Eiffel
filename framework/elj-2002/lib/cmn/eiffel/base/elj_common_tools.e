class ELJ_COMMON_TOOLS

feature {NONE}

	pointer_to_integer, ptr2int (a_ptr : POINTER): INTEGER is
		do
			c_inline_c ("R=(int)a1;%N")
		end -- pointer_to_integer

	integer_to_pointer, int2ptr (a_int : INTEGER): POINTER is
		do
			c_inline_c ("R=(void*)a1;%N")
		end -- integer_to_pointer

	pointer_to_string, ptr2str (a_ptr : POINTER): STRING is
		do
			!!Result.from_external (a_ptr)
		end -- pointer_to_string

	integer_to_string, int2str (a_int : INTEGER): STRING is
		do
			!!Result.from_external (int2ptr(a_int))
		end -- integer_to_string

	pointer_to_boolean, ptr2bool (a_ptr : POINTER): BOOLEAN is
		do
			c_inline_c ("R=(BOOL)a1;%N")
		end -- pointer_to_boolean

	boolean_to_pointer, bool2ptr (a_bool : BOOLEAN): POINTER is
		do
			c_inline_c ("R=(BOOL*)a1;%N")
		end -- boolean_to_pointer

	integer_or, ior (a_array : ARRAY[INTEGER]) : INTEGER is
		require
			a_array_not_void : a_array /= Void
		local
			i : INTEGER
		do
			from
				i := a_array.lower
			until
				i > a_array.upper
			loop
				Result := (Result.to_bit or a_array.item(i).to_bit).to_integer
				i := i + 1
			end -- loop
		end -- integer_or

	integer_and, iand (a_array : ARRAY[INTEGER]) : INTEGER is
		require
			a_array_not_void : a_array /= Void
		local
			i : INTEGER
		do
			from
				i := a_array.lower
			until
				i > a_array.upper
			loop
				Result := (Result.to_bit and a_array.item(i).to_bit).to_integer
				i := i + 1
			end -- loop
		end -- integer_or

	pprint (a_str : STRING; a_int : INTEGER) is
		do
			print (a_str + " = " + a_int.to_string + "%N")
		end -- pprint

	from_hex_to_bit32 (str: STRING): BIT 32 is
			-- expects string of the form HHHHHHHH with a maximum of 8 
			-- hex characters 0-9,a-f. For longer sequences only the 
			-- trailing 8 characters will be used. A leading 0x will
			-- be ignored to allow standard hex notation.
			-- Uppercase letters are o.k.
		local
			s: STRING
			i,j,k,l: INTEGER
			b: BIT 32
		do
			!!s.copy(str)
			s.left_adjust
			if s.has_prefix("0x") then
				s.remove_prefix("0x")
			end -- if
			from 
				i := s.count
				j := 32
			until 
				i = 0 or else i = s.count - 8  
			loop
				k := s.item(i).hexadecimal_value
				from
					l := j
				until
					l - 4 = j 
				loop
					if k.odd then
						b.put_1(j)
					end -- if
					k := k // 2
					j := j - 1
				end -- loop
				i := i - 1
			end -- loop
			Result := b
		end -- from_hex_to_bit32

	from_hex_to_bit16 (str: STRING): BIT 16 is
			-- expects string of the form HHHH with a maximum of 4 
			-- hex characters 0-9,a-f. For longer sequences only the 
			-- trailing 8 characters will be used. A leading 0x will
			-- be ignored to allow standard hex notation.
			-- Uppercase letters are o.k.
		local
			s: STRING
			i,j,k,l: INTEGER
			b: BIT 16
		do
			!!s.copy(str)
			s.left_adjust
			if s.has_prefix("0x") then
				s.remove_prefix("0x")
			end -- if
			from 
				i := s.count
				j := 16
			until 
				i = 0 or else i = s.count - 8  
			loop
				k := s.item(i).hexadecimal_value
				from
					l := j
				until
					l - 4 = j 
				loop
					if k.odd then
						b.put_1(j)
					end -- if
					k := k // 2
					j := j - 1
				end -- loop
				i := i - 1
			end -- loop
			Result := b
		end -- from_hex_to_bit16

	get_pointer (other : POINTER): POINTER is
		do
			Result := other
		end -- get_pointer

	call_eiffel_feature (a_object: ANY; a_feature: POINTER) is
		local
			obj:	POINTER
			func:	POINTER
		do
			c_inline_h ("typedef void (*EIFFEL_FUNC) (void* C);%N")
			obj  := a_object.to_pointer
			func := a_feature
			c_inline_c ("((EIFFEL_FUNC)(_func))(_obj);%N")
		end -- call_eiffel_feature

	increase_pointer (a_ptr: POINTER; a_val: INTEGER): POINTER is
		local
			pot: POINTER
			val: INTEGER
			res: POINTER
		do
			pot := a_ptr
			val := a_val
			
			c_inline_c ("_res=(void*)(((unsigned int)_pot) + _val);%N")
			
			Result := res
		end -- increase_pointer

	dereference_integer (a_ptr: POINTER): INTEGER is
		local
			pot: POINTER
			res: INTEGER
		do
			pot := a_ptr
			
			c_inline_c ("_res=*((int*)_pot);%N")
			
			Result := res
		end -- dereference_integer

	dereference_short (a_ptr: POINTER): INTEGER is
		local
			pot: POINTER
			res: INTEGER
		do
			pot := a_ptr
			
			c_inline_c ("_res=*((short*)_pot);%N")
			
			Result := res
		end -- dereference_integer

	dereference_character (a_ptr: POINTER): CHARACTER is
		local
			pot: POINTER
			res: CHARACTER
		do
			pot := a_ptr
			
			c_inline_c ("_res=*((char*)_pot);%N")
			
			Result := res
		end -- dereference_character

	poke_character (a_ptr: POINTER; a_chr: CHARACTER) is
		local
			pot: POINTER
			chr: CHARACTER
		do
			pot := a_ptr
			chr := a_chr
			
			c_inline_c ("*((char*)_pot)=_chr;%N")
		end -- poke_character
	
	hexadecimal_to_character (a_string: STRING): CHARACTER is
		require
			valid_len:		a_string /= Void and then a_string.count = 2
			valid_chars: 	a_string.item (1).is_hexadecimal_digit and
							a_string.item (2).is_hexadecimal_digit
		do
			Result := ((a_string.item (1).hexadecimal_value.to_bit @<< 4) or a_string.item (2).hexadecimal_value.to_bit).to_character
		end -- hexadecimal_to_character

	compare_no_case (a_str1, a_str2: STRING): INTEGER is
		require
			non_void_str1: a_str1 /= Void
			non_void_str2: a_str2 /= Void
		local
			res: INTEGER
			pt1: POINTER
			pt2: POINTER
		do
			pt1 := a_str1.to_external
			pt2 := a_str2.to_external
			
			c_inline_c ("_res=strcmpi(_pt1, _pt2);%N")
			
			Result := res
		end -- compare_no_case

	ptr (a_ptr: POINTER): POINTER is
		do
			Result := a_ptr
		end -- ptr

end -- class ELJ_COMMON_TOOLS
