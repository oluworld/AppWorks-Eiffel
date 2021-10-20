indexing
	contents:    "AppWorks TableItem[Base] Class"
	library:     "AppWorks-Art"
	author:      "oluoluolu@protonmail.com (Mysterious Committer)"
	copyright:   "Copyright (c) 2001, 2002, OluWorld SoftWorks!"
--	license:     "LGPL?"
	completed:   no
	tested:      no
	date:        "$Date$"
	revision:    "$Revision$"

deferred class APPWORKS_ART_TABLE_ITEM_BASE

feature

	update (t: APPWORKS_ART_TABLE) is
		do
			t.set_item (Current)
		end -- update

end -- class APPWORKS_ART_TABLE_ITEM_BASE
