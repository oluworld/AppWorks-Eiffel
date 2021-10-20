class WIN32_VERSION_INFO

feature {NONE}

	GetFileVersionInfo (a_file_name : POINTER;
							  a_handle    : INTEGER;
							  a_len       : INTEGER;
							  a_version   : POINTER) : BOOLEAN is
		external "C use <windows.h>"
		end -- GetFileVersionInfo


	GetFileVersionInfoSize (a_file_name : POINTER) : INTEGER is
		external "C use <windows.h>"
		end -- GetFileVersionInfoSize

	VerQueryValue (a_block_ptr : POINTER;
						a_sub_block : POINTER) : BOOLEAN is
		external "C use <windows.h>"
		end -- VerQueryValue

	VerLanguageName (a_lang_id      : INTEGER;
						  a_lang_buf_ptr : POINTER) : INTEGER is
		external "C use <windows.h>"
		end -- VerLanguageName

end -- class WIN32_VERSION_INFO