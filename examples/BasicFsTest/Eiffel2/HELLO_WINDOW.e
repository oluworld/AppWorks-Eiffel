class HELLO_WINDOW

inherit
	HELLO_WINDOW_MODEL
	HELLO_WINDOW_VIEW
		rename
			t as the_table
		redefine
			setup_mvc
		end

creation
	make

feature

	setup_mvc is
		do
			Precursor
			!! cntlr.make (Current)
		end

	update_data is
		do
			cntlr.update_data
		end

	on_button_click is
		do
			update_data
		end

feature

	cntlr : HELLO_WINDOW_CONTROLLER
	
end -- HELLO_WINDOW

