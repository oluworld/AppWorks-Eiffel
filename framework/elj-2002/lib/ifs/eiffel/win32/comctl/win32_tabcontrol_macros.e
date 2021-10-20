indexing
	contents: "WIN32 tabcontrol macros"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_TABCONTROL_MACROS

--	------------------------------------------------------------------------
--	Following are the macros used with tab controls. 
--
--	TabCtrl_AdjustRect
--	TabCtrl_DeleteAllItems
--	TabCtrl_DeleteItem
--	TabCtrl_GetCurFocus
--	TabCtrl_GetCurSel
--	TabCtrl_GetImageList
--	TabCtrl_GetItem
--	TabCtrl_GetItemCount
--	TabCtrl_GetItemRect
--	TabCtrl_GetRowCount
--	TabCtrl_GetToolTips
--	TabCtrl_HitTest
--	TabCtrl_InsertItem
--	TabCtrl_RemoveImage
--	TabCtrl_SetCurFocus
--	TabCtrl_SetCurSel
--	TabCtrl_SetImageList
--	TabCtrl_SetItem
--	TabCtrl_SetItemExtra
--	TabCtrl_SetItemSize
--	TabCtrl_SetPadding
--	TabCtrl_SetToolTips
--	------------------------------------------------------------------------

inherit
	WIN32_TABCONTROL_CONSTANTS

feature {NONE}

	TabCtrl_AdjustRect (a_hwnd: POINTER;
						a_larger: BOOLEAN;
						a_rect: POINTER) is
--	TabCtrl_AdjustRect (a_hwnd: POINTER;
--						a_larger: BOOLEAN;
--						a_rect: WIN32_RECT) is
--		The TabCtrl_AdjustRect macro calculates a tab control's display area 
--		given a window rectangle or calculates the window rectangle that would 
--		correspond to a specified display area. You can use this macro or 
--		explicitly send the TCM_ADJUSTRECT message.
		external "C use <windows.h>"
		end -- TabCtrl_AdjustRect

	TabCtrl_DeleteAllItems (a_hwnd: POINTER): BOOLEAN is
	--	The TabCtrl_DeleteAllItems macro removes all items from a tab control. 
	--	You can use this macro or explicitly send the TCM_DELETEALLITEMS message.
		external "C use <windows.h>"
		end -- TabCtrl_DeleteAllItems 
		
	TabCtrl_DeleteItem (a_hwnd: POINTER;
						a_item: INTEGER): BOOLEAN is
--		The TabCtrl_DeleteItem macro removes an item from a tab control. You can 
--		use this macro or explicitly send the TCM_DELETEITEM message.
		external "C use <windows.h>"
		end -- TabCtrl_DeleteItem

	TabCtrl_GetCurFocus (a_hwnd: POINTER): INTEGER is
--		The TabCtrl_GetCurFocus macro returns the index of the item that has the 
--		focus in a tab control. You can use this macro or explicitly send the 
--		TCM_GETCURFOCUS message.
		external "C use <windows.h>"
		end -- TabCtrl_GetCurFocus

	TabCtrl_GetCurSel (a_hwnd: POINTER): INTEGER is
--		The TabCtrl_GetCurSel macro determines the currently selected tab in a 
--		tab control. You can use this macro or explicitly send the TCM_GETCURSEL 
--		message.
		external "C use <windows.h>"
		end -- TabCtrl_GetCurSel

	TabCtrl_GetImageList (a_hwnd: POINTER): POINTER is
		--The TabCtrl_GetImageList macro retrieves the image list associated with a 
		--tab control. You can use this macro or explicitly send the 
		--TCM_GETIMAGELIST message.
		external "C use <windows.h>"
		end -- TabCtrl_GetImageList

	TabCtrl_GetItem (a_hwnd: POINTER;
						a_item: INTEGER;
						a_pitem: POINTER): BOOLEAN is
--	TabCtrl_GetItem (a_hwnd: POINTER;
--						a_item: INTEGER;
--						a_pitem: WIN32_TC_ITEM): BOOLEAN is
--		The TabCtrl_GetItem macro retrieves information about a tab in a tab 
--		control. You can use this macro or explicitly send the TCM_GETITEM 
--		message.
		external "C use <windows.h>"
		end -- TabCtrl_GetItem

	TabCtrl_GetItemCount (a_hwnd: POINTER): INTEGER is
--		The TabCtrl_GetItemCount macro retrieves the number of tabs in the tab 
--		control. You can use this macro or explicitly send the TCM_GETITEMCOUNT 
--		message.
		external "C use <windows.h>"
		end -- TabCtrl_GetItemCount

	TabCtrl_GetItemRect (a_hwnd: POINTER;
							a_item: INTEGER;
							a_rect: POINTER): BOOLEAN is
--	TabCtrl_GetItemRect (a_hwnd: POINTER;
--							a_item: INTEGER;
--							a_rect: WIN32_RECT): BOOLEAN is
--		The TabCtrl_GetItemRect macro retrieves the bounding rectangle for a tab 
--		in a tab control. You can use this macro or explicitly send the 
--		TCM_GETITEMRECT message.
		external "C use <windows.h>"
		end -- TabCtrl_GetItemRect

	TabCtrl_GetRowCount (a_hwnd: POINTER): INTEGER is
