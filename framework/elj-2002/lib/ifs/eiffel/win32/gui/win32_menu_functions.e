indexing
	contents: "WIN32 menu functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: yes
	
class WIN32_MENU_FUNCTIONS

--	---------------------------------------------------------------------
--	Following are the functions associated with menus. 
--
--	AppendMenu
--	CheckMenuItem
--	CheckMenuRadioItem
--	CreateMenu
--	CreatePopupMenu
--	DeleteMenu
--	DestroyMenu
--	DrawMenuBar
--	EnableMenuItem
--	GetMenu
--	GetMenuDefaultItem
--	GetMenuItemCount
--	GetMenuItemID
--	GetMenuItemInfo 
--	GetMenuItemRect 
--	GetMenuState
--	GetSubMenu
--	GetSystemMenu
--	HiliteMenuItem
--	InsertMenuItem 
--	IsMenu
--	LoadMenu
--	LoadMenuIndirect
--	MenuItemFromPoint 
--	SetMenu
--	SetMenuDefaultItem 
--	SetMenuItemBitmaps 
--	SetMenuItemInfo 
--	TrackPopupMenu
--	TrackPopupMenuEx 
--	---------------------------------------------------------------------

inherit
	WIN32_MENU_CONSTANTS

feature {NONE}

	AppendMenu (a_menu_handle : POINTER;
				a_flags       : BIT 32;
				a_item_id     : INTEGER;
    			a_new_item    : POINTER) : BOOLEAN is
--	AppendMenu (a_menu_handle : POINTER;
--				a_flags       : INTEGER;
--				a_item_id     : INTEGER;
--    			a_new_item    : STRING) : BOOLEAN is
--	The AppendMenu function appends a new item to the end of the specified 
--	menu. An application can use this function to specify the content, 
--	appearance, and behavior of the menu item. 
		external "C use <windows.h>"
    	end -- AppendMenu

	CheckMenuItem (	a_menu			: POINTER;
					a_id_check_item	: INTEGER;
					a_check			: BIT 32): BIT 32 is
--	The CheckMenuItem function sets the state of the specified menu 
--	item's check mark attribute to either checked or unchecked. 
--
--	The CheckMenuItem function has been superseded by the 
--	SetMenuItemInfo function. You can still use CheckMenuItem, however, 
--	if you do not need any of the extended features of SetMenuItemInfo.
		external "C use <windows.h>"
		end -- CheckMenuItem

	CheckMenuRadioItem (a_menu	: POINTER;
						a_first	: INTEGER; 
						a_last	: INTEGER;
						a_check	: INTEGER;
						a_flags	: BIT 32): BOOLEAN  is
--	The CheckMenuRadioItem function checks a specified menu item and 
--	makes it a radio item. At the same time, the function unchecks all 
--	other menu items in the associated group and clears the radio-item 
--	type flag for those items.
		external "C use <windows.h>"
		end -- CheckMenuRadioItem

	CreateMenu: POINTER is
--	The CreateMenu function creates a menu. The menu is initially empty, 
--	but it can be filled with menu items by using the InsertMenuItem, 
--	AppendMenu, and InsertMenu functions. 
		external "C use <windows.h>"
		end -- CreateMenu

	CreatePopupMenu: POINTER is
--	The CreatePopupMenu function creates a drop-down menu, submenu, 
--	or shortcut menu. The menu is initially empty. You can insert or 
--	append menu items by using the InsertMenuItem function. You can also 
--	use the InsertMenu function to insert menu items and the AppendMenu 
--	function to append menu items.
		external "C use <windows.h>"
		end -- CreatePopupMenu

	DeleteMenu (a_menu		: POINTER; 
				a_position	: INTEGER;
				a_flags		: BIT 32): BOOLEAN is
--	The DeleteMenu function deletes an item from the specified menu. 
--	If the menu item opens a menu or submenu, this function destroys 
--	the handle to the menu or submenu and frees the memory used by the 
--	menu or submenu. 
		external "C use <windows.h>"
		end -- DeleteMenu

	DestroyMenu (a_menu: POINTER): BOOLEAN is
--	The DestroyMenu function destroys the specified menu and frees any 
--	memory that the menu occupies. 
		external "C use <windows.h>"
		end -- DestroyMenu

	DrawMenuBar (a_window: POINTER): BOOLEAN is
--	The DrawMenuBar function redraws the menu bar of the specified window. 
--	If the menu bar changes after Windows has created the window, this 
--	function must be called to draw the changed menu bar. 
		external "C use <windows.h>"
		end -- DrawMenuBar

	EnableMenuItem (a_menu			: POINTER;	
					a_id_enable_item: INTEGER;
					a_enable		: BIT 32): BOOLEAN is
