#include <windows.h>

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"

/*
	------------------------------------------------------------------------
	EnumResLangProc

	The EnumResLangProc function is an application-defined callback 
	function that receives resource languages as a result of a call to the 
	EnumResourceLanguages function. 

	BOOL CALLBACK EnumResLangProc(
		HANDLE  hModule,	// resource-module handle 
		LPCTSTR  lpszType,	// address of resource type 
		LPCTSTR  lpszName,	// address of resource name 
		WORD  wIDLanguage,	// resource language identifier 
		LONG  lParam 	// application-defined parameter  
	);

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the languages are being enumerated. If this parameter is 
	  NULL, the function enumerates the resource languages in the module 
	  used to create the current process. 

	* lpszType

	  Points to a null-terminated string specifying the type name of the 
	  resource for which the language is being enumerated. For standard 
	  resource types, this parameter should be one of the following values: 

	  Value          Meaning

	* lpszName

	  Points to a null-terminated string specifying the name of the 
	  resource for which the language is being enumerated. 

	* wIDLanguage

	  Specifies the language identifier for the resource for which the 
	  language is being enumerated. The EnumResourceLanguages function 
	  provides this value. For a list of the primary language identifiers 
	  and sublanguage identifiers that constitute a language identifier, 
	  see the MAKELANGID macro. 

	* lParam

	  Specifies the application-defined parameter passed to the 
	  EnumResourceLanguages function. This parameter can be used in error 
	  checking. 

	Return Value

	  This callback function should return TRUE to continue enumeration; 
	  otherwise, it should return FALSE to stop enumeration. 

	Remarks

	  The EnumResLangProc function is a placeholder for the 
	  application-defined or library-defined function name. 

	See Also

	  EnumResourceLanguages, MAKELANGID 
	------------------------------------------------------------------------
*/

/*
	------------------------------------------------------------------------
	EnumResNameProc

	The EnumResNameProc function is an application-defined callback 
	function that receives resource names as a result of a call to the 
	EnumResourceNames function. 

	BOOL CALLBACK EnumResNameProc(
		HANDLE  hModule,	// resource-module handle 
		LPCTSTR  lpszType,	// address of resource type 
		LPTSTR  lpszName,	// address of resource name 
		LONG  lParam 	// application-defined parameter  
	);

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the names are being enumerated. If this parameter is NULL, 
	  the function enumerates the resource names in the module used to 
	  create the current process. 

	* lpszType

	  Points to a null-terminated string specifying the type name of the 
	  resource for which the name is being enumerated. For standard 
	  resource types, this parameter should be one of the following values: 

	  Value    Meaning
	  ...

	  Points to a null-terminated string specifying the name of the 
	  resource for which the name is being enumerated. 

	* lParam

	  Specifies the application-defined parameter passed to the 
	  EnumResourceNames function. This parameter can be used in error 
	  checking. 

	Return Value

	  This callback function should return TRUE to continue enumeration; 
	  otherwise, it should return FALSE to stop enumeration. 

	Remarks

	  The EnumResNameProc function is a placeholder for the 
	  application-defined or library-defined function name. 

	See Also

	  EnumResourceNames 


	------------------------------------------------------------------------
*/

/*
	------------------------------------------------------------------------
	EnumResTypeProc

	The EnumResTypeProc function is an application-defined callback 
	function that receives resource types as a result of a call to the 
	EnumResourceTypes function. 

	BOOL CALLBACK EnumResTypeProc(
		HANDLE  hModule,	// resource-module handle 
		LPTSTR  lpszType,	// address of resource type 
		LONG  lParam 	// application-defined parameter  
	);

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the types are to be enumerated. If this parameter is NULL, 
	  the function enumerates the resource types in the module used to 
	  create the current process. 

	* lpszType

	  Points to a null-terminated string specifying the type name of the 
	  resource for which the type is being enumerated. For standard 
	  resource types, this parameter can be one of the following values: 

	   Value       Meaning
	   ...

	* lParam

	  Specifies the application-defined parameter passed to the 
	  EnumResourceTypes function. This parameter can be used in error 
	  checking. 

	Return Value

	  The callback function should return TRUE to continue enumeration; 
	  otherwise, it should return FALSE to stop enumeration. 

	Remarks

	  The EnumResTypeProc function is a placeholder for the 
	  application-defined or library-defined function name. 

	See Also

	  EnumResourceTypes 
	------------------------------------------------------------------------
*/

// ========================================================================

