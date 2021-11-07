class DEFAULT_APP

inherit
	APPWORKS_BASE_APP
		redefine 
			make, 
			post_init
		end
	
creation
	make

feature
	make is
		do
			Precursor
		end
				
	post_init is
		local
			fr  : APPWORKS_ART_BLANK_FRAME
			sp  : APPWORKS_ART_VERTICAL_SPLITTER
			itm : APPWORKS_ART_TABLE_ITEM
			btn : APPWORKS_ART_BUTTON
		do
			!! fr.make
			fr.create_ 		(Current)
			fr.set_main_frame

			!! sp.make
			fr.insert_child (sp, "Splitter", true)

			!! t.make
			!! btn.make
			sp.insert_child (t,   "Table",  true)
			sp.insert_child (btn, "Button", true)

--			t.settop     	(0, 0)
--			t.set_size   	(150, 150)
			t.add_column 	(0, "Name")
			t.add_column 	(1, "Size")

			!! itm.make
			itm.set 		(0, 0, "0-0")
			t.add_item		(itm)
			itm.set 		(1, 0, "1-0")
			itm.set_indent_level (1)
			t.add_item		(itm)
			t.set_text		(0, 1, "0-1")

			sp.end_select
			
			t.show
			btn.show
			sp.show
			fr.show
		end -- post_init
	do_run is
		local
			c : COLLECTION[APPWORKS_FILE_DESC]
			i : ITERATOR_ON_COLLECTION[APPWORKS_FILE_DESC]
			n : INTEGER
		do
			c := shared_file_server.enumerate ("/local/*")
			if c /= Void then
				from
					!! i.make (c)
					i.start
					n := 0
				until
					i.is_off
				loop
					n := n + 1
					t.set_text (n, 0, i.item.get_file_name)
					t.set_text (n, 1, i.item.get_file_size.to_string)
					i.next
				end
			end
		end -- do_run
	do_init (c : COLLECTION[STRING]) is
		do
		end -- do_init

feature {NONE}

	t   : APPWORKS_ART_TABLE
		
end -- class DEFAULT_APP
