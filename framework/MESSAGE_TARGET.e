indexing
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class MESSAGE_TARGET

feature

	fire_string_to(str: STRING; targ: MESSAGE_TARGET) is
		local
			evt: APPWORKS_BASE_EVENT
		do	
--			io.put_string ("firing string " + str + " to " + targ.unique_id + "%N")
			!! evt.make (Current)
			evt.set_msg (str)
			fire_to (evt, targ)
		end -- fire_string_to

	fire_to(evt: APPWORKS_BASE_EVENT; targ: MESSAGE_TARGET) is
		require 
			evt  /= Void
			targ /= Void
		local
			dummy: APPWORKS_BASE_EVENT
		do
--			print ("firing event " + evt.get_msg(Void) + " to " + targ.unique_id + "%N")
			dummy := targ.handle (evt)
--			print ("Exit fire to%N")
		end -- fire_to

	handle (evt: APPWORKS_BASE_EVENT): APPWORKS_BASE_EVENT is
		do
			Result := bad_event
		end -- handle

feature

	good_event: APPWORKS_BASE_EVENT is
		once
			!! Result.xmake (Void)
			Result.set_msg ("good_event")
		ensure
			Result /= Void
		end

	bad_event: APPWORKS_BASE_EVENT is
		once
			!! Result.xmake (Void)
			Result.set_msg ("bad_event")
		ensure
			Result /= Void
		end

feature

	unique_id: STRING is
		once
			Result := my_number_maker.get.to_string
		end -- my_id

	my_number_maker: NUMBER_MAKER is 
		once
			!! Result.make
		end -- my_number_maker

end -- class MESSAGE_TARGET
