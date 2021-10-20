indexing
	contents: "WIN32 text and fonts functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: no
	
class WIN32_TEXT_AND_FONT_FUNCTIONS

inherit
	WIN32_TEXT_AND_FONT_CONSTANTS

feature {NONE}

	AddFontResource (a_resource: POINTER): INTEGER is
--	AddFontResource (a_resource: STRING): INTEGER is
		external "C use <windows.h>"
		end -- AddFontResource
	
	CreateFont (a_height:			INTEGER;
				a_width:			INTEGER;
				a_escapement:		INTEGER;
				a_orientation:		INTEGER;
				a_weight:			INTEGER;
				a_italic:			INTEGER;
				a_underline:		INTEGER;
				a_strike_out:		INTEGER;
				a_char_set:			INTEGER;
				a_output_precision:	INTEGER;
				a_clip_precision:	INTEGER;
				a_quality:			INTEGER;
				a_pitch_and_family:	INTEGER;
				a_face:				POINTER): POINTER is
		external "C use <windows.h>"
		end -- CreateFont
		
	CreateFontIndirect (a_logfont: POINTER): POINTER is
--	CreateFontIndirect (a_logfont: WIN32_LOGFONT): POINTER is
		external "C use <windows.h>"
		end -- CreateFontIndirect
		
	CreateScalableFontResource (a_hidden:		INTEGER;
								a_font_res:		POINTER;
								a_font_file:	POINTER;
								a_current_path:	POINTER): BOOLEAN is
--	CreateScalableFontResource (a_hidden:		INTEGER;
--								a_font_res:		STRING;
--								a_font_file:	STRING;
--								a_current_path:	STRING): BOOLEAN is
		external "C use <windows.h>"
		end -- CreateScalableFontResource
		
	DrawText (	a_dc:		POINTER;
				a_text:		POINTER;
				a_text_len:	INTEGER;
				a_rect:		POINTER;
				a_flags:	BIT 32): INTEGER is
--	DrawText (	a_dc:		POINTER;
--				a_text:		STRING;
--				a_text_len:	INTEGER;
--				a_rect:		WIN32_RECT;
--				a_flags:	BIT 32): INTEGER is
		external "C use <windows.h>"
		end -- DrawText
										
	DrawTextEx (a_dc:			POINTER;
				a_text:			POINTER;
				a_text_len:		INTEGER;
				a_rect:			POINTER;
				a_flags:		BIT 32;
				a_ext_flags:	POINTER): INTEGER is
--	DrawTextEx (a_dc:			POINTER;
--				a_text:			STRING;
--				a_text_len:		INTEGER;
--				a_rect:			WIN32_RECT;
--				a_flags:		BIT 32;
--				a_ext_flags:	WIN32_DRAWTEXTPARAMS): INTEGER is
		external "C use <windows.h>"
		end -- DrawTextEx
		
	EnumFontFamilies (	a_dc:			POINTER;
						a_family:		POINTER;
						a_enum_func:	POINTER;
						a_param:		INTEGER): INTEGER is
		do
			Result := c_EnumFontFamilies (	a_dc,
											a_family,
											a_enum_func,
											a_param,
											Current.to_pointer)
		end -- EnumFontFamilies
		
	EnumFonts (	a_dc:			POINTER;
				a_face_name:	POINTER;
				a_enum_func:	POINTER;
				a_param:		INTEGER): INTEGER is
		do
			Result := c_EnumFonts (	a_dc,
									a_face_name,
									a_enum_func,
									a_param,
									Current.to_pointer)
		end -- EnumFonts
		
	ExtTextOut (a_dc:			POINTER;
				a_x:			INTEGER;
				a_y:			INTEGER;
				a_options:		BIT 32;
				a_rect:			POINTER;
				a_text:			POINTER;
				a_text_len:		INTEGER;
				a_seperates:	POINTER): BOOLEAN is
