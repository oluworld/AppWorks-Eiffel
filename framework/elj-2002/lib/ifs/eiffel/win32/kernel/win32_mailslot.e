indexing
	WIN32 mailslot functions
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: yes
	
class WIN32_MAILSLOT

feature {NONE}

	CreateMailslot (a_name                  : POINTER;
					 a_message_size          : INTEGER;
					 a_read_timeout          : INTEGER;
					 a_security_attributes   : POINTER) : POINTER is
		external "C use <windows.h>"
		end -- CreateMailslot

	GetMailslotInfo(a_mailslot			:	POINTER;
					a_max_message_size	:	POINTER;
					a_next_size			:	POINTER;
					a_message_count		:	POINTER;
					a_read_timeout		:	POINTER) : BOOLEAN is
		external "C use <windows.h>"
    	end -- GetMailslotInfo
    	
    SetMailslotInfo(a_mailslot:		POINTER;
    				a_read_timeout:	INTEGER) : BOOLEAN is
		external "C use <windows.h>"
    	end -- SetMailslotInfo
    	
end -- class WIN32_MAILSLOT