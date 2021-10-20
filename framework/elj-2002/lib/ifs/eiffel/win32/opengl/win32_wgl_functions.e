class WIN32_WGL_FUNCTIONS


feature {NONE}

	-- wglCopyContext

	wglCopyContext (a_hglrcSrc : POINTER;
				a_hlglrcDst : POINTER;
				a_mask : INTEGER) : BOOLEAN  is
			--  The wglCopyContext function copies selected groups
			-- of rendering states from one OpenGL rendering context
			-- to another. 
		external "C_InlineWithoutCurrent"
		alias "wglCopyContext"
		end -- wglCopyContext

	-- wglCreateContext

	wglCreateContext (a_hdc : POINTER) : INTEGER  is
			--  The wglCreateContext function creates a new OpenGL
			-- rendering context, which is suitable for drawing on
			-- the device referenced by hdc. The rendering context
			-- has the same pixel format as the device context.
		external "C_InlineWithoutCurrent"
		alias "wglCreateContext"
		end -- wglCreateContext

	-- wglCreateLayerContext

	wglCreateLayerContext (a_hdc : POINTER;
				a_iLayerPlane : INTEGER) : INTEGER  is
			--  The wglCreateLayerContext function creates a new OpenGL
			-- rendering context for drawing to a specified layer
			-- plane on a device context. 
		external "C_InlineWithoutCurrent"
		alias "wglCreateLayerContext"
		end -- wglCreateLayerContext

	-- wglDeleteContext

	wglDeleteContext (a_hglrc : POINTER) : BOOLEAN  is
			--  The wglDeleteContext function deletes a specified
			-- OpenGL rendering context. 
		external "C_InlineWithoutCurrent"
		alias "wglDeleteContext"
		end -- wglDeleteContext

	-- wglDescribeLayerPlane

	wglDescribeLayerPlane (a_hdc : POINTER;
				a_iPixelFormat : INTEGER;
				a_iLayerPlane : INTEGER;
				a_nBytes : INTEGER;
				a_plpd_deref : POINTER) : BOOLEAN  is
--	wglDescribeLayerPlane (a_hdc : POINTER;
--				a_iPixelFormat : INTEGER;
--				a_iLayerPlane : INTEGER;
--				a_nBytes : INTEGER;
--				a_plpd_deref : WIN32_PIXELFORMATDESCRIPTOR) : BOOLEAN  is
			--  The wglDescribeLayerPlane function obtains information
			-- about the layer planes of a given pixel format. 
		external "C_InlineWithoutCurrent"
		alias "wglDescribeLayerPlane"
		end -- wglDescribeLayerPlane

	-- wglGetCurrentContext

	wglGetCurrentContext : POINTER  is
			--  The wglGetCurrentContext function obtains a handle
			-- to the current OpenGL rendering context of the calling
			-- thread.
		external "C_InlineWithoutCurrent"
		alias "wglGetCurrentContext"
		end -- wglGetCurrentContext

	-- wglGetCurrentDC

	wglGetCurrentDC : POINTER  is
			--  The wglGetCurrentDC function obtains a handle to the
			-- device context that is associated with the current
			-- OpenGL rendering context of the calling thread.
		external "C_InlineWithoutCurrent"
		alias "wglGetCurrentDC"
		end -- wglGetCurrentDC

	-- wglGetLayerPaletteEntries

	wglGetLayerPaletteEntries (a_hdc : POINTER;
				a_iLayerPlane : INTEGER;
				a_iStart : INTEGER;
				a_cEntries : INTEGER;
				a_pcr_deref : POINTER) : INTEGER  is
