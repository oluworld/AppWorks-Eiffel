indexing
	contents: "WIN32 bitmap functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: no

class WIN32_BITMAP_FUNCTIONS

inherit
	WIN32_BITMAP_CONSTANTS

--	------------------------------------------------------------------------
--	Following are the functions used with bitmaps. 
--	
--	BitBlt
--	CreateBitmap
--	CreateBitmapIndirect
--	CreateCompatibleBitmap
--	CreateDIBitmap
--	CreateDIBSection
--	CreateDiscardableBitma
--	ExtFloodFill
--	GetBitmapBits
--	GetBitmapDimensionEx
--	GetDIBColorTable
--	GetDIBits
--	GetPixel
--	GetStretchBltMode
--	LoadBitmap
--	MaskBlt
--	PatBlt
--	PlgBlt
--	SetBitmapDimensionEx
--	SetDIBColorTable
--	SetDIBits
--	SetDIBitsToDevice
--	SetPixel
--	SetPixelV
--	SetStretchBltMode
--	StretchBlt
--	StretchDIBits 
--	------------------------------------------------------------------------

feature {NONE}

	BitBlt (a_handle_dest    : POINTER;
			a_x_dest         : INTEGER;
			a_y_dest         : INTEGER;
			a_width_dest     : INTEGER;
			a_height_dest    : INTEGER;
			a_handle_src     : POINTER;
			a_x_src          : INTEGER;
			a_y_src          : INTEGER;
--GE		a_width_src      : INTEGER;
--GE		a_height_src     : INTEGER;
			a_raster_op_code : BIT 32) : BOOLEAN is
--	The BitBlt function performs a bit-block transfer of the color data 
--	corresponding to a rectangle of pixels from the specified source device 
--	context into a destination device context. 
		external "C use <windows.h>"
		end -- BitBlt

	CreateBitmap(a_width          : INTEGER;
				 a_height         : INTEGER;
				 a_planes         : INTEGER;
				 a_bits_per_pixel : INTEGER;
				 a_color_array    : POINTER) : POINTER is
--	The CreateBitmap function creates a bitmap with the specified width, 
--	height, and color format (color planes and bits per pixel). 
		external "C use <windows.h>"
		end -- CreateBitmap

	CreateBitmapIndirect (a_bitmap : POINTER) : POINTER is
--	The CreateBitmapIndirect function creates a bitmap with the specified 
--	width, height, and color format (color planes and bits per pixel). 
		external "C use <windows.h>"
		end -- CreateBitmapIndirect

	CreateCompatibleBitmap (a_handle : POINTER;
							a_width  : INTEGER;
							a_height : INTEGER) : POINTER is
--	The CreateCompatibleBitmap function creates a bitmap compatible with 
--	the device that is associated with the specified device context. 
		external "C use <windows.h>"
		end -- CreateCompatibleBitmap

	CreateDIBitmap (a_hdc				: POINTER;
					a_bitmap_info_header: POINTER;
					a_init				: INTEGER;
					a_init_data			: POINTER;
					a_bitmap_info		: POINTER;
					a_usage: INTEGER)	: POINTER is
--	CreateDIBitmap (a_hdc				: POINTER;
--					a_bitmap_info_header: WIN32_BITMAPINFOHEADER;
--					a_init				: INTEGER;
--					a_init_data			: POINTER;
--					a_bitmap_info		: WIN32_BITMAPINFO;
--					a_usage: INTEGER)	: POINTER is
--	The CreateDIBitmap function creates a device-dependent bitmap (DDB)
--	from a device-independent bitmap (DIB) and, optionally, sets the bitmap
--	bits. 
		external "C use <windows.h>"
		end -- CreateDIBitmpap

	CreateDIBSection (	a_handle      : POINTER;
						a_bitmap_info : POINTER;
						a_usage       : INTEGER;
						a_bits        : POINTER;
						a_section     : POINTER;
						a_offset      : INTEGER) : POINTER is
