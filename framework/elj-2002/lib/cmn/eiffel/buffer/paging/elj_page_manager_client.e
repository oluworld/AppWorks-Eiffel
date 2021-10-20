deferred class ELJ_PAGE_MANAGER_CLIENT

feature {ELJ_PAGE_MANAGER}

	page_size: INTEGER is
		deferred
		ensure
			meaningful_page_size: Result > 0
		end -- page_size
	
	write_page (a_page: ELJ_DATA_PAGE) is
		require
			non_void_page: a_page /= Void
			known_page: a_page.client = Current
			page_large_enough: a_page.size >= page_size
		deferred
		end -- write_page

	read_page (a_page: ELJ_DATA_PAGE; a_position: INTEGER) is
		require
			non_void_page: a_page /= Void
			page_large_enough: a_page.size >= page_size
		deferred
		end -- read_page

end -- deferred class ELJ_PAGE_MANAGER_CLIENT
