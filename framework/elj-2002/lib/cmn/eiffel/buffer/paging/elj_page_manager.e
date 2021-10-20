class ELJ_PAGE_MANAGER

creation
	make

feature {NONE}

	make is
		do
			create pages.make
		end -- make

feature

	put (a_page: ELJ_DATA_PAGE) is
		require
			non_void_page: a_page /= Void
			known_page: 
		do
			a_page.unuse
		end -- put
	
	read (a_client: ELJ_PAGE_MANAGER_CLIENT; a_position: INTEGER): ELJ_DATA_PAGE is
		local
			idx: INTEGER
		do
			from
				idx := pages.lower
			until
				idx > pages.upper or else pages.item (idx).same_id (a_client, a_position)
			loop
				idx := idx + 1
			end -- loop
			
			if idx <= pages.upper then
				Result := pages @ idx
			-- make Result the first in list, to let the order of the list
			-- reflect the page access statistic
				pages.remove (idx)
				pages.add_first (Result)
			else
				Result := unused_page
				Result.set_size (a_client.page_size)
				a_client.read_page (Result, a_position)
			end -- if
			
			Result.setup (a_client, a_position)
		end -- read
	
	check_out (a_client: ELJ_PAGE_MANAGER_CLIENT; a_position: INTEGER): ELJ_DATA_PAGE is
		do
			Result := read (a_client, a_position)
			Result.use
		end -- check_out

feature {NONE}

	unused_page: ELJ_DATA_PAGE is
		local
			idx: INTEGER
		do
			from
			-- try to find unused page that needs no flushing
				idx := pages.lower
			until
				idx > pages.upper or else (not pages.item (idx).in_use and then not pages.item (idx).is_dirty)
			loop
				idx := idx + 1
			end -- loop
			
			if idx <= pages.upper then
				Result := pages @ idx
				pages.remove (idx)
			else
			-- we did not find one, try to find an unused one which can be flushed
			-- search from last to first to flush oldest
				from
					idx := pages.upper
				until
					idx < pages.lower or else not pages.item (idx).in_use
				loop
					idx := idx - 1
				end -- loop
				
				if idx >= pages.lower then
					Result := pages.item (idx)
					Result.client.write_page (Result)
					pages.remove (idx)
				else
				-- our list contains no unused pages, create one
					create Result
				end -- if
			end -- if
		-- make Result the first in list, to let the order of the list
		-- reflect the page access statistic
			pages.add_first (Result)
		end -- unused_page
	
	pages: LINKED_LIST[ELJ_DATA_PAGE]

end -- class ELJ_PAGE_MANAGER
