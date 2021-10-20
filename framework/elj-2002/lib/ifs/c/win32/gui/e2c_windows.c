#include "windows.h"

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"

/*
	------------------------------------------------------------------------
	ChildWindowFromPoint

	The ChildWindowFromPoint function determines which, if any, of the 
	child windows belonging to a parent window contains the specified 
	point. 

	HWND ChildWindowFromPoint(
		HWND hWndParent,	// handle to parent window
		POINT Point 	// structure with point coordinates
	);	
 

	Parameters

	* hWndParent

	  Identifies the parent window. 

	* Point

	  Specifies a POINT structure that defines the client coordinates of 
	  the point to be checked. 
	------------------------------------------------------------------------
*/

EIF_INTEGER c_ChildWindowFromPoint (EIF_INTEGER hWndParent,
												EIF_POINTER Point)
{
	return (EIF_INTEGER) ChildWindowFromPoint (	(HWND) hWndParent,
												*((POINT*) Point));
}

/*
	------------------------------------------------------------------------
	ChildWindowFromPointEx

	The ChildWindowFromPointEx function determines which, if any, of the 
	child windows belonging to the specified parent window contains the 
	specified point. The function can ignore invisible, disabled, and 
	transparent child windows.

	HWND ChildWindowFromPointEx(
		HWND hwndParent, 	// handle to parent window
		POINT pt, 	// structure with point coordinates
		UINT uFlags	// skipping flags
	);	
 
	Parameters

	* hwndParent

	  Identifies the parent window. 

	* pt

	  Specifies a POINT structure that defines the client coordinates of 
	  the point to be checked.  

	* uFlags

	  Specifies which child windows to skip. This parameter can be a 
	  combination of the following values:

	   Value               Meaning
	   ------------------- ------------------------------
	   CWP_ALL             Do not skip any child windows
	   CWP_SKIPINVISIBLE   Skip invisible child windows
	   CWP_SKIPDISABLED    Skip disabled child windows
	   CWP_SKIPTRANSPARENT Skip transparent child windows
 	------------------------------------------------------------------------
*/

EIF_INTEGER c_ChildWindowFromPointEx(EIF_INTEGER hWndParent,
												 EIF_POINTER pt,
												 EIF_INTEGER uFlags)
{
	return (EIF_INTEGER) ChildWindowFromPointEx (	(HWND) hWndParent,
													*((POINT*)pt),
													(UINT)uFlags);
}

/*
	------------------------------------------------------------------------
	EnumChildWindows

	The EnumChildWindows function enumerates the child windows that belong 
	to the specified parent window by passing the handle of each child 
	window, in turn, to an application-defined callback function. 
	EnumChildWindows continues until the last child window is enumerated or 
	the callback function returns FALSE. 

	BOOL EnumChildWindows(
		HWND hWndParent,	// handle to parent window
		WNDENUMPROC lpEnumFunc,	// pointer to callback function
		LPARAM lParam 	// application-defined value
);	
 

	Parameters

	* hWndParent

	  Identifies the parent window whose child windows are to be 
	  enumerated. 

	* lpEnumFunc

	  Points to an application-defined callback function. For more 
	  information about the callback function, see the EnumChildProc 
	  callback function. 

	* lParam

	  Specifies a 32-bit, application-defined value to be passed to the 
	  callback function. 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumChildWindows (	EIF_INTEGER hWndParent,
											EIF_POINTER lpCurrent,
											EIF_POINTER lpEifEnumFunc,
											EIF_INTEGER lParam)
{
	ENUMPARAM	EnumParam;
		
	EnumParam.eif_object	= lpCurrent;
	EnumParam.lparam		= lParam;
	EnumParam.eif_enum		= lpEifEnumFunc;
	
	return (EIF_BOOLEAN) EnumChildWindows( (HWND) hWndParent,
											c_enum_window_proc,
											(LPARAM)&EnumParam);
}

/*
	------------------------------------------------------------------------
	EnumThreadWindows

	The EnumThreadWindows function enumerates all nonchild windows 
	associated with a thread by passing the handle of each window, in turn, 
	to an application-defined callback function. EnumThreadWindows 
	continues until the last window is enumerated or the callback function 
	returns FALSE. To enumerate child windows of a particular window, use 
	the EnumChildWindows function. This function supersedes the 
	EnumTaskWindows function. 

	BOOL EnumThreadWindows(
		DWORD dwThreadId,	// thread identifier
		WNDENUMPROC lpfn,	// pointer to callback function
		LPARAM lParam 	// application-defined value
	);	
 

	Parameters

	* dwThreadId

	Identifies the thread whose windows are to be enumerated. 

	* lpfn

	  Points to an application-defined callback function. For more 
	  information about the callback function, see the EnumThreadWndProc 
	  callback function. 

	* lParam

	  Specifies a 32-bit, application-defined value to be passed to the 
	  callback function.

	Return Values

	  If the function succeeds, the return value is nonzero.

	  If the function fails, the return value is zero. 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumThreadWindows(EIF_INTEGER dwThreadId,
										  EIF_POINTER lpCurrent,
										  EIF_POINTER lpEifEnumFunc,
										  EIF_INTEGER lParam)
{
	ENUMPARAM EnumParam;
		
	EnumParam.eif_object = lpCurrent;
	EnumParam.lparam     = lParam;
	EnumParam.eif_enum   = lpEifEnumFunc;
	
	return (EIF_BOOLEAN) EnumThreadWindows((DWORD) dwThreadId,
											c_enum_window_proc,
											(LPARAM)&EnumParam);
}

/*
	------------------------------------------------------------------------
	EnumWindows

	The EnumWindows function enumerates all top-level windows on the screen 
	by passing the handle of each window, in turn, to an 
	application-defined callback function. EnumWindows continues until the 
	last top-level window is enumerated or the callback function returns 
	FALSE. 

	BOOL EnumWindows(
		WNDENUMPROC lpEnumFunc,	// pointer to callback function
		LPARAM lParam 	// application-defined value
	);	
 

	Parameters

	* lpEnumFunc

	  Points to an application-defined callback function. For more 
	  information, see the EnumWindowsProc callback function. 

	* lParam

	  Specifies a 32-bit, application-defined value to be passed to the 
	  callback function. 

	Return Values

	  If the function succeeds, the return value is nonzero.

	  If the function fails, the return value is zero. 
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_EnumWindows (EIF_POINTER lpCurrent,
									 EIF_POINTER lpEifEnumFunc,
									 EIF_INTEGER lParam)
{
	ENUMPARAM EnumParam;

	EnumParam.eif_object = lpCurrent;
	EnumParam.lparam     = lParam;
	EnumParam.eif_enum   = lpEifEnumFunc;
	
	return (EIF_BOOLEAN) EnumWindows(c_enum_window_proc,
									(LPARAM)&EnumParam);
}

/*
	------------------------------------------------------------------------
	The WindowFromPoint function retrieves the handle of the window that
	contains the specified point. 

	HWND WindowFromPoint(
		POINT Point 	// structure with point
	);	
 

	Parameters

	* Point

	Specifies a POINT structure that defines the point to be checked. 


	Return Values

	If the function succeeds, the return value is the handle of the window
	that contains the point. If no window exists at the given point,
	the return value is NULL. 
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WindowFromPoint(EIF_POINTER Point)
{
	return (EIF_INTEGER) WindowFromPoint(*((POINT*)Point));
}
