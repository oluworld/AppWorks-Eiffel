-- Copyright (c) 1998,1999 Michael B. Durian.  All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-- OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  
-- IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- SUCH DAMAGE.

-- STRINGS may now be used as keys (corrections by Jacques Bouchard)

class
	--
	-- A red/black tree
	-- with keys of type K and items of type E
	--
	RED_BLACK_TREE[K -> COMPARABLE, E]

creation
	make

feature -- Initialization
	make is
		-- create an empty tree
	do
		before := True
		after := True
	end

feature -- Access
	count: INTEGER
	first: E is
			-- first sorted item
		require
			not_empty: not empty
		do
			start
			Result := item
		end

	last: E is
			-- last sorted item
		require
			not_empty: not empty
		do
			finish
			Result := item
		end

	start is
			-- position to first sorted item
		require
			have_first: not empty
		do
				check first_link /= Void end
				-- if not empty, must have first_link
			mem_link := first_link
			before := False
			after := False
		ensure
			moved_index: mem_link = first_link
		end

	finish is
			-- position to last sorted item
		require
			have_last: not empty
		do
				check last_link /= Void end
				-- if not empty, must have last_link
			mem_link := last_link
			before := False
			after := False
		ensure
			moved_index: mem_link = last_link
		end


	isfirst: BOOLEAN is
			-- index at first sorted element?
		do
			Result := mem_link = first_link
		ensure
			first: Result = (mem_link = first_link)
		end

	islast: BOOLEAN is
			-- index at last sorted element?
		do
			Result := mem_link = last_link
		ensure
			last: Result = (mem_link = last_link)
		end

	before: BOOLEAN
	after: BOOLEAN

	empty: BOOLEAN is
			-- tree empty?
		do
			Result := root = Void
		ensure
			Result = (root = Void)
		end

	item: E is
			-- current element
		require
			not_before: not before
			not_after: not after
		do
			Result := mem_link.item
		end

	forth is
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

	back is
			-- previous sorted item
		require
			not_before: not before
			not_empty: not empty
		do
			if isfirst then
				before := True
			elseif after then
				mem_link := last_link
				after := False
			else
				mem_link := mem_link.previous
			end
		ensure
			not_after: not after
		end

	key: K is
			-- current key
		require
			not_empty: not empty
		do
			Result := mem_link.key
		ensure
			right_key: Result = mem_link.key
		end

	find(k: K): BOOLEAN is
			-- set cursor to node for item or come close
		require
			null_key: k /= Void
			not_empty: not empty
		local
			n: like root
			at_leaf: BOOLEAN
		do
			-- Check to see if we're already there
			at_leaf := False
			if not k.is_equal(mem_link.key) then
				from
					n := root
				until
					k.is_equal(n.key) or at_leaf
				loop
					if k < n.key then
						if n.left = Void then
							at_leaf := True
						else
							n := n.left
						end
					else
						if n.right = Void then
							at_leaf := True
						else
							n := n.right
						end
					end
				end
				mem_link := n
			end
			before := False
			after := False
                        Result := not at_leaf
		end

feature -- Element change
	insert(k: K; i: E) is
			-- add new item
		local
			leaf: like root
			nn: like root
		do
			if root = Void then
				-- Empty tree
				!!nn.make(k, i, Void, Void, Void, True)
				root := nn
				count := 1
			else
				if find(k) then
					mem_link.set_item(i)
					nn := mem_link
				else
					leaf := mem_link
					if k < leaf.key then
							check leaf.left = Void end
							-- must not have a left child
						!!nn.make(k, i, Void, Void, leaf, True)
						nn.set_previous(leaf.previous)
						if leaf.previous /= Void then
							leaf.previous.set_next(nn)
						end
						nn.set_next(leaf)
						leaf.set_previous(nn)
					else
							check leaf.right = Void end
							-- must not have a right child
						!!nn.make(k, i, Void, Void, leaf, False)
						nn.set_next(leaf.next)
						if leaf.next /= Void then
							leaf.next.set_previous(nn)
						end
						nn.set_previous(leaf)
						leaf.set_next(nn)
					end
					rebalance_insert(nn)
					count := count + 1
				end
			end
			mem_link := nn
			before := False
			after := False
			if nn.previous = Void then
				first_link := nn
			end
			if nn.next = Void then
				last_link := nn
			end
		end

