class APPWORKS_UTIL_OPTION

creation
	make
	
feature
	
	make is
		do
		end
		
	set_name (s : STRING) is
		do
			my_name := s
		end
	
	set_value (s : STRING) is
		do
			my_value := s
		end
	
	set_message (s : STRING) is
		do
			my_message := s
		end	

feature

	my_name, my_value, my_message : STRING

end -- class APPWORKS_UTIL_OPTION
