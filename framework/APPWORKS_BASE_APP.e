indexing
	description: "The functional entry point of an AppWorks app"
	library:     "AppWorks-Base"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   almost
	tested:      ummm
	date:        "$Date$"
	revision:    "$Revision$"

--
-- derive from this to make an cli app
-- use basic app for gui
--

deferred class APPWORKS_BASE_APP

inherit
	MESSAGE_TARGET
	APPWORKS_BASE_STD_APP
		redefine post_quit
		end	
		
feature -- main frame
	
	my_main_frame: APPWORKS_ART_FRAME
	
	notify_destroy_frame (a_frame: APPWORKS_ART_FRAME) is
		do
			if my_main_frame = a_frame then
				quit
			end
		end -- notify_destroy_frame 
	
	set_main_frame (a_frame: APPWORKS_ART_FRAME) is
		do
			my_main_frame := a_frame
		end -- set_main_frame 
		
	
feature

	make is 
		do
--			!!ms_client.make(Current, Current)
		end -- make
	
--	init is
--		deferred
--		end
	
	init_app(s1, s2: STRING) is
		do
		end -- init_app

	start is
			-- the only thing that should happen 
			-- here is a call to start2 
		deferred
		end -- start
	
	start2 (a_vendor, a_appname: STRING) is
		require
			valid_vendor: a_vendor /= Void and then a_vendor.first_index_of('/') = 0
			valid_appname: a_appname /= Void 
		do
			--do_nothing
			!!my_dbi.make (Current)
			my_dbi.set_root("~/Programs/"+a_vendor+"/"+a_appname+"/")
		ensure
			my_dbi /= Void
		end -- make
	
	start2_singleton (a_vendor, a_appname: STRING) is
		do
			--do_nothing
		end -- make
	
	xmake (a_vendor, a_appname: STRING; is_singleton: BOOLEAN; namer1: APPWORKS_SERVICES_NAMER) is
		do
			if is_singleton then
				if namer1.has_singleton (a_vendor, a_appname) then
					quit_by_singleton -- (namer1.get_singleton...)
				end
			else
				--namer1.add_item (make_namer_id, get_target_id)
			end
		end -- make
	
	quit_by_singleton  is
		do quit end
	
	set_servers (fileserv: APPWORKS_SERVICES_FILESYSTEM;
	      winserv:  APPWORKS_SERVICES_WINDOW_SERVER;
		  dbserv:   APPWORKS_SERVICES_DBI_SERVER) is
		do
			shared_file_server          := fileserv
			shared_window_server        := winserv
			shared_information_database := dbserv
		end -- set_servers 
	
	init (args: COLLECTION[STRING]) is
		require
			args_is_valid: args /= Void
		local
			evt: APPWORKS_BASE_EVENT
		do
			pre_init
			if args.has("help") then -- fast_has uses =, has uses equals
				fire_string_to("expose onassist", Current)
				quit
			elseif args.has("version") then
				!!evt.make(Current)
				evt.set_msg("expose onassist")
				evt.add_str("version", "True")
				evt.fire_to(Current)
				quit
			else
				do_init(args)
				my_args := args
				post_init
			end
		end -- init

	quit is
		do
			quit_with_val(my_ret_val)
		end -- quit
	
	quit_with_val(rc: INTEGER)  is
		do
			pre_quit
			my_ret_val  := rc
			my_quit_now := True
			post_quit
		end -- quit_with_val

feature
	
	get_handle: POINTER is
		do
			Result := my_pid
		end -- get_handle

feature -- Running
	
	run: INTEGER is
		do
			from 
			until
				should_quit_now
			loop
				do_run
			end
			Result := my_ret_val
		end -- run

feature -- Init-time features

	set_app_name (a_name : STRING) is
		require
			a_name_not_void: a_name /= Void
		do
			my_app_name := a_name
		ensure
			program_name_set: my_app_name = a_name
		end -- set_app_name

	set_app_path (a_path : STRING) is
		require
			a_path_not_void: a_path /= Void
		do
			my_app_path := a_path
		ensure
			program_path_set: my_app_path = a_path
		end -- set_app_path

feature -- Events

	on_assist (evt : APPWORKS_BASE_EVENT): APPWORKS_BASE_EVENT is
		local
			s: STRING
		do
			if evt.main_msg = "expose version" then
				s := get_version_string
				if s /= Void then
					display_help_message (s)
					Result := ok_event
				else
					Result := bad_event
				end
			else
				s := get_help_string
				if s /= Void then
					display_help_message (s)
					Result := ok_event
				else
					Result := bad_event
				end	
			end	
		end -- on_assist

feature -- "Shell" functions

	--  execute a shell command. return a Msg.Event 
	shell_exec(cmd: STRING): APPWORKS_BASE_EVENT is 
		deferred
		end -- shell_exec
	--  execute a shell command. return a Msg.Event 
	shell_exec_and_wait(cmd: STRING): APPWORKS_BASE_EVENT is 
		deferred
		end -- shell_exec_and_wait

feature {APPWORKS_MAIN_LOGIC}
	set_pid(pid: POINTER) is
		do
			my_pid := pid
		end -- set_pid

feature

	xunix_init (argc: INTEGER; argv: POINTER) is
		local
			i    : INTEGER
			args : LINKED_LIST[STRING]
		do
			from 
				i := 1
			until
				i > argument_count
			loop
				args.add_last(argument(i))
				i := i + 1
			end
		end -- unix_init
		
	unix_init (argc: INTEGER; argv: NATIVE_ARRAY[POINTER]) is
		local
			i    : INTEGER;	
			s    : STRING;
			args : LINKED_LIST[STRING]
		do
			!!args.make
			!!s.make(0)
			from 
				i := 1 -- next after first (one based)
			until
				i >= argc
			loop
				s.from_external(argv.item(i))
				args.add_last(s)
--				debug
					io.put_string(s)
					io.put_new_line
--				end
				i := i + 1
			end
			init(args)
		end -- unix_init
	win_init (cmdline : STRING; cmdshow: INTEGER) is
		deferred
		end -- win_init
		
feature 
	-- these should be overridden
	do_init (args : COLLECTION[STRING]) is 
		deferred
		end -- do_init
		
feature {APPWORKS_BASE_APP}

	-- these are here to avoid errors
	post_init is
		do
		end -- post_init

	pre_init is
		do
		end -- pre_init

	-- quit, post- and pre- are for requesting application shutdown
	-- on_shutdown (pre & post ??) are called after the run loop exits
	post_quit is
		do
			Precursor
		end -- post_quit

	pre_quit is
		do
		end -- pre_quit

feature -- servers

	shared_file_server          : APPWORKS_SERVICES_FILESYSTEM
	shared_window_server        : APPWORKS_SERVICES_WINDOW_SERVER
	shared_information_database : APPWORKS_SERVICES_DBI_SERVER
	
feature {NONE}
	my_dbi        : APPWORKS_DBI_HANDLE
		-- aka DataHandle

feature {APPWORKS_BASE_APP}

	my_quit_now   : BOOLEAN
	my_ret_val    : INTEGER
	my_pid        : POINTER
	my_extra_info : EXTRA_INFO
	my_args       : COLLECTION[STRING]
	my_app_name   : STRING
	my_app_path   : STRING

end -- class APPWORKS_BASE_APP
