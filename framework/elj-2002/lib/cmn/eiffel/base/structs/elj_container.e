indexing

    description:

        "generic streamable list of streamable objects"

    library:    "ELJ CCL/library/base"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"

deferred class ELJ_CONTAINER[T->ELJ_CONTAINER_ITEM]

feature {NONE}
-- creation
	make (a_owner: like owner) is
		do
			owner := a_owner
			!!items.make
		end -- make

feature
-- item access
	item (a_index: INTEGER): like new_item is
		-- returns item at index a_index
		do
			Result := items.item (a_index)
		end -- item
	
	add is
		-- adds a new item to the list
		do
			items.add_last (new_item)
		ensure
			added: count = old count + 1
		end -- add
	
	remove (a_index: INTEGER) is
		-- removes item at index a_index
		do
			item (a_index).delete
		ensure
			removed: count = old count - 1
		end -- remove
	
	last_added: like new_item is
		-- last item added with 'add'
		require
			not_empty: count > 0
		do
			Result := items.item (items.upper)
		ensure
			result_not_void: Result /= Void
		end -- last_added
	
	count: INTEGER is
		-- number of items in list
		do
			Result := items.count
		end -- count
	
	index_of (a_item: like new_item): INTEGER is
		-- 1-based index of a_item in Current
		require
			has_item: has (a_item)
		do
			Result := items.fast_index_of (a_item)
		ensure
			valid_result: Result > 0
		end -- index_of
	
	has (a_item: like new_item): BOOLEAN is
		-- is a_item a member of our list?
		do
			Result := items.fast_has (a_item)
		end -- has
	
	lower: INTEGER is
		do
			Result := items.lower
		end -- lower
		
	upper: INTEGER is
		do
			Result := items.upper
		end -- upper
		
	clear is
		do
			from
			until count = 0
			loop
				item (lower).delete
			end -- loop
		ensure
			no_items: count = 0
		end -- clear

feature 
-- container control

	update_count: INTEGER

	begin_update is
		-- setting update mode for container
		do
			update_count := update_count + 1
		end -- begin_update

	is_in_update : BOOLEAN is
		-- container in update mode?
		do
			Result := update_count > 0
		end -- is_in_update
		
	end_update is
		-- if container in update mode updating all container-items
		require
			in_update : update_count > 0
		local
			i : INTEGER
		do
			update_count := update_count - 1
			
			if update_count = 0 then
				from	i := items.lower
				until	i > items.upper
				loop
					items.item (i).update
					i := i + 1
				end -- loop
			end -- if
		end -- end_update

feature {ELJ_CONTAINER}

	owner: ANY

	new_item: T is
		deferred
		ensure
			result_created:	Result /= Void
			not_added:		items.count = old items.count
			adjusted:		Result.carrier = Current
		end -- new_item

feature {ELJ_CONTAINER_ITEM}

	internal_remove (a_index: INTEGER) is
		-- removes item at index a_index
		do
			items.remove (a_index)
		ensure
			removed: count = old count - 1
		end -- remove
	
feature {NONE}

	items: LINKED_LIST[like new_item]
	
end -- deferred class ELJ_CONTAINER[T->ELJ_CONTAINER_ITEM]