--	The EnableMenuItem function enables, disables, or grays the specified 
--	menu item. 
		external "C use <windows.h>"
		end -- EnableMenuItem

	GetMenu (a_window: POINTER): POINTER is
--	The GetMenu function retrieves the handle of the menu assigned to 
--	the given window. 
		external "C use <windows.h>"
		end -- GetMenu

	GetMenuDefaultItem (a_menu	: POINTER;
						a_by_pos: INTEGER; 
						a_flags	: BIT 32): INTEGER is
--	The GetMenuDefaultItem function determines the default menu item on 
--	the specified menu.
		external "C use <windows.h>"
		end -- GetMenuDefaultItem

	GetMenuItemCount (a_menu: POINTER): INTEGER is
--	The GetMenuItemCount function determines the number of items in the 
--	specified menu. 
		external "C use <windows.h>"
		end -- GetMenuItemCount

	GetMenuItemID (a_menu: POINTER; a_pos: INTEGER): INTEGER is
--	The GetMenuItemID function retrieves the menu item identifier of a 
--	menu item located at the specified position in a menu. 
		external "C use <windows.h>"
		end -- GetMenuItemID

	GetMenuItemInfo (a_menu			: POINTER; 
					a_item			: INTEGER;
					a_by_position	: BOOLEAN;
					a_info			: POINTER): BOOLEAN is
--	GetMenuItemInfo (a_menu			: POINTER; 
--					a_item			: INTEGER;
--					a_by_position	: BOOLEAN;
--					a_info			: WIN32_MENUITEMINFO): BOOLEAN is
--	The GetMenuItemInfo function retrieves information about a menu item.
		external "C use <windows.h>"
		end -- GetMenuItemInfo


	GetMenuItemRect (a_window	: POINTER;
					a_menu		: POINTER;
					a_item		: INTEGER; 
					a_prt_rect	: POINTER): BOOLEAN is
--	GetMenuItemRect (a_window	: POINTER;
--					a_menu		: POINTER;
--					a_item		: INTEGER; 
--					a_prt_rect	: WIN32_RECT): BOOLEAN is
--	The GetMenuItemRect function retrieves the bounding rectangle for the 
--	specified menu item.
		external "C use <windows.h>"
		end -- GetMenuItemRect

	GetMenuState (a_menu: POINTER; a_id: INTEGER; a_flags: BIT 32): BIT 32 is
--	The GetMenuState function retrieves the menu flags associated with 
--	the specified menu item. If the menu item opens a submenu, this 
--	function also returns the number of items in the submenu. 
		external "C use <windows.h>"
		end -- GetMenuState

	GetSubMenu (a_menu: POINTER; a_pos: INTEGER): POINTER is
--	The GetSubMenu function retrieves the handle of the drop-down menu or 
--	submenu activated by the specified menu item. 
		external "C use <windows.h>"
		end -- GetSubMenu

	GetSystemMenu (a_window: POINTER; a_revert: BOOLEAN): POINTER is
--	The GetSystemMenu function allows the application to access the 
--	window menu (also known as the System menu or the Control menu) for 
--	copying and modifying. 
		external "C use <windows.h>"
		end -- GetSystemMenu

	HiliteMenuItem (a_window		: POINTER;
					a_menu			: POINTER;
					a_item_hilite	: INTEGER;
					a_hilite		: BIT 32): BOOLEAN is
--	The HiliteMenuItem function highlights or removes the highlighting 
--	from an item in a menu bar. 
		external "C use <windows.h>"
		end -- HiliteMenuItem

	InsertMenuItem (a_menu			: POINTER;
					a_item			: INTEGER; 
					a_by_position	: BOOLEAN;
					a_info			: POINTER): BOOLEAN is
--	InsertMenuItem (a_menu			: POINTER;
--					a_item			: INTEGER; 
--					a_by_position	: BOOLEAN;
--					a_info			: WIN32_MENUITEMINFO): BOOLEAN is
--	The InsertMenuItem function inserts a new menu item at the specified 
--	position in a menu.
		external "C use <windows.h>"
		end -- InsertMenuItem

	InsertMenu (a_menu         : POINTER;
				a_by_position  : INTEGER;
				a_flags        : BIT 32;
				a_new_item     : INTEGER;
				a_new_item_str : POINTER): BOOLEAN is
--	InsertMenu (a_menu         : POINTER;
--				a_by_position  : INTEGER;
--				a_flags        : BIT 32;
--				a_new_item     : INTEGER;
--				a_new_item_str : STRING): BOOLEAN is
--	The InsertMenu function inserts a new menu item into a menu, moving 
--	other items down the menu. 
--
--	The InsertMenu function has been superseded by the InsertMenuItem 
--	function. You can still use InsertMenu, however, if you do not need any 
--	of the extended features of InsertMenuItem.
		external "C use <windows.h>"
		end -- InsertMenu

	IsMenu (a_menu: POINTER): BOOLEAN is
