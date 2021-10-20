class WIN32_DIB

inherit
	WIN32_API
	ELJ_COMMON_TOOLS
	ELJ_MEMORY
		rename
			make as make_memory
		redefine
			dispose
		end

creation 
	make, 
	make_from_info,
	make_from_file,
	make_from_stream

feature {NONE}

	dispose is
		local
			bool_res: BOOLEAN
		do
			if bm_handle /= default_pointer then
				bool_res := DeleteObject (bm_handle)
			end -- if
		end -- dispose

	make (a_x, a_y, a_bits, a_colors: INTEGER) is
		require
			valid_size:		a_x > 0 and then a_y > 0
			valid_depth:	a_bits =  1 or else a_bits =  4 or else a_bits =  8 or else
							a_bits = 16 or else a_bits = 24 or else a_bits = 32
			valid_color:	a_colors = 0 implies a_bits <= 8
		local
			bmi:		WIN32_BITMAPINFO
			tmp_bmih:	WIN32_BITMAPINFOHEADER
			tmp_quad:	WIN32_RGBQUAD
			info_sze:	INTEGER
			entries:	INTEGER
		do
			make_memory
			if a_colors /= 0 then
				entries := a_colors
			elseif a_bits <= 8 then
				entries := ((1).to_bit ^ -a_bits).to_integer
			end -- if

			!!tmp_bmih.make_default
			!!tmp_quad.make_default
			
			info_sze := tmp_bmih.count + (entries - 1) * tmp_quad.count
			mem := mem.calloc (info_sze)

			!!bmi
			bmi.from_external (mem.to_external, bmi.external_size)
			!!tmp_bmih
			tmp_bmih.from_external (bmi.bmiHeader, tmp_bmih.external_size)

			tmp_bmih.set_biSize (tmp_bmih.count)
			tmp_bmih.set_biWidth (a_x)
			tmp_bmih.set_biHeight (a_y)
			tmp_bmih.set_biPlanes (1)
			tmp_bmih.set_biBitCount (a_bits)
			tmp_bmih.set_biCompression (BI_RGB)
			tmp_bmih.set_biSizeImage (0)
			tmp_bmih.set_biXPelsPerMeter (0)
			tmp_bmih.set_biYPelsPerMeter (0)
			tmp_bmih.set_biClrUsed (a_colors)
			tmp_bmih.set_biClrImportant (0)

     		make_from_info (bmi.pointer)
		end -- make
	
	make_from_info (a_info: POINTER) is
		require
			info_exist: a_info /= Void
		local
			dib_bits_ptr:	CMEM_32
			int_res:		INTEGER
			i:				INTEGER
			tmp_length:		INTEGER
			tmp_height:		INTEGER
			tmp_header:		WIN32_BITMAPINFOHEADER
		do
			make_memory
			!!left_shift.make (0, 2)
			!!right_shift.make (0, 2)
			!!section
			section.make_external
			
			bm_handle := CreateDIBSection (	default_pointer,
											a_info,
											DIB_RGB_COLORS,
											$bits, --dib_bits_ptr.to_external,
											default_pointer,
											0)
			check
				bm_handle /= default_pointer
			end -- check
			
