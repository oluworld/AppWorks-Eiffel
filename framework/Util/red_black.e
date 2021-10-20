class RED_BLACK[K -> COMPARABLE, E]
	--
	-- The elements in a red/black tree
	--
	-- Used to implement RED_BLACK_TREE[K -> COMPARABLE, E]
	--

creation
	make

feature {RED_BLACK, RED_BLACK_TREE} -- Initialization
	make(k: like key; i: like item; l: like left; r: like right;
		p: like parent; il: BOOLEAN) is
			-- create a new red/black tree node
		do
			key := k
			item := i
			if p /= Void then
				if il then
					p.set_left(Current)
				else
					p.set_right(Current)
				end
			end
			set_left(l)
			set_right(r)
		ensure
			key_set: key = k
			item_set: item = i
			left_of_parent: p /= Void implies (il implies p.left = Current)
			is_left: p /= Void implies (il implies is_left)
			right_of_parent: p /= Void implies
				(not il implies p.right = Current)
			is_right: p /= Void implies (not il implies is_right)
			left_set: left = l
			right_set: right = r
			left_is_child: left /= Void implies left.parent = Current
			left_is_left: left /= Void implies left.is_left
			right_is_child: right /= Void implies right.parent = Current
			right_is_right: right /= Void implies right.is_right
		end

feature {RED_BLACK, RED_BLACK_TREE, ITERATOR_ON_RED_BLACK_TREE} -- Access
	key: K
	item: E
	next: like Current
	previous: like Current
feature {RED_BLACK, RED_BLACK_TREE} -- Access
	parent: like Current
	left: like Current
	right: like Current

	sibling: like Current is
			-- Parent's other child
		require
			parent /= Void
		do
			if is_left then
				Result := parent.right
			else
				Result := parent.left
			end
		ensure
			return_right: is_left implies (Result = parent.right)
			return_left: not is_left implies (Result = parent.left)
		end

	is_left: BOOLEAN is
			-- left node of parent?
		do
			if parent /= Void then
				Result := parent.left = Current
			end
		ensure
			is_left: parent /= Void implies Result =
				(parent.left = Current)
		end

	is_right: BOOLEAN is
			-- right node of parent?
		do
			if parent /= Void then
				Result := parent.right = Current
			end
		ensure
			is_right: parent /= Void implies Result = (parent.right = Current)
		end

	is_root: BOOLEAN is
			-- no parent?
		do
			Result := parent = Void
		ensure
			no_parent: Result = (parent = Void)
		end

	is_leaf: BOOLEAN is
			-- no children?
		do
			Result := (left = Void and right = Void)
		ensure
			Result = (left = Void and right = Void)
		end

feature {RED_BLACK, RED_BLACK_TREE} -- Status report
	is_red: BOOLEAN
	is_black: BOOLEAN is
			-- node not red?
		do
			Result := not is_red
		ensure
			not_red: Result = not is_red
		end


feature {RED_BLACK, RED_BLACK_TREE} -- Status setting
	set_red is
			-- make red
		do
			is_red := True
		ensure
			red_set: is_red = True
		end

	set_black is
			-- make black
		do
			is_red := False
		ensure
			black_set: is_red = False
		end

feature {RED_BLACK, RED_BLACK_TREE} -- Element change
	set_item(i: like item) is
			-- change item
		do
			item := i
		ensure
			item = i
		end

	set_key(k: like key) is
			-- change key
		do
			key := k
		ensure
			key = k
		end

	set_left(l: like left) is
			-- add left child
		do
			left := l
			if left /= Void then
				left.set_parent(Current)
			end
		ensure
			left_set: left = l
			left_is_left: left /= Void implies left.is_left
			left_is_child: left /= Void implies left.parent = Current
		end

	set_right(r: like right) is
			-- add right child
		do
			right := r
			if right /= Void then
				right.set_parent(Current)
			end
		ensure
			right_set: right = r
			right_is_right: right /= Void implies right.is_right
			right_is_child: right /= Void implies right.parent = Current
		end

	set_parent(p: like parent) is
			-- add parent
		do
			parent := p
		ensure
			parent = p
		end

	set_next(n: like next) is
			-- set next list element
		do
			next := n
		ensure
			next = n
		end

	set_previous(p: like previous) is
			-- set previous list element
		do
			previous := p
		ensure
			previous = p
		end

feature {RED_BLACK, RED_BLACK_TREE} -- Print
	print_node is
			-- print node to io
		do
			io.put_string("key: ")
			print(key)
			io.put_string(" item: ")
			print(item)
			if is_left then
				io.put_string(" is_left")
			end
			if is_right then
				io.put_string(" is_right")
			end
			if is_red then
				io.put_string(" is_red")
			else
				io.put_string(" is_black")
			end
			if is_leaf then
				io.put_string(" is_leaf")
			else
				io.put_string(" left: ")
				if left = Void then
					io.put_string("void")
				else
					print(left.key)
				end
				io.put_string(" right: ")
				if right = Void then
					io.put_string("void")
				else
					print(right.key)
				end
			end
			io.put_string(" previous: ")
			if previous = Void then
				io.put_string("void")
			else
				print(previous.key)
			end
			io.put_string(" next: ")
			if next = Void then
				io.put_string("void")
			else
				print(next.key)
			end
		end

invariant
	recursion: parent /= Current
	left_and_right: not (is_left and is_right)

end -- RED_BLACK[K -> COMPARABLE, E]
