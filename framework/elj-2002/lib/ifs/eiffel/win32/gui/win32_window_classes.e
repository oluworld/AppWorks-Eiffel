indexing
	contents: "WIN32 window class functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: yes
	
class WIN32_WINDOW_CLASSES

--	------------------------------------------------------------------------
--	Following are the functions used with window classes. 
--
--	GetClassInfo
--	GetClassInfoEx
--	GetClassLong
--	GetClassName
--	GetClassWord
--	GetWindowLong
--	GetWindowWord
--	RegisterClass
--	RegisterClassEx
--	SetClassLong
--	SetClassWord
--	SetWindowLong
--	SetWindowWord
--	UnregisterClass 
--	------------------------------------------------------------------------

feature {NONE}

	GetClassInfo (a_instance   : POINTER;
					a_class_name : POINTER;
					a_class_info : POINTER) : BOOLEAN is
--	GetClassInfo (	a_instance   : POINTER;
--					a_class_name : STRING;
--					a_class_info : WIN32_WNDCLASS) : BOOLEAN is
--	The GetClassInfo function retrieves information about a window class. 
--
--	The GetClassInfo function has been superseded by the GetClassInfoEx 
--	function. You can still use GetClassInfo, however, if you do not need 
--	information about the class small icon. 
		external "C use <windows.h>"
		end -- GetClassInfo
		
	GetClassInfoEx (a_instance   : POINTER;
					a_class_name : POINTER;
					a_class_info : POINTER) : BOOLEAN is
--	GetClassInfoEx (a_instance   : POINTER;
--					a_class_name : STRING;
--					a_class_info : WIN32_WNDCLASSEX) : BOOLEAN is
--	The GetClassInfoEx function retrieves information about a window class, 
--	including the handle of the small icon associated with the window 
--	class. The GetClassInfo function does not retrieve the handle of the 
--	small icon.
		external "C use <windows.h>"
		end -- GetClassInfoEx
		
	GetClassLong (	a_window: POINTER; a_index: INTEGER): INTEGER is
--	The GetClassLong function retrieves the specified 32-bit (long) value 
--	from the WNDCLASS structure associated with the specified window. 
		external "C use <windows.h>"
		end -- GetClassLong
		
	GetClassName (	a_window:	POINTER;
					a_name:		POINTER;
					a_name_len:	INTEGER): INTEGER is
--	GetClassName (	a_window:	POINTER;
--					a_name:		STRING;
--					a_name_len:	INTEGER): INTEGER is
--	The GetClassName function retrieves the name of the class to which the 
--	specified window belongs. 
		external "C use <windows.h>"
		end -- GetClassName
		
	GetClassWord (	a_window: POINTER; a_index: INTEGER): INTEGER is
--	The GetClassWord function retrieves the 16-bit (word) value at the 
--	specified offset into the extra class memory for the window class to 
--	which the specified window belongs. 
--
--	Other than GCW_ATOM and GCW_HICONSM, the GCW_ values are obsolete in 
--	the Win32 API. You must use the GetClassLong function to retrieve the 
--	class values of a window. 
		external "C use <windows.h>"
		end -- GetClassWord
		
	GetWindowLong (	a_window: POINTER; a_index: INTEGER): INTEGER is
--	The GetWindowLong function retrieves information about the specified
--	window. The function also retrieves the 32-bit (long) value at the
--	specified offset into the extra window memory of a window. 
		external "C use <windows.h>"
		end -- GetWindowLong
		
	GetWindowWord (	a_window: POINTER; a_index: INTEGER): INTEGER is
--	The GetWindowWord function retrieves a 16-bit (word) value at the
--	specified offset into the extra window memory for the specified window. 
		external "C use <windows.h>"
		end -- GetWindowWord
		
	RegisterClass (a_class: POINTER): INTEGER is
--	RegisterClass (a_class: WIN32_WNDCLASS): INTEGER is
--	The RegisterClass function registers a window class for subsequent
--	use in calls to the CreateWindow or CreateWindowEx function. 
--
--	The RegisterClass function has been superseded by the
--	RegisterClassEx function. You can still use RegisterClass, however,
--	if you do not need to set the class small icon. 
		external "C use <windows.h>"
		end -- RegisterClass
		
	RegisterClassEx (a_class: POINTER): INTEGER is
--	RegisterClassEx (a_class: WIN32_WNDCLASSEX): INTEGER is
--	The RegisterClassEx function registers a window class for subsequent
--	use in calls to the CreateWindow or CreateWindowEx function.
--	The RegisterClass function does not allow you to set the small icon. 
		external "C use <windows.h>"
		end -- RegisterClassEx
		
	SetClassLong (a_window: POINTER; a_index: INTEGER; a_value: INTEGER): INTEGER is
--	The SetClassLong function replaces the specified 32-bit (long) value at 
--	the specified offset into the extra class memory or the WNDCLASS 
--	structure for the class to which the specified window belongs. 
		external "C use <windows.h>"
		end -- SetClassLong
		
	SetClassWord (a_window: POINTER; a_index: INTEGER; a_value: INTEGER): INTEGER is
--	The SetClassWord function replaces the 16-bit (word) value at the 
--	specified offset into the extra class memory for the window class to 
--	which the specified window belongs
		external "C use <windows.h>"
		end -- SetClassWord
		
	SetWindowWord (	a_window: POINTER; a_index: INTEGER; a_value: INTEGER): INTEGER is
--	The SetWindowWord function replaces the 16-bit (word) value at the
--	specified offset into the extra window memory for the specified window.
		external "C use <windows.h>"
		end -- SetWindowWord
		
	UnregisterClass (a_name: POINTER; a_instance: POINTER): BOOLEAN is
--	UnregisterClass (a_name: STRING; a_instance: POINTER): BOOLEAN is
--	The UnregisterClass function removes a window class, freeing the
--	memory required for the class. 
		external "C use <windows.h>"
		end -- UnregisterClass
		
end -- class WIN32_WINDOW_CLASSES