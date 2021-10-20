class WIN32_TREEVIEW_MACROS


feature {NONE}

	-- TreeView_CreateDragImage

	TreeView_CreateDragImage (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_CreateDragImage macro creates a dragging
			-- bitmap for the specified item in a tree-view control,
			-- creates an image list for the bitmap, and adds the
			-- bitmap to the image list. An application can display
			-- the image when dragging the item by using the image
			-- list functions. You can use this macro or explicitly
			-- send the TVM_CREATEDRAGIMAGE message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_CreateDragImage

	-- TreeView_DeleteAllItems

	TreeView_DeleteAllItems (a_hwnd : POINTER) : BOOLEAN is
			-- The TreeView_DeleteAllItems macro removes an item
			-- from a tree-view control. You can use this macro, the
			-- TreeView_DeleteItem macro, or explicitly send the TVM_DELETEITEM
			-- message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_DeleteAllItems

	-- TreeView_DeleteItem

	TreeView_DeleteItem (a_hwnd : POINTER;
		a_hitem : POINTER) : BOOLEAN is
			-- The TreeView_DeleteItem macro removes an item from
			-- a tree-view control. You can use this macro, the TreeView_DeleteAllItems
			-- macro, or explicitly send the TVM_DELETEITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_DeleteItem

	-- TreeView_EditLabel

	TreeView_EditLabel (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_EditLabel macro begins in-place editing
			-- of the specified item's text, replacing the text of
			-- the item with a single-line edit control containing
			-- the text. This macro implicitly selects and focuses
			-- the specified item. You can use this macro or explicitly
			-- send the TVM_EDITLABEL message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_EditLabel

	-- TreeView_EndEditLabelNow

	TreeView_EndEditLabelNow (a_hwnd : POINTER;
		a_fCancel : BOOLEAN) : BOOLEAN is
			-- The TreeView_EndEditLabelNow macro ends the editing
			-- of a tree-view item's label. You can use this macro
			-- or explicitly send the TVM_ENDEDITLABELNOW message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_EndEditLabelNow

	-- TreeView_EnsureVisible

	TreeView_EnsureVisible (a_hwnd : POINTER;
		a_hitem : POINTER) : BOOLEAN is
			-- The TreeView_EnsureVisible macro ensures that a tree-view
			-- item is visible, expanding the parent item or scrolling
			-- the tree-view control, if necessary. You can use this
			-- macro or explicitly send the TVM_ENSUREVISIBLE message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_EnsureVisible

	-- TreeView_Expand

	TreeView_Expand (a_hwnd : POINTER;
		a_hitem : POINTER;
		a_flag : INTEGER) : BOOLEAN is
			-- The TreeView_Expand macro expands or collapses the
			-- list of child items, if any, associated with the specified
			-- parent item. You can use this macro or explicitly send
			-- the TVM_EXPAND message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_Expand

	-- TreeView_GetCount

	TreeView_GetCount (a_hwnd : POINTER) : INTEGER is
			-- The TreeView_GetCount macro retrieves a count of the
			-- items in a tree-view control. You can use this macro
			-- or explicitly send the TVM_GETCOUNT message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetCount

	-- TreeView_GetEditControl

	TreeView_GetEditControl (a_hwnd : POINTER) : POINTER is
			-- The TreeView_GetEditControl macro retrieves the handle
			-- to the edit control being used to edit a tree-view
			-- item's text. You can use this macro or explicitly send
			-- the TVM_GETEDITCONTROL message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetEditControl

	-- TreeView_GetImageList

	TreeView_GetImageList (a_hwnd : POINTER;
		a_iImage : INTEGER) : POINTER is
			-- The TreeView_GetImageList macro retrieves the handle
			-- to the normal or state image list associated with a
			-- tree-view control. You can use this macro or explicitly
			-- send the TVM_GETIMAGELIST message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetImageList

	-- TreeView_GetIndent

	TreeView_GetIndent (a_hwnd : POINTER) : INTEGER is
			-- The TreeView_GetIndent macro retrieves the amount,
			-- in pixels, that child items are indented relative to
			-- their parent items. You can use this macro or explicitly
			-- send the TVM_GETINDENT message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetIndent

	-- TreeView_GetISearchString

	TreeView_GetISearchString (a_hwnd : POINTER;
		a_psz : POINTER) : BOOLEAN is
--	TreeView_GetISearchString (a_hwnd : POINTER;
--		a_psz : STRING) : BOOLEAN is
			-- The TreeView_GetISearchString macro retrieves the
			-- incremental search string for a tree-view control.
			-- The tree-view control uses the incremental search string
			-- to select an item based on characters typed by the
			-- user. You can use this macro or explicitly send the
			-- TVM_GETISEARCHSTRING message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_psz : a_psz.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetISearchString

	-- TreeView_GetItem

	TreeView_GetItem (a_hwnd : POINTER;
		a_item : POINTER) : BOOLEAN is
--	TreeView_GetItem (a_hwnd : POINTER;
--		a_item : WIN32_TV_ITEM) : BOOLEAN is
			-- The TreeView_GetItem macro retrieves some or all of
			-- a tree-view item's attributes. You can use this macro
			-- or explicitly send the TVM_GETITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_item : a_item.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetItem

	-- TreeView_GetItemRect

	TreeView_GetItemRect (a_hwnd : POINTER;
		a_hitem : POINTER;
		a_rc : POINTER;
		a_fItemRect : BOOLEAN) : BOOLEAN is
--	TreeView_GetItemRect (a_hwnd : POINTER;
--		a_hitem : POINTER;
--		a_rc : WIN32_RECT;
--		a_fItemRect : BOOLEAN) : BOOLEAN is
			-- The TreeView_GetItemRect macro retrieves the bounding
			-- rectangle for a tree-view item and indicates whether
			-- the item is visible. You can use this macro or explicitly
			-- send the TVM_GETITEMRECT message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
			not_void_a_rc : a_rc.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetItemRect

	-- TreeView_GetChild

	TreeView_GetChild (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetChild macro retrieves the first child
			-- item of the specified tree-view item. You can use this
			-- macro, or you can explicitly send the TVM_GETNEXTITEM
			-- message with the TVGN_CHILD flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetChild

	-- TreeView_GetDropHilite

	TreeView_GetDropHilite (a_hwnd : POINTER) : POINTER is
			-- The TreeView_GetDropHilite macro retrieves the tree-view
			-- item that is the target of a drag-and-drop operation.
			-- You can use this macro, or you can explicitly send
			-- the TVM_GETNEXTITEM message with the TVGN_DROPHILITE
			-- flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetDropHilite

	-- TreeView_GetFirstVisible

	TreeView_GetFirstVisible (a_hwnd : POINTER) : POINTER is
			-- The TreeView_GetFirstVisible macro retrieves the first
			-- visible item in a tree-view control. You can use this
			-- macro, or you can explicitly send the TVM_GETNEXTITEM
			-- message with the TVGN_FIRSTVISIBLE flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetFirstVisible

	-- TreeView_GetNextItem

	TreeView_GetNextItem (a_hwnd : POINTER;
		a_hitem : POINTER;
		a_flag : INTEGER) : POINTER is
			-- The TreeView_GetNextItem macro retrieves the tree-view
			-- item that bears the specified relationship to a specified
			-- item. You can use this macro or one of the related
			-- macros, or you can explicitly send the TVM_GETNEXTITEM
			-- message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetNextItem

	-- TreeView_GetNextSibling

	TreeView_GetNextSibling (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetNextSibling macro retrieves the next
			-- sibling item of a specified item in a tree-view control.
			-- You can use this macro, or you can explicitly send
			-- the TVM_GETNEXTITEM message with the TVGN_NEXT flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetNextSibling

	-- TreeView_GetNextVisible

	TreeView_GetNextVisible (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetNextVisible macro retrieves the next
			-- visible item that follows a specified item in a tree-view
			-- control. You can use this macro, or you can explicitly
			-- send the TVM_GETNEXTITEM message with the TVGN_NEXTVISIBLE
			-- flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetNextVisible

	-- TreeView_GetParent

	TreeView_GetParent (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetParent macro retrieves the parent
			-- item of the specified tree-view item. You can use this
			-- macro, or you can explicitly send the TVM_GETNEXTITEM
			-- message with the TVGN_PARENT flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetParent

	-- TreeView_GetPrevSibling

	TreeView_GetPrevSibling (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetPrevSibling macro retrieves the previous
			-- sibling item of a specified item in a tree-view control.
			-- You can use this macro, or you can explicitly send
			-- the TVM_GETNEXTITEM message with the TVGN_PREVIOUS
			-- flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetPrevSibling

	-- TreeView_GetPrevVisible

	TreeView_GetPrevVisible (a_hwnd : POINTER;
		a_hitem : POINTER) : POINTER is
			-- The TreeView_GetPrevVisible macro retrieves the first
			-- visible item that precedes a specified item in a tree-view
			-- control. You can use this macro, or you can explicitly
			-- send the TVM_GETNEXTITEM message with the TVGN_PREVIOUSVISIBLE
			-- flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetPrevVisible

	-- TreeView_GetRoot

	TreeView_GetRoot (a_hwnd : POINTER) : POINTER is
			-- The TreeView_GetRoot macro retrieves the topmost or
			-- very first item of the tree-view control. You can use
			-- this macro, or you can explicitly send the TVM_GETNEXTITEM
			-- message with the TVGN_ROOT flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetRoot

	-- TreeView_GetSelection

	TreeView_GetSelection (a_hwnd : POINTER) : POINTER is
			-- The TreeView_GetSelection macro retrieves the currently
			-- selected item in a tree-view control. You can use this
			-- macro, or you can explicitly send the TVM_GETNEXTITEM
			-- message with the TVGN_CARET flag.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetSelection

	-- TreeView_GetVisibleCount

	TreeView_GetVisibleCount (a_hwnd : POINTER) : INTEGER is
			-- The TreeView_GetVisibleCount macro obtains the number
			-- of items that are fully visible in the client window
			-- of a tree-view control. You can use this macro or explicitly
			-- send the TVM_GETVISIBLECOUNT message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_GetVisibleCount

	-- TreeView_HitTest

	TreeView_HitTest (a_hwnd : POINTER;
		a_pht : POINTER) : POINTER is
--	TreeView_HitTest (a_hwnd : POINTER;
--		a_pht : WIN32_TV_HITTESTINFO) : POINTER is
			-- The TreeView_HitTest macro determines the location
			-- of the specified point relative to the client area
			-- of a tree-view control. You can use this macro or explicitly
			-- send the TVM_HITTEST message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_pht : a_pht.is_not_null
		external "C use <windows.h>"
		end -- TreeView_HitTest

	-- TreeView_InsertItem

	TreeView_InsertItem (a_hwnd : POINTER;
		a_pis : POINTER) : POINTER is
--	TreeView_InsertItem (a_hwnd : POINTER;
--		a_pis : WIN32_TV_INSERTSTRUCT) : POINTER is
			-- The TreeView_InsertItem macro inserts a new item in
			-- a tree-view control. You can use this macro or explicitly
			-- send the TVM_INSERTITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_pis : a_pis.is_not_null
		external "C use <windows.h>"
		end -- TreeView_InsertItem

	-- TreeView_Select

	TreeView_Select (a_hwnd : POINTER;
		a_hitem : POINTER;
		a_flag : INTEGER) : BOOLEAN is
			-- The TreeView_Select macro selects the specified tree-view
			-- item, scrolls the item into view, or redraws the item
			-- in the style used to indicate the target of a drag-and-drop
			-- operation. You can use this macro, the TreeView_SelectItem
			-- or TreeView_SelectDropTarget macro, or explicitly send
			-- the TVM_SELECTITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_Select

	-- TreeView_SelectDropTarget

	TreeView_SelectDropTarget (a_hwnd : POINTER;
		a_hitem : POINTER) : BOOLEAN is
			-- The TreeView_SelectDropTarget macro selects the specified
			-- tree-view item, scrolls the item into view, or redraws
			-- the item in the style used to indicate the target of
			-- a drag-and-drop operation. You can use this macro,
			-- the TreeView_Select or TreeView_SelectItem macro, or
			-- explicitly send the TVM_SELECTITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SelectDropTarget

	-- TreeView_SelectItem

	TreeView_SelectItem (a_hwnd : POINTER;
		a_hitem : POINTER) : BOOLEAN is
			-- The TreeView_SelectItem macro selects the specified
			-- tree-view item, scrolls the item into view, or redraws
			-- the item in the style used to indicate the target of
			-- a drag-and-drop operation. You can use this macro,
			-- the TreeView_Select or TreeView_SelectDropTarget macro,
			-- or explicitly send the TVM_SELECTITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SelectItem

	-- TreeView_SelectSetFirstVisible

	TreeView_SelectSetFirstVisible (a_hwnd : POINTER;
		a_hitem : POINTER) : BOOLEAN is
			-- The TreeView_SelectSetFirstVisible macro selects the
			-- specified tree-view item, scrolls the item into view,
			-- or redraws the item in the style used to indicate the
			-- target of a drag-and-drop operation. You can use this
			-- macro, the TreeView_Select or TreeView_SelectItem macro,
			-- or explicitly send the TVM_SELECTITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SelectSetFirstVisible

	-- TreeView_SetImageList

	TreeView_SetImageList (a_hwnd : POINTER;
		a_himl : POINTER;
		a_iImage : INTEGER) : POINTER is
			-- The TreeView_SetImageList macro sets the normal or
			-- state image list for a tree-view control and redraws
			-- the control using the new images. You can use this
			-- macro or explicitly send the TVM_SETIMAGELIST message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_himl : a_himl.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SetImageList

	-- TreeView_SetIndent

	TreeView_SetIndent (a_hwnd : POINTER;
		a_indent : INTEGER) : BOOLEAN is
			-- The TreeView_SetIndent macro sets the width of indentation
			-- for a tree-view control and redraws the control to
			-- reflect the new width. You can use this macro or explicitly
			-- send the TVM_SETINDENT message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SetIndent

	-- TreeView_SetItem

	TreeView_SetItem (a_hwnd : POINTER;
		a_item : POINTER) : BOOLEAN is
--	TreeView_SetItem (a_hwnd : POINTER;
--		a_item : WIN32_TV_ITEM) : BOOLEAN is
			-- The TreeView_SetItem macro sets some or all of a tree-view
			-- item's attributes. You can use this macro or explicitly
			-- send the TVM_SETITEM message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_item : a_item.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SetItem

	-- TreeView_SortChildren

	TreeView_SortChildren (a_hwnd : POINTER;
		a_hitem : POINTER;
		a_fRecurse : INTEGER) : BOOLEAN is
			-- The TreeView_SortChildren macro sorts the child items
			-- of the specified parent item in a tree-view control.
			-- You can use this macro or explicitly send the TVM_SORTCHILDREN
			-- message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_hitem : a_hitem.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SortChildren

	-- TreeView_SortChildrenCB

	TreeView_SortChildrenCB (a_hwnd : POINTER;
		a_sort : POINTER;
		a_fRecurse : INTEGER) : BOOLEAN is
--	TreeView_SortChildrenCB (a_hwnd : POINTER;
--		a_sort : WIN32_TV_SORTCB;
--		a_fRecurse : INTEGER) : BOOLEAN is
			-- The TreeView_SortChildrenCB macro sorts tree-view
			-- items using an application-defined callback function
			-- that compares the items. You can use this macro or
			-- explicitly send the TVM_SORTCHILDRENCB message.
		require
			not_void_a_hwnd : a_hwnd.is_not_null
			not_void_a_sort : a_sort.is_not_null
		external "C use <windows.h>"
		end -- TreeView_SortChildrenCB


end -- class WIN32_TREEVIEW_MACROS
