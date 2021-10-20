class SINGLE_COLLECTION[E]

inherit
	COLLECTION[E]
creation
	make

feature -- Indexing:

	lower: INTEGER is 1
	upper: INTEGER is 1

feature -- Counting:

	my_count: INTEGER
	count: INTEGER is
		do
			Result := my_count
		end

	is_empty: BOOLEAN is
			-- Is collection empty ?
		do
			Result := count =0
		end

feature -- Accessing:

	item, infix "@", first, last (i: INTEGER): E is
		do
			Result := the_object
		end

feature -- Writing:

	put(element: like item i: INTEGER) is
			-- Make `element' the item at index `i'.
		require
			valid_index(i)
		deferred
		ensure
			item(i) = element
			count = old count
		end

	swap(i1, i2: INTEGER) is
			-- Swap item at index `i1' with item at index `i2'.
		require
			valid_index(i1)
			valid_index(i2)
		local
			tmp: like item
		do
			tmp := item(i1)
			put(item(i2),i1)
			put(tmp,i2)
		ensure
			item(i1) = old item(i2)
			item(i2) = old item(i1)
			count = old count
		end

	set_all_with(v: like item) is
			-- Set all items with value `v'.
		deferred
		ensure
			count = old count
		end
	
	set_slice_with(v: like item lower_index, upper_index: INTEGER) is
			-- Set all items in range [`lower_index' .. `upper_index'] with `v'.
		require
			lower_index <= upper_index
			valid_index(lower_index)
			valid_index(upper_index)
		local
			i: INTEGER
		do
			from  
				i := lower_index
			until
				i > upper_index
			loop
				put(v,i)
				i := i + 1
			end		
		ensure
			count = old count
		end
	
	clear_all is
			-- Set every item to its default value.
			-- The `count' is not affected (see also `clear').
		local
			value: like item
		do
			set_all_with(value)
		ensure
	 stable_upper: upper = old upper
	 stable_lower: lower = old lower
			all_default
		end
	
