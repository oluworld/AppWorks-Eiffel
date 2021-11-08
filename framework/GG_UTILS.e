indexing
	purpose: "house various utility functions"

-- or expanded??
deferred class GG_UTILS

feature

	print_all (c: COLLECTION[ANY]) is
		local
			i : ITERATOR_ON_COLLECTION[ANY]
		do
			from
				!! i.make (c)
				i.start
			until
				i.is_off
			loop
				print (i.item)
				i.next
			end
		end -- print_all
	
	p5 (a1, a2, a3, a4, a5 : ANY) is
		do
			print (a1)
			print (a2)
			print (a3)
			print (a4)
			print (a5)
		end -- p5

	p5b (a1, a2, a3, a4, a5 : ANY) is
		do
			print (a1) print(" ")
			print (a2) print(" ")
			print (a3) print(" ")
			print (a4) print(" ")
			print (a5) print("%N")
		end -- p5

feature

	get_quoted (line, name, value : STRING) is
		do
			-- TODO: implement me
		end -- get_quoted

	splitline (line, name, value : STRING) is
		require
			line_length: line.count > 0
		local
			i  : INTEGER
		do
			if line @ 1 = '"' then
				get_quoted (line, name, value)
			else
				from 
					i := 1
				until
					i > line.count 
						or else 
					line @ i = ' ' 
						or else 
					line @ i = '%T'
				loop
					name.extend (line @ i)
					i := i + 1
				end
				value.copy (line.substring (i, line.count))
			end
			if value.count > 0 then
				if is_quot (value @ 1) then 
					value.copy (value.substring (1, value.count-1))
				else
					value.remove_first (1)
				end
			end
		end

	is_quot (c : CHARACTER) : BOOLEAN is
		do
			if c = '"' then
				Result := True
			elseif c = '%'' then
				Result := True
			end
		end

feature

	string_after_last (s: STRING; c: CHARACTER): STRING is
			-- returns Void if not found
		local
			pos: INTEGER
		do
			pos := string_rfind (s, c)
			if pos > 0 then
				Result := s.substring(pos+1, s.count)
			end
		ensure
			valid_result: Result = Void implies not s.has(c)
		end
	
	string_rfind (s: STRING; c: CHARACTER): INTEGER is
			-- returns 0 if not found
		local
			sc: INTEGER
		do
			from
				sc := s.count
			until
				sc = 0
					or else
				Result /= 0
			loop
				if s @ sc = c then
					Result := sc
				else
					sc := sc - 1
				end
			end
		ensure
			valid_result: Result < s.lower implies not s.has(c)
		end -- string_rfind 
	
feature

	xp2i (a_ptr: POINTER): INTEGER is
		do
			c_inline_c ("R=(EIF_INTEGER)a1;%N")
		end -- p2i

	p2i (a_ptr: POINTER): INTEGER is
		external "C inline"
		alias "(EIF_INTEGER)$a_ptr"
		end -- p2i

	xi2p (an_int: INTEGER): POINTER is
		do
			c_inline_c ("R=(EIF_POINTER)a1;%N")
		end -- p2i

	i2p (an_int: INTEGER): POINTER is
		external "C inline"
		alias "(EIF_POINTER)$an_int"
		end -- i2p

end -- class GG_UTILS