feature -- Removal
	remove is
			-- remove current item
		require
			something_to_remove: not empty
			not_before_or_after: not (before or after)
		local
			n, x, x_par, y: like root
			y_red: BOOLEAN
			new_link: like mem_link
		do
			n := mem_link
			count := count - 1
			if n.left = Void or else n.right = Void then
				-- delete node with less than two children
				y := n
			else
				-- delete successor
					check n.next /= Void end
					-- becuase we have both children something on
					-- the right must be next
				y := n.next
			end

			if y.left /= Void then
				x := y.left
			else
				x := y.right
			end

			x_par := y.parent
			y_red := y.is_red

			-- remove y, in case y = n.next, make
			-- y's contents the new cont. of n
			if y /= n then
				n.set_key(y.key)
				n.set_item(y.item)
			end

			if y.is_root then
				root := x
				if x /= Void then
					x.set_parent(Void)
				end
			elseif y.is_left then
				y.parent.set_left(x)
			else
				y.parent.set_right(x)
			end

			-- fix prev and next pointers
			if y.previous = Void then
				first_link := y.next
			else
				y.previous.set_next(y.next)
			end
			if y.next = Void then
				after := True
				last_link := y.previous
			else
				y.next.set_previous(y.previous)
			end

			if mem_link = y then
				-- move link
				if y.next /= Void then
					mem_link := y.next
				else
					mem_link := last_link
				end
			end

			if not y_red and then x /= Void then
				rebalance_delete(x, x_par)
			end

			if empty then
				mem_link := Void
				before := True
				after := True
			end
		end


