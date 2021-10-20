indexing
	contents: "WIN32 keyboard functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: no
	tested: no

class WIN32_KEYBOARD_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used to receive and process keyboard input. 
--
--	ActivateKeyboardLayout
--	EnableWindow
--	GetActiveWindow
--	GetAsyncKeyState
--	GetFocus
--	GetKeyboardLayoutName
--	GetKeyboardState
--	GetKeyNameText
--	GetKeyState
--	IsWindowEnabled
--	keybd_event
--	LoadKeyboardLayout
--	MapVirtualKey
--	OemKeyScan
--	RegisterHotKey
--	SetActiveWindow
--	SetFocus
--	SetKeyboardState
--	ToAscii
--	ToUnicode
--	UnloadKeyboardLayout
--	UnregisterHotKey
--	VkKeyScan
--
--	Obsolete or Deleted Functions
--
--	GetKBCodePage
--	------------------------------------------------------------------------

feature {NONE}

	-- ActivateKeyboardLayout

	ActivateKeyboardLayout (a_hkl 	: POINTER;
							a_Flags : INTEGER) : POINTER  is
			-- The implementations of ActivateKeyboardLayout in Windows
			-- 95 and Windows NT are substantially different. To accommodate
			-- these differences, this reference page first presents
			-- the Windows 95 implementation in its entirety, followed
			-- by the Windows NT version. Windows 95: The ActivateKeyboardLayout
			-- function sets the input language for the current thread.
			-- This function accepts a keyboard layout handle that
			-- identifies a locale as well as the physical layout
			-- of the keyboard.

		external "C use <windows.h>"
		end -- ActivateKeyboardLayout

	-- GetActiveWindow

	GetActiveWindow : POINTER  is
			-- The GetActiveWindow function retrieves the window
			-- handle to the active window associated with the thread
			-- that calls the function. 
		external "C use <windows.h>"
		end -- GetActiveWindow

	-- GetAsyncKeyState

	GetAsyncKeyState (a_vKey : INTEGER) : INTEGER  is
			-- The GetAsyncKeyState function determines whether a
			-- key is up or down at the time the function is called,
			-- and whether the key was pressed after a previous call
			-- to GetAsyncKeyState. 
		external "C use <windows.h>"
		end -- GetAsyncKeyState

	-- GetFocus

	GetFocus : POINTER  is
			-- The GetFocus function retrieves the handle of the
			-- window that has the keyboard focus, if the window is
			-- associated with the calling thread's message queue.
		external "C use <windows.h>"
		end -- GetFocus

	-- GetKeyboardLayoutName

	GetKeyboardLayoutName (a_pwszKLID_deref : POINTER) : BOOLEAN  is
--	GetKeyboardLayoutName (a_pwszKLID_deref : STRING) : BOOLEAN  is
			-- The GetKeyboardLayoutName function retrieves the name
			-- of the active keyboard layout. 
		external "C use <windows.h>"
		end -- GetKeyboardLayoutName

	-- GetKeyboardState

	GetKeyboardState (a_KeyState : POINTER) : BOOLEAN  is
--	GetKeyboardState (a_KeyState : INTEGER_REF) : BOOLEAN  is
			-- The GetKeyboardState function copies the status of
			-- the 256 virtual keys to the specified buffer. 
		external "C use <windows.h>"
		end -- GetKeyboardState

	-- GetKeyNameText

	GetKeyNameText (a_lParam : INTEGER;
					a_String : POINTER;
					a_nSize : INTEGER) : INTEGER  is
--	GetKeyNameText (a_lParam : INTEGER;
--					a_String : STRING;
--					a_nSize : INTEGER) : INTEGER  is
			-- The GetKeyNameText function retrieves a string that
			-- represents the name of a key. 
		external "C use <windows.h>"
		end -- GetKeyNameText

	-- GetKeyState

	GetKeyState (a_nVirtKey : INTEGER) : INTEGER  is
			-- The GetKeyState function retrieves the status of the
			-- specified virtual key. The status specifies whether
			-- the key is up, down, or toggled (on, off 3/4 alternating
			-- each time the key is pressed). 
		external "C use <windows.h>"
		end -- GetKeyState

	-- IsWindowEnabled

	IsWindowEnabled (a_hWnd : POINTER) : BOOLEAN  is
			-- The IsWindowEnabled function determines whether the
			-- specified window is enabled for mouse and keyboard
			-- input. 
		external "C use <windows.h>"
		end -- IsWindowEnabled

	-- keybd_event

	keybd_event(a_bVk 			: INTEGER;
				a_bScan 		: INTEGER;
				a_dwFlags 		: INTEGER;
				a_dwExtraInfo 	: INTEGER) is
			-- The keybd_event function synthesizes a keystroke.
			-- The system can use such a synthesized keystroke to
			-- generate a WM_KEYUP or WM_KEYDOWN message. The keyboard
			-- driver's interrupt handler calls the keybd_event function.
			-- 
		external "C use <windows.h>"
		end -- keybd_event

	-- LoadKeyboardLayout

	LoadKeyboardLayout (a_pwszKLID_deref : POINTER;
						a_Flags : INTEGER) : POINTER  is
