class TEST_RBT

	-- Test the RED_BLACK_TREE Class from the midi-eiffel library ..
	--
	--    ftp://ftp.boulderlabs.com/pub/midi/
	--
	-- Example comes from:
	--
	--    http://www.ee.uwa.edu.au/~plsd210/ds/red_black.html
	--    http://www.ee.uwa.edu.au/~plsd210/ds/red_black_op.html
	--
	-- Geoff Eldridge (09 Apr 99)

creation
	make

feature

	make is
		do
			!!rbt.make

			rbt.insert( 1, 1)
			print_count

			rbt.insert( 2, 2)
			print_count

			rbt.insert( 5, 3)
			print_count

			rbt.insert( 7, 4)
			print_count

			rbt.insert( 8, 5)
			print_count

			rbt.insert(11, 6)
			print_count

			rbt.insert(14, 7)
			print_count

			rbt.insert(15, 8)
			print_count

			rbt.print_tree
			print_count

			io.put_new_line
			io.put_new_line
			io.put_string("insert node 4%N")
			io.put_string("=============%N")

			rbt.insert( 4, 9)
			rbt.print_tree
			print_count

		end -- make

feature -- access

	rbt : RED_BLACK_TREE[INTEGER, INTEGER]

	print_count is
		do
			io.put_string("rbt.count = ")
			io.put_integer(rbt.count)
			io.put_string("%N%N")
		end -- print_count


end -- TEST_RBT