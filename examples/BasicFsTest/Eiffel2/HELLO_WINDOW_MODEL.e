class HELLO_WINDOW_MODEL

--creation
--	make
	
feature

	set_text (r, c : INTEGER; s: STRING) is
		local
			itm : APPWORKS_ART_TABLE_ITEM
		do
			itm := the_table.get (r, c)

			if itm /= Void then
				itm.set_text (s)
				itm.update (the_table)

				itm := Void  -- this should enable garbage collection
				print (the_table.bool_res)
			else
				print ("did not find item%N")
			end

--			if c = the_table.cols+1 then
--				the_table.add_column ("**")
--			end
--			if r = the_table.rows+1 then
--				!! itm.make
--				itm.set (r, c, s)
--				the_table.add_item (itm)
--			else
--				the_table.set_text (r, c, s)
--			end
		end -- set_text

	get_data : COLLECTION[APPWORKS_FILE_DESC] is
		do
--			Result := dummy_data
			Result := my_owner.shared_file_server.enumerate ("/local/*")
		end -- get_data

	dummy_data : COLLECTION[APPWORKS_FILE_DESC] is
		local
			ll : LINKED_LIST [APPWORKS_FILE_DESC]
			fd : APPWORKS_FILE_DESC
		do
			!! ll.make

			!! fd.make
			fd.set_file_name ("DBi")
			fd.set_file_size (0)
			ll.add_last (fd)

			!! fd.make
			fd.set_file_name ("data")
			fd.set_file_size (0)
			ll.add_last (fd)
			
			Result := ll
		ensure
			Result /= Void 
		end -- dummy_data

feature {NONE}

	my_owner : APPWORKS_BASE_APP is
		deferred
		end
		
	the_table : APPWORKS_ART_TABLE is
		deferred
		end

end -- HELLO_WINDOW_MODEL