--	CreateDIBSection (	a_handle      : POINTER;
--						a_bitmap_info : WIN32_BITMAPINFO;
--						a_usage       : INTEGER;
--						a_bits        : POINTER_REF;
--						a_section     : POINTER;
--						a_offset      : INTEGER) : POINTER is
--	The CreateDIBSection function creates a device-independent bitmap (DIB) 
--	that applications can write to directly. The function gives you a 
--	pointer to the location of the bitmap's bit values. You can supply a 
--	handle to a file mapping object that the function will use to create 
--	the bitmap, or you can let the operating system allocate the memory for 
--	the bitmap.
		external "C use <windows.h>"
		end -- CreateDIBSection

	ExtFloodFill (	a_hdc		: POINTER;
					a_xStart	: INTEGER;
					a_ystart	: INTEGER;
					a_color		: INTEGER;
					a_fill_type	: INTEGER): BOOLEAN is
--	The ExtFloodFill function fills an area of the display surface with
--	the current brush. 
		external "C use <windows.h>"
		end -- ExtFloodFill

	GetBitmapDimensionEx (	a_bitmap	: POINTER;
							a_dimension	: POINTER): BOOLEAN is
--	GetBitmapDimensionEx (	a_bitmap	: POINTER;
--							a_dimension	: WIN32_SIZE): BOOLEAN is
--	The GetBitmapDimensionEx function retrieves the dimensions of 
--	a bitmap. The retrieved dimensions must have been set by the 
--	SetBitmapDimensionEx function. The GetMapDimensionEx function 
--	replaces the GetMapDimension function.
		external "C use <windows.h>"
		end -- GetBitmapDimensionEx

	GetDIBColorTable (	a_hdc			: POINTER;
						a_start_index	: INTEGER;
						a_entries		: INTEGER;
						a_colors		: POINTER): INTEGER is
--	GetDIBColorTable (	a_hdc			: POINTER;
--						a_start_index	: INTEGER;
--						a_entries		: INTEGER;
--						a_colors		: WIN32_RGBQUAD): INTEGER is
--	The GetDIBColorTable function retrieves RGB (red, green, blue) color 
--	values from a range of entries in the color table of the DIB section 
--	bitmap that is currently selected into a specified device context.
		external "C use <windows.h>"
		end -- GetDIBColorTable

	GetDIBits (	a_hdc		: POINTER;
				a_bmp		: POINTER;
				a_start_scan: INTEGER;
				a_scan_lines: INTEGER;
				a_bits		: POINTER;
				a_bi		: POINTER;
				a_usage		: INTEGER): INTEGER is
--	GetDIBits (	a_hdc		: POINTER;
--				a_bmp		: POINTER;
--				a_start_scan: INTEGER;
--				a_scan_lines: INTEGER;
--				a_bits		: POINTER;
--				a_bi		: WIN32_BITMAPINFO;
--				a_usage		: INTEGER): INTEGER is
--	The GetDIBits function retrieves the bits of the specified bitmap 
--	and copies them into a buffer using the specified format. 
		external "C use <windows.h>"
		end -- GetDIBits

	GetPixel (	a_handle : POINTER;
				a_x      : INTEGER;
				a_y      : INTEGER) : INTEGER is
--	The GetPixel function retrieves the red, green, blue (RGB) color value 
--	of the pixel at the specified coordinates. 
		external "C use <windows.h>"
		end -- GetPixel

	GetStretchBltMode (a_hdc: POINTER): INTEGER is
--	The GetStretchBltMode function retrieves the current stretching mode. 
--	The stretching mode defines how color data is added to or removed 
--	from bitmaps that are stretched or compressed when the StretchBlt 
--	function is called. 
		external "C use <windows.h>"
		end -- GetStretchBltMode

	LoadBitmap (a_hinstance		: POINTER;
				a_bitmap_name	: POINTER) : POINTER is
--	LoadBitmap (a_hinstance		: POINTER;
--				a_bitmap_name	: STRING) : POINTER is
--	The LoadBitmap function loads the specified bitmap resource from a 
--	module's executable file. 
		external "C use <windows.h>"
		end -- LoadBitmap

	MaskBlt (	a_hdc_dest	: POINTER;
				a_xdest		: INTEGER;
				a_ydest		: INTEGER;
				a_width		: INTEGER;
				a_height	: INTEGER;
				a_hdc_src	: POINTER;
				a_xsrc		: INTEGER;
				a_ysrc		: INTEGER;
				a_mask		: POINTER;
				a_xmask		: INTEGER;
				a_ymask		: INTEGER;
				a_rop		: INTEGER): BOOLEAN is
