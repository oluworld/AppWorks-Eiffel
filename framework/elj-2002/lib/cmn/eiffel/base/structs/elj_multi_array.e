indexing

    description:

        "[
          multi dimensional array
          - access is normalized to a one dimensional array storage
          - every dimension may have different lower and upper limits
		]"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"

class ELJ_MULTI_ARRAY[E]

inherit
	SAFE_EQUAL[E]
		redefine
			fill_tagged_out_memory
		end

creation
	make,
	make_empty,
	make_with_bounds

feature {NONE}

	make (a_dimensions: INTEGER) is
		-- creates empty multidimensional array
		-- dimensions adjusted
		-- upper and lower bounds per dimension set to zero
		require
			min_zero_dimension: a_dimensions >= 0
		do
			dimensions := a_dimensions
			create lowers.make (1, dimensions)
			create uppers.make (1, dimensions)
		end -- make

	make_empty is
		-- creates empty multidimensional array
		-- zero dimensions (a point ;-)
		do
			make (0)
		end -- make_empty
	
	make_with_bounds (a_dimensions: INTEGER; a_lowers, a_uppers: COLLECTION[INTEGER]) is
		-- creates multi dimensional array with given dimension count and lower and upper
		-- limits for every dimension
		require
			min_zero_dimension: a_dimensions >= 0
			non_void_lowers: a_lowers /= Void
			non_void_uppers: a_uppers /= Void
			equal_count: a_lowers.count = a_uppers.count
			limit_for_every_dimension: a_lowers.count = a_dimensions
		do
			make (a_dimensions)
			set_bounds (a_lowers, a_uppers)
		end -- make_with_bounds
		
feature {NONE}

	storage: NATIVE_ARRAY[E]
		-- items are stored here

	lowers: ARRAY[INTEGER]
		-- array of lower bounds

	uppers: ARRAY[INTEGER]
		-- array of upper bounds


feature {NONE}
-- internal helper routines
	calc_physical_index (a_index: COLLECTION[INTEGER]): INTEGER is
		-- returns index into 'storage'
		require
			non_void_index: a_index /= Void
			index_for_every_dimension: a_index.count = dimensions
			in_bounds: valid_index (a_index)
		local
			id1: INTEGER
			id2: INTEGER
			dif: INTEGER
			mul: INTEGER
		do
			from
				dif := a_index.lower - dimension_lower
				id1 := dimension_lower
			until
				id1 > dimension_upper
			loop
				from
					id2 := id1 + 1
					mul := a_index.item (id1 + dif) - lowers.item (id1)
				until
					id2 > dimension_upper
				loop
					mul := mul * dimension_count (id2)
					id2 := id2 + 1
				end -- loop
				
				Result := Result + mul
				id1 := id1 + 1
			end -- loop
		ensure
			within_storage: Result >= 0 and then Result < count
		end -- calc_physical_index

feature
-- status
	count: INTEGER
	 	-- how many elements fit in?

	dimensions: INTEGER
		-- how many dimensions?

	dimension_count (a_dimension: INTEGER): INTEGER is
		-- how many items in the given dimension?
		require
			dimension_in_range: a_dimension >= dimension_lower and then a_dimension <= dimension_upper
		do
			Result := uppers.item (a_dimension) - lowers.item (a_dimension) + 1
		end -- dimension_count
	
	dimension_lower: INTEGER is
		-- lower bound of dimensions
		do
			Result := 1
		end -- dimension_lower
		
	dimension_upper: INTEGER is
		-- upper bound of dimensions
		do
			Result := dimensions
		end -- dimension_upper
	
	is_empty: BOOLEAN is
		-- no elements within?
		do
			Result := count = 0
		end -- is_empty
		
	lower_at (a_dimension: INTEGER): INTEGER is
		-- lower imit of given dimension
		require
			dimension_in_range: a_dimension >= dimension_lower and then a_dimension <= dimension_upper
		do
			Result := lowers.item (a_dimension)
		end -- lower_at
	
	lower_not_larger (a_lowers, a_uppers: COLLECTION[INTEGER]): BOOLEAN is
		-- is every item in 'a_lower' really smaller or equal than the one
		-- with the same index in 'a_upper'?
		require
			non_void_lowers: a_lowers /= Void
			non_void_uppers: a_uppers /= Void
			equal_count: a_lowers.count = a_uppers.count
			limit_for_every_dimension: a_lowers.count = dimensions
		local
			idx: INTEGER
		do
			from
				idx := a_lowers.lower
				Result := True
			until
				idx > a_lowers.upper or else not Result
			loop
				Result := a_uppers.item (idx) >= a_lowers.item (idx)
				idx := idx + 1
			end -- loop
		end -- lower_always_smaller

	upper_at (a_dimension: INTEGER): INTEGER is
		-- upper imit of given dimension
		require
			dimension_in_range: a_dimension >= dimension_lower and then a_dimension <= dimension_upper
		do
			Result := uppers.item (a_dimension)
		end -- upper_at
	
	valid_index (a_index: COLLECTION[INTEGER]): BOOLEAN is
		-- is every item in 'a_index' within the ranges given by 'lowers' and 'uppers'?
		require
			non_void_index: a_index /= Void
			index_for_every_dimension: a_index.count = dimensions
		local
			idx: INTEGER
			itm: INTEGER
		do
			from
				idx := lowers.lower
				Result := True
			until
				idx > lowers.upper or else not Result
			loop
				itm := a_index.item (a_index.lower - lowers.lower + idx)
				Result := itm >= lowers.item (idx) and then itm <= uppers.item (idx)
				idx := idx + 1
			end -- loop
		end -- valid_index
	
