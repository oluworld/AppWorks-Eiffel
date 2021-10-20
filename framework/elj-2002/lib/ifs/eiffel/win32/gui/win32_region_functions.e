class WIN32_REGION_FUNCTIONS

feature {NONE}

	CombineRgn (a_dest, a_src1, a_src2: POINTER; a_combine_mode: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CombineRgn

	CreateEllipticRgn (a_left, a_topt, a_right, a_bottom: INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CreateEllipticRgn

	CreateEllipticRgnIndirect (a_rect: POINTER): POINTER is
--	CreateEllipticRgnIndirect (a_rect: WIN32_RECT): POINTER is
		external "C use <windows.h>"
		end -- CreateEllipticRgnIndirect

	CreatePolygonRgn (	a_points:	POINTER;
    					a_count:	INTEGER;
    					a_mode:		INTEGER): POINTER is
--	CreatePolygonRgn (	a_points:	C_STRUCT_ARRAY[WIN32_POINT];
--    					a_count:	INTEGER;
--    					a_mode:		INTEGER): POINTER is
		external "C use <windows.h>"
    	end -- CreatePolygonRgn

	CreatePolyPolygonRgn (	a_points:		POINTER;
							a_poly_counts:	POINTER;
    						a_count:		INTEGER;
    						a_mode:			INTEGER): POINTER is
--	CreatePolyPolygonRgn (	a_points:		C_STRUCT_ARRAY[WIN32_POINT];
--							a_poly_counts:	ARRAY[INTEGER];
--    						a_count:		INTEGER;
--    						a_mode:			INTEGER): POINTER is
		external "C use <windows.h>"
    	end -- CreatePolyPolygonRgn

	CreateRectRgn (a_left, a_topt, a_right, a_bottom: INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CreateRectRgn

	CreateRectRgnIndirect (a_rect: POINTER): POINTER is
--	CreateRectRgnIndirect (a_rect: WIN32_RECT): POINTER is
		external "C use <windows.h>"
		end -- CreateRectRgnIndirect

	CreateRoundRectRgn (a_left, a_topt, a_right, a_bottom, a_width, a_height: INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CreateRoundRectRgn

	EqualRgn (a_first_region, a_second_region: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- EqualRgn

	FillRgn (a_dc, a_region, a_brush: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- FillRgn

	FrameRgn (a_dc, a_region, a_brush: POINTER; a_frame_width, a_frame_height: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- FrameRgn

	GetPolyFillMode (a_dc: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GetPolyFillMode

	GetRgnBox (a_region: POINTER; a_rect: POINTER): INTEGER is
--	GetRgnBox (a_region: POINTER; a_rect: WIN32_RECT): INTEGER is
		external "C use <windows.h>"
		end -- GetRgnBox

	InvertRgn (a_dc, a_region: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- InvertRgn

	OffsetRgn (a_region: POINTER; a_x_offset, a_y_offset: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- OffsetRgn

	PaintRgn (a_dc, a_region: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- PaintRgn

	PtInRgn (a_region: POINTER; a_x, a_y: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- PtInRgn

	RectInRgn (a_region: POINTER; a_rect: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- RectInRgn

	SetPolyFillMode (a_dc: POINTER; a_mode: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- SetPolyFillMode

end -- class WIN32_REGION_FUNCTIONS