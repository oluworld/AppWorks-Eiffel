indexing
	contents:    "AppWorks Native Window - Win32 Implementation"
	description: "Implements interop with GDI subsystem"
	library:     "AppWorks/Art/Win32"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_ART_NATIVE_WINDOW

inherit
	APPWORKS_ART_NATIVE_WINDOW_BASE

feature

	register is
			-- This registers the window class on Windows
			-- Dont know what it would do on GTK
			-- Maybe ensure window system started
		do
			do_nothing
		end -- register

	create_std_window is
			-- creates a window using the 
		local
			my_handle : POINTER
		do
			my_handle := gtk_window_new()
			--~ CreateWindow(  get_clazzname,
										--~ get_title,
										--~ get_style,
										--~ get_int_prop("x-coord"),
										--~ get_int_prop("y-coord"),
										--~ get_int_prop("width"),
										--~ get_int_prop("height"),
										--~ get_parent_native_handle,
										--~ get_menu,
										--~ get_inst,
										--~ get_extra_clazzinfo)
			
			check
				window_actually_created: my_handle.is_not_null
			end
			
			set_native_handle (my_handle)
		end -- create_std_frame 

	show is
		do
			Precursor
			gtk_window_show (get_native_handle)
			--~ gtk_flush() ??
		end -- show

feature

	get_menu : POINTER is
		do
			Result := default_pointer
		end -- get_menu
	--~ get_handle : POINTER is
		--~ do
			--~ Result := my_handle
		--~ end -- get_handle 
	--~ get_inst : POINTER is
		--~ do
			--~ Result := get_owner_handle
		--~ end -- get_inst

feature

	--~ lock_focus is
		--~ local
			--~ ptr	: POINTER
		--~ do
			--~ ptr := SetCapture (get_native_handle)
		--~ end -- lock_focus
		
	--~ unlock_focus is
		--~ do
			--~ win32_state := ReleaseCapture
		--~ end -- unlock_focus

feature

	--~ WndProc (hWnd   : POINTER;
			 --~ uMsg   : INTEGER;
			 --~ wParam : INTEGER;
			 --~ lParam : INTEGER) : INTEGER is
		--~ local
			--~ rect  : WIN32_RECT
			--~ point : WIN32_POINT
			--~ e     : EVENT
		--~ do
			--~ create rect.make

			--~ Result := 1
			
			--~ inspect uMsg

--~ -- 				when WM_WINDOWPOSCHANGING then
--~ --					get_client_rect_in (rect)
--~ --					settop (rect.left, rect.top)
--~ --					Result := DefWindowProc(hWnd, uMsg, wParam, lParam)
					
--~ --				when WM_CREATE then
--~ --					PlaySound ("hellowin.wav", default_pointer, SND_FILENAME or SND_ASYNC)

--~ --				when WM_PAINT then
--~ --					fire_string_to ("expose repaint", Current)
--~ --					Result := 0

				--~ when WM_ACTIVATE then
					--~ if wParam = WA_INACTIVE then
						--~ fire_string_to ("expose losefocus", Current)
					--~ else
						--~ fire_string_to ("expose gainfocus", Current)
					--~ end
					--~ Result := 0	

				--~ when WM_DESTROY then
					--~ fire_string_to ("notify requestdestroy", Current)
					--~ Result := 0
				
				--~ when WM_SIZE then
					--~ !! e.make (Current)
					--~ e.set_msg ("expose resize")
					--~ e.add_int ("width",  LOWORD(lParam))
					--~ e.add_int ("height", HIWORD(lParam))
					--~ fire_to   (e, Current)
					--~ Result := 0

				--~ when WM_MOVE then
					--~ imp_on_move (LOWORD(lParam), HIWORD(lParam))
					--~ Result := 0

				--~ when WM_MOUSEMOVE then
					--~ !! e.make (Current)
					--~ e.set_msg ("expose mousemove")
					--~ e.add_int ("x-coord",  LOWORD(lParam))
					--~ e.add_int ("y-coord", HIWORD(lParam))
					--~ e.add_int ("button", wParam)
					--~ fire_to   (e, Current)
