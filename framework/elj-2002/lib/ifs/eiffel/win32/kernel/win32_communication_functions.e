class WIN32_COMMUNICATION_FUNCTIONS

feature {NONE}

	-- BuildCommDCB

	BuildCommDCB (a_pDef : POINTER;
		a_pDCB : POINTER) : BOOLEAN is
--	BuildCommDCB (a_pDef : STRING;
--		a_pDCB : WIN32_DCB) : BOOLEAN  is
			-- The BuildCommDCB function fills a specified DCB structure
			-- with values specified in a device-control string. The
			-- device-control string uses the syntax of the mode command.
		external "C use <windows.h>"
		end -- BuildCommDCB

	-- BuildCommDCBAndTimeouts

	BuildCommDCBAndTimeouts (a_pDef : POINTER;
		a_pDCB : POINTER;
		a_pCommTimeouts : POINTER) : BOOLEAN is
--	BuildCommDCBAndTimeouts (a_pDef : STRING;
--		a_pDCB : WIN32_DCB;
--		a_pCommTimeouts : WIN32_COMMTIMEOUTS) : BOOLEAN  is
			-- The BuildCommDCBAndTimeouts function translates a
			-- device-definition string into appropriate device-control
			-- block codes and then places these codes into a device
			-- control block. The function can also set up time-out
			-- values, including the possibility of no time-outs,
			-- for a device; the function's behavior in this regard
			-- varies based on the contents of the device-definition
			-- string. 
		external "C use <windows.h>"
		end -- BuildCommDCBAndTimeouts

	-- ClearCommBreak

	ClearCommBreak (a_hFile : POINTER) : BOOLEAN is
			-- The ClearCommBreak function restores character transmission
			-- for a specified communications device and places the
			-- transmission line in a nonbreak state. 
		external "C use <windows.h>"
		end -- ClearCommBreak

	-- ClearCommError

	ClearCommError (a_hFile : POINTER;
		a_pErrors : POINTER;
		a_pStat : POINTER) : BOOLEAN is
--	ClearCommError (a_hFile : POINTER;
--		a_pErrors : INTEGER_REF;
--		a_pStat : WIN32_COMSTAT) : BOOLEAN is
			-- The ClearCommError function retrieves information
			-- about a communications error and reports the current
			-- status of a communications device. The function is
			-- called when a communications error occurs, and it clears
			-- the device's error flag to enable additional input
			-- and output (I/O) operations. 
		external "C use <windows.h>"
		end -- ClearCommError

	-- CommConfigDialog

	CommConfigDialog (a_pszName : POINTER;
		a_hWnd : POINTER;
		a_pCC : POINTER) : BOOLEAN is