--	The IsMenu function determines whether a handle is a menu handle. 
		external "C use <windows.h>"
		end -- IsMenu

	LoadMenu (a_instance: POINTER; a_menu_name: POINTER): POINTER is
--	LoadMenu (a_instance: POINTER; a_menu_name: STRING): POINTER is
--	The LoadMenu function loads the specified menu resource from 
--	the executable (.EXE) file associated with an application instance. 
		external "C use <windows.h>"
		end -- LoadMenu

	LoadMenuIndirect(a_menu_template: POINTER): POINTER is
--	LoadMenuIndirect(a_menu_template: WIN32_MENUTEMPLATE): POINTER is
--	The LoadMenuIndirect function loads the specified menu template in 
--	memory. 
		external "C use <windows.h>"
		end -- LoadMenuIndirect

	MenuItemFromPoint (	a_window: POINTER;
						a_menu	: POINTER; 
						a_screen: POINTER): INTEGER is
--	MenuItemFromPoint (	a_window: POINTER;
--						a_menu	: POINTER; 
--						a_screen: WIN32_POINT): INTEGER is
--	The MenuItemFromPoint function determines which menu item, if any, 
--	is at the specified location.
		external "C use <windows.h>"
		end -- MenuItemFromPoint

	SetMenu (a_window: POINTER; a_menu: POINTER): BOOLEAN is
--	The SetMenu function assigns a new menu to the specified window. 
		external "C use <windows.h>"
		end -- SetMenu

	SetMenuDefaultItem (a_menu: POINTER;
						a_item: INTEGER;
						a_by_pos: INTEGER ): BOOLEAN is
--	The SetMenuDefaultItem function sets the default menu item for the 
--	specified menu.
		external "C use <windows.h>"
		end -- SetMenuDefaultItem

	SetMenuItemBitmaps (a_menu				: POINTER;
						a_position			: INTEGER;
						a_flags				: BIT 32;
						a_bitmap_unchecked	: POINTER;
						a_bitmap_checked	: POINTER): BOOLEAN is
--	The SetMenuItemBitmaps function associates the specified bitmap 
--	with a menu item. Whether the menu item is checked or unchecked, 
--	Windows displays the appropriate bitmap next to the menu item. 
		external "C use <windows.h>"
		end -- SetMenuItemBitmaps

	SetMenuItemInfo (a_menu			: POINTER;
					a_item			: INTEGER; 
					a_by_position	: BOOLEAN; 
					a_info			: POINTER): BOOLEAN is
--	SetMenuItemInfo (a_menu			: POINTER;
--					a_item			: INTEGER; 
--					a_by_position	: BOOLEAN; 
--					a_info			: WIN32_MENUITEMINFO): BOOLEAN is
--	The SetMenuItemInfo function changes information about a menu item
		external "C use <windows.h>"
		end -- SetMenuItemInfo

	TrackPopupMenu (a_menu		: POINTER;
					a_flags		: BIT 32;
					a_x			: INTEGER;
					a_y			: INTEGER;
					a_reserved	: INTEGER;
					a_window	: POINTER;
					a_rect		: POINTER): BOOLEAN is
--	TrackPopupMenu (a_menu		: POINTER;
--					a_flags		: BIT 32;
--					a_x			: INTEGER;
--					a_y			: INTEGER;
--					a_reserved	: INTEGER;
--					a_window	: POINTER;
--					a_rect		: WIN32_RECT): BOOLEAN is
--	The TrackPopupMenu function displays a shortcut menu at the 
--	specified location and tracks the selection of items on the menu. 
--	The shortcut menu can appear anywhere on the screen.
		external "C use <windows.h>"
		end -- TrackPopupMenu

	TrackPopupMenuEx (	a_menu	: POINTER;
						a_flags	: BIT 32; 
						a_x		: INTEGER;
						a_y		: INTEGER;
						a_window: POINTER;
						a_params: POINTER): BOOLEAN is
--	TrackPopupMenuEx (	a_menu	: POINTER;
--						a_flags	: BIT 32; 
--						a_x		: INTEGER;
--						a_y		: INTEGER;
--						a_window: POINTER;
--						a_params: WIN32_TPMPARAMS): BOOLEAN is
--	The TrackPopupMenuEx function displays a shortcut menu at the 
--	specified location and tracks the selection of items on the 
--	shortcut menu. The shortcut menu can appear anywhere on the screen.
		external "C use <windows.h>"
		end -- TrackPopupMenuEx

end -- class WIN32_MENU_FUNCTIONS