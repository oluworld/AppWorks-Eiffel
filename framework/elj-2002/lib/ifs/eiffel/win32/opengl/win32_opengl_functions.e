class WIN32_OPENGL_FUNCTIONS


feature {NONE}

	-- ChoosePixelFormat

	ChoosePixelFormat (a_hdc : POINTER;
				a_ppfd_deref : POINTER) : INTEGER  is
--	ChoosePixelFormat (a_hdc : INTEGER;
--				a_ppfd_deref : WIN32_PIXELFORMATDESCRIPTOR) : INTEGER  is
			-- The ChoosePixelFormat function attempts to match an
			-- appropriate pixel format supported by a device context
			-- to a given pixel format specification.
		external "C_InlineWithoutCurrent"
		alias "ChoosePixelFormat"
		end -- ChoosePixelFormat

	-- DescribePixelFormat

	DescribePixelFormat (a_hdc : POINTER;
				a_iPixelFormat : INTEGER;
				a_nBytes : INTEGER;
				a_ppfd_deref : POINTER) : INTEGER  is
--	DescribePixelFormat (a_hdc : INTEGER;
--				a_iPixelFormat : INTEGER;
--				a_nBytes : INTEGER;
--				a_ppfd_deref : WIN32_PIXELFORMATDESCRIPTOR) : INTEGER  is
			-- The DescribePixelFormat function obtains information
			-- about the pixel format identified by iPixelFormat of
			-- the device associated with hdc. The function sets the
			-- members of the PIXELFORMATDESCRIPTOR structure pointed
			-- to by ppfd with that pixel format data.
		external "C_InlineWithoutCurrent"
		alias "DescribePixelFormat"
		end -- DescribePixelFormat

	-- GetEnhMetaFilePixelFormat

	GetEnhMetaFilePixelFormat (a_hemf : POINTER;
				a_cbBuffer : INTEGER;
				a_ppfd_deref : POINTER) : INTEGER  is
--	GetEnhMetaFilePixelFormat (a_hemf : INTEGER;
--				a_cbBuffer : INTEGER;
--				a_ppfd_deref : WIN32_PIXELFORMATDESCRIPTOR) : INTEGER  is
			-- The GetEnhMetaFilePixelFormat function retrieves pixel
			-- format information for an enhanced metafile.
		external "C_InlineWithoutCurrent"
		alias "GetEnhMetaFilePixelFormat"
		end -- GetEnhMetaFilePixelFormat

	-- GetPixelFormat

	GetPixelFormat (a_hdc : POINTER) : INTEGER  is
			-- The GetPixelFormat function obtains the index of the
			-- currently selected pixel format of the specified device
			-- context.
		external "C_InlineWithoutCurrent"
		alias "GetPixelFormat"
		end -- GetPixelFormat

	-- SetPixelFormat

	SetPixelFormat (a_hdc : POINTER;
				a_iPixelFormat : INTEGER;
				a_ppfd_deref : POINTER) : BOOLEAN  is
			-- The SetPixelFormat function sets the pixel format
			-- of the specified device context to the format specified
			-- by the iPixelFormat index.
		external "C_InlineWithoutCurrent"
		alias "SetPixelFormat"
		end -- SetPixelFormat

	-- SwapBuffers

	SwapBuffers (a_hdc : POINTER) : BOOLEAN  is
			-- The SwapBuffers function exchanges the front and back
			-- buffers if the current pixel format for the window
			-- referenced by the specified device context includes
			-- a back buffer. 
		external "C_InlineWithoutCurrent"
		alias "SwapBuffers"
		end -- SwapBuffers

end -- class WIN32_OPENGL_FUNCTIONS