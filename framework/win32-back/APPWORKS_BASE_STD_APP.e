indexing
	description: "Interface to native system for APP"
	notes:       "will only be used on windows"
	library:     "AppWorks-Base-Windows"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date$"
	revision:    "$Revision$"

class APPWORKS_BASE_STD_APP

inherit
	WIN32_MESSAGE_AND_QUEUES

feature

	post_quit is
		do
			PostQuitMessage (0)
		end -- post_quit
	
feature -- Running

	do_run is
		local
			state : BOOLEAN
			atom  : INTEGER
		do
			state := TranslateMessage(my_msg.pointer)
			atom  := DispatchMessage(my_msg.pointer)
		end -- do_run

	should_quit_now: BOOLEAN is
		do
			Result := not GetMessage(my_msg.pointer, default_pointer, 0, 0)
		end -- should_quit_now

feature {NONE}

	my_msg: expanded WIN32_MSG is
		once
			Result.make_external
		end

end -- class APPWORKS_BASE_STD_APP
