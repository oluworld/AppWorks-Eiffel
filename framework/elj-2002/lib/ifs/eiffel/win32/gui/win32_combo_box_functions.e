indexing
	contents: "WIN32 combobox functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: no

class WIN32_COMBO_BOX_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with combo boxes. 
--
--	DlgDirListComboBox
--	DlgDirSelect - not used
--	DlgDirSelectEx
--	DlgDirSelectComboBox
--	DlgDirSelectComboBoxEx
--	------------------------------------------------------------------------

inherit
	WIN32_COMBO_BOX_CONSTANTS

feature {NONE}
	
	DlgDirListComboBox (a_parent:		POINTER;
						a_filename:		POINTER;
						a_combo_id:		INTEGER;
						a_static_id:	INTEGER;
						a_file_type:	BIT 32): INTEGER is
			--	DlgDirListComboBox (a_parent:		POINTER;
			--						a_filename:		STRING;
			--						a_combo_id:		INTEGER;
			--						a_static_id:	INTEGER;
			--						a_file_type:	BIT 32): INTEGER is
			--	The DlgDirListComboBox function fills the specified combo
			-- box with a directory listing. It fills the list with the
			-- names of all files, drives, and subdirectories that match
			-- the specified attributes and path string. 
		external "C use <windows.h>"
		end -- DlgDirListComboBox
		
	DlgDirSelectEx (a_parent:	POINTER;
					a_path:		POINTER;
					a_path_len:	INTEGER;
					a_list_id:	INTEGER): BOOLEAN is
			--	DlgDirSelectEx (a_parent:	POINTER;
			--					a_path:		STRING;
			--					a_path_len:	INTEGER;
			--					a_list_id:	INTEGER): BOOLEAN is
			--	The DlgDirSelectEx function retrieves the current selection
			-- from a single-selection list box. It assumes that the list
			-- box has been filled by the DlgDirList function and that the
			-- selection is a drive letter, filename, or directory name. 
		external "C use <windows.h>"
		end -- DlgDirSelectEx
		
	DlgDirSelectComboBoxEx (a_parent:	POINTER;
							a_path:		POINTER;
							a_path_len:	INTEGER;
							a_combo_id:	INTEGER): BOOLEAN is
			--	DlgDirSelectComboBoxEx (a_parent:	POINTER;
			--							a_path:		STRING;
			--							a_path_len:	INTEGER;
			--							a_combo_id:	INTEGER): BOOLEAN is
			--	The DlgDirSelectComboBoxEx function retrieves the current
			-- selection from a combo box filled by using the
			-- DlgDirListComboBox function. The selection is interpreted
			-- as a drive letter, a file, or a directory name. 
		external "C use <windows.h>"
		end -- DlgDirSelectComboBoxEx
		
end -- class WIN32_COMBO_BOX_FUNCTIONS