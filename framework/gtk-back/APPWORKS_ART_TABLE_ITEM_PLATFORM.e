indexing
	contents:    "AppWorks TableItem Class - Win32 Native Widget Implementation"
	description: "An area that represents a row a Table"
	library:     "AppWorks-Art-gtk"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2021, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision: 1.1.1.1 $"

deferred class APPWORKS_ART_TABLE_ITEM_PLATFORM

feature

	set_state (a_state, a_state_mask : INTEGER) is
		do
--			item.set_state (a_state)
--			item.set_stateMask (a_state_mask)
--			item.set_mask (item.mask or LVIF_STATE)
		end

	set_image_index (an_index : INTEGER) is
		do
--			item.set_iImage (an_index)
--			item.set_mask (item.mask or LVIF_IMAGE)
		end

	set_extra_info (a_value : INTEGER) is
		do
--			item.set_lParam (a_value)
--			item.set_mask (item.mask or LVIF_PARAM)
		end

	set_indent_level (a_level : INTEGER) is
		do
--			item.set_iIndent (a_level)
--			item.set_mask (item.mask or LVIF_INDENT)
		end

	set (an_index, a_subindex : INTEGER; a_text : STRING) is
		do
--			item.set_iItem (an_index)
--			item.set_iSubItem (a_subindex)
--			if a_text /= Void then
--				item.set_mask (item.mask or LVIF_TEXT)
--				item.set_pszText (a_text)
--			end
		end -- set

	set_text (a_text : STRING) is
		require
			valid_text: a_text /= Void
		do
--			item.set_mask    (item.mask or LVIF_TEXT)
--			item.set_pszText (a_text.to_external)
		end -- set

	set_callback (an_index, a_subindex : INTEGER) is
		do
--			item.set_pszTextCallback
		end -- set_callback 

feature

	text: STRING is
		do
--			Result := item.pszText
		end -- text
	
feature {APPWORKS_ART_TABLE_PLATFORM, APPWORKS_ART_TABLE_ITEM_PLATFORM}

--	item: expanded WIN32_LV_ITEM

end -- class APPWORKS_ART_TABLE_ITEM_PLATFORM