--	ExtTextOut (a_dc:			POINTER;
--				a_x:			INTEGER;
--				a_y:			INTEGER;
--				a_options:		BIT 32;
--				a_rect:			WIN32_RECT;
--				a_text:			STRING;
--				a_text_len:		INTEGER;
--				a_seperates:	ARRAY[INTEGER]): BOOLEAN is
		external "C use <windows.h>"
		end -- ExtTextOut
		
	GetAspectRatioFilterEx (a_dc:			POINTER;
							a_aspect_ratio: POINTER): BOOLEAN is
--	GetAspectRatioFilterEx (a_dc:			POINTER;
--							a_aspect_ratio: WIN32_SIZE): BOOLEAN is
		external "C use <windows.h>"
		end -- GetAspectRatioFilterEx
		
	GetCharABCWidths (	a_dc:			POINTER;
						a_first_char:	INTEGER;
						a_last_char:	INTEGER;
						a_abc:			POINTER): BOOLEAN is
--	GetCharABCWidths (	a_dc:			POINTER;
--						a_first_char:	INTEGER;
--						a_last_char:	INTEGER;
--						a_abc:			WIN32_ABC): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCharABCWidths
												
	GetCharABCWidthsFloat (	a_dc:			POINTER;
							a_first_char:	INTEGER;
							a_last_char:	INTEGER;
							a_abc:			POINTER): BOOLEAN is
--	GetCharABCWidthsFloat (	a_dc:			POINTER;
--							a_first_char:	INTEGER;
--							a_last_char:	INTEGER;
--							a_abc:			WIN32_ABCFLOAT): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCharABCWidthsFloat
		
	GetCharacterPlacement (	a_dc:			POINTER;
							a_text:			POINTER;
							a_text_len:		INTEGER;
							a_max_extent:	INTEGER;
							a_results:		POINTER;
							a_flags:		BIT 32): INTEGER is
--	GetCharacterPlacement (	a_dc:			POINTER;
--							a_text:			STRING;
--							a_text_len:		INTEGER;
--							a_max_extent:	INTEGER;
--							a_results:		WIN32_GCP_RESULTS;
--							a_flags:		BIT 32): INTEGER is
		external "C use <windows.h>"
		end -- GetCharacterPlacement
		
	GetCharWidth (	a_dc:			POINTER;
					a_first_char:	INTEGER;
					a_last_char:	INTEGER;
					a_result:		POINTER): BOOLEAN is
--	GetCharWidth (	a_dc:			POINTER;
--					a_first_char:	INTEGER;
--					a_last_char:	INTEGER;
--					a_result:		ARRAY[INTEGER]): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCharWidth
												
	GetCharWidth32 (a_dc:			POINTER;
					a_first_char:	INTEGER;
					a_last_char:	INTEGER;
					a_result:		POINTER): BOOLEAN is
--	GetCharWidth32 (a_dc:			POINTER;
--					a_first_char:	INTEGER;
--					a_last_char:	INTEGER;
--					a_result:		ARRAY[INTEGER]): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCharWidth32
												
	GetCharWidthFloat (	a_dc:			POINTER;
						a_first_char:	INTEGER;
						a_last_char:	INTEGER;
						a_result:		POINTER): BOOLEAN is
--	GetCharWidthFloat (	a_dc:			POINTER;
--						a_first_char:	INTEGER;
--						a_last_char:	INTEGER;
--						a_result:		ARRAY[REAL]): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCharWidthFloat
		
	GetFontData(a_dc:		POINTER;
				a_table:	INTEGER;
				a_offset:	INTEGER;
				a_buffer:	POINTER;
				a_data_len:	INTEGER): INTEGER is
