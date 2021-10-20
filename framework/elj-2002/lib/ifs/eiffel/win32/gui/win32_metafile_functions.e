indexing
	contents: "WIN32 metafile functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: no
	tested: no

class WIN32_METAFILE_FUNCTIONS

--	------------------------------------------------------------------------
--	Following are the functions used with enhanced format metafiles. 
--
--	CloseEnhMetaFile
--	CopyEnhMetaFile
--	CreateEnhMetaFile
--	DeleteEnhMetaFile
--	EnhMetaFileProc
--	EnumEnhMetaFile
--	GdiComment
--	GetEnhMetaFile
--	GetEnhMetaFileBits
--	GetEnhMetaFileDescription
--	GetEnhMetaFileHeader
--	GetEnhMetaFilePaletteEntries
--	GetWinMetaFileBits
--	PlayEnhMetaFile
--	PlayEnhMetaFileRecord
--	SetEnhMetaFileBits
--	SetWinMetaFileBits
--	------------------------------------------------------------------------

feature {NONE}

	CloseEnhMetaFile (a_hdc: POINTER): POINTER is
--	The CloseEnhMetaFile function closes an enhanced-metafile device 
--	context and returns a handle that identifies an enhanced-format 
--	metafile. 
		external "C use <windows.h>"
		end -- CloseEnhMetaFile

	CopyEnhMetaFile (	a_src	: POINTER;
						a_file	: POINTER): POINTER is
--	CopyEnhMetaFile (	a_src	: POINTER;
--						a_file	: STRING): POINTER is
--	The CopyEnhMetaFile function copies the contents of an enhanced-format 
--	metafile to a specified file.
		external "C use <windows.h>"
		end -- CopyEnhMetaFile

	CreateEnhMetaFile (	a_hdcref		: POINTER;
						a_filename		: POINTER;
						a_rect			: POINTER;
						a_description	: POINTER): POINTER is
--	CreateEnhMetaFile (	a_hdcref		: POINTER;
--						a_filename		: STRING;
--						a_rect			: WIN32_RECT;
--						a_description	: STRING): POINTER is
--	The CreateEnhMetaFile function creates a device context for an enhanced-
--	format metafile. This device context can be used to store a device-
--	independent picture. 
		external "C use <windows.h>"
		end -- CreateEnhMetaFile

	DeleteEnhMetaFile (a_emf: POINTER): BOOLEAN is
--	The DeleteEnhMetaFile function deletes an enhanced-format metafile or an 
--	enhanced-format metafile handle. 
		external "C use <windows.h>"
		end -- DeleteEnhMetaFile

	EnumEnhMetaFile (	a_hdc		: POINTER;
						a_emf		: POINTER;
						a_meta_func	: POINTER;
						a_data		: INTEGER;
						a_rect		: WIN32_RECT): BOOLEAN is
--	The EnumEnhMetaFile function enumerates the records within an enhanced-
--	format metafile by retrieving each record and passing it to the specified 
--	callback function. The application-supplied callback function processes 
--	each record as required. The enumeration continues until the last record 
--	is processed or when the callback function returns zero. 
		do
			Result := c_EnumEnhMetaFile (a_hdc, a_emf, a_meta_func, a_data, a_rect.pointer, Current.to_pointer)
		end -- EnumEnhMetaFile

	GdiComment (a_hdc	: POINTER;
				a_size	: INTEGER;
				a_data	: POINTER): BOOLEAN is
--	GdiComment (a_hdc	: POINTER;
--				a_size	: INTEGER;
--				a_data	: STRING): BOOLEAN is
--	The GdiComment function copies a comment from a buffer into a specified 
--	enhanced-format metafile. 
		external "C use <windows.h>"
		end -- GdiComment

	GetEnhMetaFile (a_meta_file: POINTER): POINTER is
--	GetEnhMetaFile (a_meta_file: STRING): POINTER is
--	The GetEnhMetaFile function creates a handle that identifies the 
--	enhanced-format metafile stored in the specified file. 
		external "C use <windows.h>"
		end -- GetEnhMetaFile

	GetEnhMetaFileBits (a_hemf			: POINTER;
						a_buffer_size	: INTEGER;
						a_buffer		: POINTER): INTEGER is
--	The GetEnhMetaFileBits function retrieves the contents of the specified 
--	enhanced-format metafile and copies them into a buffer. 
		external "C use <windows.h>"
		end -- GetEnhMetaFileBits

	GetEnhMetaFileDescription (	a_hemf			: POINTER;
								a_buffer		: INTEGER;
								a_description	: POINTER): INTEGER is
