class WIN32_TIME_FUNCTIONS


feature {NONE}

	-- CompareFileTime

	CompareFileTime (a_pFileTime1 : POINTER;
		a_pFileTime2 : POINTER) : INTEGER is
--	CompareFileTime (a_pFileTime1 : WIN32_FILETIME;
--		a_pFileTime2 : WIN32_FILETIME) : INTEGER is
			--  The CompareFileTime function compares two 64-bit file
			-- times. 
		external "C use <windows.h>"
		end -- CompareFileTime

	-- DosDateTimeToFileTime

	DosDateTimeToFileTime (a_wFatDate : INTEGER;
		a_wFatTime : INTEGER;
		a_pFileTime : POINTER) : BOOLEAN is
--	DosDateTimeToFileTime (a_wFatDate : INTEGER;
--		a_wFatTime : INTEGER;
--		a_pFileTime : WIN32_FILETIME) : BOOLEAN is
			--  The DosDateTimeToFileTime function converts MS-DOS
			-- date and time values to a 64-bit file time. 
		external "C use <windows.h>"
		end -- DosDateTimeToFileTime

	-- FileTimeToDosDateTime

	FileTimeToDosDateTime (a_pFileTime : POINTER;
		a_pFatDate : POINTER;
		a_pFatTime : POINTER) : BOOLEAN is
--	FileTimeToDosDateTime (a_pFileTime : WIN32_FILETIME;
--		a_pFatDate : INTEGER_REF;
--		a_pFatTime : INTEGER_REF) : BOOLEAN is
			--  The FileTimeToDosDateTime function converts a 64-bit
			-- file time to MS-DOS date and time values. 
		external "C use <windows.h>"
		end -- FileTimeToDosDateTime

	-- FileTimeToLocalFileTime

	FileTimeToLocalFileTime (a_pFileTime : POINTER;
		a_pLocalFileTime : POINTER) : BOOLEAN is
--	FileTimeToLocalFileTime (a_pFileTime : WIN32_FILETIME;
--		a_pLocalFileTime : WIN32_FILETIME) : BOOLEAN is
			--  The FileTimeToLocalFileTime function converts a file
			-- time based on the Coordinated Universal Time (UTC)
			-- to a local file time. 
		external "C use <windows.h>"
		end -- FileTimeToLocalFileTime

	-- FileTimeToSystemTime

	FileTimeToSystemTime (a_pFileTime : POINTER;
		a_pSystemTime : POINTER) : BOOLEAN is
--	FileTimeToSystemTime (a_pFileTime : WIN32_FILETIME;
--		a_pSystemTime : WIN32_SYSTEMTIME) : BOOLEAN is
			--  The FileTimeToSystemTime function converts a 64-bit
			-- file time to system time format. 
		external "C use <windows.h>"
		end -- FileTimeToSystemTime

	-- GetCurrentTime

	GetCurrentTime : INTEGER is
			--  The GetCurrentTime function retrieves the number of
			-- milliseconds that have elapsed since Windows was started.
			-- 
		external "C use <windows.h>"
		end -- GetCurrentTime

	-- GetFileTime

	GetFileTime (a_hFile : POINTER;
		a_pCreationTime : POINTER;
		a_pLastAccessTime : POINTER;
		a_pLastWriteTime : POINTER) : BOOLEAN is
--	GetFileTime (a_hFile : POINTER;
--		a_pCreationTime : WIN32_FILETIME;
--		a_pLastAccessTime : WIN32_FILETIME;
--		a_pLastWriteTime : WIN32_FILETIME) : BOOLEAN is
			--  The GetFileTime function retrieves the date and time
			-- that a file was created, last accessed, and last modified.
			-- 
		external "C use <windows.h>"
		end -- GetFileTime

	-- GetLocalTime

	GetLocalTime (a_pSystemTime : POINTER) is
--	GetLocalTime (a_pSystemTime : WIN32_SYSTEMTIME) is
			--  The GetLocalTime function retrieves the current local
			-- date and time. 
		external "C use <windows.h>"
		end -- GetLocalTime

	-- GetSystemTime

	GetSystemTime (a_pSystemTime : POINTER) is
--	GetSystemTime (a_pSystemTime : WIN32_SYSTEMTIME) is
			--  The GetSystemTime function retrieves the current system
			-- date and time. The system time is expressed in Coordinated
			-- Universal Time (UTC). 
		external "C use <windows.h>"
		end -- GetSystemTime

	-- GetSystemTimeAdjustment

	GetSystemTimeAdjustment (a_pTimeAdjustment : POINTER;
		a_pTimeIncrement : POINTER;
		a_pTimeAdjustmentDisabled : POINTER) : BOOLEAN is
--	GetSystemTimeAdjustment (a_pTimeAdjustment : INTEGER_REF;
--		a_pTimeIncrement : INTEGER_REF;
--		a_pTimeAdjustmentDisabled : BOOLEAN_REF) : BOOLEAN is
			--  The GetSystemTimeAdjustment function determines whether
			-- the system is applying periodic time adjustments to
			-- its time-of-day clock at each clock interrupt, along
			-- with the value and period of any such adjustments.
			-- Note that the period of such adjustments is equivalent
			-- to the time period between clock interrupts.
		external "C use <windows.h>"
		end -- GetSystemTimeAdjustment

	-- GetSystemTimeAsFileTime

	GetSystemTimeAsFileTime (a_pSystemTimeAsFileTime : POINTER) is
