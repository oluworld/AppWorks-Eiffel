class DEFAULT_APP

inherit
	APPWORKS_BASIC_APP
		redefine 
			make, 
			basic_app_window,
			basic_app_window_name
		end
	
creation
	make

feature
	make is
		do
			Precursor
		end -- make

	do_run is
		do
--			print ("Filling data%N")
--			print ("About to update%N")
			basic_app_window.update_data
		end -- do_run

	x__do_run is
		local
			c : COLLECTION[APPWORKS_FILE_DESC]
		do
			print ("Filling data%N")
			c := get_data
			if c /= Void then
				print ("About to update%N")
				basic_app_window.update (c)
				c := Void
			end
		end -- do_run
	
	do_init (c : COLLECTION[STRING]) is
		do
		end -- do_init

feature -- For BasicApp

	basic_app_window_name : STRING is "BasicFsTest2-MainContent"

	basic_app_window : HELLO_WINDOW is
		once
			!! Result.make
		end -- basic_app_window

end -- class DEFAULT_APP
