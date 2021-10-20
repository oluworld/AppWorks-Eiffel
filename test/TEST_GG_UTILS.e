class TEST_GG_UTILS
inherit
	GG_UTILS
creation
	make
feature
	make is
		do
			test_is_quot
			test_splitline 
		end -- make

feature

	test_is_quot is
		do
			assert_true (is_quot('%''))
			assert_true (is_quot('"'))
			--
			assert_false (is_quot('`'))
			assert_false (is_quot('A'))
		end -- test_is_quot

	test_splitline  is
		do
			splitline ("a b", n, v)
			assert_string_eq (n, "a")
			assert_string_eq (v, "b")
			--
			splitline ("%"a  %" b", n, v)
			assert_string_eq (n, "%"a  %"")
			assert_string_eq (v, "b")
			--
			splitline ("", n, v)
			assert_not_reached
			--
		end -- test_splitline 

end -- class TEST_GG_UTILS
