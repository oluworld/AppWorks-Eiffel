indexing
	contents: "WIN32 filled figure functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_FILLED_FIGURE_FUNCTIONS

--	------------------------------------------------------------------------
--	The following functions are used with filled shapes. 
--
--	Chord
--	Ellipse
--	FillRect
--	FrameRect
--	InvertRect
--	Pie
--	Polygon
--	PolyPolygon
--	Rectangle
--	RoundRect
--	------------------------------------------------------------------------

feature {NONE}

	Chord (a_handle:		POINTER;
			a_left_rect:	INTEGER;
			a_top_rect:		INTEGER;
			a_right_rect:	INTEGER;
			a_bottom_rect:	INTEGER;
			a_x_radial_1:	INTEGER;
			a_y_radial_1:	INTEGER;
			a_x_radial_2:	INTEGER;
			a_y_radial_2:	INTEGER): BOOLEAN is
			--	The Chord function draws a chord (a region bounded by the
			-- intersection of an ellipse and a line segment, called a
			-- "secant"). The chord is outlined by using the current pen
			-- and filled by using the current brush. 
		external "C use <windows.h>"
		end -- Chord

	Ellipse (a_handle:		POINTER;
				a_left_rect:	INTEGER;
				a_top_rect:		INTEGER;
				a_right_rect:	INTEGER;
				a_bottom_rect:	INTEGER): BOOLEAN is
			--	The Ellipse function draws an ellipse. The center of the
			-- ellipse is the center of the given bounding rectangle. The
			-- ellipse is outlined by using the current pen and is filled
			-- by using the current brush. 
		external "C use <windows.h>"
		end -- Ellipse
	
	FillRect (a_dc:		POINTER;
				a_rect:		POINTER;
				a_brush:	POINTER): INTEGER is
--	FillRect (	a_dc:		POINTER;
--				a_rect:		WIN32_RECT;
--				a_brush:	POINTER): INTEGER is
			--	The FillRect function fills a rectangle by using the
			-- specified brush. This function includes the left and
			-- top borders, but excludes the right and bottom borders
			-- of the rectangle. 
		external "C use <windows.h>"
		end -- FillRect
		
	FrameRect (a_dc:		POINTER;
				a_rect:		POINTER;
				a_brush:	POINTER): INTEGER is
--	FrameRect (	a_dc:		POINTER;
--				a_rect:		WIN32_RECT;
--				a_brush:	POINTER): INTEGER is
			--	The FrameRect function draws a border around the
			-- specified rectangle by using the specified brush.
			-- The width and height of the border are always one
			-- logical unit. 
		external "C use <windows.h>"
		end -- FrameRect
		
	InvertRect (a_dc:		POINTER;
				a_rect:		POINTER): BOOLEAN is
--	InvertRect (a_dc:		POINTER;
--				a_rect:		WIN32_RECT): BOOLEAN is
			--	The InvertRect function inverts a rectangle in a window by
			-- performing a logical NOT operation on the color values for
			-- each pixel in the rectangle's interior. 
		external "C use <windows.h>"
		end -- InvertRect
		
	Pie (a_handle:		POINTER;
			a_left_rect:	INTEGER;
			a_top_rect:		INTEGER;
			a_right_rect:	INTEGER;
			a_bottom_rect:	INTEGER;
			a_x_radial_1:	INTEGER;
			a_y_radial_1:	INTEGER;
			a_x_radial_2:	INTEGER;
			a_y_radial_2:	INTEGER): BOOLEAN is
			--	The Pie function draws a pie-shaped wedge bounded by the
			-- intersection of an ellipse and two radials. The pie is
			-- outlined by using the current pen and filled by using the
			-- current brush. 
		external "C use <windows.h>"
		end -- Pie

	Polygon (a_handle:		POINTER;
				a_point_arr:	POINTER;
				a_count:		INTEGER): BOOLEAN is
--	Polygon (a_handle:		POINTER;
--				a_point_arr:	C_STRUCT_ARRAY[WIN32_POINT];
--				a_count:		INTEGER): BOOLEAN is
			--	The Polygon function draws a polygon consisting of two or
			-- more vertices connected by straight lines. The polygon is
			-- outlined by using the current pen and filled by using the
			-- current brush and polygon fill mode. 
		external "C use <windows.h>"
		end -- Polygon
		
	PolyPolygon (a_handle:		POINTER;
					a_point_arr:	POINTER;
					a_vertice_arr:	POINTER;
					a_count:		INTEGER): BOOLEAN is
--	PolyPolygon (a_handle:		POINTER;
--					a_point_arr:	C_STRUCT_ARRAY[WIN32_POINT];
--					a_vertice_arr:	ARRAY[INTEGER];
--					a_count:		INTEGER): BOOLEAN is
			--	The PolyPolygon function draws a series of closed polygons.
			-- Each polygon is outlined by using the current pen and filled
			-- by using the current brush and polygon fill mode. The polygons
			-- drawn by this function can overlap.
		external "C use <windows.h>"
		end -- PolyPolygon
		
	Rectangle (a_handle:		POINTER;
				a_left_rect:	INTEGER;
				a_top_rect:		INTEGER;
				a_right_rect:	INTEGER;
				a_bottom_rect:	INTEGER): BOOLEAN is
			--	The Rectangle function draws a rectangle. The rectangle is 
			-- outlined by using the current pen and filled by using the
			-- current brush. 
		external "C use <windows.h>"
		end -- Rectangle
	
	RoundRect (a_handle:		POINTER;
				a_left_rect:	INTEGER;
				a_top_rect:		INTEGER;
				a_right_rect:	INTEGER;
				a_bottom_rect:	INTEGER;
				a_width:		INTEGER;
				a_height:		INTEGER): BOOLEAN is
			--	The RoundRect function draws a rectangle with rounded
			-- corners. The rectangle is outlined by using the current
			-- pen and filled by using the current brush. 
		external "C use <windows.h>"
		end -- RoundRect
	
end -- class WIN32_FILLED_FIGURE_FUNCTIONS