indexing
	contents: "array holding structures and their"
	          "'expanded' external represantation"
	author: "Uwe Sander, usander@online.de"
	completed: no	-- maybe this container could guarantee that
					-- all items are assigned on itself ?
	tested: yes
	
class C_STRUCT_ARRAY[T->C_STRUCTURE]

inherit
	ELJ_COMMON_TOOLS

creation
	make
	
feature

	make (a_count: INTEGER) is
		require
			meaningful_size: a_count > 0
		do
			if not the_item.is_expanded_type then
				!!the_item
			end -- if
			
			count := a_count
			
			c_array := c_array.calloc (the_item.external_size * a_count)
			
			pointer := c_array.to_pointer
		end -- make
	
feature

	resize (a_count: INTEGER) is
		do
		end
		
feature

	count: INTEGER

	item (a_index: INTEGER): T is
		require
			valid_index: count > -1 implies 0 <= a_index and a_index < count
		do
			Result := the_item

			the_item.from_external (increase_pointer (pointer, the_item.external_size * a_index), the_item.external_size)
		end -- item
	
	to_external: POINTER is
		do
			Result := pointer
		end -- to_external

feature {NONE}

	item_size:	INTEGER
	the_item:	like item
	pointer:	POINTER

feature {NONE}

	c_array: NATIVE_ARRAY[CHARACTER]

end -- class C_STRUCT_ARRAY[T->C_STRUCTURE]