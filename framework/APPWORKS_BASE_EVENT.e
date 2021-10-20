indexing
	description: "platform independent message passing"
	library:     "AppWorks/Base"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 1999-2001, 2002, OluWorld SoftWorks!"
--	license:     ""
	completed:   "no, use event_srv.get_str/AgxEventGetStr"
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"

class APPWORKS_BASE_EVENT 

inherit
	SHARED_MESSAGE_SERVER_ACCESS

creation
	make, xmake
	
feature

	make (source: MESSAGE_TARGET) is
		require
			source /= Void
		do
			sender := source
		end -- make
	
feature {MESSAGE_TARGET} -- creation

	xmake (source: MESSAGE_TARGET) is
		require
			source = Void
		do
			--sender := source
		end -- make
	
feature

	set_msg (a_msg : STRING) is
		do
			main_msg := a_msg
		end -- set_msg
	
	fire_to (targ: MESSAGE_TARGET) is
		local
			eat_event: APPWORKS_BASE_EVENT
		do
			--shared_message_server.notify(Current)
			eat_event := targ.handle(Current) 
		end -- fire_to
	
	add_str (n: STRING; v: STRING) is
		do
			get_arg_list.insert(n,v)
		end -- add_str
	
	add_int (n: STRING; v: INTEGER) is
		do
			get_arg_list.insert(n,v.to_string)
		end -- add_int

feature -- shortcuts

	sp_height : INTEGER is
		do
			Result := get_int ("height")
		end

	sp_width : INTEGER is
		do
			Result := get_int ("width")
		end

feature 

	get_main_msg : STRING is
		do
			Result := main_msg
		end -- get_main_msg

	get_msg (request: STRING): STRING is
		require
			valid_request: request /= Void
		do
			found := get_arg_list.find (request)
			if found then 
				Result := get_arg_list.item
			end
		ensure
			Result = Void implies not get_arg_list.find(request)
		end -- get_msg

	get_int (request : STRING): INTEGER is
		require
			request /= Void
		local
			interm: STRING
		do
			interm := get_msg(request)
			if found then
				Result := interm.to_integer--.to_string
			end
		end -- get_int

feature

	found: BOOLEAN
		-- true if get_int, get_str, etc are valid

feature
	get_arg_list : RED_BLACK_TREE[STRING, STRING] is
		local
			arg_list : RED_BLACK_TREE[STRING, STRING]
		once
			!! arg_list.make
			Result := arg_list
		ensure
			Result /= Void
		end -- get_arg_list

feature -- these are non-modifyable

	main_msg : STRING
	sender   : MESSAGE_TARGET
	
end -- class APPWORKS_BASE_EVENT 
