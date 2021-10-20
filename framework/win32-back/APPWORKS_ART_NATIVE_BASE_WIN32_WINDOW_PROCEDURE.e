deferred class APPWORKS_ART_NATIVE_BASE_WIN32_WINDOW_PROCEDURE

feature

	WndProc (hWnd  : POINTER;
			 uMsg  : INTEGER;
			 wParam: INTEGER;
			 lParam: INTEGER): INTEGER is
		local
			--rect : WIN32_RECT
			--point: WIN32_POINT
			e: APPWORKS_BASE_EVENT
		do
			--!!rect.make_external
			
			Result := 1
			
			inspect uMsg

-- 				when WM_WINDOWPOSCHANGING then
--					get_client_rect_in (rect)
--					settop (rect.left, rect.top)
--					Result := DefWindowProc(hWnd, uMsg, wParam, lParam)
					
--				when WM_CREATE then
--					PlaySound ("hellowin.wav", default_pointer, SND_FILENAME or SND_ASYNC)

--				when WM_PAINT then
					-- why do we get so many??
--					fire_string_to ("expose repaint", Current)
--					Result := 0
				
				when WM_ACTIVATE then
					if wParam = WA_INACTIVE then
						fire_string_to ("expose lose_key_focus", Current)
					else
						fire_string_to ("expose gain_key_focus", Current)
					end
					Result := 0	
					
--				when WM_MOUSEENTER then
--					print ("mouseenter%N")
				when WM_MOUSELEAVE then
					print ("mouseleave%N")
				when WM_MOUSEWHEEL then
					print ("mousewheel%N")
					
				when WM_DESTROY then
					fire_string_to ("notify requestdestroy", Current)
					Result := 0
				
				when WM_SIZE then
					!! e.make (Current)
					e.set_msg ("expose resize")
					e.add_int ("width",  LOWORD(lParam))
					e.add_int ("height", HIWORD(lParam))
					fire_to   (e, Current)
					Result := 0
					
				when WM_MOVE then
					imp_on_move (LOWORD(lParam), HIWORD(lParam))
					Result := 0
					
				when WM_MOUSEMOVE then
					!! e.make (Current)
					e.set_msg ("expose mousemove")
					e.add_int ("x-coord",  LOWORD(lParam))
					e.add_int ("y-coord", HIWORD(lParam))
					e.add_int ("button", wParam)
					fire_to   (e, Current)
					--imp_on_mousemove (LOWORD(lParam), HIWORD(lParam), wParam)
					Result := 0
					
				when WM_LBUTTONDOWN then
					imp_on_mousedown (LEFT_MOUSE_BUTTON, 1, e)
					Result := 0
					
				when WM_LBUTTONUP then
					imp_on_mouseup (LEFT_MOUSE_BUTTON, 1)
					Result := 0
					
				when WM_RBUTTONDOWN then
					imp_on_mousedown (RIGHT_MOUSE_BUTTON, 1, e)
					Result := 0
					
				when WM_RBUTTONUP then
					imp_on_mouseup (RIGHT_MOUSE_BUTTON, 1)
					Result := 0
					
				when WM_MBUTTONDOWN then
					imp_on_mousedown (MIDDLE_MOUSE_BUTTON, 1)
					Result := 0
					
				when WM_MBUTTONUP then
					imp_on_mouseup (MIDDLE_MOUSE_BUTTON, 1)
					Result := 0
					
				when WM_COMMAND then
					!! e.make (Current)
					e.set_msg ("expose native")
					e.add_int ("lp", lParam)
					e.add_int ("wp", wParam)
					e.add_str ("source_id", get_prop ("target-id"))
					fire_to   (e, Current)
					Result := 0
					
				else
					Result := DefWindowProc(hWnd, uMsg, wParam, lParam)
					
			end -- inspect
--			print ("finished windowproc%N")
		end -- WinProc

end -- class APPWORKS_ART_NATIVE_BASE_WIN32_WINDOW_PROCEDURE
