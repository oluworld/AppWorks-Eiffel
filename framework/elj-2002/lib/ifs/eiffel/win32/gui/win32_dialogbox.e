indexing
	contents: "WIN32 dialog functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no

class WIN32_DIALOGBOX

--	----------------------------------------------------------------------
--	Following are the functions used to create and manage dialog boxes and
--	controls within dialog boxes.
--
--	CreateDialog
--	CreateDialogIndirect
--	CreateDialogIndirectParam
--	CreateDialogParam
--	DefDlgProc
--	DialogBox
--	DialogBoxIndirect
--	DialogBoxIndirectParam
--	DialogBoxParam
--	DialogProc
--	EndDialog
--	GetDialogBaseUnits
--	GetDlgCtrlID
--	GetDlgItem
--	GetDlgItemInt
--	GetDlgItemText
--	GetNextDlgGroupItem
--	GetNextDlgTabItem
--	IsDialogMessage
--	MapDialogRect
--	MessageBox
--	MessageBoxEx
--	SendDlgItemMessage
--	SetDlgItemInt
--	SetDlgItemText
--	MessageBoxIndirect
--	----------------------------------------------------------------------

inherit
	WIN32_DIALOGBOX_CONSTANTS

feature {NONE}

	CreateDialog (	a_instance:		POINTER;
					a_templ_name:	POINTER;
					a_parent:		POINTER;
					dialog_func:	POINTER): POINTER is
--	CreateDialog (	a_instance:		POINTER;
--					a_templ_name:	STRING;
--					a_parent:		POINTER;
--					dialog_func:	POINTER): POINTER is
--	The CreateDialog function creates a modeless dialog box from a dialog
--	box template resource.
		external "C use <windows.h>"
		end -- CreateDialog

	CreateDialogIndirect (	a_instance:		POINTER;
							a_template:		POINTER;
							a_parent:		POINTER;
							dialog_func:	POINTER): POINTER is
--	CreateDialogIndirect (	a_instance:		POINTER;
--							a_template:		WIN32_DLGTEMPLATE;
--							a_parent:		POINTER;
--							dialog_func:	POINTER): POINTER is
--	The CreateDialogIndirect function creates a modeless dialog box from a
--	dialog box template in memory.
		external "C use <windows.h>"
		end -- CreateDialogIndirect

	CreateDialogIndirectParam (	a_instance:		POINTER;
								a_template:		POINTER;
								a_parent:		POINTER;
								dialog_func:	POINTER;
								a_param:		INTEGER): POINTER is
--	CreateDialogIndirectParam (	a_instance:		POINTER;
--								a_template:		WIN32_DLGTEMPLATE;
--								a_parent:		POINTER;
--								dialog_func:	POINTER;
--								a_param:		INTEGER): POINTER is
--	The CreateDialogIndirectParam function creates a modeless dialog box
--	from a dialog box template in memory. Before displaying the dialog box,
--	the function passes an application-defined value to the dialog box
--	procedure as the lParam parameter of the WM_INITDIALOG message. An
--	application can use this value to initialize dialog box controls.
		external "C use <windows.h>"
		end -- CreateDialogIndirectParam

	CreateDialogParam (	a_instance:		POINTER;
						a_templ_name:	POINTER;
						a_parent:		POINTER;
						dialog_func:	POINTER;
						a_param:		INTEGER): POINTER is
--	CreateDialogParam (	a_instance:		POINTER;
--						a_templ_name:	STRING;
--						a_parent:		POINTER;
--						dialog_func:	POINTER;
--						a_param:		INTEGER): POINTER is
--	The CreateDialogParam function creates a modeless dialog box from a
--	dialog box template resource. Before displaying the dialog box, the
--	function passes an application-defined value to the dialog box
--	procedure as the lParam parameter of the the WM_INITDIALOG message. An
--	application can use this value to initialize dialog box controls.
		external "C use <windows.h>"
		end -- CreateDialogParam

	DefDlgProc (a_dialog:	POINTER;
				a_msg:		INTEGER;
				a_wparam:	INTEGER;
				a_lparam:	INTEGER): INTEGER is
--	The DefDlgProc function carries out default message processing for a
--	window procedure belonging to an application-defined dialog box class.
		external "C use <windows.h>"
		end -- DefDlgProc

	DialogBox (	a_instance:		POINTER;
				a_templ_name:	POINTER;
				a_parent:		POINTER;
				dialog_func:	POINTER): INTEGER is