--			bits := dib_bits_ptr.as_pointer

			int_res := GetObject (bm_handle, section.count, section.pointer)
			check
				int_res /= 0
			end -- check

			if compression = BI_BITFIELDS then
				from
				until	i = 3
				loop
					left_shift.put (mask_to_left_shift (section.dsBitFields (i)), i)
					right_shift.put (mask_to_right_shift (section.dsBitFields (i)), i)
					i := i + 1
				end -- loop
			elseif compression = BI_RGB then
				if bits_per_pixel = 16 then
					section.set_dsBitFields (31744, 0)
					section.set_dsBitFields (992, 1)
					section.set_dsBitFields (31, 2)

					right_shift.put (10, 0)
					right_shift.put (5, 1)
					right_shift.put (0, 2)

					left_shift.put (3, 0)
					left_shift.put (3, 0)
					left_shift.put (3, 0)
				elseif bits_per_pixel = 24 or bits_per_pixel = 32 then
					section.set_dsBitFields (16711680, 0)
					section.set_dsBitFields (65280, 1)
					section.set_dsBitFields (255, 2)

					right_shift.put (16, 0)
					right_shift.put (8, 1)
					right_shift.put (0, 2)
				end -- if
			end -- if

			tmp_height := height
			
			!!bytes.make (0, height - 1)

			tmp_length := row_length
			
			!!tmp_header
			tmp_header.from_external (a_info, tmp_header.external_size)
			
			if tmp_header.biHeight > 0 then
				from	i := 0
				until	i = tmp_height
				loop
					bytes.put (increase_pointer (bits, (tmp_height - i - 1) * tmp_length), i)
					i := i + 1
				end -- loop
			else
				from	i := 0
				until	i = tmp_height
				loop
					bytes.put (increase_pointer (bits, i * tmp_length), i)
					i := i + 1
				end -- loop
			end -- if
		end -- make_from_info

	make_from_file (a_file_name: STRING) is
		-- we are dealing with external data at this point so we're doing
		-- a check on nearly every operation - we don't want to crash the
		-- program just because the end user selected an invalid file
		require
			valid_name: a_file_name /= Void
		local
			bfh:			WIN32_BITMAPFILEHEADER
			bi:				WIN32_BITMAPINFO
			bm_file:		POINTER
			bool_res:		BOOLEAN
			bi_size:		INTEGER
			read_bytes:		CMEM_32
		do
			make_memory
			last_loaded := False
			
			bm_file := CreateFile (	a_file_name.to_external,
									GENERIC_READ,
									FILE_SHARE_READ,
									default_pointer,
									OPEN_EXISTING,
									FILE_FLAG_SEQUENTIAL_SCAN,
									default_pointer)

			if bm_file /= INVALID_HANDLE_VALUE then
				!!bfh
				bfh.make_external
				
				if ReadFile (bm_file, bfh.pointer, bfh.count, read_bytes.to_external, default_pointer) then
					if bfh.bfType = 19778 then
						bi_size := bfh.bfOffBits - bfh.count
						mem := mem.calloc (bi_size)
						
						if ReadFile (bm_file, mem.to_external, bi_size, read_bytes.to_external, default_pointer) then
							!!bi
							bi.from_external (mem.to_external, bi_size)
			
							make_from_info (bi.to_external)
							
							bi_size := bfh.bfSize - bfh.bfOffBits
			
							if ReadFile (bm_file, bits, bi_size, read_bytes.to_external, default_pointer) then
								last_loaded := True
							end -- if
						end -- if
					end -- if
				end -- if
														
				bool_res := CloseHandle (bm_file)
			end -- if
		end -- make_from_file

