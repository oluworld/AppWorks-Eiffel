--
-- -*- Eiffel -*-
-- Copyright (C) 2001 OluWorld! Softworks
-- Example/test hello world program
-- derived from the python demo apw_hello.py
-- derived from the inti demo hello.cc
--

class HELLO_WINDOW

inherit
	APPWORKS_ART_WINDOW
		rename
			make as make_window
		end -- redefine APPWORKS_ART_WINDOW
		
creation
	make
	
feature {NONE}
	button : APPWORKS_ART_BUTTON
feature
	make is
		do
			make_window
			!!button.make
		end -- make		
	
	do_create(parent : APPWORKS_ART_WINDOW; dbiroot : STRING; read_dbi : BOOLEAN) is
		once
			set_title ("Hello Window")
			button.create_(Current, "Button", read_dbi)
		end -- do_create

-- feature

end -- HELLO_WINDOW