--~ --					imp_on_mousemove (LOWORD(lParam), HIWORD(lParam), wParam)
					--~ Result := 0

				--~ when WM_LBUTTONDOWN then
					--~ imp_on_mousedown (LEFT_MOUSE_BUTTON, 1)
					--~ Result := 0
					
				--~ when WM_LBUTTONUP then
					--~ imp_on_mouseup (LEFT_MOUSE_BUTTON, 1)
					--~ Result := 0

				--~ when WM_RBUTTONDOWN then
					--~ imp_on_mousedown (RIGHT_MOUSE_BUTTON, 1)
					--~ Result := 0
					
				--~ when WM_RBUTTONUP then
					--~ imp_on_mouseup (RIGHT_MOUSE_BUTTON, 1)
					--~ Result := 0

				--~ when WM_MBUTTONDOWN then
					--~ imp_on_mousedown (MIDDLE_MOUSE_BUTTON, 1)
					--~ Result := 0
					
				--~ when WM_MBUTTONUP then
					--~ imp_on_mouseup (MIDDLE_MOUSE_BUTTON, 1)
					--~ Result := 0

				--~ when WM_COMMAND then
					--~ !! e.make (Current)
					--~ e.set_msg ("expose native")
					--~ e.add_int ("lp", lParam)
					--~ e.add_int ("wp", wParam)
					--~ e.add_str ("source_id", get_prop ("target-id"))
					--~ fire_to   (e, Current)
					--~ Result := 0

				--~ else
					--~ Result := DefWindowProc(hWnd, uMsg, wParam, lParam)

			--~ end -- inspect
--~ --			print ("finished windowproc%N")
		--~ end -- WinProc

	imp_on_mousedown (buttton, clicks : INTEGER) is
		do
		end -- imp_on_mousedown
	imp_on_mouseup (buttton, clicks : INTEGER) is
		do
		end -- imp_on_mouseup 
	ximp_on_mousemove (x, y, button : INTEGER) is
		do
		end -- imp_on_mousemove 
	imp_on_move (x, y : INTEGER) is
		do
		end -- imp_on_move 
	on_repaint is
		--~ local
			--~ hdc   : POINTER
			--~ state : BOOLEAN
			--~ ps    : WIN32_PAINT_STRUCT
			--~ rect  : WIN32_RECT
		do
			--~ !! rect.make
			--~ !! ps.make

			--~ hdc   := BeginPaint (get_native_handle, ps)
			--~ state := GetClientRect (get_native_handle, rect)
			--~ atom  := DrawText (hdc,
							--~ "Hello, Windows 95!",
							--~ -1,
							--~ rect,
							--~ DT_SINGLELINE or DT_CENTER or DT_VCENTER)

			--~ check
				--~ atom > 0
			--~ end -- check

			--~ state := EndPaint (get_native_handle, ps)
		end -- on_repaint

feature -- Overridden Window features

	settop (x, y : INTEGER) is
		local
			res : BOOLEAN
		do
			if IsWindow (get_native_handle) then
				res := SetWindowPos(get_native_handle, default_pointer, 
						x, y, 0, 0,
						SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER)
				check
					window_actually_moved: res = TRUE
				end
				Precursor (x, y)
			end
		end -- settop

	xsettop (x, y : INTEGER) is
		local
			res : BOOLEAN
		do
			check
				valid_handle: IsWindow (get_native_handle)
			end
			res := SetWindowPos(get_native_handle, default_pointer, 
				x, y, 0, 0,
			 	SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER)
			check
				window_actually_moved: res = TRUE
			end
			Precursor (x, y)
		end -- settop

	set_size (h, w : INTEGER) is
		local
			res : BOOLEAN
			s   : STRING
		do
			check
				valid_handle: IsWindow (get_native_handle)
			end
--			print ("set_size in NATIVE_WINDOW%N")
			res := SetWindowPos(get_native_handle, default_pointer, 
				0, 0, w, h, 
			 	SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOZORDER)
--			s := last_error_message
--			print (s)
			check
				window_actually_resized: res = TRUE
			end
			Precursor (h, w) -- set properties after native size is changed
		end -- imp_set_size

	set_title (s: STRING) is
		local
			dummy : BOOLEAN
		do
			dummy := SetWindowText (get_native_handle, s)
			Precursor (s)
		end -- set_title
	
feature 

	get_client_rect : WIN32_RECT is
		do
			!! Result.make
			win32_state := GetClientRect(get_native_handle, Result)
		end
		
	get_client_rect_in (rect : WIN32_RECT) is
		do
			win32_state := GetClientRect(get_native_handle, rect)
		end
		
feature 

	LEFT_MOUSE_BUTTON : INTEGER is 1
	MIDDLE_MOUSE_BUTTON : INTEGER is 2
	RIGHT_MOUSE_BUTTON : INTEGER is 3

feature {NONE}

	wndclass    : WIN32_WNDCLASS
	win32_state : BOOLEAN
--	win32_rect  : WIN32_RECT	

end -- class APPWORKS_ART_NATIVE_WINDOW