--	DialogBox (	a_instance:		POINTER;
--				a_templ_name:	STRING;
--				a_parent:		POINTER;
--				dialog_func:	POINTER): INTEGER is
--	The DialogBox function creates a modal dialog box from a dialog box
--	template resource. DialogBox does not return control until the
--	specified callback function terminates the modal dialog box by calling
--	the EndDialog function.
		external "C use <windows.h>"
		end -- DialogBox

	DialogBoxIndirect (	a_instance:		POINTER;
						a_template:		POINTER;
						a_parent:		POINTER;
						dialog_func:	POINTER): INTEGER is
--	DialogBoxIndirect (	a_instance:		POINTER;
--						a_template:		WIN32_DLGTEMPLATE;
--						a_parent:		POINTER;
--						dialog_func:	POINTER): INTEGER is
--	The DialogBoxIndirect function creates a modal dialog box from a dialog
--	box template in memory. The DialogBoxIndirect function does not return
--	control until the specified callback function terminates the modal
--	dialog box by calling the EndDialog function.
		external "C use <windows.h>"
		end -- DialogBoxIndirect

	DialogBoxIndirectParam (a_instance:		POINTER;
							a_template:		POINTER;
							a_parent:		POINTER;
							dialog_func:	POINTER;
							a_param:		INTEGER): INTEGER is
--	DialogBoxIndirectParam (a_instance:		POINTER;
--							a_template:		WIN32_DLGTEMPLATE;
--							a_parent:		POINTER;
--							dialog_func:	POINTER;
--							a_param:		INTEGER): INTEGER is
--	The DialogBoxIndirectParam function creates a modal dialog box from a
--	dialog box template in memory. Before displaying the dialog box, the
--	function passes an application-defined value to the dialog box
--	procedure as the lParam parameter of the WM_INITDIALOG message. An
--	application can use this value to initialize dialog box controls.
		external "C use <windows.h>"
		end -- DialogBoxIndirectParam

	DialogBoxParam (a_instance:		POINTER;
					a_templ_name:	POINTER;
					a_parent:		POINTER;
					dialog_func:	POINTER;
					a_param:		INTEGER): INTEGER is
--	DialogBoxParam (a_instance:		POINTER;
--					a_templ_name:	STRING;
--					a_parent:		POINTER;
--					dialog_func:	POINTER;
--					a_param:		INTEGER): INTEGER is
--	The DialogBoxParam function creates a modal dialog box from a dialog
--	box template resource. Before displaying the dialog box, the function
--	passes an application-defined value to the dialog box procedure as the
--	lParam parameter of the WM_INITDIALOG message. An application can use
--	this value to initialize dialog box controls.
		external "C use <windows.h>"
		end -- DialogBoxParam

	EndDialog (a_dialog: POINTER; a_result: INTEGER): BOOLEAN is
--	The EndDialog function destroys a modal dialog box, causing the system
--	to end any processing for the dialog box.
		external "C use <windows.h>"
		end -- EndDialog

	GetDialogBaseUnits: INTEGER is
--	The GetDialogBaseUnits function returns the dialog box base units used
--	by Windows to create dialog boxes. Both Windows and applications use
--	these units to convert the width and height of dialog boxes and
--	controls from dialog units, as given in dialog box templates, to
--	pixels, and vice versa.
		external "C use <windows.h>"
		end -- GetDialogBaseUnits

	GetDlgCtrlID (a_handle: POINTER): INTEGER is
--	The GetDlgCtrlID function returns the identifier of the specified
--	control.
		external "C use <windows.h>"
		end -- GetDlgCtrlID

	GetDlgItem (a_dialog: POINTER; a_control_id: INTEGER): POINTER is
--	The GetDlgItem function retrieves the handle of a control in the
--	specified dialog box.
		external "C use <windows.h>"
		end -- GetDlgItem

	GetDlgItemInt (	a_dialog: 		POINTER;
					a_control_id:	INTEGER;
					a_translated: 	POINTER;
					a_signed:		BOOLEAN): INTEGER is
--	GetDlgItemInt (	a_dialog: 		POINTER;
--					a_control_id:	INTEGER;
--					a_translated: 	BOOLEAN_REF
--					a_signed:		BOOLEAN): INTEGER is
--	The GetDlgItemInt function translates the text of a specified control
--	in a dialog box into an integer value.
		external "C use <windows.h>"
		end -- GetDlgItemInt

	GetDlgItemText (a_dialog:	POINTER;
					a_item_id:	INTEGER;
					a_text:		POINTER;
					a_text_len:	INTEGER): INTEGER is
--	GetDlgItemText (a_dialog:	POINTER;
--					a_item_id:	INTEGER;
--					a_text:		STRING;
--					a_text_len:	INTEGER): INTEGER is
--	The GetDlgItemText function retrieves the title or text associated with
--	a control in a dialog box.
		external "C use <windows.h>"
		end -- GetDlgItemText

	GetNextDlgGroupItem (	a_dialog:		POINTER;
							a_ctrl_hndl:	POINTER;
							a_previous:		BOOLEAN): POINTER is
