indexing
	contents: "WIN32 resource functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no
	
class WIN32_RESOURCES

--	------------------------------------------------------------------------
--	Following are the functions used with resources. 
--	
--	- BeginUpdateResource
--	- CopyImage
--	- EndUpdateResource
--	- EnumResLangProc
--	- EnumResNameProc
--	- EnumResourceLanguages
--	- EnumResourceNames
--	- EnumResourceTypes
--	- EnumResTypeProc
--	- FindResource
--	- FindResourceEx
--	- LoadImage
--	- LoadResource
--	- LockResource
--	- SizeofResource
--	- UpdateResource  
--	------------------------------------------------------------------------

inherit
	WIN32_MACROS

feature {NONE}

	BeginUpdateResource(a_file_name : POINTER;
						a_delete_existing_resources : BOOLEAN) : POINTER is
--	BeginUpdateResource(a_file_name : STRING;
--						a_delete_existing_resources : BOOLEAN) : POINTER is
--	The BeginUpdateResource function returns a handle that can be used by 
--	the UpdateResource function to add, delete, or replace resources in an 
--	executable file. 
		external "C use <windows.h>"
		end -- BeginUpdateResource

	CopyImage (	a_image_handle : POINTER;
				a_type         : INTEGER;
				a_cx_desired   : INTEGER;
				a_cy_desired   : INTEGER;
				a_flags        : BIT 32) : POINTER is
--	The CopyImage function creates a new image (icon, cursor, or bitmap) 
--	and copies the attributes of the given image to the new one. If 
--	necessary, the function stretches the bits to fit the desired size of 
--	the new image.
		external "C use <windows.h>"
		end -- CopyImage

	EndUpdateResource (	a_handle	: POINTER;
						a_discard	: BOOLEAN) : BOOLEAN is
--	The EndUpdateResource function ends a resource update in an executable 
--	file. 
		external "C use <windows.h>"
		end -- EndUpdateResource

	EnumResourceLanguages (	a_module_handle : POINTER;
							a_type          : POINTER;
							a_name          : POINTER;
							a_enum_func_ptr : POINTER;
							a_param         : INTEGER) : BOOLEAN is
--	The EnumResourceLanguages function searches a module for each resource 
--	of the specified type and name and passes the language of each resource 
--	it locates to a defined callback function. 
		do
			Result := c_EnumResourceLanguages (	a_module_handle,
												a_type,
												a_name,
												a_enum_func_ptr,
												a_param,
												Current.to_pointer)
		end -- EnumResourceLanguages

	EnumResourceNames (	a_module_handle : POINTER;
						a_type          : POINTER;
						a_enum_func_ptr : POINTER;
						a_param         : INTEGER) : BOOLEAN is
--	The EnumResourceNames function searches a module for each resource of 
--	the specified type and passes the name of each resource it locates to 
--	an application-defined callback function. 
		do
			Result := c_EnumResourceNames (	a_module_handle,
											a_type,
											a_enum_func_ptr,
											a_param,
											Current.to_pointer)
		end -- EnumResourceNames
		
	EnumResourceTypes (	a_module_handle : POINTER;
						a_enum_func_ptr : POINTER;
						a_param         : INTEGER) : BOOLEAN is
--	The EnumResourceTypes function searches a module for resources and 
--	passes each resource type it finds to an application-defined callback 
--	function. 
		do
			Result := c_EnumResourceTypes (	a_module_handle,
											a_enum_func_ptr,
											a_param,
											Current.to_pointer)
		end -- EnumResourceTypes
		
	FindResource (	a_module_handle : POINTER;
					a_name          : POINTER;
					a_type          : POINTER) : POINTER is
--	FindResource (	a_module_handle : POINTER;
--					a_name          : STRING;
--					a_type          : POINTER) : POINTER is
--	The FindResource function determines the location of a resource with 
--	the specified type and name in the specified module. 
		external "C use <windows.h>"
		end -- FindResource

	FindResourceEx (a_module_handle : POINTER;
					a_name          : POINTER;
					a_type          : POINTER;
					a_language      : INTEGER) : POINTER is
--	FindResourceEx (a_module_handle : POINTER;
--					a_name          : STRING;
--					a_type          : POINTER;
--					a_language      : INTEGER) : POINTER is
--	The FindResourceEx function determines the location of the resource 
--	with the specified type, name, and language in the specified module. 
		external "C use <windows.h>"
		end -- FindResourceEx

	LoadImage (	a_handle     : POINTER;
				a_name       : POINTER;
				a_type       : INTEGER;
				a_cx_desired : INTEGER;
				a_cy_desired : INTEGER;
				a_load_flag  : BIT 32) : POINTER is
--	LoadImage (	a_handle     : POINTER;
--				a_name       : STRING;
--				a_type       : INTEGER;
--				a_cx_desired : INTEGER;
--				a_cy_desired : INTEGER;
--				a_load_flag  : BIT 32) : POINTER is
--	The LoadImage function loads an icon, cursor, or bitmap.
		external "C use <windows.h>"
		end -- LoadImage

	LoadResource (	a_module_handle   : POINTER;
					a_res_info_handle : POINTER) : POINTER is
