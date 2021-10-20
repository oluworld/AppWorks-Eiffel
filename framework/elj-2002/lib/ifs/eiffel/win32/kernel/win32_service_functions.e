indexing
	contents: "WIN32 file functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_SERVICE_FUNCTIONS

feature {NONE}

	ChangeServiceConfig (	a_sc_manager_handle  : POINTER;
							a_service_type       : INTEGER;
							a_start_type         : INTEGER;
							a_error_control      : INTEGER;
							a_binary_path_name   : POINTER;
							a_load_order_group   : POINTER;
							a_tag_id             : POINTER;
							a_dependencies       : POINTER;
							a_service_start_name : POINTER;
							a_password           : POINTER;
							a_display_name       : POINTER) : BOOLEAN is
--	ChangeServiceConfig (	a_sc_manager_handle  : INTEGER;
--							a_service_type       : INTEGER;
--							a_start_type         : INTEGER;
--							a_error_control      : INTEGER;
--							a_binary_path_name   : STRING;
--							a_load_order_group   : STRING;
--							a_tag_id             : INTEGER_REF;
--							a_dependencies       : POINTER;
--							a_service_start_name : STRING;
--							a_password           : STRING;
--							a_display_name       : STRING) : BOOLEAN is
		external "C use <windows.h>"
		end -- ChangeServiceConfig

	CloseServiceHandle (a_sc_object: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- CloseServiceHandle

	ControlService (a_service: POINTER;
					a_control: INTEGER;
					a_service_status: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- ControlService

	CreateService (	a_sc_manager: POINTER;
					a_service_name: POINTER;
					a_display_name: POINTER;
					a_desired_access: BIT 32;
					a_service_type: INTEGER;
					a_start_type: INTEGER;
					a_error_control: INTEGER;
					a_binary_path_name: POINTER;
					a_load_order_group: POINTER;
					a_tag_id: POINTER;
					a_dependencies: POINTER;
					a_service_start_name: POINTER;
					a_password: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- CreateService

	DeleteService (a_service_handle  : INTEGER) : BOOLEAN is
		external "C use <windows.h>"
		end -- DeleteService

	EnumDependentServices (	a_service: POINTER;
							a_service_state: BIT 32;
							a_services: POINTER;
							a_buf_size: INTEGER;
							a_bytes_needed: POINTER;
							a_services_returned: POINTER): BOOLEAN is
--	EnumDependentServices (	a_service: INTEGER;
--							a_service_state: BIT 32;
--							a_services: C_STRUCT_ARRAY[WIN32_ENUM_SERVICE_STATUS];
--							a_buf_size: INTEGER;
--							a_bytes_needed: INTEGER_REF;
--							a_services_returned: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- EnumDependentServices

	EnumServicesStatus (a_sc_manager: POINTER;
						a_service_type: BIT 32;
						a_service_state: BIT 32;
						a_services: POINTER;
						a_buf_size: INTEGER;
						a_bytes_needed: POINTER;
						a_services_returned: POINTER;
						a_resume_handle: POINTER): BOOLEAN is
--	EnumServicesStatus (a_sc_manager: INTEGER;
--						a_service_type: BIT 32;
--						a_service_state: BIT 32;
--						a_services: C_STRUCT_ARRAY[WIN32_ENUM_SERVICE_STATUS];
--						a_buf_size: INTEGER;
--						a_bytes_needed: INTEGER_REF;
--						a_services_returned: INTEGER_REF;
--						a_resume_handle: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- EnumServicesStatus

	GetServiceDisplayName (	a_sc_manager: POINTER;
							a_service_name: POINTER;
							a_display_name: POINTER;
							a_buffer: POINTER): BOOLEAN is
--	GetServiceDisplayName (	a_sc_manager: INTEGER;
--							a_service_name: STRING;
--							a_display_name: STRING;
--							a_buffer: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- GetServiceDisplayName

	GetServiceKeyName (	a_sc_manager: POINTER;
						a_display_name: POINTER;
						a_service_name: POINTER;
						a_buffer: POINTER): BOOLEAN is
--	GetServiceKeyName (	a_sc_manager: INTEGER;
--						a_display_name: STRING;
--						a_service_name: STRING;
--						a_buffer: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- GetServiceKeyName

	LockServiceDatabase (a_sc_manager_handle : POINTER) : INTEGER is
		external "C use <windows.h>"
		end -- LockServiceDatabase

	NotifyBootConfigStatus (a_boot_acceptable: BOOLEAN): BOOLEAN is
		external "C use <windows.h>"
		end -- NotifyBootConfigStatus

	OpenSCManager (	a_machine_name: POINTER;
					a_database_name: POINTER;
					a_desired_access: BIT 32): POINTER is
		external "C use <windows.h>"
		end -- OpenSCManager

	OpenService (a_service_handle : POINTER;
				 a_service_name   : POINTER;
				 a_desired_access : BIT 32) : POINTER is
			-- Returns a handle to the specified service.
		external "C use <windows.h>"
		end -- OpenService

	QueryServiceConfig (a_service: POINTER;
						a_serv_config: POINTER;
						a_buf_size: INTEGER;
						a_bytes_needed: POINTER): BOOLEAN is
--	QueryServiceConfig (a_service: INTEGER;
--						a_serv_config: WIN32_QUERY_SERVICE_CONFIG;
--						a_buf_size: INTEGER;
--						a_bytes_needed: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- QueryServiceConfig

	QueryServiceLockStatus (a_sc_manager: POINTER;
							a_lock_stat: POINTER;
							a_buf_size: INTEGER;
							a_bytes_needed: POINTER): BOOLEAN is
--	QueryServiceLockStatus (a_sc_manager: INTEGER;
--							a_lock_stat: WIN32_QUERY_SERVICE_LOCK_STATUS;
--							a_buf_size: INTEGER;
--							a_bytes_needed: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- QueryServiceLockStatus

	QueryServiceObjectSecurity (a_service: POINTER;
								a_security_info: BIT 32;
								a_security_desc: POINTER;
								a_buf_size: INTEGER;
								a_bytes_needed: POINTER): BOOLEAN is
--	QueryServiceObjectSecurity (a_service: INTEGER;
--								a_security_info: BIT 32;
--								a_security_desc: WIN32_SECURITY_DESCRIPTOR;
--								a_buf_size: INTEGER;
--								a_bytes_needed: INTEGER_REF): BOOLEAN is
		external "C use <windows.h>"
		end -- QueryServiceObjectSecurity

	QueryServiceStatus (a_service: INTEGER;
						a_service_status: POINTER): BOOLEAN is
--	QueryServiceStatus (a_service: INTEGER;
--						a_service_status: WIN32_SERVICE_STATUS): BOOLEAN is
		external "C use <windows.h>"
		end -- QueryServiceStatus

	RegisterServiceCtrlHandler (a_service_name: POINTER;
								a_handler_proc: POINTER): INTEGER is
--	RegisterServiceCtrlHandler (a_service_name: STRING;
--								a_handler_proc: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- RegisterServiceCtrlHandler

	SetServiceObjectSecurity (	a_service: POINTER;
								a_security_info: BIT 32;
								a_security_desc: POINTER): BOOLEAN is
--	SetServiceObjectSecurity (	a_service: INTEGER;
--								a_security_info: BIT 32;
--								a_security_desc: WIN32_SECURITY_DESCRIPTOR): BOOLEAN is
		external "C use <windows.h>"
		end -- SetServiceObjectSecurity

	SetServiceStatus (	a_service_status_handle: POINTER;
						a_service_status: POINTER): BOOLEAN is
--	SetServiceStatus (	a_service_status_handle: INTEGER;
--						a_service_status: WIN32_SERVICE_STATUS): BOOLEAN is
		external "C use <windows.h>"
		end -- SetServiceStatus

	StartService (	a_service: POINTER;
					a_num_service_args: INTEGER;
					a_service_args: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- StartService

	StartServiceCtrlDispatcher (a_service_table: POINTER): BOOLEAN is
--	StartServiceCtrlDispatcher (a_service_table: C_STRUCT_ARRAY[WIN32_SERVICE_TABLE_ENTRY]): BOOLEAN is
		external "C use <windows.h>"
		end -- StartServiceCtrlDispatcher

	UnlockServiceDatabase (a_scl_lock : INTEGER) : BOOLEAN is
		external "C use <windows.h>"
		end -- UnlockServiceDatabase

end -- class WIN32_SERVICE_FUNCTIONS