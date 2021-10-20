indexing
	contents: "WIN32 listview macros"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_LISTVIEW_MACROS

--	------------------------------------------------------------------------
--	Following are the macros used with tab controls. 
--	
--	ListView_Arrange
--	ListView_CreateDragImage
--	ListView_DeleteAllItems
--	ListView_DeleteColumn
--	ListView_DeleteItem
--	ListView_EditLabel
--	ListView_EnsureVisible
--	ListView_FindItem
--	ListView_GetBkColor
--	ListView_GetCallbackMask
--	ListView_GetColumn
--	ListView_GetColumnWidth
--	ListView_GetCountPerPage
--	ListView_GetEditControl
--	ListView_GetImageList
--	ListView_GetISearchString
--	ListView_GetItem
--	ListView_GetItemCount
--	ListView_GetItemPosition
--	ListView_GetItemRect
--	ListView_GetItemSpacing
--	ListView_GetItemState
--	ListView_GetItemText
--	ListView_GetNextItem
--	ListView_GetOrigin
--	ListView_GetSelectedCount
--	ListView_GetStringWidth
--	ListView_GetTextBkColor
--	ListView_GetTextColor
--	ListView_GetTopIndex
--	ListView_GetViewRect
--	ListView_HitTest
--	ListView_InsertColumn
--	ListView_InsertItem
--	ListView_RedrawItems
--	ListView_Scroll
--	ListView_SetBkColor
--	ListView_SetCallbackMask
--	ListView_SetColumn
--	ListView_SetColumnWidth
--	ListView_SetImageList
--	ListView_SetItem
--	ListView_SetItemCount
--	ListView_SetItemPosition
--	ListView_SetItemPosition32
--	ListView_SetItemState
--	ListView_SetItemText
--	ListView_SetTextBkColor
--	ListView_SetTextColor
--	ListView_SortItems
--	ListView_Update
--	------------------------------------------------------------------------

inherit
	WIN32_LISTVIEW_CONSTANTS

feature {NONE}

	-- ListView_Arrange

	ListView_Arrange (a_hwnd : POINTER;
						a_code : INTEGER) : BOOLEAN is
			-- The ListView_Arrange macro arranges items in icon
			-- view. You can use this macro or explicitly send the
			-- LVM_ARRANGE message.
		external "C use <windows.h>"
		end -- ListView_Arrange

	-- ListView_DeleteAllItems

	ListView_DeleteAllItems (a_hwnd : POINTER) : BOOLEAN is
			-- The ListView_DeleteAllItems macro removes all items
			-- from a list view control. You can use this macro or
			-- explicitly send the LVM_DELETEALLITEMS message.
		external "C use <windows.h>"
		end -- ListView_DeleteAllItems

	-- ListView_DeleteAllItems

	-- ListView_DeleteColumn

	ListView_DeleteColumn (a_hwnd : POINTER;
							a_iCol : INTEGER) : BOOLEAN is
			-- The ListView_DeleteColumn macro removes a column from
			-- a list view control. You can use this macro or explicitly
			-- send the LVM_DELETECOLUMN message.
		external "C use <windows.h>"
		end -- ListView_DeleteColumn

	-- ListView_DeleteItem

	ListView_DeleteItem (a_hwnd : POINTER;
							a_iItem : INTEGER) : BOOLEAN is
			-- The ListView_DeleteItem macro removes an item from
			-- a list view control. You can use this macro or explicitly
			-- send the LVM_DELETEITEM message.
		external "C use <windows.h>"
		end -- ListView_DeleteItem

	-- ListView_EditLabel

	ListView_EditLabel (a_hwnd : POINTER;
						a_iItem : INTEGER) : POINTER is
			-- The ListView_EditLabel macro begins in-place editing
			-- of the specified list view item's text. The message
			-- implicitly selects and focuses the specified item.
			-- You can use this macro or explicitly send the LVM_EDITLABEL
			-- message.
		external "C use <windows.h>"
		end -- ListView_EditLabel

	-- ListView_EnsureVisible

	ListView_EnsureVisible (a_hwnd : POINTER;
							a_i : INTEGER;
							a_fPartialOK : BOOLEAN) : BOOLEAN is
			-- The ListView_EnsureVisible macro ensures that a list
			-- view item is entirely or at least partially visible,
			-- scrolling the list view control if necessary. You can
			-- use this macro or explicitly send the LVM_ENSUREVISIBLE
			-- message.
		external "C use <windows.h>"
		end -- ListView_EnsureVisible

	-- ListView_FindItem

	ListView_FindItem (a_hwnd : POINTER;
						a_iStart : INTEGER;
						a_plvfi_deref : POINTER) : INTEGER is
