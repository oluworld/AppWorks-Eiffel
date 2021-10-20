indexing
	contents: "WIN32 string manipulation"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_STRING_MANIPULATION

feature {NONE}

	CharLower (a_string: POINTER): POINTER is
		external "C use <windows.h>"
		end -- CharLower
		
	CharLowerBuff (a_string:	POINTER;
					a_str_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CharLowerBuff
		
	CharNext (a_chr_ptr: POINTER): POINTER is
		external "C use <windows.h>"
		end -- CharNext
		
	CharNextExA (a_code_page:	INTEGER;
					a_chr_ptr:		POINTER;
					a_reserved:		INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CharNextExA

	CharPrev (a_str_ptr, a_chr_ptr: POINTER): POINTER is
		external "C use <windows.h>"
		end -- CharPrev
		
	CharPrevExA (a_code_page:	INTEGER;
					a_str_ptr:		POINTER
					a_chr_ptr:		POINTER;
					a_reserved:		INTEGER): POINTER is
		external "C use <windows.h>"
		end -- CharPrevExA
	
	CharToOem ( a_source:	POINTER;
				a_dest:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- CharToOem
		
	CharToOemBuff (a_source:	POINTER;
					a_dest:		POINTER;
					a_src_len:	INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- CharToOemBuff
		
	CharUpper (a_string: POINTER): POINTER is
		external "C use <windows.h>"
		end -- CharUpper
		
	CharUpperBuff ( a_string:	POINTER;
					a_str_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CharUpperBuff
	
	CompareString (a_locale:		INTEGER;
					a_flag_set:		BIT 32;
					a_str_1:		POINTER;
					a_str_len_1:	INTEGER;
					a_str_2:		POINTER;
					a_str_len_2:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- CompareString
		
	ConvertDefaultLocale (a_locale: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- ConvertDefaultLocale
	
	EnumCalendarInfo (a_enum_proc:	POINTER;
						a_locale:		INTEGER;
						a_calendar:		INTEGER;
						a_cal_type:		INTEGER): BOOLEAN is
		do
--			Result := c_EnumCalendarInfo (	a_enum_proc,
--											a_locale,
--											a_calendar,
--											a_cal_type,
--											Current.to_pointer)
		end -- EnumCalendarInfo
	
	EnumDateFormats (a_enum_proc:	POINTER;
						a_locale:		INTEGER;
						a_flag:			INTEGER): BOOLEAN is
		do
--			Result := c_EnumDateFormats (	a_enum_proc,
--											a_locale,
--											a_flag,
--											Current.to_pointer)
		end -- EnumDateFormats
	
	EnumSystemCodePages (	a_enum_proc:	POINTER;
							a_flag:			INTEGER): BOOLEAN is
		do
--			Result := c_EnumSystemCodePages (	a_enum_proc,
--												a_flag,
--												Current.to_pointer)
		end -- EnumSystemCodePages
	
	EnumSystemLocales (a_enum_proc:	POINTER;
						a_flag:			INTEGER): BOOLEAN is
		do
--			Result := c_EnumSystemLocales (	a_enum_proc,
--											a_flag,
--											Current.to_pointer)
		end -- EnumSystemLocales
		
	EnumTimeFormats (a_enum_proc:	POINTER;
						a_locale:		INTEGER;
						a_flag:			INTEGER): BOOLEAN is
		do
--			Result := c_EnumTimeFormats (	a_enum_proc,
--											a_locale,
--											a_flag,
--											Current.to_pointer)
		end -- EnumTimeFormats
		
	FoldString (a_flag_set:	BIT 32;
				a_source:	POINTER;
				a_src_len:	INTEGER;
				a_dest:		POINTER;
				a_dst_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- FoldString
	
	FormatMessage (a_flag_set: 	BIT 32;
					a_msg_source:	POINTER;
					a_msg_id:		INTEGER;
					a_lang_id:		INTEGER;
					a_result:		POINTER;
					a_res_len:		INTEGER;
					a_arg_list:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- FormatMessage
			
	GetACP: INTEGER is
		external "C use <windows.h>"
		end -- GetACP
	
	GetCPInfo (a_code_page:	INTEGER;
				a_cp_info:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- GetCPInfo
		
	GetCurrencyFormat (a_locale:	INTEGER;
						a_flag_set:	BIT 32;
						a_value:	POINTER;
						a_format:	POINTER;
						a_result:	POINTER;
						a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetCurrencyFormat
	
	GetDateFormat (a_locale:	INTEGER;
					a_flag_set:	BIT 32;
					a_time:		POINTER;
					a_format:	POINTER;
					a_result:	POINTER;
					a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetDateFormat
	
	GetLocaleInfo (a_locale:	INTEGER;
					a_lc_type:	INTEGER;
					a_result:	POINTER;
					a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetLocaleInfo

	GetNumberFormat (a_locale:	INTEGER;
						a_flag_set:	BIT 32;
						a_input:	POINTER;
						a_format:	POINTER;
						a_result:	POINTER;
						a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetNumberFormat
	
	GetOEMCP: INTEGER is
		external "C use <windows.h>"
		end -- GetOEMCP
	
	GetStringTypeA (a_locale:		INTEGER;
					a_type_info:	INTEGER;
					a_source:		POINTER;
					a_src_len:		INTEGER;
					a_chr_type:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- GetStringTypeA
										
	GetStringTypeEx (a_locale:		INTEGER;
						a_type_info:	INTEGER;
						a_source:		POINTER;
						a_src_len:		INTEGER;
						a_chr_type:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- GetStringTypeEx
										
	GetStringTypeW (a_type_info:	INTEGER;
					a_source:		POINTER;
					a_src_len:		INTEGER;
					a_chr_type:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- GetStringTypeW
		
	GetSystemDefaultLangID: INTEGER is
		external "C use <windows.h>"
		end -- GetSystemDefaultLangID

	GetSystemDefaultLCID: INTEGER is
		external "C use <windows.h>"
		end -- GetSystemDefaultLCID
	
	GetThreadLocale: INTEGER is
		external "C use <windows.h>"
		end -- GetThreadLocale
	
	GetTimeFormat (a_locale:	INTEGER;
					a_flag_set:	BIT 32;
					a_time:		POINTER;
					a_format:	POINTER;
					a_result:	POINTER;
					a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GetTimeFormat

	GetUserDefaultLangID: INTEGER is
		external "C use <windows.h>"
		end -- GetUserDefaultLangID
	
	GetUserDefaultLCID: INTEGER is
		external "C use <windows.h>"
		end -- GetUserDefaultLCID
	
	IsCharAlpha (a_char: CHARACTER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsCharAlpha
		
	IsCharAlphaNumeric (a_char: CHARACTER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsCharAlphaNumeric
	
	IsCharLower (a_char: CHARACTER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsCharLower
			
	IsCharUpper (a_char: CHARACTER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsCharUpper
		
	IsDBCSLeadByte (a_char: CHARACTER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsDBCSLeadByte
	
	IsTextUnicode (a_text:		POINTER;
					a_text_len:	INTEGER;
					a_flag_set:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- IsTextUnicode

	IsValidCodePage (a_code_page: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsValidCodePage
		
	IsValidLocale (a_locale:	INTEGER;
					a_flag:		INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- IsValidLocale
		
	LCMapString (a_locale:	INTEGER;
					a_flag_set:	BIT 32;
					a_source:	POINTER;
					a_src_len:	INTEGER;
					a_result:	POINTER;
					a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- LCMapString
		
	LoadString (a_instance:	POINTER;
				a_res_id:	INTEGER;
				a_result:	POINTER;
				a_res_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- LoadString
		
	lstrcat (first_pointer, sec_pointer: POINTER): POINTER is
		external "C use <windows.h>"
		end -- lstrcat

	lstrcmp (first_pointer, sec_pointer: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- lstrcmp

	lstrcmpi (first_pointer, sec_pointer: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- lstrcmpi

	lstrcpy (first_pointer, sec_pointer: POINTER): POINTER is
		external "C use <windows.h>"
		end -- lstrcpy

	lstrcpyn (first_pointer:	POINTER;
				sec_pointer:	POINTER;
				max_len:		INTEGER): POINTER is
		external "C use <windows.h>"
		end -- lstrcpyn

	lstrlen (a_pointer: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- lstrlen

	MultiByteToWideChar (a_code_page:	INTEGER;
							a_flag_set:		BIT 32;
							a_source:		POINTER;
							a_src_len:		INTEGER;
							a_result:		POINTER;
							a_res_len:		INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- MultiByteToWideChar

	OemToChar (a_source, a_result: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- OemToChar

	OemToCharBuff (a_source:	POINTER;
					a_result:	POINTER;
					a_res_len:	INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- OemToCharBuff

	SetLocaleInfo (a_locale:	INTEGER;
					a_type:		INTEGER;
					a_data:		POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- SetLocaleInfo
		
	SetThreadLocale (a_locale: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- SetThreadLocale

	WideCharToMultiByte (a_code_page:	INTEGER;
							a_flag_set:		BIT 32;
							a_source:		POINTER;
							a_src_len:		INTEGER;
							a_result:		POINTER;
							a_res_len:		INTEGER;
							a_default:		POINTER;
							a_usage:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- WideCharToMultiByte

	wsprintf (a_result:	POINTER;
				a_format:	POINTER;
				a_args:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- wsprintf
                                  
	wvsprintf (a_result:	POINTER;
				a_format:	POINTER;
				a_args:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- wvsprintf
                                  
end -- class WIN32_STRING_MANIPULATION            
