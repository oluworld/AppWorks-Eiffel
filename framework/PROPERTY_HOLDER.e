indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class PROPERTY_HOLDER

inherit
	GG_UTILS
	
creation
	make
	
feature -- Property Management

	make is
		do
			!!prop_list.make
		end -- make
		
	unmarshall_prop (n, v: STRING) is
		do
			set_prop (n , v)
		end -- unmarshall_prop

	set_prop (n, v: STRING) is
			-- set any property, except target-id, which
			-- is set once and once only
		require
			valid_target: not (n.is_equal(target_id_name))
			void_name:   n /= Void
			void_value:  v /= Void
		do
			if n.is_equal(target_id_name) then
				-- TODO: fixme
				--do_something_funky
			else
				prop_list.insert (n, v)
			end
--			print (n+" = "+v+" %N")
--			print_props
		end -- set_prop
	
	set_int_prop (n: STRING; v: INTEGER) is
		do
			set_prop (n, v.to_string)
		end -- set_prop

	get_prop (a_prop_name: STRING): STRING is
		do
			Result := int_get_prop (a_prop_name)
		ensure
			--Result /= Void
			Result = Void implies not has(a_prop_name)
		end -- get_prop

	get_prop_or (a_prop_name, d: STRING): STRING is
		do
			Result := int_get_prop (a_prop_name)
			if Result = Void then
				Result := d
			end
		ensure 
			valid_default: Result /= Void
		end -- get_prop

	get_int_prop (a_prop_name: STRING): INTEGER is
		do
			Result := get_prop(a_prop_name).to_integer
		end -- get_int_prop

feature {APPWORKS_SERVICES_MESSAGE_SERVER_CLIENT}

	set_target_id (a_desired_id: STRING) is
		do
			prop_list.insert (target_id_name, a_desired_id)
		end -- set_target_id
		
feature

	has (a_prop_name: STRING): BOOLEAN is
		do
			Result := prop_list.find(target_id_name)			
		end -- has

	get_target_id: STRING is
		require
			has(target_id_name)
		do
			if prop_list.find(target_id_name) then
				Result := prop_list.item
			end
		end -- get_target_id

feature {NONE}

	int_get_prop (n: STRING): STRING is
		require 
			valid_prop_name: n /= Void
		do
--			prop_list.print_tree
--			io.put_string(n)
--			io.put_string(" = ")

			if --prop_list.empty or else 
				not prop_list.find (n) then
				Result := Void
			else				
				Result := prop_list.item
--				io.put_string(Result)
			end

--			io.put_new_line
		end -- get_prop

feature

	print_props is
		require
			has_props: prop_list.count > 0
		local 
			i: ITERATOR_ON_RED_BLACK_TREE [STRING, STRING]
		do
			print ("===========================%N")
			from
				!! i.make (prop_list)
				i.start
			until
				i.is_off
			loop
				print (i.key)
				print ("%T%T")
				print (i.item)
				print ("%N")
				i.next
			end
			i := Void
			print ("===========================%N")
		end -- print_props

feature {NONE} -- the magic starts here

	prop_list   : RED_BLACK_TREE [STRING, STRING]
	
feature

	target_id_name: STRING is "target-id" -- try with once!!

invariant

	invalid_prop_list: prop_list /= Void
--	base_prop_set:     get_prop("target-id") /= Void

end -- class PROPERTY_HOLDER
