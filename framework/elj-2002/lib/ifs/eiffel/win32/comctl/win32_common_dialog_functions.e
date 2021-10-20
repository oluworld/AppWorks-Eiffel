class WIN32_COMMON_DIALOG_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with common dialog boxes. 
--	
--	ChooseColor
--	ChooseFont
--	CommDlgExtendedError
--	FindText
--	GetFileTitle
--	GetOpenFileName
--	GetSaveFileName
--	PageSetupDlg
--	PrintDlg
--	ReplaceText 
--
--	The following application-defined hook procedures are used with common dialog boxes. 
--
--	CCHookProc
--	CFHookProc
--	FRHookProc
--	OFNHookProc
--	OFNHookProcOldStyle
--	PagePaintHook
--	PageSetupHook
--	PrintHookProc
--	SetupHookProc 	
--	------------------------------------------------------------------------

inherit
	WIN32_COMMON_DIALOG_CONSTANTS

feature {NONE}

	ChooseColor (a_struct: POINTER): BOOLEAN is
--	ChooseColor (a_struct: WIN32_CHOOSECOLOR): BOOLEAN is
--		The ChooseColor function creates a Color common dialog box that enables 
--		the user to select a color.
		external "C use <windows.h>"
		end -- ChooseColor
		
	ChooseFont (a_struct: POINTER): BOOLEAN is
--	ChooseFont (a_struct: WIN32_CHOOSEFONT): BOOLEAN is
		--The ChooseFont function creates a Font common dialog box that enables 
		--the user to choose attributes for a logical font. These attributes 
		--include a typeface name, style (bold, italic, or regular), point size, 
		--effects (underline, strikeout, and text color), and a script (or 
		--character set). 
		external "C use <windows.h>"
		end -- ChooseFont
		
	CommDlgExtendedError: INTEGER is
--		The CommDlgExtendedError function returns a common dialog box error 
--		code. This code indicates the most recent error to occur during the 
--		execution of one of the following common dialog box functions:
		external "C use <windows.h>"
		end -- CommDlgExtendedError
	
	FindText (a_struct: POINTER) : POINTER is
--	FindText (a_struct: WIN32_FINDREPLACE) : POINTER is
--		The FindText function creates a system-defined modeless dialog box that 
--		lets the user specify a string to search for and options to use when 
--		searching for text in a document. 
		external "C use <windows.h>"
		end -- FindText
		
	GetFileTitle (	a_file:			POINTER;
					a_title:		POINTER;
					a_title_len:	INTEGER): INTEGER is
--	GetFileTitle (	a_file:			STRING;
--					a_title:		STRING;
--					a_title_len:	INTEGER): INTEGER is
--		The GetFileTitle function returns the name of the file identified by the 
--		lpszFile parameter. 
		external "C use <windows.h>"
		end -- GetFileTitle
		
	GetOpenFileName (a_struct: POINTER): BOOLEAN is
--	GetOpenFileName (a_struct: WIN32_OPENFILENAME): BOOLEAN is
--		The GetOpenFileName function creates an Open common dialog box that lets 
--		the user specify the drive, directory, and the name of a file or set of 
--		files to open. 
		external "C use <windows.h>"
		end -- GetOpenFileName
		
	GetSaveFileName (a_struct: POINTER): BOOLEAN is
--	GetSaveFileName (a_struct: WIN32_OPENFILENAME): BOOLEAN is
--		The GetSaveFileName function creates a Save common dialog box that lets 
--		the user specify the drive, directory, and name of a file to save. 
		external "C use <windows.h>"
		end -- GetSaveFileName
		
	PageSetupDlg (a_struct: POINTER): BOOLEAN is
--	PageSetupDlg (a_struct: WIN32_PAGESETUPDLG): BOOLEAN is
--		The PageSetupDlg function creates a Page Setup dialog box that enables 
--		the user to specify the attributes of a printed page. These attributes 
--		include the paper size and source, the page orientation (portrait or 
--		landscape), and the width of the page margins. 
		external "C use <windows.h>"
		end -- PageSetupDlg
		
	PrintDlg (a_struct: POINTER): BOOLEAN is
--	PrintDlg (a_struct: WIN32_PRINTDLG): BOOLEAN is
--		The PrintDlg function displays a Print dialog box or a Print Setup 
--		dialog box. The Print dialog box enables the user to specify the 
--		properties of a particular print job. 
--	
--		The Print Setup dialog box should not be used in new applications. It 
--		has been superseded by the Page Setup common dialog box created by the 
--		PageSetupDlg function. 
		external "C use <windows.h>"
		end -- PrintDlg
		
	ReplaceText (a_struct: POINTER) : POINTER is
--	ReplaceText (a_struct: WIN32_FINDREPLACE) : POINTER is
--		The ReplaceText function creates a system-defined modeless dialog box 
--		that lets the user specify a string to search for and a replacement 
--		string, as well as options to control the find and replace operations.
		external "C use <windows.h>"
		end -- ReplaceText

end -- class WIN32_COMMON_DIALOG_FUNCTIONS
