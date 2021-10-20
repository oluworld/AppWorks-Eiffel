indexing
	contents: "WIN32 clipping functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: yes
	
class WIN32_CLIPPING_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions that can be used with clipping. 
--	
--	ExcludeClipRect
--	ExtSelectClipRgn
--	GetClipBox
--	GetClipRgn
--	GetMetaRgn
--	IntersectClipRect
--	OffsetClipRgn
--	PtVisible
--	RectVisible
--	SelectClipPath
--	SelectClipRgn
--	SetMetaRgn 
--	------------------------------------------------------------------------

feature {NONE}

	ExcludeClipRect (	a_dc:		POINTER;						
						a_left:		INTEGER;
						a_top:		INTEGER;
						a_right:	INTEGER;
						a_bottom:	INTEGER): INTEGER is
			--	The ExcludeClipRect function creates a new clipping
			-- region that consists of the existing clipping region
			-- minus the specified rectangle. 
		external "C use <windows.h>"
		end -- ExcludeClipRect
	
	ExtSelectClipRgn (	a_dc:		POINTER;
						a_region:	POINTER;
						a_mode:		INTEGER): INTEGER is
			--	The ExtSelectClipRgn function combines the specified
			-- region with the current clipping region by using the
			-- specified mode. 
		external "C use <windows.h>"
		end -- ExtSelectClipRgn

	GetClipBox (a_dc:	POINTER;
				a_rect:	POINTER): INTEGER is
			--	GetClipBox (a_dc:	POINTER;
			--				a_rect:	WIN32_RECT): INTEGER is
			--	The GetClipBox function retrieves the dimensions of
			-- the tightest bounding rectangle that can be drawn around
			-- the current visible area on the device. The visible area
			-- is defined by the current clipping region or clip path,
			-- as well as any overlapping windows. 
		external "C use <windows.h>"
		end -- GetClipBox
		
	GetClipRgn (a_dc:		POINTER;
				a_region:	POINTER): INTEGER is
			--	The GetClipRgn function retrieves a handle identifying
			-- the current application-defined clipping region for the
			-- specified device context. 
		external "C use <windows.h>"
		end -- GetClipRgn

	GetMetaRgn (a_dc:		POINTER;
				a_region:	POINTER): INTEGER is
			--	The GetMetaRgn function retrieves the current metaregion
			-- for the specified device context. 
		external "C use <windows.h>"
		end -- GetMetaRgn

	IntersectClipRect (	a_dc:		POINTER;						
						a_left:		INTEGER;
						a_top:		INTEGER;
						a_right:	INTEGER;
						a_bottom:	INTEGER): INTEGER is
			--	The IntersectClipRect function creates a new clipping
			-- region from the intersection of the current clipping region
			-- and the specified rectangle. 
		external "C use <windows.h>"
		end -- IntersectClipRect
	
	OffsetClipRgn (	a_dc:		POINTER;						
					a_x_offset:	INTEGER;
					a_y_offset:	INTEGER): INTEGER is
			--	The OffsetClipRgn function moves the clipping region of
			-- a device context by the specified offsets. 
		external "C use <windows.h>"
		end -- OffsetClipRgn
	
	PtVisible (	a_dc:	POINTER;						
				a_x_:	INTEGER;
				a_y_:	INTEGER): BOOLEAN is
			--	The PtVisible function indicates whether the specified
			-- point is within the clipping region of a device context. 
		external "C use <windows.h>"
		end -- PtVisible

	RectVisible (	a_dc:	POINTER;
					a_rect:	WIN32_RECT): BOOLEAN is
			--	The RectVisible function determines whether any part
			-- of the specified rectangle lies within the clipping
			-- region of a device context. 
		external "C use <windows.h>"
		end -- RectVisible
	
	SelectClipPath (a_dc:	POINTER;
					a_mode:	INTEGER): BOOLEAN is
			--	The SelectClipPath function selects the current path
			-- as a clipping region for a device context, combining
			-- the new region with any existing clipping region by
			-- using the specified mode. 
		external "C use <windows.h>"
		end -- SelectClipPath

	SelectClipRgn (	a_dc:		POINTER;
					a_region:	POINTER): INTEGER is
			--	The SelectClipRgn function selects a region as the
			-- current clipping region for the specified device context. 
		external "C use <windows.h>"
		end -- SelectClipRgn

	SetMetaRgn (a_dc: POINTER): INTEGER is
			--	The SetMetaRgn function intersects the current clipping
			-- region for the specified device context with the current
			-- metaregion and saves the combined region as the new
			-- metaregion for the specified device context. The clipping
			-- region is reset to a null region. 
		external "C use <windows.h>"
		end -- SetMetaRgn

end -- class WIN32_CLIPPING_FUNCTIONS