--	GetEnhMetaFileDescription (	a_hemf			: POINTER;
--								a_buffer		: INTEGER;
--								a_description	: STRING): INTEGER is
--	The GetEnhMetaFileDescription function retrieves an optional text 
--	description from an enhanced-format metafile and copies the string to the 
--	specified buffer. 
		external "C use <windows.h>"
		end -- GetEnhMetaFileDescription

	GetEnhMetaFileHeader (	a_hemf	: POINTER;
							a_buffer: INTEGER;
							a_emh	: POINTER): INTEGER is
--	GetEnhMetaFileHeader (	a_hemf	: POINTER;
--							a_buffer: INTEGER;
--							a_emh	: WIN32_ENHMETAHEADER): INTEGER is
--	The GetEnhMetaFileHeader function retrieves the record containing the 
--	header for the specified enhanced-format metafile. 
		external "C use <windows.h>"
		end -- GetEnhMetaFileHeader

	GetEnhMetaFilePaletteEntries (	a_hemf		: POINTER;
									a_entries	: INTEGER;
									a_ppe		: POINTER): INTEGER is
--	GetEnhMetaFilePaletteEntries (	a_hemf		: POINTER;
--									a_entries	:  INTEGER;
--									a_ppe		: WIN32_PALETTEENTRY): INTEGER is
--	The GetEnhMetaFilePaletteEntries function retrieves optional palette 
--	entries from the specified enhanced metafile. 
		external "C use <windows.h>"
		end -- GetEnhMetaFilePaletteEntries

	GetWinMetaFileBits (a_hemf			: POINTER;
						a_buffer_size	: INTEGER;
						a_buffer		: POINTER;
						a_map_mode		: INTEGER;
						a_hdcref		: POINTER): INTEGER is
--	The GetWinMetaFileBits function converts the enhanced-format records from 
--	a metafile into Windows-format records and stores the converted records 
--	in the specified buffer. 
		external "C use <windows.h>"
		end -- GetWinMetaFileBits

	PlayEnhMetaFile (	a_hdc	: POINTER;
						a_hemf	: POINTER;
						a_rect	: POINTER): BOOLEAN is
--	PlayEnhMetaFile (	a_hdc	: POINTER;
--						a_hemf	: POINTER;
--						a_rect	: WIN32_RECT): BOOLEAN is
--	The PlayEnhMetaFile function displays the picture stored in the specified 
--	enhanced-format metafile. 
		external "C use <windows.h>"
		end -- PlayEnhMetaFile

	PlayEnhMetaFileRecord (	a_hdc			: POINTER;
							a_handletable	: POINTER;
							a_enhmetarecord	: POINTER;
							a_handles		: INTEGER): BOOLEAN is
--	PlayEnhMetaFileRecord (	a_hdc			: POINTER;
--							a_handletable	: WIN32_HANDLETABLE;
--							a_enhmetarecord	: WIN32_ENHMETARECORD;
--							a_handles		: INTEGER): BOOLEAN is
--	The PlayEnhMetaFileRecord function plays an enhanced-metafile record by 
--	executing the graphics device interface (GDI) functions identified by the 
--	record. 
		external "C use <windows.h>"
		end -- PlayEnhMetaFileRecord

	SetEnhMetaFileBits (a_buffer: INTEGER;
						a_data	: POINTER): POINTER is
--	The SetEnhMetaFileBits function creates a memory-based enhanced-format 
--	metafile from the supplied data. 
		external "C use <windows.h>"
		end -- SetEnhMetaFileBits

	SetWinMetaFileBits (a_buffer_size	: INTEGER;
						a_buffer		: POINTER;
						a_hdcref		: POINTER;
						a_mfp			: POINTER): POINTER is
--	SetWinMetaFileBits (a_buffer_size	: INTEGER;
--						a_buffer		: POINTER;
--						a_hdcref		: POINTER;
--						a_mfp			: WIN32_METAFILEPICT): POINTER is
--	The SetWinMetaFileBits function converts a metafile from the older 
--	Windows format to the new enhanced format and stores the new metafile in 
--	memory. 
		external "C use <windows.h>"
		end -- SetWinMetaFileBits

feature {NONE}

	c_EnumEnhMetaFile (a_hdc		: POINTER;
						a_emf		: POINTER;
						a_meta_func	: POINTER;
						a_data		: INTEGER;
						a_rect		: POINTER;
						a_object	: POINTER): BOOLEAN is
		external "C"
		end -- c_EnumEnhMetaFile

end -- class WIN32_METAFILE_FUNCTIONS
