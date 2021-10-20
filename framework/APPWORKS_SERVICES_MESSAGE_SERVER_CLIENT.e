indexing
	description: "talk to the messaging server"

class APPWORKS_SERVICES_MESSAGE_SERVER_CLIENT
inherit
	GG_UTILS
creation
	make
feature
	make (mt: MESSAGE_TARGET; ph: PROPERTY_HOLDER) is
			-- pass in either an AwxWindow or AwxApplication
		require
			mt = ph
		do
			ph.set_target_id ((p2i(Current.to_pointer)).to_string)
		end -- make

end -- class APPWORKS_SERVICES_MESSAGE_SERVER_CLIENT
