indexing
	contents: "WIN32 registry functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: yes
	
class WIN32_REGISTRY_FUNCTIONS

inherit
	WIN32_REGISTRY_CONSTANTS

feature {NONE}

	RegCloseKey (a_handle : POINTER) : INTEGER is
		external "C use <windows.h>"
		end -- RegCloseKey

	RegConnectRegistry (a_machine : POINTER;
							 a_handle  : INTEGER;
							 a_result  : POINTER) : INTEGER is
		external "C use <windows.h>"
		end -- RegConnectRegistry

	RegCreateKey (a_key     : INTEGER;
				  a_sub_key : POINTER;
				  a_result  : POINTER) : INTEGER is
--	RegCreateKey (a_key     : INTEGER;
--				  a_sub_key : STRING;
--				  a_result  : INTEGER_REF) : INTEGER is
		external "C use <windows.h>"
		end -- RegCreateKey

	RegCreateKeyEx (a_handle              : INTEGER;
					a_sub_key_ptr         : POINTER;
					a_dwReserved          : INTEGER;
					a_szClass             : POINTER;
					a_fdwOptions          : INTEGER;
					a_sam_desired         : BIT 32;
					a_sec_att_ptr         : POINTER;
					a_open_key_handle_ptr : POINTER;
					a_dw_dispose_ptr      : POINTER) : INTEGER is
--	RegCreateKeyEx(	a_handle              : INTEGER;
--					a_sub_key_ptr         : STRING;
--					a_dwReserved          : INTEGER;
--					a_szClass             : STRING;
--					a_fdwOptions          : INTEGER;
--					a_sam_desired         : BIT 32;
--					a_sec_att_ptr         : WIN32_SECURITY_ATTRIBUTES;
--					a_open_key_handle_ptr : INTEGER_REF;
--					a_dw_dispose_ptr      : INTEGER_REF) : INTEGER is
		external "C use <windows.h>"
		end -- RegCreateKeyEx

	RegDeleteKey (a_key: INTEGER;
					a_sub_key: POINTER) : INTEGER is
--	RegDeleteKey  (	a_key: INTEGER;
--					a_sub_key: STRING) : INTEGER is
		external "C use <windows.h>"
		end -- RegDeleteKey
		
	RegDeleteValue (a_key: INTEGER;
					a_value_name: POINTER) : INTEGER is
--	RegDeleteValue(	a_key: INTEGER;
--					a_value_name: STRING) : INTEGER is
		external "C use <windows.h>"
		end -- RegDeleteValue

	RegEnumKey(a_key      : INTEGER; 
				a_index    : INTEGER;
				a_name     : POINTER;
				a_name_len : INTEGER): INTEGER is
