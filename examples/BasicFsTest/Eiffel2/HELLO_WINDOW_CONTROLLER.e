
	-- The controller gives commands to (controls) the model based
	-- on external input
	
class HELLO_WINDOW_CONTROLLER

creation
	make
	
feature

	make (m: HELLO_WINDOW_MODEL) is 
		do
			model := m
		end -- make

	print_all (c: COLLECTION[ANY]) is
		local
			i : ITERATOR_ON_COLLECTION[ANY]
		do
			from
				!! i.make (c)
				i.start
			until
				i.is_off
			loop
				print (i.item)
				i.next
			end
		end -- print_all

	get_data : COLLECTION[APPWORKS_FILE_DESC] is
			--@ ... delegator
		do
			Result := model.get_data
		end -- get_data
		
	update_data is
			--@ ... delegator
		local
			c: COLLECTION[APPWORKS_FILE_DESC]
		do
			c := get_data
			if c /= Void then
				int_update (c)
			end
		end -- update
		
	on_button_click is
			--@ ... delegator
		do
			model.update
		end

feature {NONE}

	int_update (c: COLLECTION[APPWORKS_FILE_DESC]) is
		require 
			valid_descriptor_list: c /= Void
		local
			i : ITERATOR_ON_COLLECTION[APPWORKS_FILE_DESC]
			n : INTEGER
		do
			from
				!! i.make (c)
				i.start
				n := 0
			until
				i.is_off
			loop
				model.set_text (n, 0, i.item.get_file_name)
					print_all (<< n, "%N", i.item.get_file_name, "%N">>)
				model.set_text (n, 1, i.item.get_file_size.to_string)
					print_all (<< i.item.get_file_size.to_string, "%N">>)
				i.next
			end
		end

feature

	model : HELLO_WINDOW_MODEL

invariant

	valid_model: model /= Void
	
end -- HELLO_WINDOW_CONTROLLER
