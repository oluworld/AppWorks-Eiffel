class WIN32_RECTANGLE_FUNCTIONS

feature {NONE}

	-- CopyRect

	CopyRect (a_prcDst : POINTER;
		a_prcSrc : POINTER) : BOOLEAN  is
--	CopyRect (a_prcDst : WIN32_RECT;
--		a_prcSrc : WIN32_RECT) : BOOLEAN  is
			-- The CopyRect function copies the coordinates of one
			-- rectangle to another. 
		external "C use <windows.h>"
		end -- CopyRect

	-- EqualRect

	EqualRect (a_prc1 : POINTER;
		a_prc2 : POINTER) : BOOLEAN  is
--	EqualRect (a_prc1 : WIN32_RECT;
--		a_prc2 : WIN32_RECT) : BOOLEAN  is
			-- The EqualRect function determines whether the two
			-- specified rectangles are equal by comparing the coordinates
			-- of their upper-left and lower-right corners. 
		external "C use <windows.h>"
		end -- EqualRect

	-- InflateRect

	InflateRect (a_prc : POINTER;
		a_dx : INTEGER;
		a_dy : INTEGER) : BOOLEAN  is
--	InflateRect (a_prc : WIN32_RECT;
--		a_dx : INTEGER;
--		a_dy : INTEGER) : BOOLEAN  is
			-- The InflateRect function increases or decreases the
			-- width and height of the specified rectangle. The InflateRect
			-- function adds dx units to the left and right ends of
			-- the rectangle and dy units to the top and bottom. The
			-- dx and dy parameters are signed values; positive values
			-- increase the width and height, and negative values
			-- decrease them. 
		external "C use <windows.h>"
		end -- InflateRect

	-- IntersectRect

	IntersectRect (a_prcDst : POINTER;
		a_prcSrc1 : POINTER;
		a_prcSrc2 : POINTER) : BOOLEAN  is
--	IntersectRect (a_prcDst : WIN32_RECT;
--		a_prcSrc1 : WIN32_RECT;
--		a_prcSrc2 : WIN32_RECT) : BOOLEAN  is
			-- The IntersectRect function calculates the intersection
			-- of two source rectangles and places the coordinates
			-- of the intersection rectangle into the destination
			-- rectangle. If the source rectangles do not intersect,
			-- an empty rectangle (in which all coordinates are set
			-- to zero) is placed into the destination rectangle.
			-- 
		external "C use <windows.h>"
		end -- IntersectRect

	-- IsRectEmpty

	IsRectEmpty (a_prc : POINTER) : BOOLEAN  is
--	IsRectEmpty (a_prc : WIN32_RECT) : BOOLEAN  is
			-- The IsRectEmpty function determines whether the specified
			-- rectangle is empty. A empty rectangle is one that has
			-- no area; that is, the coordinate of the right side
			-- is less than or equal to the coordinate of the left
			-- side, or the coordinate of the bottom side is less
			-- than or equal to the coordinate of the top side. 
		external "C use <windows.h>"
		end -- IsRectEmpty

	-- OffsetRect

	OffsetRect (a_prc : POINTER;
		a_x : INTEGER;
		a_y : INTEGER) : BOOLEAN  is
--	OffsetRect (a_prc : WIN32_RECT;
--		a_x : INTEGER;
--		a_y : INTEGER) : BOOLEAN  is
			-- The OffsetRect function moves the specified rectangle
			-- by the specified offsets. 
		external "C use <windows.h>"
		end -- OffsetRect

	-- PtInRect

	PtInRect (a_prc : POINTER;
		a_pt : POINTER) : BOOLEAN  is
--	PtInRect (a_prc : WIN32_RECT;
--		a_pt : WIN32_POINT) : BOOLEAN  is
			-- The PtInRect function determines whether the specified
			-- point lies within the specified rectangle. A point
			-- is within a rectangle if it lies on the left or top
			-- side or is within all four sides. A point on the right
			-- or bottom side is considered outside the rectangle.
		do
			Result := c_PtInRect (a_prc, a_pt)
		end -- PtInRect

	-- SetRect

	SetRect (a_prc : POINTER;
		a_nLeft : INTEGER;
		a_nTop : INTEGER;
		a_nRight : INTEGER;
		a_nBottom : INTEGER) : BOOLEAN  is
--	SetRect (a_prc : WIN32_RECT;
--		a_nLeft : INTEGER;
--		a_nTop : INTEGER;
--		a_nRight : INTEGER;
--		a_nBottom : INTEGER) : BOOLEAN  is
			-- The SetRect function sets the coordinates of the specified
			-- rectangle. This is equivalent to assigning the left,
			-- top, right, and bottom arguments to the appropriate
			-- members of the RECT structure. 
		external "C use <windows.h>"
		end -- SetRect

	-- SetRectEmpty

	SetRectEmpty (a_prc : POINTER) : BOOLEAN  is
--	SetRectEmpty (a_prc : WIN32_RECT) : BOOLEAN  is
			-- The SetRectEmpty function creates an empty rectangle
			-- in which all coordinates are set to zero. 
		external "C use <windows.h>"
		end -- SetRectEmpty

	-- SubtractRect

	SubtractRect (a_prcDest : POINTER;
		a_prcSrc1 : POINTER;
		a_prcSrc2 : POINTER) : BOOLEAN  is
--	SubtractRect (a_prcDest : WIN32_RECT;
--		a_prcSrc1 : WIN32_RECT;
--		a_prcSrc2 : WIN32_RECT) : BOOLEAN  is
			-- The SubtractRect function obtains the coordinates
			-- of a rectangle determined by subtracting one rectangle
			-- from another. 
		external "C use <windows.h>"
		end -- SubtractRect

	-- UnionRect

	UnionRect (a_prcDst : POINTER;
		a_prcSrc1 : POINTER;
		a_prcSrc2 : POINTER) : BOOLEAN  is
--	UnionRect (a_prcDst : WIN32_RECT;
--		a_prcSrc1 : WIN32_RECT;
--		a_prcSrc2 : WIN32_RECT) : BOOLEAN  is
			-- The UnionRect function creates the union of two rectangles.
			-- The union is the smallest rectangle that contains both
			-- source rectangles. 
		external "C use <windows.h>"
		end -- UnionRect

feature {NONE}

	c_PtInRect (a_prc : POINTER; a_pt : POINTER): BOOLEAN is
		local
			pt1: POINTER
			pt2: POINTER
			res: BOOLEAN
		do
			pt1 := a_prc
			pt2 := a_pt
			c_inline_c ("_res = PtInRect(_pt1, *((POINT*)_pt2));%N")
			Result := res
		end -- c_PtInRect

end -- class WIN32_RECTANGLE_FUNCTIONS