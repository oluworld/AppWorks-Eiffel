indexing
	description: "Interface to native system for APP"
	notes:       "will only be used for text mode"
	library:     "AppWorks-Base-Text"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision$"

class APPWORKS_BASE_STD_APP

feature

	post_quit is
		do
			-- ??
		end -- post_quit

feature -- Running

	should_quit_now: BOOLEAN is
		do
			my_quit_now := True
			Result := my_quit_now = True
		end -- should_quit_now

feature

	my_quit_now: BOOLEAN is
		deferred
		end

end -- class APPWORKS_BASE_STD_APP