--	GetFontData(a_dc:		POINTER;
--				a_table:	INTEGER;
--				a_offset:	INTEGER;
--				a_buffer:	ARRAY[CHARACTER];
--				a_data_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetFontData
		
	GetGlyphOutline (	a_dc:			POINTER;
						a_character:	INTEGER;
						a_format:		INTEGER;
						a_metrics:		POINTER;
						a_buffer_len:	INTEGER;
						a_buffer:		POINTER;
						a_matrix:		POINTER): INTEGER is
--	GetGlyphOutline (	a_dc:			POINTER;
--						a_character:	INTEGER;
--						a_format:		INTEGER;
--						a_metrics:		WIN32_GLYPHMETRICS;
--						a_buffer_len:	INTEGER;
--						a_buffer:		ARRAY[CHARACTER];
--						a_matrix:		WIN32_MAT2): INTEGER is
		external "C use <windows.h>"
		end -- GetGlyphOutline
		
	GetKerningPairs (	a_dc:			POINTER;
						a_num_pairs:	INTEGER;
						a_krn_pairs:	POINTER): INTEGER is
--	GetKerningPairs (	a_dc:			POINTER;
--						a_num_pairs:	INTEGER;
--						a_krn_pairs:	WIN32_KERNINGPAIR): INTEGER is
		external "C use <windows.h>"
		end -- GetKerningPairs
		
	GetOutlineTextMetrics (	a_dc:			POINTER;
							a_data_size:	INTEGER;
							a_metrics:		POINTER): INTEGER is
--	GetOutlineTextMetrics (	a_dc:			POINTER;
--							a_data_size:	INTEGER;
--							a_metrics:		WIN32_OUTLINETEXTMETRIC): INTEGER is
		external "C use <windows.h>"
		end -- GetOutlineTextMetrics
		
	GetRasterizerCaps (	a_rasterizer:	POINTER;
						a_data_size:	INTEGER): BOOLEAN  is
--	GetRasterizerCaps (	a_rasterizer:	WIN32_RASTERIZER_STATUS;
--						a_data_size:	INTEGER): BOOLEAN  is
		external "C use <windows.h>"
		end -- GetRasterizerCaps
		
	GetTabbedTextExtent (	a_dc:			POINTER;
							a_text:			POINTER;
							a_text_len:		INTEGER;
							a_tab_num:		INTEGER;
							a_pos_array:	POINTER): BOOLEAN is
--	GetTabbedTextExtent (	a_dc:			POINTER;
--							a_text:			STRING;
--							a_text_len:		INTEGER;
--							a_tab_num:		INTEGER;
--							a_pos_array:	ARRAY[INTEGER]): BOOLEAN is
		external "C use <windows.h>"
		end -- GetTabbedTextExtent
		
	GetTextAlign (a_dc:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GetTextAlign
	
	GetTextCharacterExtra (a_dc:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GetTextCharacterExtra
	
	GetTextColor (a_dc:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GetTextColor
	
	GetTextExtentExPoint (	a_dc:			POINTER;
							a_text:			POINTER;
							a_text_len:		INTEGER;
							a_max_width:	INTEGER;
							a_max_fit:		POINTER;
							a_part_extents:	POINTER;
							a_size:			POINTER): BOOLEAN is
--	GetTextExtentExPoint (	a_dc:			POINTER;
--							a_text:			STRING;
--							a_text_len:		INTEGER;
--							a_max_width:	INTEGER;
--							a_max_fit:		INTEGER_REF;
--							a_part_extents:	ARRAY[INTEGER];
--							a_size:			WIN32_SIZE): BOOLEAN is
		external "C use <windows.h>"
		end -- GetTextExtentExPoint
		
	GetTextExtentPoint (a_dc:			POINTER;
						a_text:			POINTER;
						a_text_len:		INTEGER;
						a_size:			POINTER): BOOLEAN is
--	GetTextExtentPoint (a_dc:			POINTER;
--						a_text:			STRING;
--						a_text_len:		INTEGER;
--						a_size:			WIN32_SIZE): BOOLEAN is
		external "C use <windows.h>"
		end -- GetTextExtentPoint
		
	GetTextExtentPoint32 (	a_dc:			POINTER;
							a_text:			POINTER;
							a_text_len:		INTEGER;
							a_size:			POINTER): BOOLEAN is
--	GetTextExtentPoint32 (	a_dc:			POINTER;
--							a_text:			STRING;
--							a_text_len:		INTEGER;
--							a_size:			WIN32_SIZE): BOOLEAN is
		external "C use <windows.h>"
		end -- GetTextExtentPoint32
		
	GetTextFace (	a_dc:		POINTER;
					a_text_len:	INTEGER;
					a_text:		POINTER): INTEGER is
--	GetTextFace (	a_dc:		POINTER;
--					a_text_len:	INTEGER;
--					a_text:		STRING): INTEGER is
		external "C use <windows.h>"
		end -- GetTextFace
		
	GetTextMetrics (a_dc:		POINTER;
					a_metric:	POINTER): BOOLEAN is
--	GetTextMetrics (a_dc:		POINTER;
--					a_metric:	WIN32_TEXTMETRIC): BOOLEAN is
		external "C use <windows.h>"
		end -- GetTextMetrics
		
	PolyTextOut (	a_dc:		POINTER;
					a_texts:	POINTER;
					a_text_num:	INTEGER): BOOLEAN is
--	PolyTextOut (	a_dc:		POINTER;
--					a_texts:	C_STRUCT_ARRAY[WIN32_POLYTEXT];
--					a_text_num:	INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- PolyTextOut
		
	RemoveFontResource (a_file_name: POINTER): BOOLEAN is
--	RemoveFontResource (a_file_name: STRING): BOOLEAN is
		external "C use <windows.h>"
		end -- RemoveFontResource
		
	SetMapperFlags (a_dc: POINTER; a_flag: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- SetMapperFlags
		
	SetTextAlign (a_dc: POINTER; a_mode: BIT 32): BIT 32 is
		external "C use <windows.h>"
		end -- SetTextAlign
		
	SetTextCharacterExtra (a_dc: POINTER; a_extra: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- SetTextCharacterExtra

	SetTextColor (a_dc: POINTER; a_color: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- SetTextColor
	
	SetTextJustification (	a_dc:			POINTER;
							a_break_extra:	INTEGER;
							a_break_count:	INTEGER) is
		external "C use <windows.h>"
		end -- SetTextJustification
	
	TabbedTextOut (	a_dc:			POINTER;
					a_x:			INTEGER;
					a_y:			INTEGER;
					a_text:			POINTER;
					a_text_len:		INTEGER;
					a_tab_nums:		INTEGER;
					a_tab_pos:		POINTER;
					a_tab_origin:	INTEGER): BOOLEAN is
--	TabbedTextOut (	a_dc:			POINTER;
--					a_x:			INTEGER;
--					a_y:			INTEGER;
--					a_text:			STRING;
--					a_text_len:		INTEGER;
--					a_tab_nums:		INTEGER;
--					a_tab_pos:		ARRAY[INTEGER];
--					a_tab_origin:	INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- TabbedTextOut
		
	TextOut (	a_dc:			POINTER;
				a_x_start:		INTEGER;
				a_y_start:		INTEGER;
				a_text:			POINTER;
				a_text_len:		INTEGER): BOOLEAN is
--	TextOut (	a_dc:			POINTER;
--				a_x_start:		INTEGER;
--				a_y_start:		INTEGER;
--				a_text:			STRING;
--				a_text_len:		INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- TextOut
	
feature {NONE}

	c_EnumFontFamilies (a_dc:			POINTER;
						a_family:		POINTER;
						a_enum_func:	POINTER;
						a_param:		INTEGER;
						a_object:		POINTER): INTEGER is
		external "C"
		alias "c_EnumFontFamilies"
		end -- c_EnumFontFamilies
				
	c_EnumFonts (	a_dc:			POINTER;
					a_face_name:	POINTER;
					a_enum_func:	POINTER;
					a_param:		INTEGER;
					a_object:		POINTER): INTEGER is
		external "C"
		alias "c_EnumFonts"
		end -- c_EnumFonts
		
end -- class WIN32_TEXT_AND_FONT_FUNCTIONS