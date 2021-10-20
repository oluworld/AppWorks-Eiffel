class WIN32_DLL_FUNCTIONS


feature {NONE}

	-- DisableThreadLibraryCalls

	DisableThreadLibraryCalls (a_hLibModule : POINTER) : BOOLEAN is
			-- The DisableThreadLibraryCalls function disables the
			-- DLL_THREAD_ATTACH and DLL_THREAD_DETACH notifications
			-- for the dynamic-link library (DLL) specified by hLibModule.
			-- This can reduce the size of the working code set for
			-- some applications.
		external "C use <windows.h>"
		end -- DisableThreadLibraryCalls

	-- DllEntryPoint

	DllEntryPoint (a_hinstDLL : POINTER;
		a_fdwReason : INTEGER;
		a_lpvReserved : POINTER) : BOOLEAN is
			-- The DllEntryPoint function is an optional method of
			-- entry into a dynamic-link library (DLL). If the function
			-- is used, it is called by the system when processes
			-- and threads are initialized and terminated, or upon
			-- calls to the LoadLibrary and FreeLibrary functions.
			-- DllEntryPoint is a placeholder for the library-defined
			-- function name. The actual name must be specified on
			-- the linker command line by the -entry switch. 
		external "C use <windows.h>"
		end -- DllEntryPoint

	-- FreeLibrary

	FreeLibrary (a_hLibModule : POINTER) : BOOLEAN is
			-- The FreeLibrary function decrements the reference
			-- count of the loaded dynamic-link library (DLL) module.
			-- When the reference count reaches zero, the module is
			-- unmapped from the address space of the calling process
			-- and the handle is no longer valid. This function supersedes
			-- the FreeModule function. 
		external "C use <windows.h>"
		end -- FreeLibrary

	-- FreeLibraryAndExitThread

	FreeLibraryAndExitThread (a_hLibModule : POINTER;
		a_dwExitCode : INTEGER) is
			-- The FreeLibraryAndExitThread function decrements the
			-- reference count of a loaded dynamic-link library (DLL)
			-- by one, and then calls ExitThread to terminate the
			-- calling thread. The function does not return. The FreeLibraryAndExitThread
			-- function gives threads that are created and executed
			-- within a dynamic-link library an opportunity to safely
			-- unload the DLL and terminate themselves.
		external "C use <windows.h>"
		end -- FreeLibraryAndExitThread

	-- GetModuleFileName

	GetModuleFileName (a_hModule : POINTER;
		a_pFilename : POINTER;
		a_nSize : INTEGER) : INTEGER is
--	GetModuleFileName (a_hModule : POINTER;
--		a_pFilename : STRING;
--		a_nSize : INTEGER) : INTEGER  is
			-- The GetModuleFileName function retrieves the full
			-- path and filename for the executable file containing
			-- the specified module. Windows 95 only: The GetModuleFilename
			-- function will return long filenames when an application's
			-- version number is greater than or equal to 4.00 and
			-- the long filename is available. Otherwise, it returns
			-- only 8.3 format filenames.
		external "C use <windows.h>"
		end -- GetModuleFileName

	-- GetModuleHandle

	GetModuleHandle (a_pModuleName : POINTER) : POINTER  is
--	GetModuleHandle (a_pModuleName : STRING) : POINTER is
			-- The GetModuleHandle function returns a module handle
			-- for the specified module if the file has been mapped
			-- into the address space of the calling process. 
		external "C use <windows.h>"
		end -- GetModuleHandle

	-- GetProcAddress

	GetProcAddress (a_hModule : POINTER;
		a_pProcName : POINTER) : POINTER is
--	GetProcAddress (a_hModule : POINTER;
--		a_pProcName : STRING) : POINTER  is
			-- The GetProcAddress function returns the address of
			-- the specified exported dynamic-link library (DLL) function.
		external "C use <windows.h>"
		end -- GetProcAddress

	-- LoadLibrary

	LoadLibrary (a_pLibFileName : POINTER) : POINTER is
--	LoadLibrary (a_pLibFileName : STRING) : POINTER is
			-- The LoadLibrary function maps the specified executable
			-- module into the address space of the calling process. 
		external "C use <windows.h>"
		end -- LoadLibrary

	-- LoadLibraryEx

	LoadLibraryEx (a_pLibFileName : POINTER;
		a_hFile : POINTER;
		a_dwFlags : INTEGER) : POINTER is
--	LoadLibraryEx (a_pLibFileName : STRING;
--		a_hFile : POINTER;
--		a_dwFlags : INTEGER) : POINTER  is
			-- The LoadLibraryEx function maps a specified executable
			-- module into the address space of the calling process.
			-- The executable module can be a .DLL or an .EXE file.
			-- The specified module may cause other modules to be
			-- mapped into the address space.
		external "C use <windows.h>"
		end -- LoadLibraryEx

	-- LoadModule

	LoadModule (a_pModuleName : POINTER;
		a_lpParameterBlock : POINTER) : INTEGER is
--	LoadModule (a_pModuleName : STRING;
--		a_lpParameterBlock : POINTER) : INTEGER  is
			-- The LoadModule function loads and executes a Windows-based
			-- application or creates a new instance of an existing
			-- Windows-based application. This function is provided
			-- for compatibility with earlier versions of Windows.
			-- For Win32-based applications, use the CreateProcess
			-- function. 
		external "C use <windows.h>"
		end -- LoadModule

end -- class WIN32_DLL_FUNCTIONS
