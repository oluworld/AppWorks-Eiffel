class WIN32_COLOR_MACROS

feature {NONE}

	RGB (a_bRed, a_bGreen, a_bBlue : INTEGER) : INTEGER is
			-- The RGB macro selects a red, green, blue (RGB) color based on 
			-- the arguments supplied and the color capabilities of the output 
			-- device.
		require
			byte_values:	0 <= a_bRed and a_bRed <= 255 and 
							0 <= a_bGreen and a_bGreen <= 255 and
							0 <= a_bBlue and a_bBlue <= 255
		do
			Result := (a_bRed.to_bit or (a_bGreen.to_bit @<< 8) or (a_bBlue.to_bit @<< 16)).to_integer
		end -- RGB

	PALETTERGB (a_bRed, a_bGreen, a_bBlue : INTEGER) : INTEGER is
			-- The PALETTERGB macro accepts three values that represent the 
			-- relative intensities of red, green, and blue and returns a 
			-- palette-relative red, green, blue (RGB) specifier consisting of 2 
			-- in the high-order byte and an RGB value in the three low-order 
			-- bytes. An application using a color palette can pass this 
			-- specifier, instead of an explicit RGB value, to functions that 
			-- expect a color. 
		require
			byte_values:	0 <= a_bRed and a_bRed <= 255 and 
							0 <= a_bGreen and a_bGreen <= 255 and
							0 <= a_bBlue and a_bBlue <= 255
		do
			Result := (00000010000000000000000000000000B or (a_bRed.to_bit or (a_bGreen.to_bit @<< 8) or (a_bBlue.to_bit @<< 16))).to_integer
		end -- PALETTERGB

	PALETTEINDEX (a_wPaletteIndex : INTEGER) : INTEGER is
			-- The PALETTEINDEX macro accepts an index to a logical-color 
			-- palette entry and returns a palette-entry specifier consisting of 
			-- a 32-bit COLORREF value that specifies the color associated with 
			-- the given index. An application using a logical color palette can 
			-- pass this specifier, instead of an explicit red, green, blue 
			-- (RGB) value, to GDI functions that expect a color. This allows 
			-- the function to use the color in the specified palette entry. 
		do
			Result := (00000001000000000000000000000000B or a_wPaletteIndex.to_bit).to_integer
		end -- PALETTEINDEX

end -- class WIN32_COLOR_MACROS