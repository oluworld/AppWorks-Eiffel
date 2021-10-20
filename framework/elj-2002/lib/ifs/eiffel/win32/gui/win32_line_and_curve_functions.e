indexing
	contents: "WIN32 line and curve functions"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: yes
	tested: no

class WIN32_LINE_AND_CURVE_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with lines and curves. 
--
--	AngleArc
--	Arc
--	ArcTo
--	GetArcDirection
--	LineDDA
--	LineDDAProc
--	LineTo
--	MoveToEx
--	PolyBezier
--	PolyBezierTo
--	PolyDraw
--	Polyline
--	PolylineTo
--	PolyPolyline
--	SetArcDirection 
--	------------------------------------------------------------------------

inherit
	WIN32_PATH_CONSTANTS

feature {NONE}

	AngleArc (a_dc:			POINTER;
				a_x:			INTEGER;
				a_y:			INTEGER;
				a_radius:		INTEGER;
				a_start_angle:	REAL;
				a_sweep_angle:	REAL): BOOLEAN is
			--	The AngleArc function draws a line segment and an arc. The
			-- line segment is drawn from the current position to the
			-- beginning of the arc. The arc is drawn along the perimeter
			-- of a circle with the given radius and center. The length of
			-- the arc is defined by the given start and sweep angles. 
		external "C use <windows.h>"
		end -- AngleArc

	Arc (	a_dc:			POINTER;
			a_left_rect:	INTEGER;
			a_top_rect:		INTEGER;
			a_right_rect:	INTEGER;
			a_bottom_rect:	INTEGER;
			a_x_start_arc:	INTEGER;
			a_y_start_arc:	INTEGER;
			a_x_end_arc:	INTEGER;
			a_y_end_arc:	INTEGER): BOOLEAN is
			--	The Arc function draws an elliptical arc. 
		external "C use <windows.h>"
		end -- Arc
			
	ArcTo (	a_dc:			POINTER;
			a_left_rect:	INTEGER;
			a_top_rect:		INTEGER;
			a_right_rect:	INTEGER;
			a_bottom_rect:	INTEGER;
			a_x_radial_1:	INTEGER;
			a_y_radial_1:	INTEGER;
			a_x_radial_2:	INTEGER;
			a_y_radial_2:	INTEGER): BOOLEAN is
			--	The ArcTo function draws an elliptical arc. 
		external "C use <windows.h>"
		end -- ArcTo
			
	GetArcDirection (a_dc: POINTER): INTEGER is
			--	The GetArcDirection function returns the current arc
			-- direction for the specified device context. Arc and
			-- rectangle functions use the arc direction. 
		external "C use <windows.h>"
		end -- GetArcDirection
			
	LineDDA (a_dc:		POINTER;
				a_x_start:	INTEGER;
				a_y_start:	INTEGER;
				a_x_end:	INTEGER;
				a_y_end:	INTEGER;
				a_callback:	POINTER;
				a_data:		INTEGER): BOOLEAN is
			--	The LineDDA function determines which pixels should be
			-- highlighted for a line defined by the specified starting
			-- and ending points. 
		do
			Result := c_LineDDA (a_dc,
									a_x_start,
									a_y_start,	
									a_x_end,
									a_y_end,	
									a_callback,
									a_data,
									Current.to_pointer)
		end -- LineDDA

	LineTo (a_hdc   : POINTER;
			a_x_end : INTEGER;
			a_y_end : INTEGER) : BOOLEAN is
			--	The LineTo function draws a line from the current
			-- position up to, but not including, the specified point. 
		external "C use <windows.h>"
		end -- LineTo

	MoveToEx (a_hdc   : POINTER;
				a_x     : INTEGER;
				a_y     : INTEGER;
				a_point : POINTER) : BOOLEAN is
--	MoveToEx (	a_hdc   : POINTER;
--				a_x     : INTEGER;
--				a_y     : INTEGER;
--				a_point : WIN32_POINT) : BOOLEAN is
			--	The MoveToEx function updates the current position to the
			-- specified point and optionally returns the previous position. 
		external "C use <windows.h>"
		end -- MoveToEx

	PolyBezier (a_hdc       : POINTER;
				a_pts_array : POINTER;
				a_points    : INTEGER) : BOOLEAN is
--	PolyBezier (a_hdc       : POINTER;
--				a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--				a_points    : INTEGER) : BOOLEAN is
			--	The PolyBezier function draws one or more Bézier curves. 
		external "C use <windows.h>"
		end -- PolyBezier

	PolyBezierTo (	a_hdc       : POINTER;
					a_pts_array : POINTER;
					a_points    : INTEGER) : BOOLEAN is
--	PolyBezierTo (	a_hdc       : POINTER;
--					a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--					a_points    : INTEGER) : BOOLEAN is
				--	The PolyBezierTo function draws one or more Bézier curves. 
		external "C use <windows.h>"
		end -- PolyBezierTo
	
	PolyDraw (a_hdc       : POINTER;
				a_pts_array : POINTER;
				a_desc_arr  : POINTER;
				a_points    : INTEGER) : BOOLEAN is
--	PolyDraw (a_hdc       : POINTER;
--				a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--				a_desc_arr  : ARRAY[CHARACTER];
--				a_points    : INTEGER) : BOOLEAN is
				--	The PolyDraw function draws a set of line segments and
				-- Bézier curves. 
		external "C use <windows.h>"
		end -- PolyDraw
	
	Polyline (	a_hdc       : POINTER;
				a_pts_array : POINTER;
				a_points    : INTEGER) : BOOLEAN is
--	Polyline (	a_hdc       : POINTER;
--				a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--				a_points    : INTEGER) : BOOLEAN is
			--	The Polyline function draws a series of line segments by
			-- connecting the points in the specified array. 
		external "C use <windows.h>"
		end -- Polyline
	
	PolylineTo (a_hdc       : POINTER;
				a_pts_array : POINTER;
				a_points    : INTEGER) : BOOLEAN is
--	PolylineTo (a_hdc       : POINTER;
--				a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--				a_points    : INTEGER) : BOOLEAN is
			--	The PolylineTo function draws one or more straight lines. 
		external "C use <windows.h>"
		end -- PolylineTo
	
	PolyPolyline (	a_hdc       : POINTER;
					a_pts_array : POINTER;
					a_desc_arr  : POINTER;
					a_points    : INTEGER) : BOOLEAN is
--	PolyPolyline (	a_hdc       : POINTER;
--					a_pts_array : C_STRUCT_ARRAY[WIN32_POINT];
--					a_desc_arr  : ARRAY[INTEGER];
--					a_points    : INTEGER) : BOOLEAN is
			--	The PolyPolyline function draws multiple series of
			-- connected line segments. 
		external "C use <windows.h>"
		end -- PolyPolyline
	
	SetArcDirection (	a_dc:			POINTER;
						a_direction:	INTEGER): INTEGER is
			--	The SetArcDirection sets the drawing direction to be used
			-- for arc and rectangle functions. 
		external "C use <windows.h>"
		end -- SetArcDirection

feature {NONE}

	c_LineDDA (a_dc:		POINTER;
				a_x_start:	INTEGER;
				a_y_start:	INTEGER;
				a_x_end:	INTEGER;
				a_y_end:	INTEGER;
				a_callback:	POINTER;
				a_data:		INTEGER;
				a_current:	POINTER): BOOLEAN is
		external "C"
		end -- c_LineDDA

end -- class WIN32_LINE_AND_CURVE_FUNCTIONS