--	CommConfigDialog (a_pszName : STRING;
--		a_hWnd : POINTER;
--		a_pCC : WIN32_COMMCONFIG) : BOOLEAN is
			-- The CommConfigDialog function displays a driver-supplied
			-- configuration dialog box.
		external "C use <windows.h>"
		end -- CommConfigDialog

	-- DeviceIoControl

	DeviceIoControl (a_hDevice : POINTER;
		a_dwIoControlCode : INTEGER;
		a_lpInBuffer : POINTER;
		a_nInBufferSize : INTEGER;
		a_lpOutBuffer : POINTER;
		a_nOutBufferSize : INTEGER;
		a_pBytesReturned : POINTER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	DeviceIoControl (a_hDevice : POINTER;
--		a_dwIoControlCode : INTEGER;
--		a_lpInBuffer : POINTER;
--		a_nInBufferSize : INTEGER;
--		a_lpOutBuffer : POINTER;
--		a_nOutBufferSize : INTEGER;
--		a_pBytesReturned : INTEGER_REF;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN  is
			-- The DeviceIoControl function sends a control code
			-- directly to a specified device driver, causing the
			-- corresponding device to perform the specified operation.
		external "C use <windows.h>"
		end -- DeviceIoControl

	-- EscapeCommFunction

	EscapeCommFunction (a_hFile : POINTER;
		a_dwFunc : INTEGER) : BOOLEAN is
			-- The EscapeCommFunction function directs a specified
			-- communications device to perform an extended function.
		external "C use <windows.h>"
		end -- EscapeCommFunction

	-- GetCommConfig

	GetCommConfig (a_hCommDev : POINTER;
		a_pCC : POINTER;
		a_pdwSize : POINTER) : BOOLEAN is
--	GetCommConfig (a_hCommDev : POINTER;
--		a_pCC : WIN32_COMMCONFIG;
--		a_pdwSize : INTEGER_REF) : BOOLEAN  is
			-- The GetCommConfig function gets the current configuration
			-- of a communications device.
		external "C use <windows.h>"
		end -- GetCommConfig

	-- GetCommMask

	GetCommMask (a_hFile : POINTER;
		a_pEvtMask : POINTER) : BOOLEAN is
--	GetCommMask (a_hFile : POINTER;
--		a_pEvtMask : INTEGER_REF) : BOOLEAN  is
			-- The GetCommMask function retrieves the value of the
			-- event mask for a specified communications device. 
		external "C use <windows.h>"
		end -- GetCommMask

	-- GetCommModemStatus

	GetCommModemStatus (a_hFile : POINTER;
		a_pModemStat : POINTER) : BOOLEAN is
--	GetCommModemStatus (a_hFile : POINTER;
--		a_pModemStat : INTEGER_REF) : BOOLEAN  is
			-- The GetCommModemStatus function retrieves modem control-register
			-- values. 
		external "C use <windows.h>"
		end -- GetCommModemStatus

	-- GetCommProperties

	GetCommProperties (a_hFile : POINTER;
		a_pCommProp : POINTER) : BOOLEAN is
--	GetCommProperties (a_hFile : POINTER;
--		a_pCommProp : WIN32_COMMPROP) : BOOLEAN  is
			-- The GetCommProperties function fills a buffer with
			-- information about the communications properties for
			-- a specified communications device. 
		external "C use <windows.h>"
		end -- GetCommProperties

	-- GetCommState

	GetCommState (a_hFile : POINTER;
		a_pDCB : POINTER) : BOOLEAN is
--	GetCommState (a_hFile : POINTER;
--		a_pDCB : WIN32_DCB) : BOOLEAN  is
			-- The GetCommState function fills in a device-control
			-- block (a DCB structure) with the current control settings
			-- for a specified communications device. 
		external "C use <windows.h>"
		end -- GetCommState

	-- GetCommTimeouts

	GetCommTimeouts (a_hFile : POINTER;
		a_pCommTimeouts : POINTER) : BOOLEAN is
--	GetCommTimeouts (a_hFile : POINTER;
--		a_pCommTimeouts : WIN32_COMMTIMEOUTS) : BOOLEAN  is
			-- The GetCommTimeouts function retrieves the time-out
			-- parameters for all read and write operations on a specified
			-- communications device. 
		external "C use <windows.h>"
		end -- GetCommTimeouts

	-- PurgeComm

	PurgeComm (a_hCommDev : POINTER;
		a_fdwAction : INTEGER) : BOOLEAN is
			-- The PurgeComm function can discard all characters
			-- from the output or input buffer of a specified communications
			-- resource. It can also terminate pending read or write
			-- operations on the resource. 
		external "C use <windows.h>"
		end -- PurgeComm

	-- SetCommBreak

	SetCommBreak (a_hCommDev : POINTER) : BOOLEAN is
			-- The SetCommBreak function suspends character transmission
			-- for a specified communications device and places the
			-- transmission line in a break state until the ClearCommBreak
			-- function is called. 
		external "C use <windows.h>"
		end -- SetCommBreak

	-- SetCommConfig

	SetCommConfig (a_hCommDev : POINTER;
		a_pCC : POINTER;
		a_dwSize : INTEGER) : BOOLEAN is
--	SetCommConfig (a_hCommDev : POINTER;
--		a_pCC : INTEGER_REF;
--		a_dwSize : INTEGER) : BOOLEAN  is
			-- The SetCommConfig function sets the current configuration
			-- of a communications device.
		external "C use <windows.h>"
		end -- SetCommConfig


	SetCommMask (a_hCommDev : POINTER;
		a_fdwEvtMask : INTEGER) : BOOLEAN is
			-- The SetCommMask function specifies a set of events
			-- to be monitored for a communications device. 
		external "C use <windows.h>"
		end -- SetCommMask

	-- SetCommState

	SetCommState (a_hCommDev : POINTER;
		a_pdcb : POINTER) : BOOLEAN is
--	SetCommState (a_hCommDev : POINTER;
--		a_pdcb : WIN32_DCB) : BOOLEAN  is
			-- The SetCommState function configures a communications
			-- device according to the specifications in a device-control
			-- block (a DCB structure). The function reinitializes
			-- all hardware and control settings, but it does not
			-- empty output or input queues. 
		external "C use <windows.h>"
		end -- SetCommState

	-- SetCommTimeouts

	SetCommTimeouts (a_hCommDev : POINTER;
		a_pctmo : POINTER) : BOOLEAN is
--	SetCommTimeouts (a_hCommDev : POINTER;
--		a_pctmo : WIN32_COMMTIMEOUTS) : BOOLEAN  is
			-- The SetCommTimeouts function sets the time-out parameters
			-- for all read and write operations on a specified communications
			-- device. 
		external "C use <windows.h>"
		end -- SetCommTimeouts

	-- SetupComm

	SetupComm (a_hCommDev : POINTER;
		a_cbInQueue : INTEGER;
		a_cbOutQueue : INTEGER) : BOOLEAN is
			-- The SetupComm function initializes the communications
			-- parameters for a specified communications device. 
		external "C use <windows.h>"
		end -- SetupComm

	-- TransmitCommChar

	TransmitCommChar (a_hCommDev : POINTER;
		a_chTransmit : CHARACTER) : BOOLEAN is
			-- The TransmitCommChar function transmits a specified
			-- character ahead of any pending data in the output buffer
			-- of the specified communications device. 
		external "C use <windows.h>"
		end -- TransmitCommChar

	-- WaitCommEvent

	WaitCommEvent (a_hCommDev : POINTER;
		a_pfdwEvtMask : POINTER;
		a_po : POINTER) : BOOLEAN is
--	WaitCommEvent (a_hCommDev : POINTER;
--		a_pfdwEvtMask : INTEGER_REF;
--		a_po : WIN32_OVERLAPPED) : BOOLEAN is
			-- The WaitCommEvent function waits for an event to occur
			-- for a specified communications device. The set of events
			-- that are monitored by this function is contained in
			-- the event mask associated with the device handle. 
		external "C use <windows.h>"
		end -- WaitCommEvent

end -- class WIN32_COMMUNICATION_FUNCTIONS