feature
-- access
	item, infix "@" (a_index: COLLECTION[INTEGER]): E is
		-- item at given index
		require
			non_void_index: a_index /= Void
			index_for_every_dimension: a_index.count = dimensions
			in_bounds: valid_index (a_index)
		do
			Result := storage.item (calc_physical_index (a_index))
		end -- item

feature
-- commands
	clear is
		-- sets all items to their default values, but does
		-- not touch count or bounds
		do
			if count > 0 then
				storage.clear (0, count - 1)
			end -- if
		end -- clear

feature
-- setters
	set_bounds (a_lowers, a_uppers: COLLECTION[INTEGER]) is
		-- adjust the bounds for every dimension
		-- clears content
		require
			non_void_lowers: a_lowers /= Void
			non_void_uppers: a_uppers /= Void
			equal_count: a_lowers.count = a_uppers.count
			limit_for_every_dimension: a_lowers.count = dimensions
			lower_item_not_larger_than_upper: lower_not_larger (a_lowers, a_uppers)
		local
			idx: INTEGER
			cnt: INTEGER
		do
			from
				idx := a_lowers.lower
				cnt := 1
			until
				idx > a_lowers.upper
			loop
				cnt := cnt * (a_uppers.item (a_uppers.lower - a_lowers.lower + idx) - a_lowers.item (idx) + 1)
				idx := idx + 1
			end -- loop
			
			lowers.from_collection (a_lowers)
			uppers.from_collection (a_uppers)
			
			if count = 0 then
				storage := storage.calloc (cnt)
			else
				storage := storage.realloc (count, cnt)
				storage.clear (0, cnt - 1)
			end -- if

			count := cnt
		end -- set_bounds

	put (a_item: like item; a_index: COLLECTION[INTEGER]) is
		-- sets item at 'a_index'
		require
			non_void_index: a_index /= Void
			index_for_every_dimension: a_index.count = dimensions
			in_bounds: valid_index (a_index)
		do
			storage.put (a_item, calc_physical_index (a_index))
		ensure
			item_set: equal (item (a_index), a_item)
		end -- put

	set_dimensions (a_dimensions: INTEGER) is
		-- set count of dimensions new, all bounds and content lost
		require
			min_zero_dimension: a_dimensions >= 0
		do
			dimensions := a_dimensions
			lowers.resize (1, dimensions)
			uppers.resize (1, dimensions)
			count := 0
			storage := storage.from_pointer (default_pointer)
		ensure
			dimensions_set: dimensions = a_dimensions
		end -- set_dimensions

feature

	fill_tagged_out_memory is
		-- non recursive, storage may become very large
		local
			dim: INTEGER
			idx: INTEGER
			arr: ARRAY[INTEGER]
			buf: STRING
			fns: BOOLEAN
		do
			create arr.make (1, dimensions)
			tagged_out_memory.extend('%N')
			-- tagged_out_memory is a 'once', we clone it before using it for
			-- the single elements
			buf := tagged_out_memory.twin
			
			-- initialize index array with lower bounds
			from
				dim := 1
			until
				dim > dimensions
			loop
				arr.put (lowers.item (dim), dim)
				dim := dim + 1
			end -- loop
			
			
			from
				-- do nothing if empty
				fns := count = 0
				-- start the walk through at the highest dimension
				dim := dimensions
			until
				fns -- finished?
			loop
				print_item_to_buffer (arr, buf)

				from
					fns := True
					idx := dim
				until
					idx = 0 or else not fns
				loop
					if arr.item (idx) < upper_at (idx) then
						arr.put (arr.item (idx) + 1, idx)

						if idx < dim then
							-- we found another (lower) dimension to walk through, reset all
							-- previous visited to their lower bounds
							from
								dim := idx + 1
							until
								dim > dimensions
							loop
								arr.put (lower_at (dim), dim)
								dim := dim + 1
							end -- loop
							
							-- (re)start the walk through at the highest dimension
							dim := dimensions
						end --if
						
						fns := False
					else
						idx := idx - 1
					end -- if
				end -- loop
			end -- loop
			
			tagged_out_memory.clear
			tagged_out_memory.append (buf)
		end -- fill_tagged_out_memory

feature {NONE}

	print_item_to_buffer (a_index: ARRAY[INTEGER]; a_buf: STRING) is
		local
			prn: INTEGER
		do
			from
				prn := 1
				if a_index.upper > 1 then
					a_buf.extend('%T')
					a_buf.append ("<<")
					a_buf.append (a_index.item (prn).to_string)
				end -- if
				prn := 2
			until
				prn > a_index.upper
			loop
				a_buf.extend(',')
				a_buf.append (a_index.item (prn).to_string)
				prn := prn + 1
			end -- loop
		
			a_buf.append (">>: ")
			a_buf.append (item (a_index).out)
			a_buf.extend('%N')
		end -- print_dimension_to_buffer

invariant
	lower_for_every_dimension: lowers.count = dimensions
	upper_for_every_dimension: uppers.count = dimensions
	same_bounds: lowers.lower = uppers.lower and then lowers.upper = uppers.upper

end -- class ELJ_MULTI_ARRAY
