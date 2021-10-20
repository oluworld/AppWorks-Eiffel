indexing
	contents:    "AppWorks Splitter Window - Win32 Native Widget Implementation"
	description: "A resizable area that separates two smaller areas"
	library:     "AppWorks-Art"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      currently
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_BASE_PROPERTY[G]

--inherit
--	COMPARABLE

feature

	to_string : STRING is
		do
			Result := my_value.to_string
		end -- to_string

	get_type : like my_type is
		do
			Result := my_type
		end -- get_type
		
	get_type_name : STRING is
		do
			Result := my_type.to_string
		end -- get_type_name
		
--	compare (o: ANY) is
--		do
--			Result := value.compare (o)
--		end	-- compare

--	synced : BOOLEAN
			-- What could this possibly be for?
			
	sync is 
			-- Write the property back to where it came from.
			-- How 'bout unsync, too?
		deferred 
		end	-- sync	

	syncable : BOOLEAN
			-- A property that means what it says.
			
feature {NONE}

	sync     : BOOLEAN
	dirty    : BOOLEAN

	my_type  : APPWORKS_BASE_PROPERTY_TYPE
	my_value : G
		
end -- class APPWORKS_BASE_PROPERTY
