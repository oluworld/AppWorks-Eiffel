class WIN32_PATH_FUNCTIONS


feature {NONE}

	-- AbortPath

	AbortPath (a_hdc : POINTER) : BOOLEAN  is
			--  The AbortPath function closes and discards any paths
			-- in the specified device context. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- AbortPath

	-- BeginPath

	BeginPath (a_hdc : POINTER) : BOOLEAN  is
			--  The BeginPath function opens a path bracket in the
			-- specified device context (DC). 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- BeginPath

	-- CloseFigure

	CloseFigure (a_hdc : POINTER) : BOOLEAN  is
			--  The CloseFigure function closes an open figure in
			-- a path. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- CloseFigure

	-- EndPath

	EndPath (a_hdc : POINTER) : BOOLEAN  is
			--  The EndPath function closes a path bracket and selects
			-- the path defined by the bracket into the specified
			-- device context. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- EndPath

	-- FillPath

	FillPath (a_hdc : POINTER) : BOOLEAN  is
			--  The FillPath function closes any open figures in the
			-- current path and fills the path's interior by using
			-- the current brush and polygon-filling mode. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- FillPath

	-- FlattenPath

	FlattenPath (a_hdc : POINTER) : BOOLEAN  is
			--  The FlattenPath function transforms any curves in
			-- the path that is selected into the current device context
			-- (DC), turning each curve into a sequence of lines.
			-- 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- FlattenPath

	-- GetMiterLimit

	GetMiterLimit (a_hdc : POINTER;
		a_eLimit : POINTER) : BOOLEAN  is
--	GetMiterLimit (a_hdc : POINTER;
--		a_eLimit : REAL_REF) : BOOLEAN  is
			--  The GetMiterLimit function returns the miter limit
			-- for the specified device context. 
		require
			not_void_a_hdc : a_hdc /= Void
			not_void_a_eLimit : a_eLimit /= Void
		external "C use <windows.h>"
		end -- GetMiterLimit

	-- GetPath

	GetPath (a_dc : POINTER;
				a_point_arr : POINTER;
				a_byte_arr :	POINTER;
				a_size : INTEGER): INTEGER is
--	GetPath (a_dc : POINTER;
--				a_point_arr : C_STRUCT_ARRAY[WIN32_POINT];
--				a_byte_arr :	ARRAY[CHARACTER];
--				a_size : INTEGER): INTEGER is
			-- The GetPath function retrieves the coordinates defining
			-- the endpoints of lines and the control points of curves
			-- found in the path that is selected into the specified
			-- device context. 
		external "C use <windows.h>"
		end -- GetPath

	-- PathToRegion

	PathToRegion (a_hdc : POINTER) : POINTER  is
			--  The PathToRegion function creates a region from the
			-- path that is selected into the specified device context.
			-- 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- PathToRegion

	-- SetMiterLimit

	SetMiterLimit (a_hdc : POINTER;
		a_eNewLimit : REAL;
		a_eOldLimit : POINTER) : BOOLEAN  is
--	SetMiterLimit (a_hdc : POINTER;
--		a_eNewLimit : REAL;
--		a_eOldLimit : REAL_REF) : BOOLEAN  is
			--  The SetMiterLimit function sets the limit for the
			-- length of miter joins for the specified device context.
			-- 
		require
			not_void_a_hdc : a_hdc /= Void
			not_void_a_eOldLimit : a_eOldLimit /= Void
		external "C use <windows.h>"
		end -- SetMiterLimit

	-- StrokeAndFillPath

	StrokeAndFillPath (a_hdc : POINTER) : BOOLEAN  is
			--  The StrokeAndFillPath function closes any open figures
			-- in a path, strokes the outline of the path by using
			-- the current pen, and fills its interior by using the
			-- current brush. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- StrokeAndFillPath

	-- StrokePath

	StrokePath (a_hdc : POINTER) : BOOLEAN  is
			--  The StrokePath function renders the specified path
			-- by using the current pen. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- StrokePath

	-- WidenPath

	WidenPath (a_hdc : POINTER) : BOOLEAN  is
			--  The WidenPath function redefines the current path
			-- as the area that would be painted if the path were
			-- stroked using the pen currently selected into the given
			-- device context. 
		require
			not_void_a_hdc : a_hdc /= Void
		external "C use <windows.h>"
		end -- WidenPath

end -- class WIN32_PATH_FUNCTIONS
