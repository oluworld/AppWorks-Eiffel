class WIN32_SHELL_LIBRARY_FUNCTIONS

feature {NONE}

	DragAcceptFiles (a_hWnd : POINTER;
		a_fAccept : BOOLEAN) is
			-- The DragAcceptFiles function registers whether a window
			-- accepts dropped files. 
		external "C use <windows.h>"
		end -- DragAcceptFiles

	DragFinish (a_hDrop : POINTER) is
			-- The DragFinish function releases memory that Windows
			-- allocated for use in transferring filenames to the
			-- application. 
		external "C use <windows.h>"
		end -- DragFinish

	DragQueryFile (a_hDrop : POINTER;
		a_iFile : INTEGER;
		a_pszFile : POINTER;
		a_cch : INTEGER) : INTEGER is
--	DragQueryFile (a_hDrop : POINTER;
--		a_iFile : INTEGER;
--		a_pszFile : STRING;
--		a_cch : INTEGER) : INTEGER is
			-- The DragQueryFile function retrieves the filenames
			-- of dropped files. 
		external "C use <windows.h>"
		end -- DragQueryFile

	DragQueryPoint (a_hDrop : POINTER;
		a_ppt : POINTER) : BOOLEAN is
--	DragQueryPoint (a_hDrop : POINTER;
--		a_ppt : WIN32_POINT) : BOOLEAN is
			-- The DragQueryPoint function retrieves the position
			-- of the mouse pointer at the time a file was dropped.
		external "C use <windows.h>"
		end -- DragQueryPoint

	ExtractAssociatedIcon (a_hInst : POINTER;
		a_pIconPath : POINTER;
		a_piIcon : POINTER) : INTEGER is
--	ExtractAssociatedIcon (a_hInst : POINTER;
--		a_pIconPath : STRING;
--		a_piIcon : INTEGER_REF) : INTEGER is
			-- The ExtractAssociatedIcon function returns the handle
			-- of an indexed icon found in a file or an icon found
			-- in an associated executable file. 
		external "C use <windows.h>"
		end -- ExtractAssociatedIcon

	ExtractIcon (a_hInst : POINTER;
		a_pszExeFileName : POINTER;
		a_nIconIndex : INTEGER) : INTEGER is
--	ExtractIcon (a_hInst : POINTER;
--		a_pszExeFileName : STRING;
--		a_nIconIndex : INTEGER) : INTEGER is
			-- The ExtractIcon function retrieves the handle of an
			-- icon from the given executable file, dynamic-link library
			-- (DLL), or icon file. 
		external "C use <windows.h>"
		end -- ExtractIcon

	FindExecutable (a_pFile : POINTER;
		a_pDirectory : POINTER;
		a_pResult : POINTER) : POINTER is
--	FindExecutable (a_pFile : STRING;
--		a_pDirectory : STRING;
--		a_pResult : STRING) : POINTER is
			-- The FindExecutable function retrieves the name and
			-- handle of the executable (.EXE) file associated with
			-- the specified filename. 
		external "C use <windows.h>"
		end -- FindExecutable

	ShellAbout (a_hWnd : POINTER;
		a_szApp_deref : POINTER;
		a_szOtherStuff_deref : POINTER;
		a_hIcon : INTEGER) : INTEGER is
--	ShellAbout (a_hWnd : POINTER;
--		a_szApp_deref : STRING;
--		a_szOtherStuff_deref : STRING;
--		a_hIcon : INTEGER) : INTEGER is
			-- The ShellAbout function displays a Shell About dialog
			-- box. 
		external "C use <windows.h>"
		end -- ShellAbout

	ShellExecute (a_hwnd : POINTER;
		a_pOperation : POINTER;
		a_pFile : POINTER;
		a_pParameters : POINTER;
		a_pDirectory : POINTER;
		a_nShowCmd : INTEGER) : POINTER is
--	ShellExecute (a_hwnd : POINTER;
--		a_pOperation : STRING;
--		a_pFile : STRING;
--		a_pParameters : STRING;
--		a_pDirectory : STRING;
--		a_nShowCmd : INTEGER) : POINTER is
			-- The ShellExecute function opens or prints a specified
			-- file. The file can be an executable file or a document
			-- file. See ShellExecuteEx also. 
		external "C use <windows.h>"
		end -- ShellExecute

	ShellExecuteEx (a_pExecInfo : POINTER) : BOOLEAN is
--	ShellExecuteEx (a_pExecInfo : WIN32_SHELLEXECUTEINFO) : BOOLEAN is
			-- The ShellExecuteEx function performs an action on
			-- a file. The file can be an executable file or a document.
		external "C use <windows.h>"
		end -- ShellExecuteEx

end -- class WIN32_SHELL_LIBRARY_FUNCTIONS