--	The MaskBlt function combines the color data for the source and 
--	destination bitmaps using the specified mask and raster operation. 
		external "C use <windows.h>"
		end -- MaskBlt

	PatBlt (a_hdc	: POINTER;
			a_xleft	: INTEGER;
			a_yleft	: INTEGER;
			a_width	: INTEGER;
			a_height: INTEGER;
			a_rop	: INTEGER): BOOLEAN is
--	The PatBlt function paints the given rectangle using the brush that 
--	is currently selected into the specified device context. The brush 
--	color and the surface color(s) are combined by using the given 
--	raster operation. 
		external "C use <windows.h>"
		end -- PatBlt

	PlgBlt (a_hdc_dest	: POINTER;
			a_point		: POINTER;
			a_hdc_src	: POINTER;
			a_xsrc		: INTEGER;
			a_ysrc		: INTEGER;
			a_width		: INTEGER;
			a_height	: INTEGER;
			a_mask		: POINTER;
			a_xmask		: INTEGER;
			a_ymask		: INTEGER): BOOLEAN is
--	PlgBlt (a_hdc_dest	: POINTER;
--			a_point		: WIN32_POINT;
--			a_hdc_src	: POINTER;
--			a_xsrc		: INTEGER;
--			a_ysrc		: INTEGER;
--			a_width		: INTEGER;
--			a_height	: INTEGER;
--			a_mask		: POINTER;
--			a_xmask		: INTEGER;
--			a_ymask		: INTEGER): BOOLEAN is
--	The PlgBlt function performs a bit-block transfer of the bits of color 
--	data from the specified rectangle in the source device context to the 
--	specified parallelogram in the destination device context. If the given 
--	bitmask handle identifies a valid monochrome bitmap, the function uses 
--	this bitmap to mask the bits of color data from the source rectangle. 
		external "C use <windows.h>"
		end -- PlgBlt

	SetBitmapDimensionEx (	a_bitmap: POINTER;
							a_width	: INTEGER;
							a_height: INTEGER;
							a_size	: POINTER): BOOLEAN is
--	SetBitmapDimensionEx (	a_bitmap: POINTER;
--							a_width	: INTEGER;
--							a_height: INTEGER;
--							a_size	: WIN32_SIZE): BOOLEAN is
--	The SetBitmapDimensionEx function assigns preferred dimensions to a 
--	bitmap. These dimensions can be used by applications; however, they are 
--	not used by Windows. 
		external "C use <windows.h>"
		end -- SetBitmapDimensionEx

	SetDIBColorTable (	a_hdc			: POINTER;
						a_start_index	: INTEGER;
						a_entries		: INTEGER;
						a_colors		: POINTER): INTEGER is
--	SetDIBColorTable (	a_hdc			: POINTER;
--						a_start_index	: INTEGER;
--						a_entries		: INTEGER;
--						a_colors		: WIN32_RGBQUAD): INTEGER is
--	The SetDIBColorTable function sets RGB (red, green, blue) color values in 
--	a range of entries in the color table of the device-independent bitmap 
--	(DIB) that is currently selected into a specified device context.
		external "C use <windows.h>"
		end -- SetDIBColorTable

	SetDIBits (	a_hdc		: POINTER;
				a_bmp		: POINTER;
				a_start_scan: INTEGER;
				a_scan_lines: INTEGER;
				a_bits		: POINTER;
				a_bmi		: POINTER;
				a_color_use	: INTEGER): INTEGER is
--	SetDIBits (	a_hdc		: POINTER;
--				a_bmp		: POINTER;
--				a_start_scan: INTEGER;
--				a_scan_lines: INTEGER;
--				a_bits		: POINTER;
--				a_bmi		: WIN32_BITMAPINFO;
--				a_color_use	: INTEGER): INTEGER is
--	The SetDIBits function sets the pixels in a bitmap using the color data found 
--	in the specified device-independent bitmap (DIB). 
		external "C use <windows.h>"
		end -- SetDIBits

	SetDIBitsToDevice (	a_hdc		: POINTER;
						a_xdest		: INTEGER;
						a_ydest		: INTEGER;
						a_width		: INTEGER;
						a_height	: INTEGER;
						a_xsrc		: INTEGER;
						a_ysrc		: INTEGER;
						a_start_scan: INTEGER;
						a_scan_lines: INTEGER;
						a_bits		: POINTER;
						a_bmi		: POINTER;
						a_color_use	: INTEGER): INTEGER is