feature

	bit_size: INTEGER is
		local
			bh: expanded WIN32_BITMAPINFOHEADER
		do
			bh.from_external (section.dsBmih, bh.external_size)

     		if bh.biSizeImage /= 0 then
				Result := bh.biSizeImage
			else
				Result := height * row_length
			end -- if
		end -- bit_size

	bitmap: POINTER is
		do
			Result := bm_handle
		end -- bitmap

	bits_per_pixel: INTEGER is
		local
			bm: expanded WIN32_BITMAP
		do
			bm.from_external (section.dsBm, bm.external_size)
			Result := bm.bmBitsPixel
		end -- bits_per_pixel

	compression: INTEGER is
		local
			bh: expanded WIN32_BITMAPINFOHEADER
		do
			bh.from_external (section.dsBmih, bh.external_size)
			Result := bh.biCompression
		end -- compression


	height: INTEGER is
		local
			bm: expanded WIN32_BITMAP
		do
			bm.from_external (section.dsBm, bm.external_size)
			Result := bm.bmHeight
		end -- height
	
	last_loaded: BOOLEAN
	
	mask (a_index: INTEGER): INTEGER is
		require
			valid_index: 1 <= a_index and a_index <= 3
		do
			
		end -- mask
	
	num_colors: INTEGER is
		local
			bh: expanded WIN32_BITMAPINFOHEADER
		do
			bh.from_external (section.dsBmih, bh.external_size)
			
			if bh.biClrUsed /= 0 then
				Result := bh.biClrUsed
			elseif bits_per_pixel <= 8 then
				Result := ((1).to_bit ^ -bits_per_pixel).to_integer
			end -- if
		end -- if

	pixel (a_x, a_y: INTEGER): INTEGER is
		local
			pixel_char:	CHARACTER
			pixel_int:	INTEGER
			shift_val:	INTEGER
		do
			inspect bits_per_pixel
				when 1 then
					pixel_char := dereference_character (pixel_pointer (a_x, a_y))
					Result := ((1).to_bit and (pixel_char.to_bit ^ (7 - (a_x.to_bit and (7).to_bit).to_integer))).to_integer
					
				when 4 then
					pixel_char := dereference_character (pixel_pointer (a_x, a_y))
					if (a_x.to_bit and (1).to_bit) /= (1).to_bit then
						shift_val := 4
					end -- if
					
					Result := ((15).to_bit and (pixel_char.to_bit ^ shift_val)).to_integer
				when 8 then
					pixel_char := dereference_character (pixel_pointer (a_x, a_y))
					Result := pixel_char.to_integer
					
				when 16 then
					Result := dereference_short (pixel_pointer (a_x, a_y))
					
				when 24 then
					pixel_int := dereference_integer (pixel_pointer (a_x, a_y))
					Result := ((16777215).to_bit and pixel_int.to_bit).to_integer
					
				when 32 then
					Result := dereference_integer (pixel_pointer (a_x, a_y))
			end -- inspect
		end -- pixel
	
	pixel_color (a_x, a_y: INTEGER): WIN32_RGBQUAD is
		local
			pixel_value:	INTEGER
			ptr_to_value:	POINTER
		do
			pixel_value := pixel (a_x, a_y)
			!!Result
			Result.make_external
			
			if bits_per_pixel <= 8 then
				color_from_table (pixel_value, Result)
			elseif bits_per_pixel = 24 then
				ptr_to_value := Result.pointer
				c_inline_c ("* (RGBTRIPLE *) _ptr_to_value = * (RGBTRIPLE *) & _pixel_value;%N")
				Result.set_rgbReserved (0)
			elseif bits_per_pixel = 32 and compression = BI_RGB then
				ptr_to_value := Result.pointer
				c_inline_c ("* (RGBQUAD *) _ptr_to_value = * (RGBQUAD *) & _pixel_value;%N")
			else
				Result.set_rgbRed   (((((section.dsBitFields (0).to_bit and pixel_value.to_bit) ^ right_shift.item (0)) ^ -left_shift.item (0))).to_integer)
				Result.set_rgbGreen (((((section.dsBitFields (1).to_bit and pixel_value.to_bit) ^ right_shift.item (1)) ^ -left_shift.item (1))).to_integer)
				Result.set_rgbBlue  (((((section.dsBitFields (2).to_bit and pixel_value.to_bit) ^ right_shift.item (2)) ^ -left_shift.item (2))).to_integer)
			end -- if
		end -- pixel_color

	pixel_pointer (a_x, a_y: INTEGER): POINTER is
		require
			valid_x: a_x >= 0 and then a_x < width
			valid_y: a_y >= 0 and then a_y < height
		do
			Result := increase_pointer (bytes.item (a_y), (a_x * bits_per_pixel) // 8)
		end -- pixel_pointer

	row_length: INTEGER is
		do
			Result := 4 * ((width * bits_per_pixel + 31) // 32)
		end -- row_length

	width: INTEGER is
		local
			bm: expanded WIN32_BITMAP
		do
			bm.from_external (section.dsBm, bm.external_size)
			Result := bm.bmWidth
		end -- width
	
	bits: POINTER

feature

--	set_pixel (a_x, a_y, a_value: INTEGER) is
--		local
--			pixel_ptr:	POINTER
--			pixel_chr:	CHARACTER
--			tmp_chr:	CHARACTER
--		do
--			pixel_ptr := pixel_pointer (a_x, a_y)
--			pixel_chr := dereference_character (pixel_ptr)
--			
--			inspect bits_per_pixel
--				when 1 then
--					tmp_chr := ((1).to_bit ^ (7 - (a_x.to_bit and (7).to_bit).to_integer)).to_character
--					tmp_chr := (pixel_chr.to_bit and (not tmp_chr.to_bit)).to_character
--					pixel_chr := (tmp_chr.to_bit or (a_value.to_character.to_bit ^ (7 - (a_x.to_bit and (7).to_bit).to_character))).to_character
--			end -- inspect
--		end -- set_pixel

--BOOL DibSetPixel (HDIB hdib, int x, int y, DWORD dwPixel)
--{
--     PBYTE pPixel ;
--
--     if (!(pPixel = DibPixelPtr (hdib, x, y)))
--          return FALSE ;
--
--     switch (DibBitCount (hdib))
--     {
--     case  1:  * pPixel &= ~(1     << (7 - (x & 7))) ;
--               * pPixel |= dwPixel << (7 - (x & 7)) ;
--               break ;
--
--     case  4:  * pPixel &= 0x0F    << (x & 1 ? 4 : 0) ;
--               * pPixel |= dwPixel << (x & 1 ? 0 : 4) ;
--               break ;
--
--     case  8:  * pPixel = (BYTE) dwPixel ;
--               break ;
--
--     case 16:  * (WORD *) pPixel = (WORD) dwPixel ;
--               break ;
--
--     case 24:  * (RGBTRIPLE *) pPixel = * (RGBTRIPLE *) &dwPixel ; 
--               break ;
--
--     case 32:  * (DWORD *) pPixel = dwPixel ;
--               break ;
--
--     default:
--          return FALSE ;
--     }
--     return TRUE ;
--}


	make_from_stream (a_stream: ELJ_STREAM_BASE) is
		-- we are dealing with external data at this point so we're doing
		-- a check on nearly every operation - we don't want to crash the
		-- program just because the end user selected an invalid file
		local
			bfh:			WIN32_BITMAPFILEHEADER
			bi_size:		INTEGER
			read_ptr:		POINTER
			read_buf:		STRING
			i:				INTEGER
		do
			last_loaded := False
			
			!!bfh
			bfh.make_external
			!!read_buf.make_filled (' ', 2)
			
			from	i := 0
					read_ptr := bfh.pointer
			until	i = bfh.count
			loop
				a_stream.read_character
				read_buf.put (a_stream.last_character, 1)
				a_stream.read_character
				read_buf.put (a_stream.last_character, 2)
				poke_character (read_ptr, hexadecimal_to_character (read_buf))
				read_ptr := increase_pointer (read_ptr, 1)
				i := i + 1
			end --loop
			
			if bfh.bfType = 19778 then
				bi_size := bfh.bfOffBits - bfh.count
				mem := mem.calloc (bi_size)
						
				from	i := 0
						read_ptr := mem.to_external
				until	i = bi_size
				loop
					a_stream.read_character
					read_buf.put (a_stream.last_character, 1)
					a_stream.read_character
					read_buf.put (a_stream.last_character, 2)
					poke_character (read_ptr, hexadecimal_to_character (read_buf))
					read_ptr := increase_pointer (read_ptr, 1)
					i := i + 1
				end --loop

				make_from_info (mem.to_external)
							
				bi_size := bfh.bfSize - bfh.bfOffBits
			
				from	i := 0
						read_ptr := bits
				until	i = bi_size
				loop
					a_stream.read_character
					read_buf.put (a_stream.last_character, 1)
					a_stream.read_character
					read_buf.put (a_stream.last_character, 2)
					poke_character (read_ptr, hexadecimal_to_character (read_buf))
					read_ptr := increase_pointer (read_ptr, 1)
					i := i + 1
				end --loop
				
				last_loaded := True
			end -- if
		end -- make_from_file

	save_to_stream (a_stream: ELJ_STREAM_BASE) is
		local
			bmfh:		WIN32_BITMAPFILEHEADER
			bmi:		WIN32_BITMAPINFO
			ttl_size:	INTEGER
			save_ptr:	POINTER
			i:			INTEGER
		do
			!!bmfh
			bmfh.make_external

			ttl_size := total_size

			bmfh.set_bfType      (19778)
			bmfh.set_bfSize      (bmfh.count + ttl_size)
			bmfh.set_bfReserved1 (0)
			bmfh.set_bfReserved2 (0)
			bmfh.set_bfOffBits   (bmfh.bfSize - bit_size)

			from	i := 0
					save_ptr := bmfh.pointer
			until	i = bmfh.count
			loop
				a_stream.put_string (dereference_character (save_ptr).to_hexadecimal)
				save_ptr := increase_pointer (save_ptr, 1)
				i := i + 1
			end -- loop
			
			bmi := copy_to_packed_dib

			from	i := 0
					save_ptr := bmi.pointer
			until	i = ttl_size
			loop
				a_stream.put_string (dereference_character (save_ptr).to_hexadecimal)
				save_ptr := increase_pointer (save_ptr, 1)
				i := i + 1
			end -- loop
		end -- save_to_stream

	save_to_file (a_file: STRING) is
		local
			bmfh:		WIN32_BITMAPFILEHEADER
			bmi:		WIN32_BITMAPINFO
			bool_res:	BOOLEAN
			cls_res:	BOOLEAN
			ttl_size:	INTEGER
			file_hndl:	POINTER
		do
			file_hndl := CreateFile (	a_file.to_external,
										GENERIC_WRITE,
										(0).to_bit,
										default_pointer,
										CREATE_ALWAYS,
										FILE_ATTRIBUTE_NORMAL,
										default_pointer)

			if file_hndl /= INVALID_HANDLE_VALUE then
				!!bmfh
				bmfh.make_external

				ttl_size := total_size

				bmfh.set_bfType      (19778)
				bmfh.set_bfSize      (bmfh.count + ttl_size)
				bmfh.set_bfReserved1 (0)
				bmfh.set_bfReserved2 (0)
				bmfh.set_bfOffBits   (bmfh.bfSize - bit_size)

				bool_res := WriteFile (file_hndl, bmfh.pointer, bmfh.count, default_pointer, default_pointer)
				
				if bool_res then
					bmi := copy_to_packed_dib
					bool_res := WriteFile (file_hndl, bmi.pointer, ttl_size, default_pointer, default_pointer)
					
					cls_res := CloseHandle (file_hndl)

					if not bool_res then
						cls_res := DeleteFile (a_file.to_external)
					end -- if
				else
					cls_res := CloseHandle (file_hndl)
					cls_res := DeleteFile (a_file.to_external)
				end -- if
			end -- if
		end -- save_to_file

--BOOL DibFileSave (HDIB hdib, const TCHAR * szFileName)
--{
--     BITMAPFILEHEADER bmfh ;
--     BITMAPINFO     * pbmi ;
--     BOOL             bSuccess ;
--     DWORD            dwTotalSize, dwBytesWritten ;
--     HANDLE           hFile ;
--
--     hFile = CreateFile (szFileName, GENERIC_WRITE, 0, NULL,
--                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL) ;
--
--     if (hFile == INVALID_HANDLE_VALUE)
--          return FALSE ;
--
--     dwTotalSize  = DibTotalSize (hdib) ;
--
--     bmfh.bfType      = * (WORD *) "BM" ;
--     bmfh.bfSize      = sizeof (BITMAPFILEHEADER) + dwTotalSize ;
--     bmfh.bfReserved1 = 0 ;
--     bmfh.bfReserved2 = 0 ;
--     bmfh.bfOffBits   = bmfh.bfSize - DibBitsSize (hdib) ;
--
--    // the BITMAPFILEHEADER schreiben
--     bSuccess = WriteFile (hFile, &bmfh, sizeof (BITMAPFILEHEADER), &dwBytesWritten, NULL) ;
--
--     if (!bSuccess || (dwBytesWritten != sizeof (BITMAPFILEHEADER)))
--     {
--          CloseHandle (hFile) ;
--          DeleteFile (szFileName) ;
--          return FALSE ;
--     }
--     // DIB Section als gepacktes DIB kopieren
--     if (NULL == (pbmi = DibCopyToPackedDib (hdib, FALSE)))
--     {
--          CloseHandle (hFile) ;
--          DeleteFile (szFileName) ;
--          return FALSE ;
--     }
--
--     // gepacktes DIB in einem Rutsch schreiben und danach wieder freigeben
--     bSuccess = WriteFile (hFile, pbmi, dwTotalSize, &dwBytesWritten, NULL) ;
--     CloseHandle (hFile) ;
--     free (pbmi) ;
--
--     if (!bSuccess || (dwBytesWritten != dwTotalSize))
--     {
--          DeleteFile (szFileName) ;
--          return FALSE ;
--     }
--     return TRUE ;
--}
--
feature -- {NONE}
-- internal attributes

	mem:			NATIVE_ARRAY[CHARACTER]
	bytes:			ARRAY[POINTER]
	bm_handle:		POINTER
	section:		WIN32_DIBSECTION
	left_shift:		ARRAY[INTEGER]
	right_shift:	ARRAY[INTEGER]

	color_from_table (a_index: INTEGER; a_rgb_quad: WIN32_RGBQUAD) is
		local
			tmp_dc:	POINTER
			int_rs:	INTEGER
			bol_rs:	BOOLEAN
			ptr_rs: POINTER
		do
			tmp_dc := CreateCompatibleDC (default_pointer)
			ptr_rs := SelectObject (tmp_dc, bm_handle)
			int_rs := GetDIBColorTable (tmp_dc, a_index, 1, a_rgb_quad.pointer)
			check
				int_rs /= 0
			end -- check
			
			bol_rs := DeleteDC (tmp_dc)
		end -- color_from_table

	color_size: INTEGER is
		local
			tmp_rgbquad: expanded WIN32_RGBQUAD
		do
			tmp_rgbquad.make_external
			Result := num_colors * tmp_rgbquad.count
		end -- color_size

	copy_to_packed_dib: WIN32_BITMAPINFO is
		local
			copy_ptr:		POINTER
			num_clrs:		INTEGER
			temp_hdc:		POINTER
			temp_obj:		POINTER
			int_temp:		INTEGER
			bool_tmp:		BOOLEAN
			tmp_head:		expanded WIN32_BITMAPINFOHEADER
			tmp_rgbquad:	expanded WIN32_RGBQUAD
		do
			!!Result
			Result.make_with_size (total_size)
			copy_ptr := Result.to_external

			tmp_head.from_external (section.dsBmih, tmp_head.external_size)
			
			CopyMemory (copy_ptr, tmp_head.to_external, tmp_head.external_size)
			
			copy_ptr := increase_pointer (Result.pointer, tmp_head.external_size)

			if tmp_head.biCompression = BI_BITFIELDS then
				CopyMemory (copy_ptr, section.dsBitFieldPtr, 3 * (Integer_bits // 8))
				copy_ptr := increase_pointer (copy_ptr, 3 * (Integer_bits // 8))
			end -- if
			
			num_clrs := num_colors
			
			if num_clrs > 0 then
				temp_hdc := CreateCompatibleDC (default_pointer)
				temp_obj := SelectObject (temp_hdc, bitmap)

				tmp_rgbquad.from_external (copy_ptr, tmp_rgbquad.external_size)

				int_temp := GetDIBColorTable (temp_hdc, 0, num_clrs, tmp_rgbquad.to_external)
				bool_tmp := DeleteDC (temp_hdc)
			end -- if
			
			copy_ptr := increase_pointer (copy_ptr, num_clrs * tmp_rgbquad.count)
			CopyMemory (copy_ptr, bits, bit_size)
		end -- copy_to_packed_dib

	info_header_size: INTEGER is
		local
			bh: expanded WIN32_BITMAPINFOHEADER
		do
			bh.from_external (section.dsBmih, bh.external_size)
			Result := bh.biSize
		end -- info_header_size
	
	info_size: INTEGER is
		do
			Result := info_header_size + mask_size + color_size
		end -- info_size

	mask_size: INTEGER is
		local
			bh: expanded WIN32_BITMAPINFOHEADER
		do
			bh.from_external (section.dsBmih, bh.external_size)
			
			if bh.biCompression = BI_BITFIELDS then
				Result := 3 * (Integer_bits // 8)
			end -- if
		end -- mask_size
	
	mask_to_right_shift (a_mask: INTEGER): INTEGER is
		local
			local_mask: INTEGER
		do
			if a_mask /= 0 then
				from	local_mask := a_mask
				until	not (local_mask.to_bit and (1).to_bit).to_boolean
				loop
					Result := Result + 1
					local_mask := (local_mask.to_bit @>> 1).to_integer
				end -- loop
			end -- if
		end -- mask_to_right_shift

	mask_to_left_shift (a_mask: INTEGER): INTEGER is
		local
			local_mask: INTEGER
		do
			if a_mask /= 0 then
				from	local_mask := a_mask
				until	not (local_mask.to_bit and (1).to_bit).to_boolean
				loop
					local_mask := (local_mask.to_bit @>> 1).to_integer
				end -- loop
				
				from
				until	(local_mask.to_bit and (1).to_bit).to_boolean
				loop
					Result := Result + 1
					local_mask := (local_mask.to_bit @>> 1).to_integer
				end -- loop
				
				Result := 8 - Result
			end -- if
		end -- mask_to_left_shift

	total_size: INTEGER is
		do
			Result := info_size + bit_size
		end -- total_size

end -- class WIN32_DIB
