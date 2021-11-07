class HELLO_WINDOW_VIEW

inherit
	APPWORKS_ART_HORIZONTAL_SPLITTER
--	APPWORKS_ART_VERTICAL_SPLITTER
		redefine
			post_create,
			handle
		end
	WIN32_BUTTON_CONSTANTS

--creation
--	make
	
feature

	post_create is
		local
			itm : APPWORKS_ART_TABLE_ITEM
		do
			Precursor

			!! t.make
			!! btn.make
			begin_select
			-- 3 ways to do it ...
--			insert_child (t,   "Table",  true)
--			insert_child (btn, "Button", true)
--			option_name_value ("above", "Table")
--			option_name_value ("below", "Button")

--			insert_child (t,   "1",  true)
--			insert_child (btn, "2", true)
			set_children (t, btn)

			btn.set_prop ("button_message", "expose enact")

--			t.settop     	(0, 0)
--			t.set_size   	(150, 150)
			t.add_column 	("Name")
			t.add_column 	("Size")

--			!! itm.make
--			itm.set 		(0, 0, "0-0")
--			t.add_item		(itm)
--			itm.set 		(1, 0, "1-0")
--			itm.set_indent_level (1)
--			t.add_item		(itm)
--			t.set_text		(0, 1, "0-1")

			end_select

			t.show
			btn.show
		end
		
	handle (evt: EVENT) : EVENT is
		do
			if evt.get_main_msg.is_equal ("expose enact") then
				print ("button clicked !!%N")
				on_button_click	
			else
				Result := Precursor (evt)
			end
		end -- handle

	on_button_click is
		deferred
		end
		
feature {NONE}

	t   : APPWORKS_ART_TABLE
	btn : APPWORKS_ART_BUTTON
		
end -- HELLO_WINDOW_VIEW