--	The GetNextDlgGroupItem function retrieves the handle of the first
--	control in a group of controls that precedes (or follows) the specified
--	control in a dialog box.
		external "C use <windows.h>"
		end -- GetNextDlgGroupItem

	GetNextDlgTabItem (	a_dialog:		POINTER;
						a_ctrl_hndl:	POINTER;
						a_previous:		BOOLEAN): POINTER is
--	The GetNextDlgTabItem function retrieves the handle of the first
--	control that has the WS_TABSTOP style that precedes (or follows) the
--	specified control.
		external "C use <windows.h>"
		end -- GetNextDlgTabItem

	IsDialogMessage (	a_dialog:	POINTER;
						a_msg:		POINTER): BOOLEAN is
--	IsDialogMessage (	a_dialog:	POINTER;
--						a_msg:		WIN32_MSG): BOOLEAN is
--	The IsDialogMessage function determines whether a message is intended
--	for the specified dialog box and, if it is, processes the message.
		external "C use <windows.h>"
		end -- IsDialogMessage

	MapDialogRect (	a_dialog:	POINTER;
					a_rect:		POINTER): BOOLEAN is
--	MapDialogRect (	a_dialog:	POINTER;
--					a_rect:		WIN32_RECT): BOOLEAN is
--	The MapDialogRect function converts (maps) the specified dialog box
--	units to screen units (pixels). The function replaces the coordinates
--	in the specified RECT structure with the converted coordinates, which
--	allows the structure to be used to create a dialog box or position a
--	control within a dialog box.
		external "C use <windows.h>"
		end -- MapDialogRect

	MessageBox (a_owner   : POINTER;
				a_text    : POINTER;
				a_caption : POINTER;
				a_flags   : BIT 32) : INTEGER is
--	MessageBox (a_owner   : POINTER;
--				a_text    : STRING;
--				a_caption : STRING;
--				a_flags   : BIT 32) : INTEGER is
--	The MessageBox function creates, displays, and operates a message box.
--	The message box contains an application-defined message and title, plus
--	any combination of predefined icons and push buttons.
		external "C use <windows.h>"
		end -- MessageBox

	MessageBoxEx (	a_owner   : POINTER;
					a_text    : POINTER;
					a_caption : POINTER;
					a_flags   : BIT 32;
					a_lang_id :	INTEGER) : INTEGER is
--	MessageBoxEx (	a_owner   : POINTER;
--					a_text    : STRING;
--					a_caption : STRING;
--					a_flags   : BIT 32;
--					a_lang_id :	INTEGER) : INTEGER is
--	The MessageBox function creates, displays, and operates a message box.
--	The message box contains an application-defined message and title, plus
--	any combination of predefined icons and push buttons.
		external "C use <windows.h>"
		end -- MessageBoxEx

	SendDlgItemMessage (a_dialog:	POINTER;
						a_ctrl_id:	INTEGER;
						a_msg:		INTEGER;
						a_wparam:	INTEGER;
						a_lparam:	INTEGER): INTEGER is
--	The SendDlgItemMessage function sends a message to the specified
--	control in a dialog box.
		external "C use <windows.h>"
		end -- SendDlgItemMessage

	SetDlgItemInt (	a_dialog:	POINTER;
					a_ctrl_id:	INTEGER;
					a_value:	INTEGER;
					a_signed:	BOOLEAN): BOOLEAN is
--	The SetDlgItemInt function sets the text of a control in a dialog box
--	to the string representation of a specified integer value.
		external "C use <windows.h>"
		end -- SetDlgItemInt

	SetDlgItemText (a_dialog:	POINTER;
					a_ctrl_id:	INTEGER;
					a_value:	POINTER): BOOLEAN is
--	SetDlgItemText (a_dialog:	POINTER;
--					a_ctrl_id:	INTEGER;
--					a_value:	STRING): BOOLEAN is
--	The SetDlgItemText function sets the title or text of a control in a
--	dialog box.
		external "C use <windows.h>"
		end -- SetDlgItemText

	MessageBoxIndirect (a_params: POINTER): BOOLEAN is
--	MessageBoxIndirect (a_params: WIN32_MSGBOXPARAMS): BOOLEAN is
--	The MessageBoxIndirect function creates, displays, and operates a
--	message box. The message box contains application-defined message text
--	and title, any icon, and any combination of predefined push buttons.
		external "C use <windows.h>"
		end -- MessageBoxIndirect

end -- WIN32_DIALOGBOX
