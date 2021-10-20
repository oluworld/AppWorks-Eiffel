indexing
	contents:    "AppWorks Basic App"
	description: "A specialized version of application that makes it easy to %
				  %add a window to a BLANK_my_FRAME"
	library:     "AppWorks/Base"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_BASIC_APP

inherit
	APPWORKS_BASE_APP
		redefine post_init
		end

feature

	post_init is
		do
			Precursor
			
			!! my_frame.make
			my_frame.create_ (Current)
			set_main_frame (my_frame)
			
			my_basic_window := basic_app_window
			
			my_frame.begin_select
			my_frame.insert_child (my_basic_window, basic_app_window_name, true)
			my_frame.end_select
			
			post_init_show
			
		end -- post_init

	post_init_show is
		do
			my_basic_window.show
			my_frame.show
		end

feature

	start is
		do
			start2 (basic_app_vendor, basic_app_name)
		end -- start
	
feature -- abstract features

	basic_app_window : APPWORKS_ART_WINDOW is
		deferred
		ensure
			valid_basic_window: Result /= Void
		end

	basic_app_window_name: STRING is
		deferred
		end

	basic_app_vendor: STRING is
		deferred
		end

	basic_app_name: STRING is
		deferred
		end

feature -- subclass access

	my_basic_window : APPWORKS_ART_WINDOW
	my_frame		: APPWORKS_ART_BLANK_FRAME

end -- class APPWORKS_BASIC_APP
