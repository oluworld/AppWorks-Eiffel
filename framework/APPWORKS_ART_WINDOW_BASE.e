indexing
	contents:    "[window_base] holds ... (abstract)"
	library:     "AppWorks-Art (Independent/Base)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"
	notes:       "refactor to talk to window server, like windows does"

deferred class APPWORKS_ART_WINDOW_BASE

inherit
	-- type inheritance
	PROPERTY_HOLDER
		rename make as make_property_holder
		end
	MESSAGE_TARGET
		redefine handle
		end
	-- constants
	APPWORKS_ART_WINDOW_CONSTANTS
	-- mixins
	APPWORKS_ART_WINDOW_NATIVE_MIXIN
	APPWORKS_ART_WINDOW_PROPERTY_MIXIN
	-- utility
	GG_UTILS

feature

	make is
		do
			make_property_holder -- Precursor
			--
			!!ms_client.make(Current, Current)
			--
			xyy  -- call CONTAINER#make_window hook
			setup_mvc
		end -- make

feature

	setup_mvc is
			-- use this to set the controller and model when using MVC
		do
			do_nothing
		end -- setup_mvc

feature {APPWORKS_ART_WINDOW}

	xyy is
			-- a simple hook for make_children
		do
		end -- setup_mvc

feature

	do_nothing is
		do
		end -- do_nothing

feature

	set_layout_name (a_layout_name : STRING) is
		do
			set_prop ("layout_name", a_layout_name)
		end -- set_layout_name

feature

	--add, --??
	create_ (parent: APPWORKS_ART_CONTAINER; dbi_root: STRING; readdbi: BOOLEAN) is
		do
			pre_create
			do_create (parent, dbi_root, readdbi)
			post_create
			--impl_create_end
		end -- create_

	pre_create is
		do
			--io.put_string ("pre_create%N")
			set_initial_properties
		end -- pre_create

	initial_title: STRING is 
		do Result := "<Untitled>" end
	
	set_initial_properties is
		do
			set_prop	 ("title",       initial_title)
			set_prop     ("name",        get_target_id)
			set_int_prop ("x-coord",     10)
			set_int_prop ("y-coord",     10)
			set_width    (200)
			set_height   (200)
		end -- set_initial_properties

	do_create (parent: APPWORKS_ART_CONTAINER; dbi_root: STRING; readdbi: BOOLEAN) is
			-- do_create :
			--   1) set_prop "DBiRoot"
			--   2) set_prop "name"
			--   3) add Current to parent
			--   4) set_owner (set_prop "owner" ??)
			--   5) initialize dbi_handle (my_dbi)
			--   6) sync_dbi_in
		do
			-- use a char eater here
			if dbi_root.has_prefix("~/") or else dbi_root.has_prefix("/") then
				set_prop_dbiroot (dbi_root)
				set_prop ("name", string_after_last(dbi_root, '/'))
			else
				if parent /= Void then
					set_prop_dbiroot (parent.get_prop_dbiroot+"/"+dbi_root)
				end
				set_prop ("name", dbi_root)
			end
			check
				valid_dbiroot_prop:
					get_prop_dbiroot /= Void and then 
					get_prop_dbiroot.count > 0
			end
			if parent /= Void then
				-- which order is better ??
				my_parent := parent
				my_parent.add_child (get_prop("name"), Current)
			else
--				my_parent := get_desktop_window -- get_invisible_window
			end
			my_owner := get_owner
			check
				initial_valid_owner: my_owner /= Void
			end
			!! my_dbi.make  (my_owner)
			my_dbi.set_root (get_prop_dbiroot)
			if readdbi = True then
				sync_dbi_in
			end
		ensure
			valid_owner:  my_owner /= Void
			valid_parent: my_parent /= Void
			--valid_prop_dbiroot: not string_is_empty (get_prop_dbiroot)
		end -- do_create

	post_create is
		do
--			print ("post_create in WINDOW%N")
			ws_handle := window_server.get_service_number
			window_server.notify_post_create (get_target_id, Current)
			-- native_handle is valid now, so add children
			validate_native_handle_in_post_create
			loaded
		end -- post_create
	
	validate_native_handle_in_post_create is
			-- not a game
		do
			do_nothing
		ensure
			valid_handle: valid_handle
		end -- validate_native_handle_in_post_create
	
	window_server: APPWORKS_SERVICES_WINDOW_SERVER is
		require
			valid_owner: get_owner /= Void
		do
			Result := get_owner.shared_window_server
		ensure
			valid_window_server: Result /= Void
		end -- window_server

	loaded is
			-- this is redefined in contanier to call add_children
		require
			valid_handle: valid_handle
			--valid_native_handle
			--valid_parent_native_handle
		do
			do_nothing
		end -- loaded

feature

	valid_handle: BOOLEAN is
		do
			Result := True
		end -- valid_handle
	

feature {NONE}

	ws_handle_memory: INTEGER --WINDOW_SERVER_HANDLE


		-- the window_server (sws) recognizes us by this

feature -- ws_handle features

	ws_handle: INTEGER --WINDOW_SERVER_HANDLE

 is
		do
			Result := ws_handle_memory
		end -- ws_handle

	set_ws_handle (a_ws_handle: INTEGER --WINDOW_SERVER_HANDLE

) is
		do
			ws_handle_memory := a_ws_handle
		end -- set_ws_handle
	
