class WIN32_ACCELERATOR_FUNCTIONS

feature {NONE}

	CopyAcceleratorTable (a_acc_tbl:	POINTER;
							a_acc_dst:	POINTER;
							a_count:	INTEGER): INTEGER is
--	CopyAcceleratorTable (	a_acc_tbl:	POINTER;
--							a_acc_dst:	C_STRUCT_ARRAY[WIN32_ACCEL];
--							a_count:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CopyAcceleratorTable
	
	CreateAcceleratorTable (a_acc_arr:	POINTER;
							a_count:	INTEGER): POINTER is
--	CreateAcceleratorTable (a_acc_arr:	C_STRUCT_ARRAY[WIN32_ACCEL];
--							a_count:	INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CreateAcceleratorTable

	DestroyAcceleratorTable (a_acc_tbl: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- DestroyAcceleratorTable

	LoadAccelerators (a_instance: POINTER; a_tbl_name: POINTER): POINTER is
--	LoadAccelerators (a_instance: POINTER; a_tbl_name: STRING): POINTER is
		external "C use <windows.h>"
		alias "LoadAccelerators"
		end -- LoadAccelerators

	TranslateAccelerator (a_wnd:		POINTER;
							a_acc_tbl:	POINTER;
							a_msg:		POINTER): BOOLEAN is
--	TranslateAccelerator (	a_wnd:		POINTER;
--							a_acc_tbl:	POINTER;
--							a_msg:		WIN32_MSG): BOOLEAN is
		external "C use <windows.h>"
		end -- TranslateAccelerator

end -- class WIN32_ACCELERATOR_FUNCTIONS