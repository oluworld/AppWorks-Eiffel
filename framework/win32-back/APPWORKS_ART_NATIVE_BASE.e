indexing
	description: "Base class for interop with native window system"
	library:     "AppWorks-Art (Win32)"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

deferred class APPWORKS_ART_NATIVE_BASE

inherit
	-- native
	WIN32_WINDOW_CLASSES
	WIN32_DEVICE_CONTEXT_FUNCTIONS
	WIN32_MOUSE_INPUT_FUNCTIONS
	WIN32_CURSOR_FUNCTIONS
	WIN32_ICON_FUNCTIONS
	WIN32_COLOR_CONSTANTS
--	WIN32_BRUSH_CONSTANTS
	WIN32_DEVICE_CONTEXT_CONSTANTS
	WIN32_ICON_CONSTANTS
	WIN32_WINDOW_STYLE_CONSTANTS
	WIN32_CLASS_STYLE_CONSTANTS
	WIN32_WINDOW_MESSAGES
--	WIN32_CONSTANTS
	WIN32_MESSAGE_AND_QUEUES
	WIN32_UTILITY
	WIN32_PAINTING_AND_DRAWING
	WIN32_WINDOWS
	-- mixin
	APPWORKS_ART_NATIVE_BASE_WIN32_WINDOW_PROCEDURE
	-- utility
	--ELJ_COMMON_TOOLS
	GG_UTILS
	--
	
feature

	register is
		local
			atom       : INTEGER
			lpfnWndProc: POINTER
		do
			!! wndclass.make_external
			
			lpfnWndProc := make_instance (Current.to_pointer, $WndProc)
			
			check
				valid_window_proc: lpfnWndProc  /= default_pointer
			end
			wndclass.set_style			( CS_HREDRAW or CS_VREDRAW )
			wndclass.set_lpfnWndProc	(lpfnWndProc )
			wndclass.set_cbClsExtra		(0)
			wndclass.set_cbWndExtra		(0)
			wndclass.set_hInstance		(get_inst)
			wndclass.set_hIcon			(default_icon)
			wndclass.set_hCursor		(default_cursor)
			wndclass.set_hbrBackground	(get_register_brush)
			wndclass.set_lpszMenuName	("")
			wndclass.set_lpszClassName	(get_clazzname)

			atom := RegisterClass(wndclass.pointer)

			----------------------------------------------------------------------
--			p5 ("Trying to register ", get_clazzname, " WndProc -> ", lpfnWndProc, "%N")
--			do_ext_msg 
			----------------------------------------------------------------------

			if not (atom > 0) then
				print (get_clazzname)
				print (" not actually registered%N")
			else
				--print (get_clazzname)
				--print (" actually registered%N")
			end
			
		end -- register

	default_icon: POINTER is
		do
			Result := LoadIcon   (default_pointer, IDI_APPLICATION)
		end -- default_icon
	default_cursor: POINTER is
		do
			Result := LoadCursor (default_pointer, IDC_ARROW)
		end -- default_cursor
	
	do_ext_msg is
		do
			print (last_error_message)
		end -- do_ext_msg 

	create_std_window is
		require
			valid_parent: get_parent.valid_handle 
		local
			my_handle, parent_handle: POINTER
		do
			parent_handle := get_parent_native_handle
			check valid_parent: IsWindow(parent_handle) end
			--
			my_handle := CreateWindow(  (get_clazzname).to_external,
										(get_title).to_external,
										get_style,
										get_int_prop("x-coord"),
										get_int_prop("y-coord"),
										get_width, get_height,
										parent_handle,
										get_menu,
										get_inst,
										get_extra_clazzinfo)
			
			----------------------------------------------------------------------
			p5 ("Trying to CreateWindow ", get_clazzname, " hInstance -> ", get_inst, "%N")
			p5 ("Trying to CreateWindow ", get_clazzname, " parent handle -> ", p2i(get_parent_native_handle), "%N")
			p5b ("** CreateWindow ", p2i(get_inst), get_width, get_height, p2i(get_parent_native_handle))
			do_ext_msg
			----------------------------------------------------------------------
			
			set_native_handle (my_handle)
		--ensure
			-- checked by set_native_handle
			--window_actually_created: valid_handle
		end -- create_std_window

feature

	show is
		do
			if imp_show(SW_SHOWNORMAL) then
				show_vis_prop
			end
		end -- show
	
	hide is
		do
			if imp_show(SW_HIDE) then
				hide_vis_prop
			end
		ensure
			win32_state = True implies equal (get_prop ("visibility"), "hidden")
		end -- hide
	
	imp_show (a_cmd_show: INTEGER): BOOLEAN is
		do
			if ShowWindow(get_native_handle, a_cmd_show) then
				Result := True
				win32_state := UpdateWindow(get_native_handle)
				Result := win32_state
			else
				-- TODO: !!
			end
			check
				win32_state /= True implies win32_state = False
				--Result = False implies win32_state /= True
			end
		end -- imp_show

