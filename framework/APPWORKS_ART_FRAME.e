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

class APPWORKS_ART_FRAME

inherit
	APPWORKS_ART_NATIVE_CONTAINER
		rename
			do_create as create_window
			on_destroy as on_window_destroy
		redefine 
			maybe_get_parent_owner,
			validate_native_handle_in_post_create,
			pre_create
--			on_destroy
		end
	
creation
	make

feature
	
	pre_create is
		do
			Precursor
			my_desktop := get_default_desktop
			--my_parent := get_desktop_window
		end -- pre_create
	
	do_create (owner: APPWORKS_BASE_APP; dbiroot: STRING; readdbi: BOOLEAN) is
		require
			valid_owner: owner /= Void
		do
			--my_owner := owner
			set_owner (owner)
			--check
			--	my_owner = owner
			--	my_owner /= Void
			--end
			if not True then
				my_parent.set_native_handle (GetDesktopWindow)
			else 
				my_parent := get_default_desktop
			end
			create_window (my_parent, dbiroot, readdbi)
		end -- create_

	validate_native_handle_in_post_create is
		do
			register
			create_std_window
		end -- validate_native_handle_in_post_create
	
feature

	set_owner (o : APPWORKS_BASE_APP) is
		require
			valid_owner: o /= Void
		do
			my_owner := o
		ensure
			definition: my_owner = o
		end -- set_owner

	maybe_get_parent_owner: APPWORKS_BASE_APP is
		do
			--do_nothing
		end
	
feature
		
	get_style : BIT 32 is
		do
			Result := WS_OVERLAPPEDWINDOW
		end -- get_style
	
feature
		
	on_destroy is
		do
--			Precursor
--			print ("FRAME::on_destroy%N")
			my_owner.notify_destroy_frame(Current)
		end  -- on_destroy

feature

	get_desktop: APPWORKS_ART_CONTAINER is
		do
			--Result := my_window_server.get_desktop_for(ws_handle)
			Result := my_desktop
		end -- get_desktop 

	get_default_desktop: APPWORKS_ART_CONTAINER is
		once
			!!Result.make
			Result.set_native_handle (GetDesktopWindow)
		end -- get_default_desktop 

feature {NONE}
	
	my_desktop : APPWORKS_ART_CONTAINER
	
end -- class APPWORKS_ART_FRAME
