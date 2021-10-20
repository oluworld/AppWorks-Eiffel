indexing
	purpose: "setup environment for app"

--
-- the appropriate method, usually set is only called once from the 
-- program entry point. we will deconstruct parameters into objects
-- and announce them the root class
--

class ROOT

inherit
	APPWORKS_MAIN_LOGIC
creation
	make

feature

	make is
		do
			
		end -- make

	set (hinst : POINTER; argc : INTEGER; argv: NATIVE_ARRAY[POINTER]) is
		do

--			CHAR szModuleName[MAX_PATH];	// CHAR from windows.h
--			GetModuleFileName(hInst, szModuleName, sizeof(szModuleName));

			!!global_app.make
			global_app.set_servers  (shared_file_server, 
			                         shared_window_server,
							         shared_information_database)
			global_app.start
			global_app.set_app_path (argument(0))
			global_app.set_pid      (hinst)
			global_app.unix_init    (argc, argv)
			
			res := global_app.run
			
		end -- make

feature

	shared_file_server : APPWORKS_SERVICES_FILESYSTEM is
		once
			!! Result.make
		end -- shared_file_server
	
	shared_window_server : APPWORKS_SERVICES_WINDOW_SERVER is
		once 
			!! Result.make
		end -- shared_window_server

	shared_information_database : APPWORKS_SERVICES_DBI_SERVER is
		require
			global_app /= Void
		once 
			!! Result.make (global_app)
		end -- shared_information_database 

feature

	global_app : DEFAULT_APP
	res        : INTEGER

end -- class ROOT
