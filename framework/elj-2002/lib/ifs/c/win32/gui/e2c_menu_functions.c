#include <windows.h>

#include "eiffel_glue.h"

#include "e2c_eiffelproc_global.h"


/*
	---------------------------------------------------------------------
	The LoadMenuIndirect function loads the specified menu template in 
	memory. 

	HMENU LoadMenuIndirect(
		CONST MENUTEMPLATE *lpMenuTemplate	// address of menu template
	);	
	
	If the spcified menu template is an extended one the function 
	c_LoadMenuIndirect_Ex is called. Then the menu consists of a
	MENUEX_TEMPLATE_HEADER followed by one or more contiguous 
	MENUEX_TEMPLATE_ITEM structures.

	If the spcified menu template is not an extended one the function 
	c_LoadMenuIndirect is called. Then the menu consists of a
	MENUITEMTEMPLATEHEADER followed by one or more contiguous 
	MENUITEMTEMPLATE structures.

	Original Parameters

	* lpMenuTemplate

	Points to a menu template or an extended menu template. A menu 
	template consists of a MENUITEMTEMPLATEHEADER structure followed by 
	one or more contiguous MENUITEMTEMPLATE structures. An extended menu 
	template consists of a MENUEX_TEMPLATE_HEADER structure followed by 
	one or more contiguous MENUEX_TEMPLATE_ITEM structures. 

	Eiffel-specific Parameters

	* lpMenuTemplateHeader
	
	Points either to a MENUITEMTEMPLATEHEADER structure or a 
	MENUEX_TEMPLATE_HEADER structure.
	
	* lpMenuTemplateItems

	Points either to an array of MENUITEMTEMPLATE structures or of
	MENUEX_TEMPLATE_ITEM structures. 
	
	* iItemCount
	
	Determines how many items are in the second parameter

	Return Values

	If the function succeeds, the return value is the handle of the menu. 
	If the function fails, the return value is NULL. To get extended 
	error information, call GetLastError. 

	See Also

	LoadMenu, MENUEX_TEMPLATE_HEADER, MENUEX_TEMPLATE_ITEM, 
	MENUITEMTEMPLATE, MENUITEMTEMPLATEHEADER 
	---------------------------------------------------------------------
*/
/*
EIF_INTEGER c_LoadMenuIndirect (EIF_POINTER lpMenuTemplateHeader, 
								EIF_POINTER lpMenuTemplateItems,
								EIF_INTEGER iItemCount)
{
	EIF_INTEGER result;
	
	EIF_MENU_TEMPLATE* menutemplate = (EIF_MENU_TEMPLATE*) malloc(sizeof (MENUITEMTEMPLATEHEADER) + iItemCount * sizeof (MENUITEMTEMPLATE));
	
	memcpy (&menutemplate->header, lpMenuTemplateHeader, sizeof (MENUITEMTEMPLATEHEADER));
	memcpy (menutemplate->items, lpMenuTemplateItems, iItemCount * sizeof (MENUITEMTEMPLATE));
	
	result = (EIF_INTEGER) LoadMenuIndirect ((CONST MENUTEMPLATE*) menutemplate);
	
	free (menutemplate);
	
	return result;
}

EIF_INTEGER c_LoadMenuIndirect_Ex (	EIF_POINTER lpMenuTemplateHeader, 
									EIF_POINTER lpMenuTemplateItems,
									EIF_INTEGER iItemCount)
{
	EIF_INTEGER result;
	
	EIF_MENU_TEMPLATE_EX* menutemplate = (EIF_MENU_TEMPLATE_EX*) malloc(sizeof (MENUEX_TEMPLATE_HEADER) + iItemCount * sizeof (MENUEX_TEMPLATE_ITEM));
	
	memcpy (&menutemplate->header, lpMenuTemplateHeader, sizeof (MENUEX_TEMPLATE_HEADER));
	memcpy (menutemplate->items, lpMenuTemplateItems, iItemCount * sizeof (MENUEX_TEMPLATE_ITEM));
	
	result = (EIF_INTEGER) LoadMenuIndirect ((CONST MENUTEMPLATE*) menutemplate);
	
	free (menutemplate);
	
	return result;
}
*/
/*
	------------------------------------------------------------------
	The MenuItemFromPoint function determines which menu item, if any, 
	is at the specified location.

	UINT WINAPI MenuItemFromPoint(
		HWND hWnd, 	 
		HMENU hMenu, 	
		POINT ptScreen	
	);	

	Parameters

	* hWnd

	Handle to the window containing the menu.

	* hMenu

	Handle to the menu containing the menu items to hit test.

	* ptScreen

	POINT structure specifying the location to test. If hMenu specifies 
	a menu bar, this parameter is in window coordinates. Otherwise, it is 
	in client coordinates.

	Return Values

	Returns the zero-based position of the menu item at the specified 
	location or -1 if no menu item is at the specified location.

	See Also

	POINT 
	------------------------------------------------------------------
*/

EIF_INTEGER c_MenuItemFromPoint (EIF_INTEGER hWnd,
								EIF_INTEGER hMenu, 
								EIF_POINTER ptScreen)
{
	return (EIF_INTEGER) MenuItemFromPoint ((HWND) hWnd,
											(HMENU) hMenu,
											*((POINT*) ptScreen));
}