/*
	------------------------------------------------------------------------
	EnumResourceLanguages

	The EnumResourceLanguages function searches a module for each resource 
	of the specified type and name and passes the language of each resource 
	it locates to a defined callback function. 

	BOOL EnumResourceLanguages(
		HMODULE  hModule,	// resource-module handle 
		LPCTSTR  lpType,	// address of resource type 
		LPCTSTR  lpName,	// address of resource name 
		ENUMRESLANGPROC  lpEnumFunc,	// address of callback function 
		LONG  lParam 	// application-defined parameter 
	);	

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the languages are to be enumerated. If this parameter is 
	  NULL, the function enumerates the resource languages in the module 
	  used to create the current process. 

	* lpType

	  Points to a null-terminated string specifying the type of the 
	  resource for which the language is being enumerated. For standard 
	  resource types, this parameter can be one of the following values: 

	  [..]

	* lpName

	  Points to a null-terminated string specifying the name of the 
	  resource for which the language is being enumerated. 

	* lpEnumFunc

	  Points to the callback function to be called for each enumerated 
	  resource language. For more information, see the EnumResLangProc 
	  function. 

	* lParam

	  Specifies an application-defined value passed to the callback 
	  function. This parameter may be used in error checking. 

	Return Value

	  If the function succeeds, the return value is TRUE.

	  If the function fails, the return value is FALSE. To get extended 
	  error information, call GetLastError. 

	Remarks

	  The EnumResourceLanguages function continues to enumerate resource 
	  languages until the callback function returns FALSE or all resource 
	  languages have been enumerated. 

	See Also

	  EnumResLangProc, EnumResourceNames, EnumResourceTypes 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumResourceLanguages(EIF_INTEGER hModule,
									EIF_POINTER lpType,
									EIF_POINTER lpName,
									EIF_POINTER lpEnumFunc,
									EIF_INTEGER lParam,
									EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	
	res_param.eif_object = lpCurrent;
	res_param.eif_enum   = lpEnumFunc;
	res_param.lparam     = lParam;
	
	return (EIF_BOOLEAN) EnumResourceLanguages(	(HMODULE) hModule,
												(LPCTSTR) lpType,
												(LPCTSTR) lpName,
												(ENUMRESLANGPROC) c_enum_res_lang_proc,
												(LONG) &res_param);	
}

/*
	------------------------------------------------------------------------
	EnumResourceNames

	The EnumResourceNames function searches a module for each resource of 
	the specified type and passes the name of each resource it locates to 
	an application-defined callback function. 

	BOOL EnumResourceNames(
		HINSTANCE  hModule,	// resource-module handling 
		LPCTSTR  lpszType,	// address of resource type 
		ENUMRESNAMEPROC  lpEnumFunc,	// address of callback function 
		LONG  lParam 	// application-defined parameter 
	);

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the names are to be enumerated. If this parameter is NULL, 
	  the function enumerates the resource names in the module used to 
	  create the current process. 

	* lpszType

	  Points to a null-terminated string specifying the type name of the 
	  resource for which the name is being enumerated. For standard 
	  resource types, this parameter can be one of the following values: 

	   Value            Meaning
	   RT_ACCELERATOR   Accelerator table
	   RT_BITMAP        Bitmap resource
	   RT_DIALOG        Dialog box
	   RT_FONT          Font resource
	   RT_FONTDIR       Font directory resource
	   RT_MENU          Menu resource
	   RT_RCDATA        Application-defined resource (raw data)
	   RT_STRING        String-table entry
	   RT_MESSAGETABLE  Message-table entry
	   RT_CURSOR        Hardware-dependent cursor resource
	   RT_GROUP_CURSOR  Hardware-independent cursor resource
	   RT_ICON          Hardware-dependent icon resource
	   RT_GROUP_ICON    Hardware-independent icon resource
	   RT_VERSION       Version resource

	* lpEnumFunc

	  Points to the callback function to be called for each enumerated 
	  resource name. For more information, see the EnumResNameProc 
	  function. 

	* lParam

	  Specifies an application-defined value passed to the callback 
	  function. This parameter can be used in error checking. 

	Return Value

	  If the function succeeds, the return value is TRUE.

	  If the function fails, the return value is FALSE. To get extended 
	  error information, call GetLastError. 

	Remarks

	  The EnumResourceNames function continues to enumerate resource names 
	  until the callback function returns FALSE or all resource names have 
	  been enumerated. 

	See Also

	  EnumResNameProc, EnumResourceLanguages, EnumResourceTypes 

	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumResourceNames (	EIF_INTEGER hModule,
									EIF_POINTER lpszType,
									EIF_POINTER lpEnumFunc,
									EIF_INTEGER lParam,
									EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	
	res_param.eif_object = lpCurrent;
	res_param.eif_enum   = lpEnumFunc;
	res_param.lparam     = lParam;
	
	return (EIF_BOOLEAN) EnumResourceNames(	(HINSTANCE) hModule,
											(LPCTSTR) lpszType,
											(ENUMRESNAMEPROC) c_enum_res_name_proc,
											(LONG) &res_param);
}

/*
	------------------------------------------------------------------------
	EnumResourceTypes

	The EnumResourceTypes function searches a module for resources and 
	passes each resource type it finds to an application-defined callback 
	function. 

	BOOL EnumResourceTypes(
		HMODULE  hModule,	// resource-module handle 
		ENUMRESTYPEPROC  lpEnumFunc,	// address of callback function 
		LONG  lParam 	// application-defined parameter  
	);	

	Parameters

	* hModule

	  Identifies the module whose executable file contains the resources 
	  for which the types are to be enumerated. If this parameter is NULL, 
	  the function enumerates the resource types in the module used to 
	  create the current process. 

	* lpEnumFunc

	  Points to the callback function to be called for each enumerated 
	  resource type. For more information, see the EnumResTypeProc 
	  function. 

	* lParam

	  Specifies an application-defined value passed to the callback 
	  function. 

	Return Value

	  If the function succeeds, the return value is TRUE.

	  If the function fails, the return value is FALSE. To get extended 
	  error information, call GetLastError. 

	Remarks

	  The EnumResourceTypes function continues to enumerate resource types 
	  until the callback function returns FALSE or all resource types have 
	  been enumerated. 

	See Also

	  EnumResourceLanguages, EnumResourceNames, EnumResTypeProc 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumResourceTypes(EIF_INTEGER  hModule,
								EIF_POINTER lpEnumFunc,
								EIF_INTEGER lParam,
								EIF_POINTER lpCurrent)
{
	ENUMPARAM res_param;
	
	res_param.eif_object = lpCurrent;
	res_param.eif_enum   = lpEnumFunc;
	res_param.lparam     = lParam;
	
	return (EIF_BOOLEAN) EnumResourceTypes(	(HMODULE) hModule,
											(ENUMRESTYPEPROC) c_enum_res_type_proc,
											(LONG) &res_param);
}