feature

	handle (evt: EVENT): EVENT is
		local
			s: STRING
		do
			Result := bad_event
			s := evt.get_main_msg
			--print ("Recieved message: " + s + "%N")
			if s.is_equal("expose resize") then -- use same_as to ignore case
				--last_event:=evt
				on_size ( evt.sp_height, evt.sp_width )
				Result := good_event
			elseif s.is_equal("expose mousemove") then
				imp_on_mousemove ( evt.get_int ("x-coord"), evt.get_int ("y-coord"), evt.get_int ("button") )
				Result := good_event
			elseif s.is_equal("notify requestdestroy") then
				on_destroy
--			elseif s.is_equal("expose repaint") then
--				on_repaint
			else
				print ("Unhandled event: " + s + "%N")
			end
			--print ("Exit handle%N")
		end -- handle

feature
	my_width, my_height: INTEGER

	set_size (a_height, a_width : INTEGER) is
		do
			set_width  (a_width)
			set_height (a_height)
		end -- set_size

feature
	
	prop_width: INTEGER is 
		do Result := get_int_prop("width") end
	prop_height: INTEGER is 
		do Result := get_int_prop("height") end
	
	get_width: INTEGER is do Result := my_width end
	get_height: INTEGER is do Result := my_height end
	set_width(value: INTEGER) is 
		do 
			my_width := value 
			set_int_prop("width",  value)
		end
	set_height(value: INTEGER) is 
		do 
			set_int_prop("height", value)
			my_height := value 
		end
	
feature
	
	on_size (h, w : INTEGER) is
		do
			print ("-->> enter WINDOW#on_size%N")
			print ("<<--  exit WINDOW#on_size%N")
		end -- on_size

	on_destroy is
		do
			print ("WINDOW::on_destroy%N")
		end -- on_destroy

feature

	get_parent_native_handle : POINTER is
		do
--			io.put_string("get_parent_native_handle%N")
			Result := my_parent.get_native_handle
--			io.put_string(Result.to_pointer.out)
--			io.put_new_line
		end -- get_parent_native_handle

feature

	get_parent: APPWORKS_ART_WINDOW is
		do
			Result := my_parent
		end -- get_parent

feature

	sync_dbi_print (s: STRING) is
		do
			--~ io.put_string (s)
		end -- sync_dbi_print

	-- TODO: implement me 
	sync_dbi_in is do end
	xsync_dbi_in is
		require
			my_dbi.root_is_set
		local
			keys : COLLECTION[STRING]
			i, j : INTEGER
			k, v : STRING
		do
			sync_dbi_print ("ENTER sync_dbi_in%N")
			my_dbi.lock("Props")
			keys := my_dbi.enum_str ("Props")
			from
--				i := 1
				j := keys.count-1
			until
				i > j
			loop
				-- assumption
				-- TODO: ??
				check i = 0 end
				i := i + 1
				k := keys.item(i)
				v := my_dbi.get_str(keys.item(i))
				if not sync_special_prop_in (k, v) then
					unmarshall_prop (k, v)
				end
			end
			my_dbi.unlock("Props")
			sync_dbi_print ("EXIT  sync_dbi_in%N")
		end -- sync_dbi_in

	sync_special_prop_in (k, v : STRING) : BOOLEAN is
		do
			check
				Result = False
			end
			if k.is_equal ("layout") then
--				!! my_layout.make
--				my_layout.from_string (v)
				Result := True
			end
		end -- sync_special_prop_in

feature -- Accessors

	get_owner: APPWORKS_BASE_APP is
		do
			if my_owner = Void then
				my_owner := maybe_get_parent_owner
			end
			Result := my_owner
		ensure
			valid_owner: Result /= Void
		end -- get_owner

	maybe_get_parent_owner: APPWORKS_BASE_APP is
		do
			if my_parent /= Void then
				Result := my_parent.get_owner --maybe_get_parent_owner
			end
		end

feature

	get_owner_handle : POINTER is
		do
			Result := get_owner.get_handle
			--print ("get_owner_handle is")
			--print (Result)
			--print ("%N")
		end -- get_owner_handle

feature -- XML layout parser functions

	begin_select is
		require
			not select_began
		do
			select_began := True
		ensure
			select_began
		end -- begin_select

	end_select is
		require
			select_began
		do
			select_began := False
		ensure
			-- do we need select_ended, too?
			not select_began
		end -- end_select

	option (opt : APPWORKS_UTIL_OPTION) is
		do
			option_name_value (opt.name, opt.value)
		end -- option

	option_name_value (name, value : STRING) is
		require
			select_began
		do
		--ensure
		end -- option_name_value

feature -- TODO: dont let 'em use this!!! {APPWORKS_ART_WINDOW}

	select_began : BOOLEAN

feature {NONE}

	imp_on_mousemove (x, y, button : INTEGER) is
		do
		end -- imp_on_mousemove

feature {NONE}

feature {APPWORKS_ART_WINDOW}

	my_parent        : APPWORKS_ART_CONTAINER
	my_dbi           : APPWORKS_DBI_HANDLE
	my_owner         : APPWORKS_BASE_APP
	ms_client        : APPWORKS_SERVICES_MESSAGE_SERVER_CLIENT

invariant

	--valid_owner:  my_owner /= Void
	--valid_handle: valid_handle
	
end -- class APPWORKS_ART_WINDOW_BASE
