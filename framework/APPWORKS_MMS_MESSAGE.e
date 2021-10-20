class APPWORKS_MMS_MESSAGE

creation
	make

feature
	make is
		do
		end -- make

	fill_properties (p: APPWORKS_UTIL_VISUAL_PROPERTIES) is 
		local
			s : APPWORKS_UTIL_VISUAL_SUBPROP
		do
			s := p.subkey ("Message")
			s.fill ("Type", "Mail") 				# TODO: fix this
			s.fill ("Location", "/"+get_id) 		# TODO: fix this
			s.fill ("Size", octets.to_string) 		# TODO: fix this
			s.fill ("Attachments", 0) 				# TODO: fix this
			s.fill ("Priority", "Normal") 			# TODO: fix this
			s.fill ("Sent", get_header ("Date"))	# TODO: fix this
			s.fill ("Recieved", "Today") 			# TODO: fix this
		end -- fill_properties 
		

	get_header (s: STRING) : STRING is
		deferred
		end -- get_header
		
	get_id : STRING is 
		deferred
		end -- get_id
		
	octets : INTEGER
		
end -- class APPWORKS_MMS_MESSAGE