--		The TabCtrl_GetRowCount macro retrieves the current number of rows of 
--		tabs in a tab control. You can use this macro or explicitly send the 
--		TCM_GETROWCOUNT message.
		external "C use <windows.h>"
		end -- TabCtrl_GetRowCount

	TabCtrl_GetToolTips (a_hwnd: POINTER): INTEGER is
--		The TabCtrl_GetToolTips macro retrieves the handle to the tooltip control 
--		associated with a tab control. You can use this macro or explicitly send 
--		the TCM_GETTOOLTIPS message.
		external "C use <windows.h>"
		end -- TabCtrl_GetToolTips

	TabCtrl_HitTest (a_hwnd: POINTER;
						a_info: WIN32_TC_HITTESTINFO): INTEGER is
--	TabCtrl_HitTest (a_hwnd: POINTER;
--						a_info: POINTER): INTEGER is
--		The TabCtrl_HitTest macro determines which tab, if any, is at a specified 
--		screen position. You can use this macro or explicitly send the 
--		TCM_HITTEST message.
		external "C use <windows.h>"
		end -- TabCtrl_HitTest

	TabCtrl_InsertItem (a_hwnd: POINTER;
						a_item: INTEGER;
						a_pitem: POINTER): INTEGER is
--	TabCtrl_InsertItem (a_hwnd: POINTER;
--						a_item: INTEGER;
--						a_pitem: WIN32_TC_ITEM): INTEGER is
--		The TabCtrl_InsertItem macro inserts a new tab in a tab control. You can 
--		use this macro or explicitly send the TCM_INSERTITEM message.
		external "C use <windows.h>"
		end -- TabCtrl_InsertItem

	TabCtrl_RemoveImage (a_hwnd: POINTER;
							a_image: INTEGER) is
--		The TabCtrl_RemoveImage macro removes an image from a tab control's image 
--		list. You can use this macro or explicitly send the TCM_REMOVEIMAGE 
--		message.
		external "C use <windows.h>"
		end -- TabCtrl_RemoveImage

	TabCtrl_SetCurFocus (a_hwnd: POINTER;
							a_item: INTEGER) is
--		The TabCtrl_SetCurFocus macro sets the focus to a specified tab in a tab 
--		control. You can use this macro, or you can explicitly send the 
--		TCM_SETCURFOCUS message.
		external "C use <windows.h>"
		end -- TabCtrl_SetCurFocus

	TabCtrl_SetCurSel (a_hwnd: POINTER;
						a_item: INTEGER): INTEGER is
--		The TabCtrl_SetCurSel macro selects a tab in a tab control. You can use 
--		this macro or explicitly send the TCM_SETCURSEL message.
		external "C use <windows.h>"
		end -- TabCtrl_SetCurSel

	TabCtrl_SetImageList (a_hwnd: POINTER;
							a_himl: POINTER): BOOLEAN is
--		The TabCtrl_SetImageList macro assigns an image list to a tab control. 
--		You can use this macro or explicitly send the TCM_SETIMAGELIST message.
		external "C use <windows.h>"
		end -- TabCtrl_SetImageList

	TabCtrl_SetItem (a_hwnd: POINTER;
						a_item: INTEGER;
						a_pitem: POINTER): BOOLEAN is
--	TabCtrl_SetItem (a_hwnd: POINTER;
--						a_item: INTEGER;
--						a_pitem: WIN32_TC_ITEM): BOOLEAN is
--		The TabCtrl_SetItem macro sets some or all of a tab's attributes. You can 
--		use this macro or explicitly send the TCM_SETITEM message.
		external "C use <windows.h>"
		end -- TabCtrl_SetItem

	TabCtrl_SetItemExtra (a_hwnd: POINTER;
							a_cb: INTEGER): BOOLEAN is
--		The TabCtrl_SetItemExtra macro sets the number of bytes per tab reserved 
--		for application-defined data in a tab control. You can use this macro or 
--		explicitly send the TCM_SETITEMEXTRA message.
		external "C use <windows.h>"
		end -- TabCtrl_SetItemExtra

	TabCtrl_SetItemSize (a_hwnd: POINTER;
							a_cx: INTEGER;
							a_cy: INTEGER): INTEGER is
--		The TabCtrl_SetItemSize macro sets the width and height of tabs in a 
--		fixed-width or owner-drawn tab control. You can use this macro or 
--		explicitly send the TCM_SETITEMSIZE message.
		external "C use <windows.h>"
		end -- TabCtrl_SetItemSize

	TabCtrl_SetPadding (a_hwnd: POINTER;
						a_cx: INTEGER;
						a_cy: INTEGER) is
--		The TabCtrl_SetPadding macro sets the amount of space (padding) around 
--		each tab's icon and label in a tab control. You can use this macro or 
--		explicitly send the TCM_SETPADDING message.
		external "C use <windows.h>"
		end -- TabCtrl_SetPadding

	TabCtrl_SetToolTips (a_hwnd_tab: POINTER;
							a_hwnd_tt: POINTER) is
--		The TabCtrl_SetToolTips macro assigns a tooltip control to a tab control. 
--		You can use this macro or explicitly send the TCM_SETTOOLTIPS message.
		external "C use <windows.h>"
		end -- TabCtrl_SetToolTips

end -- WIN32_TABCONTROL_MACROS