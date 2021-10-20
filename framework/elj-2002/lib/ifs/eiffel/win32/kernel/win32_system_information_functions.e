class WIN32_SYSTEM_INFORMATION_FUNCTIONS

feature {NONE}

	-- AbortSystemShutdown

	AbortSystemShutdown (a_MachineName : POINTER) : BOOLEAN is
			-- The AbortSystemShutdown function stops a system shutdown
			-- started by using the InitiateSystemShutdown function.
		external "C use <windows.h>"
		end -- AbortSystemShutdown

	-- ExpandEnvironmentStrings

	ExpandEnvironmentStrings (a_Src : POINTER;
				a_Dst : POINTER;
				a_nSize : INTEGER) : INTEGER is
			-- The ExpandEnvironmentStrings function expands environment-variable
			-- strings and replaces them with their defined values.
			--
		external "C use <windows.h>"
		end -- ExpandEnvironmentStrings

	-- 

	GetComputerName : POINTER is
		external "C use <windows.h>"
		end -- GetComputerName

	-- GetComputerName

	-- GetSysColor

	GetSysColor (a_nIndex : INTEGER) : INTEGER is
			-- The GetSysColor function retrieves the current color
			-- of the specified display element. Display elements
			-- are the parts of a window and the Windows display that
			-- appear on the system display screen.
		external "C use <windows.h>"
		end -- GetSysColor

	-- GetSystemDirectory

	GetSystemDirectory (a_Buffer : POINTER;
				a_uSize : INTEGER) : INTEGER is
--	GetSystemDirectory (a_Buffer : STRING;
--				a_uSize : INTEGER) : INTEGER is
			-- The GetSystemDirectory function retrieves the path
			-- of the Windows system directory. The system directory
			-- contains such files as Windows libraries, drivers,
			-- and font files.
		external "C use <windows.h>"
		end -- GetSystemDirectory

	-- GetSystemInfo

	GetSystemInfo (a_SystemInfo : POINTER) is
--	GetSystemInfo (a_SystemInfo : WIN32_SYSTEM_INFO) is
			-- The GetSystemInfo function returns information about
			-- the current system.
		external "C use <windows.h>"
		end -- GetSystemInfo

	-- GetSystemMetrics

	GetSystemMetrics (a_nIndex : INTEGER) : INTEGER is
			-- The GetSystemMetrics function retrieves various system
			-- metrics and system configuration settings. System metrics
			-- are the dimensions (widths and heights) of Windows
			-- display elements. All dimensions retrieved by GetSystemMetrics
			-- are in pixels.
		external "C use <windows.h>"
		end -- GetSystemMetrics

	-- GetUserName

	GetUserName (a_Buffer : POINTER;
				a_nSize_deref : POINTER) : BOOLEAN is
--	GetUserName (a_Buffer : STRING;
--				a_nSize_deref : INTEGER_REF) : BOOLEAN is
			-- The GetUserName function retrieves the user name of
			-- the current thread. This is the name of the user currently
			-- logged onto the system.
		external "C use <windows.h>"
		end -- GetUserName

	-- GetVersionEx

	GetVersionEx (a_VersionInformation : POINTER) : BOOLEAN is
--	GetVersionEx (a_VersionInformation : WIN32_OSVERSIONINFO) : BOOLEAN is
			-- The GetVersionEx function obtains extended information
			-- about the version of the operating system that is currently
			-- running.
		external "C use <windows.h>"
		end -- GetVersionEx

	-- GetWindowsDirectory

	GetWindowsDirectory (a_Buffer : POINTER;
				a_uSize : INTEGER) : INTEGER is
--	GetWindowsDirectory (a_Buffer : STRING;
--				a_uSize : INTEGER) : INTEGER is
			-- The GetWindowsDirectory function retrieves the path
			-- of the Windows directory. The Windows directory contains
			-- such files as Windows-based applications, initialization
			-- files, and Help files.
		external "C use <windows.h>"
		end -- GetWindowsDirectory

	-- SetComputerName

	SetComputerName (a_szName : POINTER) : BOOLEAN is
			-- The SetComputerName function sets the computer name
			-- to be used the next time the system is restarted.
		external "C use <windows.h>"
		end -- SetComputerName

	-- SetSysColors

	-- SystemParametersInfo

	SystemParametersInfo (a_uiAction : INTEGER;
				a_uiParam : INTEGER;
				a_pvParam_deref : POINTER;
				a_fWinIni : INTEGER) : BOOLEAN is
			-- The SystemParametersInfo function queries or sets
			-- systemwide parameters. This function can also update
			-- the user profile while setting a parameter.
		external "C use <windows.h>"
		end -- SystemParametersInfo

end -- class WIN32_SYSTEM_INFORMATION_FUNCTIONS
