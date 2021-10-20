indexing
	description: "generates a random integer"
	library:     "AppWorks-Util"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   yes
	tested:      no
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class NUMBER_MAKER

creation 
	make
	
feature

	make is
		do
			!! random_generator.make 
	 	end -- make

feature

	get: INTEGER is 
		do
			next
			Result := last
		end -- get

feature

	next is
		do
			random_generator.next
			last := random_generator.last_integer(max)
		end -- next
	
	last: INTEGER
	
feature {NONE}

	max: INTEGER is 200_000

feature 

	test is
			-- we should never get a duplicate
			-- use a SortedCollection to speed up searches
			-- we might need to add the coll to the class
			-- or we could use a number of colls which 
			-- would generate numbers within a range.
			-- or maybe just use allocations.
		local
			ar: BINARY_LIST[INTEGER]
		do
			!!ar.make
			from until i> max
			loop
				check valid: not ar.has (i) end
				ar.add_last(i)
				i := i + 1
			end
		end -- test

feature

	random_generator : MIN_STAND

end -- NUMBER_MAKER
