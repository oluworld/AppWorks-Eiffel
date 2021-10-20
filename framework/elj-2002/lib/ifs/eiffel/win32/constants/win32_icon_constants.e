indexing
	contents: "WIN32 icon functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no
	
class WIN32_ICON_CONSTANTS

inherit
	WIN32_MACROS

feature {NONE}

	IDI_APPLICATION : POINTER is
		once
			Result := MAKEINTRESOURCE(32512)
		end -- IDI_APPLICATION

	IDI_HAND : POINTER is
		once
			Result := MAKEINTRESOURCE(32513)
		end -- IDI_APPLICATION

	IDI_QUESTION : POINTER is
		once
			Result := MAKEINTRESOURCE(32514)
		end -- IDI_APPLICATION

	IDI_EXCLAMATION : POINTER is
		once
			Result := MAKEINTRESOURCE(32515)
		end -- IDI_APPLICATION

	IDI_ASTERISK : POINTER is
		once
			Result := MAKEINTRESOURCE(32516)
		end -- IDI_APPLICATION

	IDI_WINLOGO : POINTER is
		once
			Result := MAKEINTRESOURCE(32517)
		end -- IDI_APPLICATION

	DI_MASK			: INTEGER is 1
	DI_IMAGE 		: INTEGER is 2
	DI_NORMAL 		: INTEGER is 3
	DI_COMPAT 		: INTEGER is 4
	DI_DEFAULTSIZE 	: INTEGER is 8

feature {NONE}


end -- class WIN32_ICON_CONSTANTS
