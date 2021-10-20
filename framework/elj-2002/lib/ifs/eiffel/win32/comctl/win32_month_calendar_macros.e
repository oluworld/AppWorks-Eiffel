indexing
	contents: "WIN32 Month Calendar Macros"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_MONTH_CALENDAR_MACROS

feature {NONE}

	MonthCal_GetColor (a_hwndMC : POINTER;
		a_iColor : INTEGER) : INTEGER is
			-- Retrieves the color for a given portion of a month
			-- calendar control. You can use this macro or send the
			-- MCM_GETCOLOR message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_GetColor

	MonthCal_GetCurSel (a_hwndMC : POINTER;
		a_pSysTime : POINTER) : BOOLEAN is
			-- Retrieves the currently selected date. You can use
			-- this macro or send the MCM_GETCURSEL message explicitly.
			-- NOTE: a_pSysTime is pointer from WIN32_SYSTEMTIME
		external "C use <windows.h>"
		end -- MonthCal_GetCurSel

	MonthCal_GetFirstDayOfWeek (a_hwndMC : POINTER) : INTEGER is
			-- Retrieves the first day of the week for a month calendar
			-- control. You can use this macro or send the MCM_GETFIRSTDAYOFWEEK
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_GetFirstDayOfWeek

	MonthCal_GetMaxSelCount (a_hwndMC : POINTER) : INTEGER is
			-- Retrieves the maximum date range that can be selected
			-- in a month calendar control. You can use this macro
			-- or send the MCM_GETMAXSELCOUNT message explicitly.
		external "C use <windows.h>"
		end -- MonthCal_GetMaxSelCount

	MonthCal_GetMaxTodayWidth (a_hwndMC : POINTER) : INTEGER is
			-- Retrieves the maximum width of the "today" string
			-- in a month calendar control. This includes the label
			-- text and the date text. You can use this macro or send
			-- the MCM_GETMAXTODAYWIDTH message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_GetMaxTodayWidth

	MonthCal_GetMinReqRect (a_hwndMC : POINTER;
		a_pRectInfo : POINTER) : BOOLEAN is
			-- Retrieves the minimum size required to display a full
			-- month in a month calendar control. Size information
			-- is presented in the form of a RECT structure. You can
			-- use this macro or send the MCM_GETMINREQRECT message
			-- explicitly. 
			-- NOTE: a_pRectInfo is pointer from WIN32_RECT
		external "C use <windows.h>"
		end -- MonthCal_GetMinReqRect

	MonthCal_GetMonthDelta (a_hwndMC : POINTER) : INTEGER is
			-- Retrieves the scroll rate for a month calendar control.
			-- The scroll rate is the number of months that the control
			-- moves its display when the user clicks a scroll button.
			-- You can use this macro or send the MCM_GETMONTHDELTA
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_GetMonthDelta

	MonthCal_GetMonthRange (a_hwndMC : POINTER;
		a_dwFlag : INTEGER;
		a_prgSysTimeArray : POINTER) : INTEGER is
			-- Retrieves date information (using SYSTEMTIME structures)
			-- that represents the high and low limits of a month
			-- calendar control's display. You can use this macro
			-- or send the MCM_GETMONTHRANGE message explicitly. 
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_GetMonthRange

	MonthCal_GetRange (a_hwndMC : POINTER;
		a_prgSysTimeArray : POINTER) : INTEGER is
			-- Retrieves the minimum and maximum allowable dates
			-- set for a month calendar control. You can use this
			-- macro or send the MCM_GETRANGE message explicitly.
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_GetRange

	MonthCal_GetSelRange (a_hwndMC : POINTER;
		a_prgSysTimeArray : POINTER) : BOOLEAN is
			-- Retrieves date information that represents the upper
			-- and lower limits of the date range currently selected
			-- by the user. You can use this macro or send the MCM_GETSELRANGE
			-- message explicitly. 
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_GetSelRange

	MonthCal_GetToday (a_hwndMC : POINTER;
		a_pToday : WIN32_SYSTEMTIME) : BOOLEAN is
			-- Retrieves the date information for the date specified
			-- as "today" for a month calendar control. You can use
			-- this macro or send the MCM_GETTODAY message explicitly.
		external "C use <windows.h>"
		end -- MonthCal_GetToday

	MonthCal_GetUnicodeFormat (a_hwnd : POINTER) : BOOLEAN is
			-- Retrieves the UNICODE character format flag for the
			-- control. You can use this macro or send the MCM_GETUNICODEFORMAT
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_GetUnicodeFormat

	MonthCal_HitTest (a_hwndMC : POINTER;
		a_MCHitTest : WIN32_MCHITTESTINFO) : INTEGER is
			-- Determines which portion of a month calendar control
			-- is at a given point on the screen. You can use this
			-- macro or send the MCM_HITTEST message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_HitTest

	MonthCal_SetColor (a_hwndMC : POINTER;
		a_iColor : INTEGER;
		a_clr : INTEGER) : INTEGER is
			-- Sets the color for a given portion of a month calendar
			-- control. You can use this macro or send the MCM_SETCOLOR
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_SetColor

	MonthCal_SetCurSel (a_hwndMC : POINTER;
		a_pSysTime : POINTER) : BOOLEAN is
			-- Sets the currently selected date for a month calendar
			-- control. If the specified date is not in view, the
			-- control updates the display to bring it into view.
			-- You can use this macro or send the MCM_SETCURSEL message
			-- explicitly. 
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_SetCurSel

	MonthCal_SetDayState (a_hwndMC : POINTER;
		a_iMonths : INTEGER;
		a_pDayStateArray : POINTER) : BOOLEAN is
			-- Sets the day states for all months that are currently
			-- visible within a month calendar control. You can use
			-- this macro or send the MCM_SETDAYSTATE message explicitly.
		external "C use <windows.h>"
		end -- MonthCal_SetDayState

	MonthCal_SetFirstDayOfWeek (a_hwndMC : POINTER;
		a_iDay : INTEGER) : INTEGER is
			-- Sets the first day of the week for a month calendar
			-- control. You can use this macro or send the MCM_SETFIRSTDAYOFWEEK
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_SetFirstDayOfWeek

	MonthCal_SetMaxSelCount (a_hwndMC : POINTER;
		a_iMax : INTEGER) : BOOLEAN is
			-- Sets the maximum number of days that can be selected
			-- in a month calendar control. You can use this macro
			-- or send the MCM_SETMAXSELCOUNT message explicitly.
		external "C use <windows.h>"
		end -- MonthCal_SetMaxSelCount

	MonthCal_SetMonthDelta (a_hwndMC : POINTER;
		a_iDelta : INTEGER) : INTEGER is
			-- Sets the scroll rate for a month calendar control.
			-- The scroll rate is the number of months that the control
			-- moves its display when the user clicks a scroll button.
			-- You can use this macro or send the MCM_SETMONTHDELTA
			-- message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_SetMonthDelta

	MonthCal_SetRange (a_hwndMC : POINTER;
		a_fWhichLimit : INTEGER;
		a_prgSysTimeArray : POINTER) : BOOLEAN is
			-- Sets the minimum and maximum allowable dates for a
			-- month calendar control. You can use this macro or send
			-- the MCM_SETRANGE message explicitly. 
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_SetRange

	MonthCal_SetSelRange (a_hwndMC : POINTER;
		a_prgSysTimeArray : POINTER) : BOOLEAN is
			-- Sets the selection for a month calendar control to
			-- a given date range. You can use this macro or send
			-- the MCM_SETSELRANGE message explicitly. 
			-- a_prgSysTimeArray is a pointer from C_STRUCT_ARRAY[WIN32_SYSTEMTIME] equivalent
		external "C use <windows.h>"
		end -- MonthCal_SetSelRange

	MonthCal_SetToday (a_hwndMC : POINTER;
		a_pSysTime : POINTER) is
			-- Sets the "today" selection for a month calendar control.
			-- You can use this macro or send the MCM_SETTODAY message
			-- explicitly. 
			-- NOTE: a_pSysTime is pointer from WIN32_SYSTEMTIME
		external "C use <windows.h>"
		end -- MonthCal_SetToday

	MonthCal_SetUnicodeFormat (a_hwnd : POINTER;
		a_fUnicode : BOOLEAN) : BOOLEAN is
			-- Sets the UNICODE character format flag for the control.
			-- This message allows you to change the character set
			-- used by the control at run time rather than having
			-- to re-create the control. You can use this macro or
			-- send the MCM_SETUNICODEFORMAT message explicitly. 
		external "C use <windows.h>"
		end -- MonthCal_SetUnicodeFormat

end -- class WIN32_MONTH_CALENDAR_MACROS