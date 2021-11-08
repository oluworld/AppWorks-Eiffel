indexing
	contents:    "AppWorks Window Class (abstract)"
	description: "An area that accepts drawing commands"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"
	notes:       "refactor to talk to window server, like windows does"

class APPWORKS_ART_WINDOW

inherit
	-- type inheritance
	APPWORKS_ART_WINDOW_BASE
		rename
			set_title as base_set_title
		end
	
creation
	make

feature

	get_title: STRING is
		do
			Result := get_title_prop
		end -- get_title
	
	set_title (a_title: STRING) is
		do
			set_title_prop (a_title)
--			base_set_title (a_title) -- TODO: figure this out
		end -- get_title
	
	xget_title: STRING is
		do
			Result := get_title_prop
		end -- get_title

end -- class APPWORKS_ART_WINDOW
