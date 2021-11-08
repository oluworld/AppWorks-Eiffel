indexing
	description: "convience class that holds one child"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

deferred class APPWORKS_ART_BLANK_FRAME

inherit
	APPWORKS_ART_FRAME
		rename
			do_create  as create_frame
			create_    as unused_create_frame
		--export
		--~ undefine
			--~ unused_create_frame
		redefine 
--			add,
			handle,
			set_initial_properties,
			end_select
--			my_children,
		--select
		end

creation 
	make

feature

	set_initial_properties is
		do
			Precursor
			set_prop("name", "BlankFrame")
		end -- set_initial_properties
	
feature

	-- LOOK!! i ignore inheritance!!
	create_ (owner: APPWORKS_BASE_APP) is
		do
			pre_create
--			my_owner := owner
--			create_frame (get_desktop, "~/Interface", TRUE)
--			set_parent (get_desktop)
			my_parent := get_default_desktop--get_desktop_window
			create_frame (owner, "~/Interface/DefaultFrame", True)
			post_create
		end -- create_

feature

	end_select is
			-- set the title to the same as the one of primary_window
		local
			primary: APPWORKS_ART_WINDOW
		do
			Precursor
			primary := get_primary_window
			if primary /= Void then
				set_title (primary.get_title) --get_prop("title"))
			end
		end -- end_select

feature

	handle (evt: EVENT): EVENT is
			--
			-- Delegate all messages to primary window
			-- with exception of:
			--   * expose resize
			--   * notify requestdestroy
			-- 
		local
			primary: APPWORKS_ART_WINDOW
		do
--			print ("** enter BLANK_FRAME::handle%N")
			if evt.get_main_msg.is_equal("expose resize") then
				primary := get_primary_window 
				if primary /= Void then
--					print ("==============================%N")
--					print ("on_size in BLANK_FRAME%N")
--					print ("w = ")
--					print (evt.sp_width)
--					print ("%T h = ")
--					print (evt.sp_height)
--					print ("%N==============================%N")
--					primary.print_props
					primary.set_size (evt.sp_height - primary.get_int_prop("y-coord"),
									  evt.sp_width  - primary.get_int_prop("x-coord"))
				end
				Result := good_event
			elseif evt.get_main_msg.is_equal("notify requestdestroy") then
				on_destroy
			else
				primary := get_primary_window 
				if primary /= Void then
					Result := primary.handle (evt)
				else
					Result := Precursor (evt)
				end
			end
--			print ("EXIT  blank_frame::handle%N")
		end -- handle

	get_primary_window: APPWORKS_ART_WINDOW is
		do
			if my_children /= Void and then not my_children.is_empty then
				Result := my_children.first
			end
		end -- get_primary_window

feature
	my_children: COLLECTION[APPWORKS_ART_WINDOW]
	
invariant

--	valid_children_structure: my_children /= Void
	
end -- class APPWORKS_ART_BLANK_FRAME
