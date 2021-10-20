class ITERATOR_ON_RED_BLACK_TREE[K, E]

inherit 
	ITERATOR[K]

creation
	make

feature

	make(c: RED_BLACK_TREE[K, E]) is
		require
			c /= Void
		do
			root       := c.root
			first_link := c.first_link
			last_link  := c.last_link
		ensure
			root        = c.root
			first_link  = c.first_link
			last_link   = c.last_link
		end

	start is
			-- position to first sorted item
		require
			have_first: not empty
		do
			check  -- if not empty, must have first_link 
				first_link /= Void 
			end
			mem_link := first_link
			before   := False
			after    := False
		ensure
			moved_index: mem_link = first_link
		end

	is_off: BOOLEAN is
		do
			Result := after
		end

	item: E is
			-- current element
		require
			not_before: not before
			not_after: not after
		do
			Result := mem_link.item
		end
		
	key: K is
			-- current element
		require
			not_before: not before
			not_after: not after
		do
			Result := mem_link.key
		end
		
	islast: BOOLEAN is
			-- index at last sorted element?
		do
			Result := mem_link = last_link
		ensure
			last: Result = (mem_link = last_link)
		end

	empty: BOOLEAN is
			-- tree empty?
		do
			Result := root = Void
		ensure
			Result = (root = Void)
		end

	next is
			-- next sorted item
		require
			not_after: not after
			not_empty: not empty
		do
			if islast then
				after := True
			elseif before then
				mem_link := first_link
				before := False
			else
				mem_link := mem_link.next
			end
		ensure
			not_before: not before
		end

feature

	before     : BOOLEAN
	after      : BOOLEAN

feature {NONE}

	root       : RED_BLACK[K, E]
	mem_link   : like root
	first_link : like root
	last_link  : like root

end
