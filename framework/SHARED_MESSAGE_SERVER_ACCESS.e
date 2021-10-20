expanded class SHARED_MESSAGE_SERVER_ACCESS
--inherit
--creation
feature
	
	shared_message_server: APPWORKS_SERVICES_MESSAGE_SERVER is
		once
			!!Result.make
		end
	
end -- class SHARED_MESSAGE_SERVER_ACCESS
