class WIN32_EVENT_LOGGING_FUNCTIONS

-- ClearEventLog
-- BackupEventLog
			-- Backs up the event log
-- CloseEventLog
-- DeregisterEventSource
			--	Deregisters an Event Source
-- NotifyChangeEventLog
			-- Lets an application receive notification when
			-- an event is written to the event log file specified
			-- by the hEventLog parameter. When the event is written
			-- to the event log file, the function causes the event
			-- object specified by the hEvent parameter to become
			-- signaled.
-- GetNumberOfEventLogRecords
-- GetOldestEventLogRecord
-- OpenEventLog
-- RegisterEventSource
			-- Registers an Event Source
-- OpenBackupEventLog
			-- Opens a previously saved event log.
-- ReadEventLog
-- ReportEvent
			--	Reports an event

feature {NONE}

	OpenEventLog (a_machine_name : POINTER;
					  a_log_name     : POINTER) : POINTER is
--	OpenEventLog (a_machine_name : STRING;
--					  a_log_name     : STRING) : INTEGER is
			-- Opens an event log.
		external "C use <windows.h>"
		end -- OpenEventLog

	CloseEventLog (handle : POINTER) : BOOLEAN is
			-- Closes the eventlog
		external "C use <windows.h>"
		end -- CloseEventLog

	ClearEventLog (handle      : POINTER;
						backup_name : POINTER) : BOOLEAN is
--	ClearEventLog (handle      : INTEGER;
--						backup_name : STRING) : BOOLEAN is
			-- Clears the event log
		external "C use <windows.h>"
		end -- ClearEventLog

	ReadEventLog (a_handle        : POINTER;
				  a_read_flags    : INTEGER;
				  a_record_offset : INTEGER;
				  a_evt_log_rec   : POINTER;
				  a_bytes_to_read : INTEGER;
				  a_bytes_read    : POINTER;
				  a_min_bytes     : POINTER) : BOOLEAN is
--	ReadEventLog (a_handle        : INTEGER;
--				  a_read_flags    : INTEGER;
--				  a_record_offset : INTEGER;
--				  a_evt_log_rec   : WIN32_EVENTLOGRECORD;
--				  a_bytes_to_read : INTEGER) : BOOLEAN is
			-- Reads some event log records.
		external "C use <windows.h>"
		end -- ReadEventLog

	GetNumberOfEventLogRecords (a_handle : POINTER;
	         a_number: POINTER) : BOOLEAN is
			-- Returns the number of event log records.
		external "C use <windows.h>"
		end -- GetNumberOfEventLogRecords

	GetOldestEventLogRecord (a_handle : POINTER;
	         a_number: POINTER) : BOOLEAN is
			-- Returns the number of event log records.
		external "C use <windows.h>"
		end -- GetOldestEventLogRecord

end -- class WIN32_EVENT_LOGGING_FUNCTIONS