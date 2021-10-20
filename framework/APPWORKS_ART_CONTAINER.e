indexing
	contents:    "AppWorks Window Container Class (abstract)"
	description: "A container window is one that has children"
	purpose:     "provide access to children feature"
	library:     "AppWorks-Art"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"
	notes:       "refactor to talk to window server, like windows does"
	notes:       "should this apply to us too?"

class APPWORKS_ART_CONTAINER

inherit
	APPWORKS_ART_WINDOW
		redefine loaded, xyy, on_size,
			get_native_handle
		end

creation
	make

feature

	get_native_handle: POINTER is
			-- if we dont have a native handle for native children
			-- to add to, cheat and return the one we might use
			-- TODO: this behavior is prolly wrong on some level
		do 
			Result := Precursor
			if Result = default_pointer then
				Result := get_parent.get_native_handle
			end
		end -- get_native_handle

feature {APPWORKS_ART_WINDOW}

	xyy is
			-- a simple hook for make_children
		do
			make_children
		end -- setup_mvc

feature

	make_children is
			-- redefine this in a subclass to add children 
			-- windows at just the right time
		do
			!!my_children.make
		ensure
			valid_children: my_children /= Void
		end -- make_children

	add_children is
			-- add children created in make_children
		do
			do_nothing
		end -- add_children

feature

	--add, --??
	insert_child (child: APPWORKS_ART_WINDOW; dbi_root: STRING; readdbi: BOOLEAN) is
			-- this function is equivalent to create_, but the name makes
			-- a little more sense. i might actually change this to `add'
			-- and the other `add' to `int_add'
		require
			get_prop_dbiroot /= void
		do			
			child.create_ (Current, dbi_root, readdbi)
		end -- insert_child

	loaded is
		do
			Precursor
			add_children
		end -- loaded

feature

	--add, 
	add_child (child_name: STRING; child: APPWORKS_ART_WINDOW) is
			-- please note that this function is ususally called from
			-- do_create, and native window creation usually occurs
			-- in post_create
		require
			valid_child_name:    child_name /= Void
			valid_child:         child /= Void
			valid_for_insertion: child_at(child_name) = Void
		do
--			io.put_string("inserting " + child_name + "%N")
			get_children.insert (child_name, child)
		ensure
--			my_children.has (child_name)
			child_inserted: child_at(child_name) = child
		end -- add

	child_at (child_name: STRING): APPWORKS_ART_WINDOW is
		do
			if not get_children.is_empty then
				if get_children.find (child_name) then
					Result := get_children.item
				end
			end
		ensure
			definition: Result /= Void implies get_children.find (child_name)
		end -- child_at

feature

	on_size (h, w : INTEGER) is
		local
			child : APPWORKS_ART_CONTAINER			
			iter  : ITERATOR_ON_RED_BLACK_TREE[STRING, APPWORKS_ART_WINDOW]
		do
			print ("-->> enter CONTAINER#on_size%N")
			if get_children /= Void and then not get_children.is_empty then
				from
					!!iter.make (get_children)
					iter.start
				until
					iter.is_off
				loop
					--get_children.find(iter.item)
					child ?= iter.item
					--
					p5b("resizing child", iter.item.get_prop("name"), 
					    "target-id =>",   iter.item.get_prop("target-id"), "")
					--
					if child /= Void then
						child.parent_resize (h, w)
					end
					iter.next
				end
			end
			Precursor(h,w)
			print ("<<--  exit CONTAINER#on_size%N")
		end -- on_size

	parent_resize (x, y: INTEGER) is
		do
		end -- parent_resize

feature -- Accessors

	get_children: like my_children is
		do
			Result := my_children
		ensure
			valid_result: Result /= Void
			--definition: Result = my_children
		end -- get_children

feature {NONE}

feature {APPWORKS_ART_CONTAINER}

	my_children: RED_BLACK_TREE [STRING, APPWORKS_ART_WINDOW]

invariant

	--valid_owner:  my_owner /= Void
	--valid_handle: valid_handle
	
end -- class APPWORKS_ART_CONTAINER