--	wglGetLayerPaletteEntries (a_hdc : INTEGER;
--				a_iLayerPlane : INTEGER;
--				a_iStart : INTEGER;
--				a_cEntries : INTEGER;
--				a_pcr_deref : INTEGER) : INTEGER  is
			--  The wglGetLayerPaletteEntries function retrieves the
			-- palette entries from a given color-index layer plane
			-- for a specified device context. 
		external "C_InlineWithoutCurrent"
		alias "wglGetLayerPaletteEntries"
		end -- wglGetLayerPaletteEntries

	-- wglGetProcAddress

	wglGetProcAddress (a_szProc : POINTER) : POINTER  is
			--  The wglGetProcAddress function returns the address
			-- of an OpenGL extension function for use with the current
			-- OpenGL rendering context.
		external "C_InlineWithoutCurrent"
		alias "wglGetProcAddress"
		end -- wglGetProcAddress

	-- wglMakeCurrent

	wglMakeCurrent (a_hdc : INTEGER;
				a_hglrc : INTEGER) : BOOLEAN  is
			--  The wglMakeCurrent function makes a specified OpenGL
			-- rendering context the calling thread's current rendering
			-- context. All subsequent OpenGL calls made by the thread
			-- are drawn on the device identified by hdc. You can
			-- also use wglMakeCurrent to change the calling thread's
			-- current rendering context so it's no longer current.
		external "C_InlineWithoutCurrent"
		alias "wglGetProcAddress"
		end -- wglMakeCurrent

	-- wglRealizeLayerPalette

	wglRealizeLayerPalette (a_hdc : POINTER;
				a_iLayerPlane : INTEGER;
				a_bRealize : BOOLEAN) : BOOLEAN  is
			--  The wglRealizeLayerPalette function maps palette entries
			-- from a given color-index layer plane into the physical
			-- palette or initializes the palette of an RGBA layer
			-- plane. 
		external "C_InlineWithoutCurrent"
		alias "wglRealizeLayerPalette"
		end -- wglRealizeLayerPalette

	-- wglSetLayerPaletteEntries

	wglSetLayerPaletteEntries (a_hdc : POINTER;
				a_iLayerPlane : INTEGER;
				a_iStart : INTEGER;
				a_cEntries : INTEGER;
				a_pcr_deref : POINTER) : INTEGER  is
			--  The wglSetLayerPaletteEntries function sets the palette
			-- entries in a given color-index layer plane for a specified
			-- device context. 
		external "C_InlineWithoutCurrent"
		alias "wglSetLayerPaletteEntries"
		end -- wglSetLayerPaletteEntries

	-- wglShareLists

	wglShareLists (a_hglrc1 : POINTER;
				a_hglrc2 : POINTER) : BOOLEAN  is
			--  The wglShareLists function enables multiple OpenGL
			-- rendering contexts to share a single display-list space.
		external "C_InlineWithoutCurrent"
		alias "wglShareLists"
		end -- wglShareLists

	-- wglSwapLayerBuffers

	wglSwapLayerBuffers (a_hdc : POINTER;
				a_fuPlanes : INTEGER) : BOOLEAN  is
			--  The wglSwapLayerBuffers function swaps the front and
			-- back buffers in the overlay, underlay, and main planes
			-- of the window referenced by a specified device context.
			-- 
		external "C_InlineWithoutCurrent"
		alias "wglSwapLayerBuffers"
		end -- wglSwapLayerBuffers

	-- wglUseFontBitmaps

	wglUseFontBitmaps (a_hdc : POINTER;
				a_first : INTEGER;
				a_count : INTEGER;
				a_listBase : INTEGER) : BOOLEAN  is
			--  The wglUseFontBitmaps function creates a set of bitmap
			-- display lists for use in the current OpenGL rendering
			-- context. The set of bitmap display lists is based on
			-- the glyphs in the currently selected font in the device
			-- context. You can then use bitmaps to draw characters
			-- in an OpenGL image. - The wglUseFontBitmaps function
			-- creates count display lists, one for each of a run
			-- of count glyphs that begins with the first glyph in
			-- the hdc parameter's selected fonts.
		external "C_InlineWithoutCurrent"
		alias "wglUseFontBitmaps"
		end -- wglUseFontBitmaps

	-- wglUseFontOutlines

	wglUseFontOutlines (a_hdc : POINTER;
				a_first : INTEGER;
				a_count : INTEGER;
				a_listBase : INTEGER;
				a_deviation : REAL;
				a_extrusion : REAL;
				a_format : INTEGER;
				a_gmf : POINTER) : BOOLEAN  is
--	wglUseFontOutlines (a_hdc : INTEGER;
--				a_first : INTEGER;
--				a_count : INTEGER;
--				a_listBase : INTEGER;
--				a_deviation : REAL;
--				a_extrusion : REAL;
--				a_format : INTEGER;
--				a_gmf : WIN32_GLYPHMETRICSFLOAT) : BOOLEAN  is
			--  The wglUseFontOutlines function creates a set of display
			-- lists, one for each glyph of the currently selected
			-- outline font of a device context, for use with the
			-- current rendering context. The display lists are used
			-- to draw 3-D characters of TrueType fonts. Each display
			-- list describes a glyph outline in floating-point coordinates.
			-- - The run of glyphs begins with the first glyph of
			-- the font of the specified device context. The em square
			-- size of the font, the notional grid size of the original
			-- font outline from which the font is fitted, is mapped
			-- to 1.0 in the x- and y- coordinates in the display
			-- lists. The extrusion parameter sets how much depth
			-- the font has in the z direction. - The lpgmf parameter
			-- returns a GLYPHMETRICSFLOAT structure that contains
			-- information about the placement and orientation of
			-- each glyph in a character cell.
		external "C_InlineWithoutCurrent"
		alias "wglUseFontOutlines"
		end -- wglUseFontOutlines

end -- class WIN32_WGL_FUNCTIONS
