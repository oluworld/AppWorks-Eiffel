class WIN32_PEN_FUNCTIONS


feature {NONE}

	-- CreatePen

	CreatePen (a_fnPenStyle : INTEGER;
		a_nWidth : INTEGER;
		a_crColor : INTEGER) : POINTER  is
			--  The CreatePen function creates a logical pen that
			-- has the specified style, width, and color. The pen
			-- can subsequently be selected into a device context
			-- and used to draw lines and curves. 
		external "C use <windows.h>"
		end -- CreatePen

	-- CreatePenIndirect

	CreatePenIndirect (a_plgpn : POINTER) : POINTER  is
--	CreatePenIndirect (a_plgpn : WIN32_LOGPEN) : POINTER  is
			--  The CreatePenIndirect function creates a logical cosmetic
			-- pen that has the style, width, and color specified
			-- in a structure. 
		external "C use <windows.h>"
		end -- CreatePenIndirect

	-- ExtCreatePen

	ExtCreatePen (a_dwPenStyle : INTEGER;
		a_dwWidth : INTEGER;
		a_plb : POINTER;
		a_dwStyleCount : INTEGER;
		a_pStyle : POINTER) : POINTER  is
--	ExtCreatePen (a_dwPenStyle : INTEGER;
--		a_dwWidth : INTEGER;
--		a_plb : WIN32_LOGBRUSH;
--		a_dwStyleCount : INTEGER;
--		a_pStyle : ARRAY[INTEGER]) : POINTER  is
			--  The ExtCreatePen function creates a logical cosmetic
			-- or geometric pen that has the specified style, width,
			-- and brush attributes. 
		external "C use <windows.h>"
		end -- ExtCreatePen

end -- class WIN32_PEN_FUNCTIONS
