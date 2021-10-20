class WIN32_WINDOW_PROPERTY_FUNCTIONS


feature {NONE}

	-- EnumProps

	EnumProps (a_hWnd : POINTER;
		a_lpEnumFunc : POINTER) : INTEGER is
			-- The EnumProps function enumerates all entries in the
			-- property list of a window by passing them, one by one,
			-- to the specified callback function. EnumProps continues
			-- until the last entry is enumerated or the callback
			-- function returns FALSE. 
		external "C use <windows.h>"
		end -- EnumProps

	-- EnumPropsEx

	EnumPropsEx (a_hWnd : POINTER;
		a_lpEnumFunc : POINTER;
		a_lParam : POINTER) : INTEGER is
			-- The EnumPropsEx function enumerates all entries in
			-- the property list of a window by passing them, one
			-- by one, to the specified callback function. EnumPropsEx
			-- continues until the last entry is enumerated or the
			-- callback function returns FALSE. 
		external "C use <windows.h>"
		end -- EnumPropsEx

	-- GetProp

	GetProp (a_hWnd : POINTER;
		a_pString : POINTER) : POINTER is
			-- The GetProp function retrieves a data handle from
			-- the property list of the given window. The given character
			-- string identifies the handle to be retrieved. The string
			-- and handle must have been added to the property list
			-- by a previous call to the SetProp function. 
		external "C use <windows.h>"
		end -- GetProp

	-- RemoveProp

	RemoveProp (a_hwnd : POINTER;
		a_psz : POINTER) : POINTER is
			-- The RemoveProp function removes an entry from the
			-- property list of the specified window. The specified
			-- character string identifies the entry to be removed.
		external "C use <windows.h>"
		end -- RemoveProp

	-- SetProp

	SetProp (a_hwnd : POINTER;
		a_psz : POINTER;
		a_hData : POINTER) : BOOLEAN is
			-- The SetProp function adds a new entry or changes an
			-- existing entry in the property list of the specified
			-- window. The function adds a new entry to the list if
			-- the specified character string does not exist already
			-- in the list. The new entry contains the string and
			-- the handle. Otherwise, the function replaces the string's
			-- current handle with the specified handle. 
		external "C use <windows.h>"
		end -- SetProp

end -- class WIN32_WINDOW_PROPERTY_FUNCTIONS