--	The LoadResource function loads the specified resource into global 
--	memory. 
		external "C use <windows.h>"
		end -- LoadResource

	LockResource (a_resource_handle : POINTER) : POINTER is
--	The LockResource function locks the specified resource in memory. 
		external "C use <windows.h>"
		end -- LockResource

	SizeofResource (a_module_handle   : POINTER;
					a_resource_handle : POINTER) : INTEGER is
--	The SizeofResource function returns the size, in bytes, of the 
--	specified resource. 
		external "C use <windows.h>"
		end -- SizeofResource

	UpdateResource (a_handle       : POINTER;
					a_type         : POINTER;
					a_name         : POINTER;
					a_language_id  : INTEGER;
					a_res_data_ptr : POINTER;
					a_res_data_len : INTEGER) : BOOLEAN is
--	UpdateResource (a_handle       : POINTER;
--					a_type         : STRING;
--					a_name         : STRING;
--					a_language_id  : INTEGER;
--					a_res_data_ptr : POINTER;
--					a_res_data_len : INTEGER) : BOOLEAN is
--	The UpdateResource function adds, deletes, or replaces a resource in an 
--	executable file. 
		external "C use <windows.h>"
		end -- UpdateResource

	RT_ACCELERATOR: POINTER is
		once
			Result := MAKEINTRESOURCE(9)
		end -- RT_ACCELERATOR
		
	RT_BITMAP: POINTER is
		once
			Result := MAKEINTRESOURCE(2)
		end -- RG_BITMAP
		
	RT_DIALOG: POINTER is
		once
			Result := MAKEINTRESOURCE(5)
		end -- RT_DIALOG
		
	RT_FONT: POINTER is
		once
			Result := MAKEINTRESOURCE(8)
		end -- RT_FONT
		
	RT_FONTDIR: POINTER is
		once
			Result := MAKEINTRESOURCE(7)
		end -- RT_FONTDIR
		
	RT_MENU: POINTER is
		once
			Result := MAKEINTRESOURCE(4)
		end -- RT_MENU
		
	RT_RCDATA: POINTER is
		once
			Result := MAKEINTRESOURCE(10)
		end -- RT_RCDATA
		
	RT_STRING: POINTER is
		once
			Result := MAKEINTRESOURCE(6)
		end -- RT_STRING
		
	RT_MESSAGETABLE: POINTER is
		once
			Result := MAKEINTRESOURCE(11)
		end -- RT_MESSAGETABLE
		
	RT_CURSOR: POINTER is
		once
			Result := MAKEINTRESOURCE(1)
		end -- RT_CURSOR
		
	RT_GROUP_CURSOR: POINTER is
		once
			Result := MAKEINTRESOURCE(12)
		end -- RT_GROUP_CURSOR
		
	RT_ICON: POINTER is
		once
			Result := MAKEINTRESOURCE(3)
		end -- RT_ICON
		
	RT_GROUP_ICON: POINTER is
		once
			Result := MAKEINTRESOURCE(14)
		end -- RT_GROUP_ICON
		
	RT_VERSION: POINTER is
		once
			Result := MAKEINTRESOURCE(16)
		end -- RT_VERSION
		
	RT_VXD: POINTER is
		once
			Result := MAKEINTRESOURCE(20)
		end -- RT_VXD
		
	RT_ANICURSOR: POINTER is
		once
			Result := MAKEINTRESOURCE(21)
		end -- RT_ANICURSOR
		
	RT_ANIICON: POINTER is
		once
			Result := MAKEINTRESOURCE(22)
		end -- RT_ANIICON
		
	RT_DLGINCLUDE: POINTER is
		once
			Result := MAKEINTRESOURCE(17)
		end -- RT_DLGINCLUDE
		
	RT_PLUGPLAY: POINTER is
		once
			Result := MAKEINTRESOURCE(19)
		end -- RT_PLUGPLAY
		
	RT_HTML: POINTER is
		once
			Result := MAKEINTRESOURCE(23)
		end -- RT_HTML
		
feature {NONE}

	c_EnumResourceLanguages(a_module_handle : POINTER;
							a_type_ptr      : POINTER;
							a_name_ptr      : POINTER;
							a_enum_func_ptr : POINTER;
							a_param         : INTEGER;
							a_current		: POINTER) : BOOLEAN is
		external "C"
		end -- c_EnumResourceLanguages


	c_EnumResourceNames (	a_module_handle : POINTER;
							a_type_ptr      : POINTER;
							a_enum_func_ptr : POINTER;
							a_param         : INTEGER;
							a_current		: POINTER) : BOOLEAN is
		external "C"
		end -- c_EnumResourceNames

	c_EnumResourceTypes(a_module_handle : POINTER;
						a_enum_func_ptr : POINTER;
						a_param         : INTEGER;
						a_current		: POINTER) : BOOLEAN is
		external "C"
		end -- c_EnumResourceTypes

end -- class WIN32_RESOURCES