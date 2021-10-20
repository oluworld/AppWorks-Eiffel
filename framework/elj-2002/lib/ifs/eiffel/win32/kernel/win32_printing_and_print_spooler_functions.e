class WIN32_PRINTING_AND_PRINT_SPOOLER_FUNCTIONS

feature {NONE}

	AbortDoc (a_hdc : POINTER) : INTEGER is
			-- The AbortDoc function stops the current print job
			-- and erases everything drawn since the last call to
			-- the StartDoc function. This function replaces the ABORTDOC
			-- printer escape.
		external "C use <windows.h>"
		end -- AbortDoc

--	DeviceCapabilities (a_pDevice : POINTER;
--		a_pPort : POINTER;
--		a_fwCapability : INTEGER;
--		a_pOutput : POINTER;
--		a_pDevMode : POINTER) : INTEGER is
--			-- The DeviceCapabilities function retrieves the capabilities
--			-- of a printer device driver.
--			-- (NOTE: a_pDevMode is a pointer from class WIN32_DEVMODE)
--		external "C use <windows.h>"
--		alias "DeviceCapabilities"
--		end -- DeviceCapabilities

	EndDoc (a_hdc : POINTER) : INTEGER is
			-- The EndDoc function ends a print job. This function
			-- replaces the ENDDOC printer escape.
		external "C use <windows.h>"
		end -- EndDoc

	EndPage (a_hdc : POINTER) : INTEGER is
			-- The EndPage function informs the device that the application
			-- has finished writing to a page. This function is typically
			-- used to direct the device driver to advance to a new
			-- page. This function replaces the NEWFRAME printer escape.
		external "C use <windows.h>"
		end -- EndPage

	Escape (a_hdc : POINTER;
		a_nEscape : INTEGER;
		a_cbInput : INTEGER;
		a_lpvInData : POINTER;
		a_lpvOutData : POINTER) : INTEGER is
			-- The Escape function allows applications to access
			-- capabilities of a particular device not directly available
			-- through GDI. Escape calls made by an application are
			-- translated and sent to the driver.
		external "C use <windows.h>"
		end -- Escape

	ExtEscape (a_hdc : POINTER;
		a_nEscape : INTEGER;
		a_cbInput : INTEGER;
		a_lpszInData : POINTER;
		a_cbOutput : INTEGER;
		a_lpszOutData : POINTER) : INTEGER is
			-- The ExtEscape function allows applications to access
			-- capabilities of a particular device that are not available
			-- through GDI.
		external "C use <windows.h>"
		end -- ExtEscape

	SetAbortProc (a_hdc : POINTER;
		a_lpAbortProc : POINTER) : INTEGER is
			-- The SetAbortProc function sets the application-defined
			-- abort function that allows a print job to be canceled
			-- during spooling. This function replaces the SETABORTPROC
			-- printer escape.
		external "C use <windows.h>"
		end -- SetAbortProc

	StartDoc (a_hdc : POINTER;
		a_lpdi : POINTER) : INTEGER is
			-- The StartDoc function starts a print job. This function
			-- replaces the STARTDOC printer escape.
			-- (NOTE: a_lpdi is a pointer from class WIN32_DOCINFO)
		external "C use <windows.h>"
		end -- StartDoc

	StartPage (a_hDC : POINTER) : INTEGER is
			-- The StartPage function prepares the printer driver
			-- to accept data.
		external "C use <windows.h>"
		end -- StartPage

	AbortPrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The AbortPrinter function deletes a printer's spool
			-- file if the printer is configured for spooling.
		external "C use <windows.h>"
		end -- AbortPrinter

	AbortProc (a_hdc : POINTER;
		a_iError : INTEGER) : BOOLEAN is
			-- The AbortProc function is an application-defined callback
			-- function that is called when a print job is to be canceled
			-- during spooling.
		external "C use <windows.h>"
		end -- AbortProc

	AddForm (a_hPrinter : POINTER;
		a_Level : INTEGER;
		a_pForm : POINTER) : BOOLEAN is
			-- The AddForm function adds a form to the list of available
			-- forms that can be selected for the specified printer.
		external "C use <windows.h>"
		end -- AddForm

	AddJob (a_hPrinter : POINTER;
		a_Level : INTEGER;
		a_pData : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The AddJob function obtains a path string that specifies
			-- a file that you can use to store a spooled print job.
		external "C use <windows.h>"
		end -- AddJob

	AddMonitor (a_pName : POINTER;
		a_Level : INTEGER;
		a_pMonitors : POINTER) : BOOLEAN is
			-- The AddMonitor function installs a local printer monitor
			-- and links the configuration, data, and monitor files.
			-- Future releases of Windows NT may allow remote installation
			-- of printer monitors.
		external "C use <windows.h>"
		end -- AddMonitor

	AddPort (a_pName : POINTER;
		a_hWnd : POINTER;
		a_pMonitorName : POINTER) : BOOLEAN is
			-- The AddPort function adds the name of a port to the
			-- list of supported ports.
		external "C use <windows.h>"
		end -- AddPort

	AddPrinter (a_pName : POINTER;
		a_Level : INTEGER;
		a_pPrinter : POINTER) : POINTER is
			-- The AddPrinter function adds a printer to the list
			-- of supported printers for a specified server.
		external "C use <windows.h>"
		end -- AddPrinter

	AddPrinterConnection (a_pName : POINTER) : BOOLEAN is
			-- The AddPrinterConnection function adds a connection
			-- to the specified printer for the current user.
		external "C use <windows.h>"
		end -- AddPrinterConnection

	AddPrinterDriver (a_pName : POINTER;
		a_Level : INTEGER;
		a_pDriverInfo : POINTER) : BOOLEAN is
			-- The AddPrinterDriver function installs a local or
			-- remote printer driver and links the configuration,
			-- data, and driver files.
		external "C use <windows.h>"
		end -- AddPrinterDriver

	AddPrintProcessor (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_pPathName : POINTER;
		a_pPrintProcessorName : POINTER) : BOOLEAN is
			-- The AddPrintProcessor function installs a print processor
			-- on the specified server and adds the print-processor
			-- name to an internal list of supported print processors.
		external "C use <windows.h>"
		end -- AddPrintProcessor

	AddPrintProvidor (a_pName : POINTER;
		a_Level : INTEGER;
		a_pProvidorInfo : POINTER) : BOOLEAN is
			-- The AddPrintProvidor function installs a local printer
			-- provider and links the configuration, data, and provider
			-- files. Future releases of Windows may allow remote
			-- installation of printer providers.
		external "C use <windows.h>"
		end -- AddPrintProvidor

	AdvancedDocumentProperties (a_hWnd : POINTER;
		a_hPrinter : POINTER;
		a_pDeviceName : POINTER;
		a_pDevModeOutput : POINTER;
		a_pDevModeInput : POINTER) : INTEGER is
			-- The AdvancedDocumentProperties function displays a
			-- printer-configuration dialog box for the specified
			-- printer, allowing the user to configure that printer.
			-- (NOTE: a_pDevModeOutput is a pointer from class WIN32_DEVMODE)
			-- (NOTE: a_pDevModeInput is a pointer from class WIN32_DEVMODE)
		external "C use <windows.h>"
		end -- AdvancedDocumentProperties

	ClosePrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The ClosePrinter function closes the specified printer
			-- object.
		external "C use <windows.h>"
		end -- ClosePrinter

	ConfigurePort (a_pName : POINTER;
		a_hWnd : POINTER;
		a_pPortName : POINTER) : BOOLEAN is
			-- The ConfigurePort function displays the port-configuration
			-- dialog box for a port on the specified server.
		external "C use <windows.h>"
		end -- ConfigurePort

	ConnectToPrinterDlg (a_hwnd : POINTER;
		a_Flags : INTEGER) : POINTER is
			-- The ConnectToPrinterDlg function displays a dialog
			-- box that lets users browse and connect to printers
			-- on a network. If the user selects a printer, the function
			-- attempts to create a connection to it; if a suitable
			-- driver is not installed on the server, the user is
			-- given the option of creating a printer locally.
		external "C use <windows.h>"
		end -- ConnectToPrinterDlg

	DeleteForm (a_hPrinter : POINTER;
		a_pFormName : POINTER) : BOOLEAN is
			-- The DeleteForm function removes a form name from the
			-- list of supported forms.
		external "C use <windows.h>"
		end -- DeleteForm

	DeleteMonitor (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_pMonitorName : POINTER) : BOOLEAN is
			-- The DeleteMonitor function removes a printer monitor
			-- added by the AddMonitor function.
		external "C use <windows.h>"
		end -- DeleteMonitor

	DeletePort (a_pName : POINTER;
		a_hWnd : POINTER;
		a_pPortName : POINTER) : BOOLEAN is
			-- The DeletePort function displays a dialog box that
			-- allows the user to delete a port name.
		external "C use <windows.h>"
		end -- DeletePort

	DeletePrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The DeletePrinter function deletes the specified printer
			-- object.
		external "C use <windows.h>"
		end -- DeletePrinter

	DeletePrinterConnection (a_pName : POINTER) : BOOLEAN is
			-- The DeletePrinterConnection function deletes a connection
			-- to a printer that was established by a call to AddPrinterConnection
			-- or ConnectToPrinterDlg.
		external "C use <windows.h>"
		end -- DeletePrinterConnection

	DeletePrinterDriver (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_pDriverName : POINTER) : BOOLEAN is
			-- The DeletePrinterDriver function removes the specified
			-- printer-driver name from the list of names of supported
			-- drivers for a server.
		external "C use <windows.h>"
		end -- DeletePrinterDriver

	DeletePrintProcessor (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_pPrintProcessorName : POINTER) : BOOLEAN is
			-- The DeletePrintProcessor function removes a printer
			-- processor added by the AddPrintProcessor function.
		external "C use <windows.h>"
		end -- DeletePrintProcessor

	DeletePrintProvidor (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_pPrintProvidorName : POINTER) : BOOLEAN is
			-- The DeletePrintProvidor function removes a printer
			-- provider added by the AddPrintProvidor function.
		external "C use <windows.h>"
		end -- DeletePrintProvidor

	DocumentProperties (a_hWnd : POINTER;
		a_hPrinter : POINTER;
		a_pDeviceName : POINTER;
		a_pDevModeOutput : POINTER;
		a_pDevModeInput : POINTER;
		a_fMode : INTEGER) : INTEGER is
			-- The DocumentProperties function retrieves or modifies
			-- printer initialization information or displays a printer-configuration
			-- dialog box for the specified printer.
			-- (NOTE: a_pDevModeOutput is a pointer from class WIN32_DEVMODE)
			-- (NOTE: a_pDevModeInput is a pointer from class WIN32_DEVMODE)
		external "C use <windows.h>"
		end -- DocumentProperties

	EndDocPrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The EndDocPrinter function ends a print job for the
			-- given printer.
		external "C use <windows.h>"
		end -- EndDocPrinter

	EndPagePrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The EndPagePrinter function indicates the end of one
			-- page and the beginning of the next page for the specified
			-- printer.
		external "C use <windows.h>"
		end -- EndPagePrinter

	EnumForms (a_hPrinter : POINTER;
		a_Level : INTEGER;
		a_pForm : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumForms function enumerates the forms supported
			-- by the specified printer.
		external "C use <windows.h>"
		end -- EnumForms

	EnumJobs (a_hPrinter : POINTER;
		a_FirstJob : INTEGER;
		a_NoJobs : INTEGER;
		a_Level : INTEGER;
		a_pJob : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumJobs function initializes an array of either
			-- JOB_INFO_1 or JOB_INFO_2 structures with data describing
			-- the specified print jobs for the specified printer
		external "C use <windows.h>"
		end -- EnumJobs

	EnumMonitors (a_pName : POINTER;
		a_Level : INTEGER;
		a_pMonitors : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumMonitors function initializes an array of
			-- MONITOR_INFO_1 structures with data describing the
			-- monitors for the specified server.
		external "C use <windows.h>"
		end -- EnumMonitors

	EnumPorts (a_pName : POINTER;
		a_Level : INTEGER;
		a_pPorts : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumPorts function enumerates the ports that are
			-- available for printing on a specified server.
		external "C use <windows.h>"
		end -- EnumPorts

	EnumPrinterDrivers (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_Level : INTEGER;
		a_pDriverInfo : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumPrinterDrivers function enumerates all of
			-- the printer drivers installed on the specified printer
			-- server.
		external "C use <windows.h>"
		end -- EnumPrinterDrivers

	EnumPrinters (a_Flags : INTEGER;
		a_Name : POINTER;
		a_Level : INTEGER;
		a_pPrinterEnum : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumPrinters function enumerates available printers,
			-- print servers, domains, or print providers.
		external "C use <windows.h>"
		end -- EnumPrinters

	EnumPrintProcessorDataTypes (a_pName : POINTER;
		a_pPrintProcessorName : POINTER;
		a_Level : INTEGER;
		a_pDatatypes : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumPrintProcessorDatatypes function enumerates
			-- the data types that a specifed print processor supports.
		external "C use <windows.h>"
		end -- EnumPrintProcessorDataTypes

	EnumPrintProcessors (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_Level : INTEGER;
		a_pPrintProcessorInfo : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER;
		a_pcReturned : POINTER) : BOOLEAN is
			-- The EnumPrintProcessors function enumerates the print
			-- processors installed on the specified server.
		external "C use <windows.h>"
		end -- EnumPrintProcessors

	FindClosePrinterChangeNotification (a_hChange : POINTER) : BOOLEAN is
			-- The FindClosePrinterChangeNotification function closes
			-- a change notification object created by calling the
			-- FindFirstPrinterChangeNotification function. The printer
			-- or print server associated with the change notification
			-- object will no longer be monitored by that object.
		external "C use <windows.h>"
		end -- FindClosePrinterChangeNotification

	FindFirstPrinterChangeNotification (a_hPrinter : POINTER;
		a_fdwFlags : INTEGER;
		a_fdwOptions : INTEGER;
		a_pPrinterNotifyOptions : POINTER) : POINTER is
			-- The FindFirstPrinterChangeNotification function creates
			-- a change notification object and returns a handle to
			-- the object. You can then use this handle in a call
			-- to one of the wait functions to monitor changes to
			-- the printer or print server.
		external "C use <windows.h>"
		end -- FindFirstPrinterChangeNotification

	FindNextPrinterChangeNotification (a_hChange : POINTER;
		a_pdwChange : POINTER;
		a_pPrinterNotifyOptions : POINTER;
		a_ppPrinterNotifyInfo : POINTER) : BOOLEAN is
			-- The FindNextPrinterChangeNotification function retrieves
			-- information about the most recent change notification
			-- for a change notification object associated with a
			-- printer or print server. Call this function when a
			-- wait operation on the change notification object is
			-- satisfied.
		external "C use <windows.h>"
		end -- FindNextPrinterChangeNotification

	FreePrinterNotifyInfo (a_pPrinterNotifyInfo : POINTER) : BOOLEAN is
			-- The FreePrinterNotifyInfo function frees a system-allocated
			-- buffer that was returned by the FindNextPrinterChangeNotification
			-- function.
			-- (NOTE: a_pPrinterNotifyInfo is a pointer from class WIN32_PRINTER_NOTIFY_INFO)
		external "C use <windows.h>"
		end -- FreePrinterNotifyInfo

	GetForm (a_hPrinter : POINTER;
		a_pFormName : POINTER;
		a_Level : INTEGER;
		a_pForm : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetForm function initializes a FORM_INFO_1 structure
			-- with data describing the specified form for a printer.
		external "C use <windows.h>"
		end -- GetForm

	GetJob (a_hPrinter : POINTER;
		a_JobId : INTEGER;
		a_Level : INTEGER;
		a_pJob : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetJob function retrieves print-job data for the
			-- specified printer.
		external "C use <windows.h>"
		end -- GetJob

	GetPrinter (a_hPrinter : POINTER;
		a_Level : INTEGER;
		a_pPrinter : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetPrinter function retrieves information about
			-- a specified printer.
		external "C use <windows.h>"
		end -- GetPrinter

	GetPrinterData (a_hPrinter : POINTER;
		a_pValueName : POINTER;
		a_pType : POINTER;
		a_pData : POINTER;
		a_nSize : INTEGER;
		a_pcbNeeded : POINTER) : INTEGER is
			-- The GetPrinterData function retrieves printer-configuration
			-- data for the specified printer.
		external "C use <windows.h>"
		end -- GetPrinterData

	GetPrinterDriver (a_hPrinter : POINTER;
		a_pEnvironment : POINTER;
		a_Level : INTEGER;
		a_pDriverInfo : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetPrinterDriver function retrieves driver data
			-- for the specified printer.
		external "C use <windows.h>"
		end -- GetPrinterDriver

	GetPrinterDriverDirectory (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_Level : INTEGER;
		a_pDriverDirectory : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetPrinterDriverDirectory function retrieves the
			-- path of the printer-driver directory.
		external "C use <windows.h>"
		end -- GetPrinterDriverDirectory

	GetPrintProcessorDirectory (a_pName : POINTER;
		a_pEnvironment : POINTER;
		a_Level : INTEGER;
		a_pPrintProcessorInfo : POINTER;
		a_cbBuf : INTEGER;
		a_pcbNeeded : POINTER) : BOOLEAN is
			-- The GetPrintProcessorDirectory function retrieves
			-- the path for the print processor on the specified server.
		external "C use <windows.h>"
		end -- GetPrintProcessorDirectory

	OpenPrinter (a_pPrinterName : POINTER;
		a_phPrinter : POINTER;
		a_pDefault : POINTER) : BOOLEAN is
			-- The OpenPrinter function retrieves a handle identifying
			-- the specified printer or print server.
			-- (NOTE: a_pDefault is a pointer from class WIN32_PRINTER_DEFAULTS)
		external "C use <windows.h>"
		end -- OpenPrinter

	PrinterMessageBox (a_hPrinter : POINTER;
		a_dwError : INTEGER;
		a_hwndOwner : POINTER;
		a_pText : POINTER;
		a_pCaption : POINTER;
		a_dwType : INTEGER) : POINTER is
			-- The PrinterMessageBox function displays a message
			-- box that lets an application that is printing notify
			-- the user of a printing job error. If the owner of the
			-- job is logged on remotely, the function sends a net
			-- popup to the owner. If the user selects Cancel in the
			-- message box, the function cancels the print job; otherwise,
			-- the function clears the job error status, and the system
			-- tries to print the job again.
		external "C use <windows.h>"
		end -- PrinterMessageBox

	PrinterProperties (a_hwnd : POINTER;
		a_hPrinter : POINTER) : BOOLEAN is
			-- The PrinterProperties function displays a printer-properties
			-- dialog box for the specified printer.
		external "C use <windows.h>"
		end -- PrinterProperties

	ReadPrinter (a_hPrinter : POINTER;
		a_lpBuf : POINTER;
		a_cbBuf : INTEGER;
		a_lpdwBytes : POINTER) : BOOLEAN is
			-- The ReadPrinter function retrieves data from the specified
			-- printer.
		external "C use <windows.h>"
		end -- ReadPrinter

	ResetPrinter (a_hPrinter : POINTER;
		a_pDefault : POINTER) : BOOLEAN is
			-- The ResetPrinter function lets an application specify
			-- the data type and device mode values that are used
			-- for printing documents submitted by the StartDocPrinter
			-- function. These values can be overridden by using the
			-- SetJob function once document printing has started.
			-- (NOTE: a_pDefault is a pointer from class WIN32_PRINTER_DEFAULTS)
		external "C use <windows.h>"
		end -- ResetPrinter

	ScheduleJob (a_hPrinter : POINTER;
		a_dwJobID : INTEGER) : BOOLEAN is
			-- The ScheduleJob function requests that the print spooler
			-- schedule a specified print job for printing.
		external "C use <windows.h>"
		end -- ScheduleJob

	SetForm (a_hPrinter : POINTER;
		a_lpszForm : POINTER;
		a_dwLevel : INTEGER;
		a_lpbForm : POINTER) : BOOLEAN is
			-- The SetForm function sets the form information for
			-- the specified printer.
		external "C use <windows.h>"
		end -- SetForm

	SetJob (a_hPrinter : POINTER;
		a_dwJob : INTEGER;
		a_dwLevel : INTEGER;
		a_lpbJob : POINTER;
		a_dwCommand : INTEGER) : BOOLEAN is
			-- The SetJob function pauses, resumes, cancels, or restarts
			-- a print job on the specified printer. The function
			-- can also be used to set print job parameters such as
			-- the job priority, the document name, and so forth.
		external "C use <windows.h>"
		end -- SetJob

	SetPrinter (a_hPrinter : POINTER;
		a_dwLevel : INTEGER;
		a_lpbPrinter : POINTER;
		a_dwCommand : INTEGER) : BOOLEAN is
			-- The SetPrinter function sets the specified printer
			-- by pausing printing, resuming printing, or clearing
			-- all print jobs. The function can also be used to set
			-- printer data.
		external "C use <windows.h>"
		end -- SetPrinter

	SetPrinterData (a_hPrinter : POINTER;
		a_lpszType : POINTER;
		a_dwType : INTEGER;
		a_lpbData : POINTER;
		a_cbData : INTEGER) : INTEGER is
			-- The SetPrinterData function sets the configuration
			-- data for a printer.
		external "C use <windows.h>"
		end -- SetPrinterData

	StartDocPrinter (a_hPrinter : POINTER;
		a_dwLevel : INTEGER;
		a_lpbDocInfo : POINTER) : INTEGER is
			-- The StartDocPrinter function informs the print spooler
			-- that a document is to be spooled for printing.
		external "C use <windows.h>"
		end -- StartDocPrinter

	StartPagePrinter (a_hPrinter : POINTER) : BOOLEAN is
			-- The StartPagePrinter function informs the spooler
			-- that a page is about to be printed on the specified
			-- printer.
		external "C use <windows.h>"
		end -- StartPagePrinter

	WritePrinter (a_hPrinter : POINTER;
		a_pBuf : POINTER;
		a_cbBuf : INTEGER;
		a_lpdwWritten : POINTER) : BOOLEAN is
			-- The WritePrinter function informs the print spooler
			-- that data should be written to the specified printer.
		external "C use <windows.h>"
		end -- WritePrinter

end -- class WIN32_PRINTING_AND_PRINT_SPOOLER_FUNCTIONS