feature {NONE} -- Implementation
	root: RED_BLACK[K, E]
	mem_link: like root
	first_link: like root
	last_link: like root

	rebalance_insert(node: like root) is
			-- rebalance tree after insertion
		require
			non_null: node /= Void
			is_leaf: node.is_leaf
		local
			n: like node
			t: like node
		do
			n := node
			n.set_red

			from
			until
				n.is_root or else n.parent.is_black
			loop
					check n.parent.parent /= Void end
					-- I think this is true due to the n.parent.is_black
					-- check in the until clause (a red node will
					-- always have a parent.
				if n.parent.is_left then
					t := n.parent.parent.right
					if t = Void or else t.is_black then
						if n.is_right then
							n := n.parent
							rotate_left(n)
						end
						n.parent.set_black
						n.parent.parent.set_red
						rotate_right(n.parent.parent)
					else
						n.parent.set_black
						t.set_black
						n.parent.parent.set_red
						n := n.parent.parent
					end
				else
					t := n.parent.parent.left
					if t = Void or else t.is_black then
						if n.is_left then
							n := n.parent
							rotate_right(n)
						end
						n.parent.set_black
						n.parent.parent.set_red
						rotate_left(n.parent.parent)
					else
						n.parent.set_black
						t.set_black
						n.parent.parent.set_red
						n := n.parent.parent
					end
				end
			end
			root := find_root(root)
			root.set_black
		end

	rebalance_delete(n, n_par: like root) is
			-- rebalance tree after deletion
		local
			w, x, x_par: like root
			done, up, r_right, r_left: BOOLEAN
		do
			x := n
			x_par := n_par

			from
				done := False
			until
				done or x_par = Void or (x /= Void and then x.is_red)
			loop
				if x = x_par.left then
					w := x_par.right
						check w /= Void end
						-- since x is blk w is not void
					if w.is_red then
						w.set_black
						x_par.set_red
						rotate_left(x_par)
						w := x_par.right
					end
					up := False
					if w.left = Void or else
						w.left.is_black then
						up := w.right = void or else w.right.is_black
					end
					if up then
						w.set_red
						x := x_par
						x_par := x.parent
					else
						r_right := w.right = Void or else w.right.is_black
						if r_right then
							if w.right /= Void then
								w.right.set_black
							end
							w.set_red
							rotate_right(w)
							w := x_par.right
						end
						if x_par.is_red then
							w.set_red
						else
							w.set_black
						end
						x_par.set_black
						w.right.set_black
						rotate_left(x_par)
						done := True
					end
				else
					w := x_par.left
						check w /= Void end
						-- since x is blk w is not void
					if w.is_red then
						w.set_black
						x_par.set_red
						rotate_right(x_par)
						w := x_par.left
					end
					up := False
					if w.left = Void or else
						w.left.is_black then
						up := w.right = Void or else w.right.is_black
					end
					if up then
						w.set_red
						x := x_par
						x_par := x.parent
					else
						r_left := w.left = Void or else w.left.is_black
						if r_left then
							if w.left /= Void then
								w.left.set_black
							end
							w.set_red
							rotate_left(w)
							w := x_par.left
						end
						if x_par.is_red then
							w.set_red
						else
							w.set_black
						end
						x_par.set_black
						w.left.set_black
						rotate_right(x_par)
						done := True
					end
				end
			end

			if x /= Void then
				x.set_black
			end

			root := find_root(root)
		end

	rotate_left(node: like root) is
			-- red/black rotate left
		require
			node /= Void
			node.right /= Void
		local
			t: like node
		do
			t := node.right
			node.set_right(t.left)

			if node.parent = Void then
				t.set_parent(Void)
				root := t
			elseif node.is_right then
				node.parent.set_right(t)
			else
				node.parent.set_left(t)
			end
			t.set_left(node)
		ensure
			node_is_left: node.is_left
			child_moved: old node.right.left = node.right
		end

	rotate_right(node: like root) is
			-- red/black rotate right
		require
			node /= Void
			node.left /= Void
		local
			t: like node
		do
			t := node.left
			node.set_left(t.right)
			if node.parent = Void then
				t.set_parent(Void)
				root := t
			elseif node.is_right then
				node.parent.set_right(t)
			else
				node.parent.set_left(t)
			end
			t.set_right(node)
		ensure
			node_is_right: node.is_right
			child_moved: old node.left.right = node.left
		end

	find_root(node: like root) : like root is
			-- locate root node
		require
			node /= Void
		do
			from
				Result := node
			until
				Result.is_root
			loop
				Result := Result.parent
			end
		ensure
			found_root: Result.is_root
			is_root: root = Result
		end

	print_subtree(node: like root; level: INTEGER) is
			-- print a subtree
		local
			i: INTEGER
		do
			if node /= Void then
				from
					i := 1
				until
					i > level
				loop
					io.put_character(' ')
					i := i + 1
				end
				node.print_node
				io.put_character('%N')
				print_subtree(node.left, level + 2)
				print_subtree(node.right, level + 2)
			end
		end

feature -- Print
	print_tree is
			-- print complete tree
		do
			if root = Void then
				io.put_string("<empty>%N")
			else
				print_subtree(root, 0)
			end
		end

invariant
	have_cursor: not empty implies mem_link /= Void
	nowhere_when_empty: empty implies (before and after)
	no_count_when_empty: empty implies count = 0
	somewhere_when_not_empty: not empty implies not (before and after)
	mem_link_next_valid: not empty implies (mem_link.next /= Void implies
		mem_link.next.previous = mem_link)
	mem_link_prev_valid: not empty implies (mem_link.previous /= Void
		implies mem_link.previous.next = mem_link)
	first_valid: not empty implies first_link /= Void
	last_valid: not empty implies last_link /= Void

end -- RED_BLACK_TREE[K -> COMPARABLE, E]
