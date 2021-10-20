indexing
	contents:    "AppWorks Splitter Window - Gtk Widget Implementation"
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_BASE_STD_APP

feature

	post_quit is
		do
			gdk_exit (0)
		end -- post_quit
		
	message_loop is
		do
			my_loop_ptr := make_loop (1)
			print ("UU%N")
			g_main_run (my_loop_ptr)
		end -- message_loop 
		
feature {NONE}

	my_loop_ptr : POINTER 
	
	make_loop (i : INTEGER) : POINTER is
		once
			Result := g_main_new (i)
		end -- make_loop

feature -- externals

	gdk_exit (error_code : INTEGER) is
		external "C_WithoutCurrent"
		end
		
	g_main_run (ptr: POINTER) is
		external "C_WithoutCurrent"
		end
		
	g_main_new (i : INTEGER) : POINTER is
		external "C_WithoutCurrent"
		end

end -- class APPWORKS_BASE_STD_APP