--	ListView_FindItem (a_hwnd : POINTER;
--						a_iStart : INTEGER;
--						a_plvfi_deref : WIN32_LV_FINDINFO) : INTEGER is
			-- The ListView_FindItem macro searches for a list view
			-- item with the specified characteristics. You can use
			-- this macro or explicitly send the LVM_FINDITEM message.
		external "C use <windows.h>"
		end -- ListView_FindItem

	-- ListView_GetBkColor

	ListView_GetBkColor (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetBkColor macro retrieves the background
			-- color of a list view control. You can use this macro
			-- or explicitly send the LVM_GETBKCOLOR message.
		external "C use <windows.h>"
		end -- ListView_GetBkColor

	-- ListView_GetCallbackMask

	ListView_GetCallbackMask (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetCallbackMask macro retrieves the callback
			-- mask for a list view control. You can use this macro
			-- or explicitly send the LVM_GETCALLBACKMASK message.
		external "C use <windows.h>"
		end -- ListView_GetCallbackMask

	-- ListView_GetColumn

	ListView_GetColumn (a_hwnd : POINTER;
						a_iCol : INTEGER;
						a_lv_info : POINTER) : BOOLEAN is
--	ListView_GetColumn (a_hwnd : POINTER;
--						a_iCol : INTEGER;
--						a_lv_info : WIN32_LV_COLUMN) : BOOLEAN is
			-- The ListView_GetColumn macro retrieves the attributes
			-- of a list view control's column. You can use this macro
			-- or explicitly send the LVM_GETCOLUMN message.
		external "C use <windows.h>"
		end -- ListView_GetColumn

	-- ListView_GetColumnWidth

	ListView_GetColumnWidth(a_hwnd : POINTER;
							a_iCol : INTEGER) : INTEGER is
			-- The ListView_GetColumnWidth macro retrieves the width
			-- of a column in report or list view. You can use this
			-- macro or explicitly send the LVM_GETCOLUMNWIDTH message.
		external "C use <windows.h>"
		end -- ListView_GetColumnWidth

	-- ListView_GetCountPerPage

	ListView_GetCountPerPage (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetCountPerPage macro calculates the
			-- number of items that can fit vertically in the visible
			-- area of a list view control when in list or report
			-- view. Only fully visible items are counted. You can
			-- use this macro or explicitly send the LVM_GETCOUNTPERPAGE
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetCountPerPage

	-- ListView_GetEditControl

	ListView_GetEditControl (a_hwnd : POINTER) : POINTER is
			-- The ListView_GetEditControl macro retrieves the handle
			-- to the edit control being used to edit a list view
			-- item's text. You can use this macro or explicitly send
			-- the LVM_GETEDITCONTROL message.
		external "C use <windows.h>"
		end -- ListView_GetEditControl

	-- ListView_GetImageList

	ListView_GetImageList (a_hwnd : POINTER;
							a_iImageList : INTEGER) : POINTER is
			-- The ListView_GetImageList macro retrieves the handle
			-- to an image list used for drawing list view items.
			-- You can use this macro or explicitly send the LVM_GETIMAGELIST
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetImageList

	-- ListView_GetISearchString

	ListView_GetISearchString (a_hwnd : POINTER;
								a_sz : POINTER) : BOOLEAN is
--	ListView_GetISearchString (a_hwnd : POINTER;
--								a_sz : STRING) : BOOLEAN is
			-- The ListView_GetISearchString macro retrieves the
			-- incremental search string of a list-view control. You
			-- can use this macro or explicitly send the LVM_GETISEARCHSTRING
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetISearchString

	-- ListView_GetItem

	ListView_GetItem (a_hwnd : POINTER;
						a_pitem_deref : POINTER) : BOOLEAN is
--	ListView_GetItem (a_hwnd : POINTER;
--						a_pitem_deref : WIN32_LV_ITEM) : BOOLEAN is
			-- The ListView_GetItem macro retrieves some or all of
			-- a list view item's attributes. You can use this macro
			-- or explicitly send the LVM_GETITEM message.
		external "C use <windows.h>"
		end -- ListView_GetItem

	-- ListView_GetItemCount

	ListView_GetItemCount (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetItemCount macro retrieves the number
			-- of items in a list view control. You can use this macro
			-- or explicitly send the LVM_GETITEMCOUNT message.
		external "C use <windows.h>"
		end -- ListView_GetItemCount

	-- ListView_GetItemPosition

	ListView_GetItemPosition (a_hwnd : POINTER;
								a_i : INTEGER;
								a_ppt_deref : POINTER) : BOOLEAN is
--	ListView_GetItemPosition (a_hwnd : POINTER;
--								a_i : INTEGER;
--								a_ppt_deref : WIN32_POINT) : BOOLEAN is
			-- The ListView_GetItemPosition macro retrieves the position
			-- of a list view item. You can use this macro or explicitly
			-- send the LVM_GETITEMPOSITION message.
		external "C use <windows.h>"
		end -- ListView_GetItemPosition

	-- ListView_GetItemRect

	ListView_GetItemRect (a_hwnd : POINTER;
							a_i : INTEGER;
							a_prc_deref : POINTER) : BOOLEAN is
--	ListView_GetItemRect (a_hwnd : POINTER;
--							a_i : INTEGER;
--							a_prc_deref : WIN32_RECT) : BOOLEAN is
			-- The ListView_GetItemRect macro retrieves the bounding
			-- rectangle for all or part of an item in the current
			-- view. You can use this macro or explicitly send the
			-- LVM_GETITEMRECT message.
		external "C use <windows.h>"
		end -- ListView_GetItemRect

	-- ListView_GetItemSpacing

	ListView_GetItemSpacing(a_hwnd : POINTER;
							a_fSmall : BOOLEAN) : INTEGER is
			-- The ListView_GetItemSpacing macro determines the spacing
			-- between items in a list view control. You can use this
			-- macro or explicitly send the LVM_GETITEMSPACING message.
		external "C use <windows.h>"
		end -- ListView_GetItemSpacing

	-- ListView_GetItemState

	ListView_GetItemState (a_hwnd : POINTER;
							a_i : INTEGER;
							a_mask : BIT 32) : BIT 32 is
			-- The ListView_GetItemState macro retrieves the state
			-- of a list view item. You can use this macro or explicitly
			-- send the LVM_GETITEMSTATE message.
		external "C use <windows.h>"
		end -- ListView_GetItemState

	-- ListView_GetItemText

	ListView_GetItemText (a_hwnd : POINTER;
							a_iItem : INTEGER;
							a_iSubItem : INTEGER;
							a_pszText_deref : POINTER;
							a_cchTextMax : INTEGER) is
--	ListView_GetItemText (a_hwnd : POINTER;
--							a_iItem : INTEGER;
--							a_iSubItem : INTEGER;
--							a_pszText_deref : STRING;
--							a_cchTextMax : INTEGER) is
			-- The ListView_GetItem macro retrieves the text of a
			-- list view item or subitem. You can use this macro or
			-- explicitly send the LVM_GETITEMTEXT message.
		external "C use <windows.h>"
		end -- ListView_GetItemText

	-- ListView_GetNextItem

	ListView_GetNextItem (a_hwnd : POINTER;
							a_iStart : INTEGER;
							a_flags : INTEGER) : INTEGER is
			-- The ListView_GetNextItem macro searches for a list
			-- view item that has the specified properties and bears
			-- the specified relationship to a specified item. You
			-- can use this macro or explicitly send the LVM_GETNEXTITEM
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetNextItem

	-- ListView_GetOrigin

	ListView_GetOrigin (a_hwnd : POINTER;
						a_ptOrg : POINTER) : BOOLEAN is
--	ListView_GetOrigin (a_hwnd : POINTER;
--						a_ptOrg : WIN32_POINT) : BOOLEAN is
			-- The ListView_GetOrigin macro retrieves the current
			-- view origin for a list view control. You can use this
			-- macro or explicitly send the LVM_GETORIGIN message.
		external "C use <windows.h>"
		end -- ListView_GetOrigin

	-- ListView_GetSelectedCount

	ListView_GetSelectedCount (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetSelectedCount macro determines the
			-- number of selected items in a list view control. You
			-- can use this macro or explicitly send the LVM_GETSELECTEDCOUNT
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetSelectedCount

	-- ListView_GetStringWidth

	ListView_GetStringWidth (a_hwnd : POINTER;
				a_psz_deref : POINTER) : INTEGER is
			-- The ListView_GetStringWidth macro determines the width
			-- of a specified string, using the specified list view
			-- control's current font. You can use this macro or explicitly
			-- send the LVM_GETSTRINGWIDTH message.
		external "C use <windows.h>"
		end -- ListView_GetStringWidth

	-- ListView_GetTextBkColor

	ListView_GetTextBkColor (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetTextBkColor macro retrieves the text
			-- background color of a list view control. You can use
			-- this macro or explicitly send the LVM_GETTEXTBKCOLOR
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetTextBkColor

	-- ListView_GetTextColor

	ListView_GetTextColor (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetTextColor macro retrieves the text
			-- color of a list view control. You can use this macro
			-- or explicitly send the LVM_GETTEXTCOLOR message.
		external "C use <windows.h>"
		end -- ListView_GetTextColor

	-- ListView_GetTopIndex

	ListView_GetTopIndex (a_hwnd : POINTER) : INTEGER is
			-- The ListView_GetTopIndex macro retrieves the index
			-- of the topmost visible item when in list or report
			-- view. You can use this macro or explicitly send the
			-- LVM_GETTOPINDEX message.
		external "C use <windows.h>"
		end -- ListView_GetTopIndex

	-- ListView_GetViewRect

	ListView_GetViewRect (a_hwnd : POINTER;
							a_prc_deref : POINTER) : BOOLEAN is
--	ListView_GetViewRect (a_hwnd : POINTER;
--							a_prc_deref : WIN32_RECT) : BOOLEAN is
			-- The ListView_GetViewRect macro retrieves the bounding
			-- rectangle of all items in the list view control. The
			-- list view must be in icon or small icon view. You can
			-- use this macro or explicitly send the LVM_GETVIEWRECT
			-- message.
		external "C use <windows.h>"
		end -- ListView_GetViewRect

	-- ListView_HitTest

	ListView_HitTest (a_hwnd : POINTER;
						a_pinfo_deref : POINTER) : INTEGER is
--	ListView_HitTest (a_hwnd : POINTER;
--						a_pinfo_deref : WIN32_LV_HITTESTINFO) : INTEGER is
			-- The ListView_HitTest macro determines which list view
			-- item, if any, is at a specified position. You can use
			-- this macro or explicitly send the LVM_HITTEST message.
		external "C use <windows.h>"
		end -- ListView_HitTest

	-- ListView_InsertColumn

	ListView_InsertColumn (a_hwnd : POINTER;
							a_iCol : INTEGER;
							a_pcol_deref : POINTER) : INTEGER is
--	ListView_InsertColumn (a_hwnd : POINTER;
--							a_iCol : INTEGER;
--							a_pcol_deref : WIN32_LV_COLUMN) : INTEGER is
			-- The ListView_InsertColumn macro inserts a new column
			-- in a list view control. You can use this macro or explicitly
			-- send the LVM_INSERTCOLUMN message.
		external "C use <windows.h>"
		end -- ListView_InsertColumn

	-- ListView_InsertItem

	ListView_InsertItem (a_hwnd : POINTER;
							a_pitem_deref : POINTER) : INTEGER is
--	ListView_InsertItem (a_hwnd : POINTER;
--							a_pitem_deref : WIN32_LV_ITEM) : INTEGER is
			-- The ListView_InsertItem macro inserts a new item in
			-- a list view control. You can use this macro or explicitly
			-- send the LVM_INSERTITEM message.
		external "C use <windows.h>"
		end -- ListView_InsertItem

	-- ListView_RedrawItems

	ListView_RedrawItems (a_hwnd : POINTER;
							a_iFirst : INTEGER;
							a_iLast : INTEGER) : BOOLEAN is
			-- The ListView_RedrawItems macro forces a list view
			-- control to redraw a range of items. You can use this
			-- macro or explicitly send the LVM_REDRAWITEMS message.
		external "C use <windows.h>"
		end -- ListView_RedrawItems

	-- ListView_Scroll

	ListView_Scroll(a_hwnd : POINTER;
					a_dx : INTEGER;
					a_dy : INTEGER) : BOOLEAN is
			-- The ListView_Scroll macro scrolls the content of a
			-- list view control. You can use this macro or explicitly
			-- send the LVM_SCROLL message.
		external "C use <windows.h>"
		end -- ListView_Scroll

	-- ListView_SetBkColor

	ListView_SetBkColor(a_hwnd : POINTER;
						a_clrBk : INTEGER) : BOOLEAN is
			-- The ListView_SetBkColor macro sets the background
			-- color of a list view control. You can use this macro
			-- or explicitly send the LVM_SETBKCOLOR message.
		external "C use <windows.h>"
		end -- ListView_SetBkColor

	-- ListView_SetCallbackMask

	ListView_SetCallbackMask (a_hwnd : POINTER;
								a_mask : INTEGER) : BOOLEAN is
			-- The ListView_SetCallbackMask macro changes the callback
			-- mask for a list view control. You can use this macro
			-- or explicitly send the LVM_SETCALLBACKMASK message.
		external "C use <windows.h>"
		end -- ListView_SetCallbackMask

	-- ListView_SetColumn

	ListView_SetColumn (a_hwnd : POINTER;
						a_iCol : INTEGER;
						a_pcol_deref : POINTER) : BOOLEAN is
--	ListView_SetColumn (a_hwnd : POINTER;
--						a_iCol : INTEGER;
--						a_pcol_deref : WIN32_LV_COLUMN) : BOOLEAN is
			-- The ListView_SetColumn macro sets the attributes of
			-- a list view column. You can use this macro or explicitly
			-- send the LVM_SETCOLUMN message.
		external "C use <windows.h>"
		end -- ListView_SetColumn

	-- ListView_SetColumnWidth

	ListView_SetColumnWidth (a_hwnd : POINTER;
								a_iCol : INTEGER;
								a_cx : INTEGER) : BOOLEAN is
			-- The ListView_SetColumnWidth macro changes the width
			-- of a column in report or list view. You can use this
			-- macro or explicitly send the LVM_SETCOLUMNWIDTH message.
		external "C use <windows.h>"
		end -- ListView_SetColumnWidth

	-- ListView_SetImageList

	ListView_SetImageList (a_hwnd : POINTER;
							a_himl : POINTER;
							a_iImageList : INTEGER) : POINTER is
			-- The ListView_SetImageList macro assigns an image list
			-- to a list view control. You can use this macro or explicitly
			-- send the LVM_SETIMAGELIST message.
		external "C use <windows.h>"
		end -- ListView_SetImageList

	-- ListView_SetItem

	ListView_SetItem (a_hwnd : POINTER;
						a_pitem_deref : POINTER) : BOOLEAN is
--	ListView_SetItem (a_hwnd : POINTER;
--						a_pitem_deref : WIN32_LV_ITEM) : BOOLEAN is
			-- The ListView_SetItem macro sets some or all of a list
			-- view item's attributes. You can use this macro or explicitly
			-- send the LVM_SETITEM message.
		external "C use <windows.h>"
		end -- ListView_SetItem

	-- ListView_SetItemCount

	ListView_SetItemCount (a_hwnd : POINTER;
							a_cItems : INTEGER) is
			-- The ListView_SetItemCount macro prepares a list view
			-- control for adding a large number of items. You can
			-- use this macro or explicitly send the LVM_SETITEMCOUNT
			-- message.
		external "C use <windows.h>"
		end -- ListView_SetItemCount

	-- ListView_SetItemPosition

	ListView_SetItemPosition (a_hwnd : POINTER;
								a_i : INTEGER;
								a_x : INTEGER;
								a_y : INTEGER) : BOOLEAN is
			-- The ListView_SetItemPosition macro moves an item to
			-- a specified position in a list view control, which
			-- must be in icon or small icon view. You can use this
			-- macro or explicitly send the LVM_SETITEMPOSITION message.
		external "C use <windows.h>"
		end -- ListView_SetItemPosition

	-- ListView_SetItemPosition32

	ListView_SetItemPosition32 (a_hwnd : POINTER;
								a_iItem : INTEGER;
								a_x : INTEGER;
								a_y : INTEGER) is
			-- The ListView_SetItemPosition32 macro moves an item
			-- to a specified position in a list view control, which
			-- must be in icon or small icon view. This macro differs
			-- from the ListView_SetItemPosition macro in that it
			-- uses 32-bit coordinates. You can use the ListView_SetItemPosition32
			-- macro or explicitly send the LVM_SETITEMPOSITION32
			-- message.
		external "C use <windows.h>"
		end -- ListView_SetItemPosition32

	-- ListView_SetItemState

	ListView_SetItemState (a_hwnd : POINTER;
							a_i : INTEGER;
							a_state : BIT 32;
							a_mask : BIT 32) : BOOLEAN is
			-- The ListView_SetItemState macro changes the state
			-- of an item in a list view control. You can use this
			-- macro or explicitly send the LVM_SETITEMSTATE message.
		external "C use <windows.h>"
		end -- ListView_SetItemState

	-- ListView_SetItemText

	ListView_SetItemText (a_hwnd : POINTER;
							a_i : INTEGER;
							a_iSubItem : INTEGER;
							a_pszText_deref : POINTER) is
--	ListView_SetItemText (a_hwnd : POINTER;
--							a_i : INTEGER;
--							a_iSubItem : INTEGER;
--							a_pszText_deref : STRING) is
			-- The ListView_SetItemText macro changes the text of
			-- a list view item or subitem. You can use this macro
			-- or explicitly send the LVM_SETITEMTEXT message.
		external "C use <windows.h>"
		end -- ListView_SetItemText

	-- ListView_SetTextBkColor

	ListView_SetTextBkColor(a_hwnd : POINTER;
							a_clrText : INTEGER) : BOOLEAN is
			-- The ListView_SetTextBkColor macro sets the background
			-- color of text in a list view control. You can use this
			-- macro or explicitly send the LVM_SETTEXTBKCOLOR message.
		external "C use <windows.h>"
		end -- ListView_SetTextBkColor

	-- ListView_SetTextColor

	ListView_SetTextColor (a_hwnd : POINTER;
							a_clrText : INTEGER) : BOOLEAN is
			-- The ListView_SetTextColor macro sets the text color
			-- of a list view control. You can use this macro or explicitly
			-- send the LVM_SETTEXTCOLOR message.
		external "C use <windows.h>"
		end -- ListView_SetTextColor

	-- ListView_SortItems

	ListView_SortItems (a_hwnd : POINTER;
						a_lParamSort : INTEGER) : BOOLEAN is
			-- The ListView_SortItems macro uses an application-defined
			-- comparison function to sort the items of a list view
			-- control. The index of each item changes to reflect
			-- the new sequence. You can use this macro or explicitly
			-- send the LVM_SORTITEMS message.
		external "C use <windows.h>"
		end -- ListView_SortItems

	-- ListView_Update

	ListView_Update(a_hwnd : POINTER;
					a_iItem : INTEGER) : BOOLEAN is
			-- The ListView_Update macro updates a list view item.
			-- If the list view control has the LVS_AUTOARRANGE style,
			-- this macro causes the list view control to be arranged.
			-- You can use this macro or explicitly send the LVM_UPDATE
			-- message.
		external "C use <windows.h>"
		end -- ListView_Update

end -- WIN32_LISTVIEW_MACROS