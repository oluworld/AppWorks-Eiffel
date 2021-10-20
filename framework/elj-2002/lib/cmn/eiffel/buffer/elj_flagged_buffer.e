class ELJ_FLAGGED_BUFFER

feature

	flag:	INTEGER
	
feature {ELJ_BUFFER_HANDLER}

	set_flag (a_flag: INTEGER) is
		do
			flag := a_flag
		ensure
			value_set: flag = a_flag
		end -- set_flag

end -- class ELJ_FLAGGED_BUFFER