--	RegEnumKey(	a_key      : INTEGER; 
--				a_index    : INTEGER;
--				a_name     : STRING;
--				a_name_len : INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- RegEnumKey
		
	RegEnumKeyEx (a_key             : INTEGER;
					a_index           : INTEGER;
					a_name            : POINTER;
					a_name_len        : POINTER;
					a_reserved        : POINTER;
					a_class_name      : POINTER;
					a_class_name_len  : POINTER;
					a_last_write_time : POINTER): INTEGER is
--	RegEnumKeyEx (	a_key             : INTEGER;
--					a_index           : INTEGER;
--					a_name            : STRING;
--					a_name_len        : INTEGER_REF;
--					a_reserved        : POINTER;
--					a_class_name      : STRING;
--					a_class_name_len  : INTEGER_REF;
--					a_last_write_time : INTEGER_REF): INTEGER is
		external "C use <windows.h>"
		end -- RegEnumKeyEx

	RegEnumValue (a_key:				INTEGER;
					a_index:          	INTEGER;
					a_value_name:		POINTER;
					a_value_name_len:	POINTER;
					a_reserved:       	POINTER;
					a_value_type:     	POINTER;
					a_data:           	POINTER;
					a_value_buffer_len:	POINTER) : INTEGER is
--	RegEnumValue (	a_key:				INTEGER;
--					a_index:          	INTEGER;
--					a_value_name:		STRING;
--					a_value_name_len:	INTEGER_REF;
--					a_reserved:       	POINTER;
--					a_value_type:     	INTEGER_REF;
--					a_data:           	POINTER;
--					a_value_buffer_len:	INTEGER_REF) : INTEGER is
		external "C use <windows.h>"
		end -- RegEnumValue
		
	RegFlushKey (a_key: INTEGER) : INTEGER is
		external "C use <windows.h>"
		end -- RegFlushKey

	RegGetKeySecurity (a_key                     : INTEGER;
						a_security_information    : INTEGER;
						a_security_descriptor     : POINTER;
						a_security_descriptor_len : POINTER) : INTEGER is
--	RegGetKeySecurity (	a_key                     : INTEGER;
--						a_security_information    : INTEGER;
--						a_security_descriptor     : WIN32_SECURITY_DESCRIPTOR;
--						a_security_descriptor_len : INTEGER_REF) : INTEGER is
		external "C use <windows.h>"
		end -- RegGetKeySecurity
		
	RegLoadKey (a_key:       INTEGER;
				a_sub_key:   POINTER;
				a_file_name: POINTER): INTEGER is
--	RegLoadKey (a_key:       INTEGER;
--				a_sub_key:   STRING;
--				a_file_name: STRING): INTEGER is
		external "C use <windows.h>"
		end -- RegLoadKey

	RegNotifyChangeKeyValue(a_key:           INTEGER;
							a_watch_subtree: BOOLEAN;
							a_notify_filter: BIT 32;
							a_event:         INTEGER;
							a_flag_async:    BOOLEAN) : INTEGER is
		external "C use <windows.h>"
		end -- RegNotifyChangeKeyValue
									
	RegOpenKey (a_handle		:	INTEGER;
				a_sub_key		:	POINTER;
				a_result_handle	:	POINTER) : INTEGER is
--	RegOpenKey (a_handle		:	INTEGER;
--				a_sub_key		:	STRING;
--				a_result_handle	:	INTEGER_REF) : INTEGER is
		external "C use <windows.h>"
		end -- RegCloseKey

	RegOpenKeyEx (a_key:            INTEGER;
						a_sub_key:        POINTER;
						a_option_set:     INTEGER;
						a_desired_access: BIT 32;
						a_result:         POINTER): INTEGER is
--	RegOpenKeyEx (	a_key:            INTEGER;
--						a_sub_key:        STRING;
--						a_option_set:     INTEGER;
--						a_desired_access: BIT 32;
--						a_result:         INTEGER_REF): INTEGER is
		external "C use <windows.h>"
		end -- RegOpenKeyEx

	RegQueryInfoKey (a_key                : INTEGER;
						a_class_name          : POINTER;
						a_class_name_len      : POINTER;
						a_reserved            : POINTER;
						a_sub_keys            : POINTER;
						a_sub_key_len         : POINTER;
						a_max_class_name_len  : POINTER;
						a_value_count         : POINTER;
						a_max_value_name_len  :	POINTER;
						a_max_value_len       : POINTER;
						a_security_descriptor : POINTER;
						a_last_write_time     : INTEGER) : INTEGER is
--	RegQueryInfoKey (	a_key                : INTEGER;
--						a_class_name          : STRING;
--						a_class_name_len      : INTEGER_REF;
--						a_reserved            : POINTER;
--						a_sub_keys            : INTEGER_REF;
--						a_sub_key_len         : INTEGER_REF;
--						a_max_class_name_len  : INTEGER_REF;
--						a_value_count         : INTEGER_REF;
--						a_max_value_name_len  :	INTEGER_REF;
--						a_max_value_len       : INTEGER_REF;
--						a_security_descriptor : WIN32_SECURITY_DESCRIPTOR;
--						a_last_write_time     : INTEGER) : INTEGER is
		external "C use <windows.h>"
		end -- RegQueryInfoKey

	RegQueryMultipleValues (a_key          : INTEGER;
							a_val_list     : POINTER;
							a_num_vals     : INTEGER;
							a_value_buffer : POINTER;
							a_total_size   : POINTER): INTEGER is
		external "C use <windows.h>"
		end -- RegQueryMultipleValues
		
	RegQueryValue (a_key              : INTEGER;
					a_sub_key          : POINTER;
					a_value_buffer     : POINTER;
					a_value_buffer_len : POINTER): INTEGER is
--	RegQueryValue (a_key              : INTEGER;
--					a_sub_key          : STRING;
--					a_value_buffer     : POINTER;
--					a_value_buffer_len : INTEGER_REF): INTEGER is
		external "C use <windows.h>"
		end -- RegQueryValue
		
	RegQueryValueEx (a_key        : INTEGER;
						a_value_name : POINTER;
						a_reserved   : POINTER;
						a_type       : POINTER;
						a_data       : POINTER;
						a_data_len   : POINTER): INTEGER is
--	RegQueryValueEx (	a_key        : INTEGER;
--						a_value_name : STRING;
--						a_reserved   : POINTER;
--						a_type       : INTEGER_REF;
--						a_data       : POINTER;
--						a_data_len   : INTEGER_REF): INTEGER is
		external "C use <windows.h>"
		end -- RegQueryValueEx
		
	RegReplaceKey (a_key      : INTEGER;
					a_sub_key  : POINTER;
					a_new_file : POINTER;
					a_old_file : POINTER): INTEGER is
--	RegReplaceKey (	a_key      : INTEGER;
--					a_sub_key  : STRING;
--					a_new_file : STRING;
--					a_old_file : STRING): INTEGER is
		external "C use <windows.h>"
		end -- RegReplaceKey

	RegRestoreKey (a_key       : INTEGER;
					 a_file_name : POINTER;
					 a_flag_set  : BIT 32) : INTEGER is
--	RegRestoreKey ( a_key       : INTEGER;
--					 a_file_name : STRING;
--					 a_flag_set  : BIT 32) : INTEGER is
		external "C use <windows.h>"
		end -- RegRestoreKey
		
	RegSaveKey (a_key                : INTEGER;
				a_file_name          : POINTER;
				a_security_attribute : POINTER): INTEGER is
--	RegSaveKey (a_key                : INTEGER;
--				a_file_name          : STRING;
--				a_security_attribute : WIN32_SECURITY_ATTRIBUTES): INTEGER is
		external "C use <windows.h>"
		end -- RegSaveKey

	RegSetKeySecurity (a_key                  : INTEGER;
					 	a_security_information : INTEGER;
						a_security_descriptor  : POINTER): INTEGER is
--	RegSetKeySecurity (	a_key                  : INTEGER;
--					 	a_security_information : INTEGER;
--						a_security_descriptor  : WIN32_SECURITY_DESCRIPTOR): INTEGER is
		external "C use <windows.h>"
		end -- RegSetKeySecurity

	RegSetValue (a_key      : INTEGER;
				a_sub_key  : POINTER;
				a_type     : INTEGER;
				a_data     : POINTER;
				a_data_len : INTEGER): INTEGER is
--	RegSetValue(a_key      : INTEGER;
--				a_sub_key  : STRING;
--				a_type     : INTEGER;
--				a_data     : POINTER;
--				a_data_len : INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- RegSetValue

	RegSetValueEx (a_key        : INTEGER;
					a_value_name : POINTER;
					a_reserved   : INTEGER;
					a_type       : INTEGER;
					a_data       : POINTER;
					a_data_len   : INTEGER): INTEGER is
--	RegSetValueEx (	a_key        : INTEGER;
--					a_value_name : STRING;
--					a_reserved   : INTEGER;
--					a_type       : INTEGER;
--					a_data       : POINTER;
--					a_data_len   : INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- RegSetValueEx
		
	RegUnloadKey (a_key     : INTEGER;
				  a_sub_key : POINTER): INTEGER is
--	RegUnloadKey (a_key     : INTEGER;
--				  a_sub_key : STRING): INTEGER is
		external "C use <windows.h>"
		end -- RegUnloadKey

end -- class WIN32_REGISTRY_FUNCTIONS