--	SetDIBitsToDevice (	a_hdc		: POINTER;
--						a_xdest		: INTEGER;
--						a_ydest		: INTEGER;
--						a_width		: INTEGER;
--						a_height	: INTEGER;
--						a_xsrc		: INTEGER;
--						a_ysrc		: INTEGER;
--						a_start_scan: INTEGER;
--						a_scan_lines: INTEGER;
--						a_bits		: POINTER;
--						a_bmi		: WIN32_BITMAPINFO;
--						a_color_use	: INTEGER): INTEGER is
--	The SetDIBitsToDevice function sets the pixels in the specified rectangle 
--	on the device that is associated with the destination device context 
--	using color data from a device-independent bitmap (DIB). 
		external "C use <windows.h>"
		end -- SetDIBitsToDevice

	SetPixel (	a_handle : POINTER;
				a_x      : INTEGER;
				a_y      : INTEGER;
				a_color  : INTEGER) : INTEGER is
--	The SetPixel function sets the pixel at the specified coordinates to 
--	the specified color. 
		external "C use <windows.h>"
		end -- SetPixel

	SetPixelV (	a_hdc	: POINTER;
				a_x		: INTEGER;
				a_y		: INTEGER;
				a_color	: INTEGER): BOOLEAN is
--	The SetPixelV function sets the pixel at the specified coordinates to the 
--	closest approximation of the specified color. The point must be in the 
--	clipping region and the visible part of the device surface. 
		external "C use <windows.h>"
		end -- SetPixelV

	SetStretchBltMode (	a_hdc			: POINTER;
						a_stretch_mode	: INTEGER): INTEGER is
--	The SetStretchBltMode function sets the bitmap stretching mode in the 
--	specified device context. 
		external "C use <windows.h>"
		end -- SetStretchBltMode

	StretchBlt (a_hdc_dest		: POINTER;
				a_xoOrigin_dest	: INTEGER;
				a_yorigin_dest	: INTEGER;
				a_width_dest	: INTEGER;
				a_height_dest	: INTEGER;
				a_hdcsrc		: POINTER;
				a_xorigin_src	: INTEGER;
				a_yorigin_src	: INTEGER;
				a_width_src		: INTEGER;
				a_height_src	: INTEGER;
				a_rop			: BIT 32): BOOLEAN is
--	The StretchBlt function copies a bitmap from a source rectangle into a 
--	destination rectangle, stretching or compressing the bitmap to fit the 
--	dimensions of the destination rectangle, if necessary. Windows stretches 
--	or compresses the bitmap according to the stretching mode currently set 
--	in the destination device context. 
		external "C use <windows.h>"
		end -- StretchBlt

	StretchDIBits (	a_hdc			: POINTER;
					a_xdest			: INTEGER;
					a_ydest			: INTEGER;
					a_dest_width	: INTEGER;
					a_dest_height	: INTEGER;
					a_xsrc			: INTEGER;
					a_ysrc			: INTEGER;
					a_src_width		: INTEGER;
					a_src_height	: INTEGER;
					a_bits			: POINTER;
					a_bits_info		: POINTER;
					a_usage			: INTEGER;
					a_rop			: INTEGER): INTEGER is
--	StretchDIBits (	a_hdc			: POINTER;
--					a_xdest			: INTEGER;
--					a_ydest			: INTEGER;
--					a_dest_width	: INTEGER;
--					a_dest_height	: INTEGER;
--					a_xsrc			: INTEGER;
--					a_ysrc			: INTEGER;
--					a_src_width		: INTEGER;
--					a_src_height	: INTEGER;
--					a_bits			: POINTER;
--					a_bits_info		: WIN32_BITMAPINFO;
--					a_usage			: INTEGER;
--					a_rop			: INTEGER): INTEGER is
--	The StretchDIBits function copies the color data for a rectangle of 
--	pixels in a device-independent bitmap (DIB) to the specified destination 
--	rectangle. If the destination rectangle is larger than the source 
--	rectangle, this function stretches the rows and columns of color data to 
--	fit the destination rectangle. If the destination rectangle is smaller 
--	than the source rectangle, this function compresses the rows and columns 
--	by using the specified raster operation. 
		external "C use <windows.h>"
		end -- StretchDIBits

end -- class WIN32_BITMAP_FUNCTIONS