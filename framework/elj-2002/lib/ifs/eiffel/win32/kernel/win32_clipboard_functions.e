class WIN32_CLIPBOARD_FUNCTIONS

feature {NONE}

	-- ChangeClipboardChain

	ChangeClipboardChain (a_hWndRemove : POINTER;
		a_hWndNewNext : POINTER) : BOOLEAN  is
			-- The ChangeClipboardChain function removes a specified
			-- window from the chain of clipboard viewers. 
		require
			not_void_a_hWndRemove : a_hWndRemove /= Void
			not_void_a_hWndNewNext : a_hWndNewNext /= Void
		external "C use <windows.h>"
		end -- ChangeClipboardChain

	-- CloseClipboard

	CloseClipboard : BOOLEAN  is
			-- The CloseClipboard function closes the clipboard.
		external "C use <windows.h>"
		end -- CloseClipboard

	-- CountClipboardFormats

	CountClipboardFormats : INTEGER  is
			-- The CountClipboardFormats function retrieves the number
			-- of different data formats currently on the clipboard.
		external "C use <windows.h>"
		end -- CountClipboardFormats

	-- EmptyClipboard

	EmptyClipboard : BOOLEAN  is
			-- The EmptyClipboard function empties the clipboard
			-- and frees handles to data in the clipboard. The function
			-- then assigns ownership of the clipboard to the window
			-- that currently has the clipboard open. 
		external "C use <windows.h>"
		end -- EmptyClipboard

	-- EnumClipboardFormats

	EnumClipboardFormats (a_format : INTEGER) : INTEGER  is
			-- The EnumClipboardFormats function lets you enumerate
			-- the data formats that are currently available on the
			-- clipboard. Clipboard data formats are stored in an
			-- ordered list. To perform an enumeration of clipboard
			-- data formats, you make a series of calls to the EnumClipboardFormats
			-- function. For each call, the format parameter specifies
			-- an available clipboard format, and the function returns
			-- the next available clipboard format. 
		external "C use <windows.h>"
		end -- EnumClipboardFormats

	-- GetClipboardData

	GetClipboardData (a_uFormat : INTEGER) : POINTER  is
			-- The GetClipboardData function retrieves data from
			-- the clipboard in a specified format. The clipboard
			-- must have been opened previously. 
		external "C use <windows.h>"
		end -- GetClipboardData

	-- GetClipboardFormatName

	GetClipboardFormatName (a_format : INTEGER;
		a_pszFormatName : POINTER;
		a_cchMaxCount : INTEGER) : INTEGER  is
			-- The GetClipboardFormatName function retrieves from
			-- the clipboard the name of the specified registered
			-- format. The function copies the name to the specified
			-- buffer. 
		external "C use <windows.h>"
		end -- GetClipboardFormatName

	-- GetClipboardOwner

	GetClipboardOwner : POINTER  is
			-- The GetClipboardOwner function retrieves the window
			-- handle of the current owner of the clipboard. 
		external "C use <windows.h>"
		end -- GetClipboardOwner

	-- GetClipboardViewer

	GetClipboardViewer : POINTER  is
			-- The GetClipboardViewer function retrieves the handle
			-- of the first window in the clipboard viewer chain.
		external "C use <windows.h>"
		end -- GetClipboardViewer

	-- GetOpenClipboardWindow

	GetOpenClipboardWindow : POINTER  is
			-- The GetOpenClipboardWindow function retrieves the
			-- handle of the window that currently has the clipboard
			-- open. 
		external "C use <windows.h>"
		end -- GetOpenClipboardWindow

	-- GetPriorityClipboardFormat

	GetPriorityClipboardFormat (a_aFormatPriorityList : POINTER;
		a_cFormats : INTEGER) : INTEGER  is
--	GetPriorityClipboardFormat (a_aFormatPriorityList : INTEGER_REF;
--		a_cFormats : INTEGER) : INTEGER  is
			-- The GetPriorityClipboardFormat function returns the
			-- first available clipboard format in the specified list.
		external "C use <windows.h>"
		end -- GetPriorityClipboardFormat

	-- IsClipboardFormatAvailable

	IsClipboardFormatAvailable (a_format : INTEGER) : BOOLEAN  is
			-- The IsClipboardFormatAvailable function determines
			-- whether the clipboard contains data in the specified
			-- format. 
		external "C use <windows.h>"
		end -- IsClipboardFormatAvailable

	-- OpenClipboard

	OpenClipboard (a_hwnd : POINTER) : BOOLEAN  is
			-- The OpenClipboard function opens the clipboard for
			-- examination and prevents other applications from modifying
			-- the clipboard content. 
		require
			not_void_a_hwnd : a_hwnd /= Void
		external "C use <windows.h>"
		end -- OpenClipboard

	-- RegisterClipboardFormat

	RegisterClipboardFormat (a_pszFormat : POINTER) : INTEGER  is
--	RegisterClipboardFormat (a_pszFormat : STRING) : INTEGER  is
			-- The RegisterClipboardFormat function registers a new
			-- clipboard format. This format can then be used as a
			-- valid clipboard format. 
		external "C use <windows.h>"
		end -- RegisterClipboardFormat

	-- SetClipboardData

	SetClipboardData (a_uFormat : INTEGER;
		a_hData : POINTER) : POINTER  is
			-- The SetClipboardData function places data on the clipboard
			-- in a specified clipboard format. The window must be
			-- the current clipboard owner, and the application must
			-- have called the OpenClipboard function. (When responding
			-- to the WM_RENDERFORMAT and WM_RENDERALLFORMATS messages,
			-- the clipboard owner must not call OpenClipboard before
			-- calling SetClipboardData.) 
		require
			not_void_a_hData : a_hData /= Void
		external "C use <windows.h>"
		end -- SetClipboardData

	-- SetClipboardViewer

	SetClipboardViewer (a_hwnd : POINTER) : POINTER  is
			-- The SetClipboardViewer function adds the specified
			-- window to the chain of clipboard viewers. Clipboard
			-- viewer windows receive a WM_DRAWCLIPBOARD message whenever
			-- the content of the clipboard changes. 
		require
			not_void_a_hwnd : a_hwnd /= Void
		external "C use <windows.h>"
		end -- SetClipboardViewer

end -- class WIN32_CLIPBOARD_FUNCTIONS