--	LoadKeyboardLayout (a_pwszKLID_deref : STRING;
--						a_Flags : INTEGER) : POINTER  is
			-- The implementations of LoadKeyboardLayout in Windows
			-- 95 and Windows NT are substantially different. To accommodate
			-- these differences, this reference page first presents
			-- the Windows 95 implementation in its entirety, followed
			-- by the Windows NT version. Windows 95: The LoadKeyboardLayout
			-- function loads a new keyboard layout into the system.
			-- Several keyboard layouts can be loaded at a time, but
			-- only one per process is active at a time. Loading multiple
			-- keyboard layouts makes it possible to rapidly switch
			-- between layouts.

		external "C use <windows.h>"
		end -- LoadKeyboardLayout

	-- MapVirtualKey

	MapVirtualKey (	a_uCode 	: INTEGER;
					a_uMapType	: INTEGER) : INTEGER  is
			-- The MapVirtualKey function translates (maps) a virtual-key
			-- code into a scan code or character value, or translates
			-- a scan code into a virtual-key code. 
		external "C use <windows.h>"
		end -- MapVirtualKey

	-- OemKeyScan

	OemKeyScan (a_wOemChar : INTEGER) : INTEGER  is
			-- The OemKeyScan function maps OEM ASCII codes 0 through
			-- 0x0FF into the OEM scan codes and shift states. The
			-- function provides information that allows a program
			-- to send OEM text to another program by simulating keyboard
			-- input. 
		external "C use <windows.h>"
		end -- OemKeyScan

	-- RegisterHotKey

	RegisterHotKey (a_hwnd 			: POINTER;
					a_idHotKey 		: INTEGER;
					a_fuModifiers	: BIT 32;
					a_uVirtKey 		: INTEGER) : BOOLEAN  is
			-- The RegisterHotKey function defines a hot key for
			-- the current thread.

		external "C use <windows.h>"
		end -- RegisterHotKey

	-- SetActiveWindow

	SetActiveWindow (a_hwnd : POINTER) : POINTER  is
			-- The SetActiveWindow function makes the specified top-level
			-- window associated with the thread calling this function
			-- the active window. 
		external "C use <windows.h>"
		end -- SetActiveWindow

	-- SetFocus

	SetFocus (a_hwnd : POINTER) : POINTER  is
			-- The SetFocus function sets the keyboard focus to the
			-- specified window. All subsequent keyboard input is
			-- directed to this window. The window, if any, that previously
			-- had the keyboard focus loses it. 
		external "C use <windows.h>"
		end -- SetFocus

	-- SetKeyboardState

	SetKeyboardState (a_bKeyState : POINTER) : BOOLEAN  is
--	SetKeyboardState (a_bKeyState : INTEGER_REF) : BOOLEAN  is
			-- The SetKeyboardState function copies a 256-byte array
			-- of keyboard key states into the calling thread's keyboard-input
			-- state table. This is the same table accessed by the
			-- GetKeyboardState and GetKeyState functions. Changes
			-- made to this table do not affect keyboard input to
			-- any other thread. 
		external "C use <windows.h>"
		end -- SetKeyboardState

	-- ToAscii

	ToAscii (	a_uVirtKey	: INTEGER;
				a_uScanCode : INTEGER;
				a_bKeyState : POINTER;
				a_wTransKey : POINTER;
				a_fuState 	: INTEGER) : INTEGER  is
--	ToAscii (	a_uVirtKey	: INTEGER;
--				a_uScanCode : INTEGER;
--				a_bKeyState : INTEGER_REF;
--				a_wTransKey : INTEGER_REF;
--				a_fuState 	: INTEGER) : INTEGER  is
			-- The ToAscii function translates the specified virtual-key
			-- code and keyboard state to the corresponding Windows
			-- character or characters. 
		external "C use <windows.h>"
		end -- ToAscii

	-- ToUnicode

	ToUnicode (	a_wVirtKey		: INTEGER;
				a_wScanCode		: INTEGER;
				a_KeyState		: POINTER;
				a_pwszBuff_deref: POINTER;
				a_cchBuff		: INTEGER;
				a_wFlags		: INTEGER) : INTEGER  is
--	ToUnicode (	a_wVirtKey		: INTEGER;
--				a_wScanCode		: INTEGER;
--				a_KeyState		: INTEGER_REF;
--				a_pwszBuff_deref: STRING;
--				a_cchBuff		: INTEGER;
--				a_wFlags		: INTEGER) : INTEGER  is
			-- The ToUnicode function translates the specified virtual-key
			-- code and keyboard state to the corresponding Unicode
			-- character or characters. 
		external "C use <windows.h>"
		end -- ToUnicode

	-- UnloadKeyboardLayout

	UnloadKeyboardLayout (a_hkl : POINTER) : BOOLEAN  is
			-- The UnloadKeyboardLayout function removes a keyboard
			-- layout. 
		external "C use <windows.h>"
		end -- UnloadKeyboardLayout

	-- UnregisterHotKey

	UnregisterHotKey (	a_hwnd : POINTER;
						a_idHotKey : INTEGER) : BOOLEAN  is
			-- The UnregisterHotKey function frees a hot key previously
			-- registered by the calling thread. 
		external "C use <windows.h>"
		end -- UnregisterHotKey

	-- VkKeyScan

	VkKeyScan (a_ch : CHARACTER) : INTEGER  is
			-- The VkKeyScan function translates a character to the
			-- corresponding virtual-key code and shift state for
			-- the current keyboard. 
		external "C use <windows.h>"
		end -- VkKeyScan

end -- class WIN32_KEYBOARD_FUNCTIONS