feature -- CreateWindow defaults

	set_initial_properties is
		do
			set_prop	 ("WindowClass", initial_win32_wndclass)
		end

	initial_win32_wndclass: STRING is 
		do Result := "AppWorksStdWindow" end
	
	get_extra_clazzinfo: POINTER is
		do
			Result := default_pointer
		end -- get_extra_clazzinfo
	
	get_menu: POINTER is
		do
			Result := default_pointer
		end -- get_menu
	
	get_style: BIT 32 is
		deferred
		end -- get_style
	
	get_register_brush: POINTER is
		do
			Result := GetStockObject (WHITE_BRUSH)
			--Result := win32_stock_objects.white_brush
		end -- get_register_brush
	
	get_handle: POINTER is
		do
			Result := my_handle
		end -- get_handle 
	
	get_inst: POINTER is
		do
			Result := get_owner_handle
		end -- get_inst

feature

	lock_focus is
		local
			ptr	: POINTER
		do
			ptr := SetCapture (get_native_handle)
		end -- lock_focus
		
	unlock_focus is
		do
			win32_state := ReleaseCapture
		end -- unlock_focus

feature

	imp_on_mousedown (buttton, clicks: INTEGER; e: APPWORKS_BASE_EVENT) is
		do
			print ("unhandled on_mousedown%N")
		end -- imp_on_mousedown
	imp_on_mouseup (buttton, clicks: INTEGER--; e: APPWORKS_BASE_EVENT
	) is
		do
			print ("unhandled on_mouseup%N")
		end -- imp_on_mouseup 
	ximp_on_mousemove (x, y, button: INTEGER) is
		do
		end -- imp_on_mousemove 
	imp_on_move (x, y: INTEGER) is
		do
		end -- imp_on_move 
	on_repaint is
		local
			hdc  : POINTER
			ps   : WIN32_PAINT_STRUCT
			rect : WIN32_RECT
			--point: WIN32_POINT
		do
			!! rect.make
			!! ps.make
			
			hdc   := BeginPaint (get_native_handle, ps)
			state := GetClientRect (get_native_handle, rect)
			atom  := DrawText (hdc,
							"Hello, Windows 95!",
							-1,
							rect,
							DT_SINGLELINE or DT_CENTER or DT_VCENTER)
			
			check
				atom > 0
			end -- check

			win32_state := EndPaint (get_native_handle, ps)
		end -- on_repaint

feature -- Overridden Window features

	set_xy, set_top, settop (a_x, a_y: INTEGER) is
		local
			res: BOOLEAN
		do
			if valid_handle then
				window_server.native_set_pos (ws_handle, a_x, a_y)
				window_settop (a_x, a_y)
			end
		ensure
			definition_x: x = a_x
			definition_y: y = a_y
		end -- settop

feature -- handle functions

	valid_handle: BOOLEAN is
			-- returns true if win32 recognizes our handle
		do
			Result := IsWindow (get_native_handle)
		end -- valid_handle		
	
	check_valid_handle is
			-- shut down the app (at runtime) if we aren't valid
			-- assertions are not required to be avail at runtime
		do
			if not valid_handle then
				crash
			end
		end -- check_valid_handle
	
feature -- size

	set_size (a_height, a_width: INTEGER) is
		do
			if valid_handle then
				--print ("set_size in NATIVE_WINDOW%N")
				win32_state := SetWindowPos(get_native_handle, default_pointer, 
					0, 0, a_width, h, 
					SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOZORDER)
				if win32_state = False then
					print (last_error_message)
				end
				window_set_size (a_height, a_width) -- set properties after native size is changed
			end
		ensure
			valid_window_height
			window_width  = a_width
		end -- imp_set_size

	window_width: INTEGER is
		local
			r: expanded WIN32_RECT
		do
			r.make_external
			get_client_rect_in (r)
			Result := r.right-r.left
		end
	window_height: INTEGER is
		local
			r: expanded WIN32_RECT
		do
			r.make_external
			get_client_rect_in (r)
			Result := r.bottom-r.top
		end
	xwindow_width: INTEGER is
		do
		end
	xxwindow_width: INTEGER is
		do
		end
	valid_window_height: BOOLEAN is
		do
			Result := window_height.in_range (
				max(min_height, a_height), 
				min(max_height, a_height))
		end -- valid_window_height

feature -- title

	set_title (a_title: STRING) is
		do
			win32_state := SetWindowText(get_native_handle, a_title.to_external)
			check success: win32_state /= False end
			set_title_prop (a_title)
		ensure
			--definition: equal (get_title, a_title)
			synced_definition: equal (get_title_prop, a_title)
		end -- set_title

	get_title: STRING is
		do
			-- Result := get_title_prop
			!! Result.make(64)
			win32_dummy := GetWindowText (get_native_handle, 
				Result.to_external, Result.capacity)
			--
			do_ext_msg
			print (Result.capacity)
			print ("** native get_title ")
			print (win32_dummy)
			print (" (")
			print (Result)
			print (") %N")
			--
		ensure
			--definition: get_title := a_title
			--synced: 	Result = get_title_prop
		end -- set_title
	
feature -- client rect

	get_client_rect: WIN32_RECT is
		do
			!! Result.make
			get_client_rect_in (Result)
		end
	
	get_client_rect_in (rect: WIN32_RECT) is
		do
			win32_state := GetClientRect(get_native_handle, rect)
		end -- get_client_rect_in
	
feature {NONE} -- private features

	wndclass    : WIN32_WNDCLASS
	win32_state : BOOLEAN
	win32_dummy : INTEGER
--	win32_rect  : WIN32_RECT

end -- class APPWORKS_ART_NATIVE_BASE