feature -- Adding:

	add_first(element: like item) is
			-- Add a new item in first position : `count' is increased by 
			-- one and all other items are shifted right.
		deferred
		ensure
			first = element
			count = 1 + old count
			lower = old lower
			upper = 1 + old upper
		end

	add_last(element: like item) is
			-- Add a new item at the end : `count' is increased by one.
		deferred
		ensure
			last = element
			count = 1 + old count
			lower = old lower
			upper = 1 + old upper
		end

	add(element: like item index: INTEGER) is
			-- Add a new `element' at rank `index' : `count' is increased 
			-- by one and range [`index' .. `upper'] is shifted right
			-- by one position.
		require
			lower <= index
			index <= upper + 1
		deferred
		ensure
			item(index) = element
			count = 1 + old count
			upper = 1 + old upper
		end

	append_collection(other: COLLECTION[E]) is
			-- Append `other' to Current.
		require
			other /= Void
		local
			i: INTEGER
		do
			from
				i := other.lower
			until
				i > other.upper
			loop
				add_last(other.item(i))
				i := i + 1
			end
		ensure
			count = other.count + old count
		end

feature -- Modification:

	force(element: E index: INTEGER) is
			-- Make `element' the item at `index', enlarging the collection if 
			-- necessary (new bounds except `index' are initialized with 
			-- default values).
		require
			index >= lower
		deferred
		ensure
			upper = index.max(old upper)
			item(index) = element
		end

	copy(other: like Current) is
	 -- Reinitialize by copying all the items of `other'.
		deferred
		end

	from_collection(model: COLLECTION[like item]) is
	 -- Initialize the current object with the contents of `model'.
		require
			model /= Void
		deferred
		ensure
			count = model.count
		end

feature -- Removing:

	remove_first is
			-- Remove the `first' element of the collection.
		require
			not is_empty
		deferred
		ensure
			count = (old count) - 1
			(lower = (old lower) + 1) xor (upper = (old upper) - 1) 
		end

	remove(index: INTEGER) is
			-- Remove the item at position `index'. Followings items
			-- are shifted left by one position.
		require
			valid_index(index)
		deferred
		ensure
			count = (old count) - 1
			upper = (old upper) - 1
		end

	remove_last is
			-- Remove the `last' item.
		require
			not is_empty
		deferred
		ensure
			count = (old count) - 1
			upper = (old upper) - 1
		end

	clear is
			-- Discard all items in order to make it `is_empty'.
			-- See also `clear_all'.
		deferred
		ensure
			is_empty
		end

feature -- Looking and Searching:

	has(x: like item): BOOLEAN is
			-- Look for `x' using `equal' for comparison.
			-- Also consider `fast_has' to choose the most appropriate.
		do
			Result := valid_index(index_of(x))
		end
	
	fast_has(x: like item): BOOLEAN is
			-- Look for `x' using basic `=' for comparison.
			-- Also consider `has' to choose the most appropriate.
		do
			Result := valid_index(fast_index_of(x))
		end
	
	index_of(element: like item): INTEGER is
			-- Give the index of the first occurrence of `element' using
			-- `is_equal' for comparison.
			-- Answer `upper + 1' when `element' is not inside.
			-- Also consider `fast_index_of' to choose the most appropriate.
	 --
	 -- Note: we'll have to mimic what's done in the new ELKS STRING class 
	 -- for `index_of' (ie. to add an extra argument). This is in the todo 
	 -- list ... let people switch first to ELKS 2001 at time being.
		deferred
		ensure
			lower <= Result
			Result <= upper + 1
			Result <= upper implies equal(element,item(Result))
		end
	
	fast_index_of(element: like item): INTEGER is
			-- Give the index of the first occurrence of `element' using
			-- basic `=' for comparison.
			-- Answer `upper + 1' when `element' is not inside.
			-- Also consider `index_of' to choose the most appropriate.
		deferred
		ensure
			lower <= Result
			Result <= upper + 1
			Result <= upper implies element = item(Result)
		end
	
feature -- Looking and comparison:

	is_equal(other: like Current): BOOLEAN is
	 -- Do both collections have the same `lower', `upper', and 
	 -- items?
	 -- The basic `=' is used for comparison of items.
	 -- See also `is_equal_map'.
		deferred
		ensure then
	 Result implies (lower = other.lower and upper = other.upper)
		end

	is_equal_map(other: like Current): BOOLEAN is
	 -- Do both collections have the same `lower', `upper', and 
	 -- items?
	 -- Feature `is_equal' is used for comparison of items.
	 -- See also `is_equal'.
		deferred
		ensure then
	 Result implies (lower = other.lower and upper = other.upper)
		end

	all_default: BOOLEAN is
			-- Do all items have their type's default value?
		deferred
		end

	occurrences(element: like item): INTEGER is
			-- Number of occurrences of `element' using `equal' for comparison.
			-- Also consider `fast_occurrences' to choose the most appropriate.
		deferred
		ensure
			Result >= 0
		end
		
	fast_occurrences(element: like item): INTEGER is
		deferred
		ensure
			Result >= 0
		end
		
feature -- Other features:

	get_new_iterator: ITERATOR_ON_COLLECTION[E] is
		do
			!!Result.make(Current)
		end

	replace_all(old_value, new_value: like item) is
		do
			if the_object.equals(old_value) then
				the_object := new_value
			end
		end
	
	fast_replace_all(old_value, new_value: like item) is
		do
			if the_object = old_value then
				the_object := new_value
			end
		end

	move(lower_index, upper_index, distance: INTEGER) is
		do
		end -- move

	slice(min, max: INTEGER): like Current is
		require
			valid_min: min = 1
			valid_max: max = 1
		do
			!!Result.make
			Result.add_last(the_object)
		end -- slice

feature
	the_object: E

end -- class SINGLE_COLLECTION
