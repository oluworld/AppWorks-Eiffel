class APPWORKS_UTIL_DICTIONARY[K, V]

creation
	make
	
feature
	make is
		do
			rbt.make
		end -- make

feature

	at (a_key: K): V is
		require
			valid_key: has (a_key)
		do
			if rbt.find (a_key) then
				Result := rbt.item
			end
		ensure
			--rbt.find(a_key) implies Result = True
		end -- at
	
	has (a_key: K): BOOLEAN is
		do
			Result := rbt.find (a_key)
		end -- has

	put_at (a_value: V; a_key: K) is
		do
			rbt.insert (a_key, a_value)
		end -- put_at

feature

	rbt: expanded RED_BLACK_TREE[K, V]

end -- class APPWORKS_UTIL_DICTIONARY