--	GetSystemTimeAsFileTime (a_pSystemTimeAsFileTime : WIN32_FILETIME) is
			--  The GetSystemTimeAsFileTime function obtains the current
			-- system date and time. The information is in Coordinated
			-- Universal Time (UTC) format.
		external "C use <windows.h>"
		end -- GetSystemTimeAsFileTime

	-- GetTickCount

--	GetTickCount : INTEGER is
--			--  The GetTickCount function retrieves the number of
--			-- milliseconds that have elapsed since Windows was started.
--			-- 
--		external "C use <windows.h>"
--		alias "GetTickCount"
--		end -- GetTickCount

	-- GetTimeZoneInformation

	GetTimeZoneInformation (a_pTimeZoneInformation : POINTER) : INTEGER is
--	GetTimeZoneInformation (a_pTimeZoneInformation : WIN32_TIME_ZONE_INFORMATION) : INTEGER is
			--  The GetTimeZoneInformation function retrieves the
			-- current time-zone parameters. These parameters control
			-- the translations between Coordinated Universal Time
			-- (UTC) and local time. 
		external "C use <windows.h>"
		end -- GetTimeZoneInformation

	-- LocalFileTimeToFileTime

	LocalFileTimeToFileTime (a_pLocalFileTime : POINTER;
		a_pFileTime : POINTER) : BOOLEAN is
--	LocalFileTimeToFileTime (a_pLocalFileTime : WIN32_FILETIME;
--		a_pFileTime : WIN32_FILETIME) : BOOLEAN is
			--  The LocalFileTimeToFileTime function converts a local
			-- file time to a file time based on the Coordinated Universal
			-- Time (UTC). 
		external "C use <windows.h>"
		end -- LocalFileTimeToFileTime

	-- SetFileTime

	SetFileTime (a_hFile : POINTER;
		a_pftCreation : POINTER;
		a_pftLastAccess : POINTER;
		a_pftLastWrite : POINTER) : BOOLEAN is
--	SetFileTime (a_hFile : POINTER;
--		a_pftCreation : WIN32_FILETIME;
--		a_pftLastAccess : WIN32_FILETIME;
--		a_pftLastWrite : WIN32_FILETIME) : BOOLEAN is
			--  The SetFileTime function sets the date and time that
			-- a file was created, last accessed, or last modified.
			-- 
		external "C use <windows.h>"
		end -- SetFileTime

	-- SetLocalTime

	SetLocalTime (a_pst : POINTER) : BOOLEAN is
--	SetLocalTime (a_pst : WIN32_SYSTEMTIME) : BOOLEAN is
			--  The SetLocalTime function sets the current local time
			-- and date. 
		external "C use <windows.h>"
		end -- SetLocalTime

	-- SetSystemTime

	SetSystemTime (a_pst : POINTER) : BOOLEAN is
--	SetSystemTime (a_pst : WIN32_SYSTEMTIME) : BOOLEAN is
			--  The SetSystemTime function sets the current system
			-- time and date. The system time is expressed in Coordinated
			-- Universal Time (UTC). 
		external "C use <windows.h>"
		end -- SetSystemTime

	-- SetSystemTimeAdjustment

	SetSystemTimeAdjustment (a_dwTimeAdjustment : INTEGER;
		a_bTimeAdjustmentDisabled_deref : POINTER) : BOOLEAN is
--	SetSystemTimeAdjustment (a_dwTimeAdjustment : INTEGER;
--		a_bTimeAdjustmentDisabled_deref : BOOLEAN_REF) : BOOLEAN is
			--  The SetSystemTimeAdjustment function tells the system
			-- to enable or disable periodic time adjustments to its
			-- time of day clock. Such time adjustments are used to
			-- synchronize the time of day with some other source
			-- of time information. When periodic time adjustments
			-- are enabled, they are applied at each clock interrupt.
		external "C use <windows.h>"
		end -- SetSystemTimeAdjustment

	-- SetTimeZoneInformation

	SetTimeZoneInformation (a_ptzi : POINTER) : BOOLEAN is
--	SetTimeZoneInformation (a_ptzi : WIN32_TIME_ZONE_INFORMATION) : BOOLEAN is
			--  The SetTimeZoneInformation function sets the current
			-- time-zone parameters. These parameters control translations
			-- from Coordinated Universal Time (UTC) to local time.
			-- 
		external "C use <windows.h>"
		end -- SetTimeZoneInformation

	-- SystemTimeToFileTime

	SystemTimeToFileTime (a_pst : POINTER;
		a_pft : POINTER) : BOOLEAN is
--	SystemTimeToFileTime (a_pst : WIN32_SYSTEMTIME;
--		a_pft : WIN32_FILETIME) : BOOLEAN is
			--  The SystemTimeToFileTime function converts a system
			-- time to a file time. 
		external "C use <windows.h>"
		end -- SystemTimeToFileTime

	-- SystemTimeToTzSpecificLocalTime

	SystemTimeToTzSpecificLocalTime (a_pTimeZoneInformation : POINTER;
		a_pUniversalTime : POINTER;
		a_pLocalTime : POINTER) : BOOLEAN is
--	SystemTimeToTzSpecificLocalTime (a_pTimeZoneInformation : WIN32_TIME_ZONE_INFORMATION;
--		a_pUniversalTime : WIN32_SYSTEMTIME;
--		a_pLocalTime : WIN32_SYSTEMTIME) : BOOLEAN is
			--  The SystemTimeToTzSpecificLocalTime function converts
			-- a Coordinated Universal Time (UTC) to a specified time
			-- zone's corresponding local time.
		external "C use <windows.h>"
		end -- SystemTimeToTzSpecificLocalTime

end -- class WIN32_TIME_FUNCTIONS
