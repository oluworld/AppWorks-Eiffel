indexing
	contents: "WIN32 POINT structure"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: no
	
class WIN32_DEVMODE 

inherit 
	C_STRUCTURE
		redefine
			external_size
		end

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			c_inline_c ("_res = sizeof(DEVMODE);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dmDeviceName (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDeviceName = _val;%N")
		ensure
			value_set: dmDeviceName = a_var
		end -- set_dmDeviceName

	set_dmSpecVersion (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmSpecVersion = _val;%N")
		ensure
			value_set: dmSpecVersion = a_var
		end -- set_dmSpecVersion

	set_dmDriverVersion (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDriverVersion = _val;%N")
		ensure
			value_set: dmDriverVersion = a_var
		end -- set_dmDriverVersion

	set_dmSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmSize = _val;%N")
		ensure
			value_set: dmSize = a_var
		end -- set_dmSize

	set_dmDriverExtra (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDriverExtra = _val;%N")
		ensure
			value_set: dmDriverExtra = a_var
		end -- set_dmDriverExtra

	set_dmFields (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmFields = _val;%N")
		ensure
			value_set: dmFields = a_var
		end -- set_dmFields

	set_dmOrientation (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmOrientation = _val;%N")
		ensure
			value_set: dmOrientation = a_var
		end -- set_dmOrientation

	set_dmPaperSize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPaperSize = _val;%N")
		ensure
			value_set: dmPaperSize = a_var
		end -- set_dmPaperSize

	set_dmPaperLength (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPaperLength = _val;%N")
		ensure
			value_set: dmPaperLength = a_var
		end -- set_dmPaperLength

	set_dmPaperWidth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPaperWidth = _val;%N")
		ensure
			value_set: dmPaperWidth = a_var
		end -- set_dmPaperWidth

	set_dmScale (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmScale = _val;%N")
		ensure
			value_set: dmScale = a_var
		end -- set_dmScale

	set_dmCopies (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmCopies = _val;%N")
		ensure
			value_set: dmCopies = a_var
		end -- set_dmCopies

	set_dmDefaultSource (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDefaultSource = _val;%N")
		ensure
			value_set: dmDefaultSource = a_var
		end -- set_dmDefaultSource

	set_dmPrintQuality (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPrintQuality = _val;%N")
		ensure
			value_set: dmPrintQuality = a_var
		end -- set_dmPrintQuality

	set_dmColor (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmColor = _val;%N")
		ensure
			value_set: dmColor = a_var
		end -- set_dmColor

	set_dmDuplex (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDuplex = _val;%N")
		ensure
			value_set: dmDuplex = a_var
		end -- set_dmDuplex

	set_dmYResolution (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmYResolution = _val;%N")
		ensure
			value_set: dmYResolution = a_var
		end -- set_dmYResolution

	set_dmTTOption (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmTTOption = _val;%N")
		ensure
			value_set: dmTTOption = a_var
		end -- set_dmTTOption

	set_dmCollate (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmCollate = _val;%N")
		ensure
			value_set: dmCollate = a_var
		end -- set_dmCollate

	set_dmFormName (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmFormName = _val;%N")
		ensure
			value_set: dmFormName = a_var
		end -- set_dmFormName

	set_dmLogPixels (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmLogPixels = _val;%N")
		ensure
			value_set: dmLogPixels = a_var
		end -- set_dmLogPixels

	set_dmBitsPerPel (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmBitsPerPel = _val;%N")
		ensure
			value_set: dmBitsPerPel = a_var
		end -- set_dmBitsPerPel

	set_dmPelsWidth (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPelsWidth = _val;%N")
		ensure
			value_set: dmPelsWidth = a_var
		end -- set_dmPelsWidth

	set_dmPelsHeight (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmPelsHeight = _val;%N")
		ensure
			value_set: dmPelsHeight = a_var
		end -- set_dmPelsHeight

	set_dmDisplayFlags (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDisplayFlags = _val;%N")
		ensure
			value_set: dmDisplayFlags = a_var
		end -- set_dmDisplayFlags

	set_dmDisplayFrequency (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDisplayFrequency = _val;%N")
		ensure
			value_set: dmDisplayFrequency = a_var
		end -- set_dmDisplayFrequency

	set_dmICMMethod (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmICMMethod = _val;%N")
		ensure
			value_set: dmICMMethod = a_var
		end -- set_dmICMMethod

	set_dmICMIntent (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmICMIntent = _val;%N")
		ensure
			value_set: dmICMIntent = a_var
		end -- set_dmICMIntent

	set_dmMediaType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmMediaType = _val;%N")
		ensure
			value_set: dmMediaType = a_var
		end -- set_dmMediaType

	set_dmDitherType (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmDitherType = _val;%N")
		ensure
			value_set: dmDitherType = a_var
		end -- set_dmDitherType

	set_dmReserved1 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmReserved1 = _val;%N")
		ensure
			value_set: dmReserved1 = a_var
		end -- set_dmReserved1

	set_dmReserved2 (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DEVMODE*)_ptr)->dmReserved2 = _val;%N")
		ensure
			value_set: dmReserved2 = a_var
		end -- set_dmReserved2

feature
		-- Getters

	dmDeviceName : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DEVMODE*)_ptr)->dmDeviceName;%N")
			Result := res
		end -- dmDeviceName

	dmSpecVersion : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmSpecVersion;%N")
			Result := res
		end -- dmSpecVersion

	dmDriverVersion : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDriverVersion;%N")
			Result := res
		end -- dmDriverVersion

	dmSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmSize;%N")
			Result := res
		end -- dmSize

	dmDriverExtra : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDriverExtra;%N")
			Result := res
		end -- dmDriverExtra

	dmFields : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmFields;%N")
			Result := res
		end -- dmFields

	dmOrientation : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmOrientation;%N")
			Result := res
		end -- dmOrientation

	dmPaperSize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPaperSize;%N")
			Result := res
		end -- dmPaperSize

	dmPaperLength : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPaperLength;%N")
			Result := res
		end -- dmPaperLength

	dmPaperWidth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPaperWidth;%N")
			Result := res
		end -- dmPaperWidth

	dmScale : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmScale;%N")
			Result := res
		end -- dmScale

	dmCopies : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmCopies;%N")
			Result := res
		end -- dmCopies

	dmDefaultSource : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDefaultSource;%N")
			Result := res
		end -- dmDefaultSource

	dmPrintQuality : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPrintQuality;%N")
			Result := res
		end -- dmPrintQuality

	dmColor : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmColor;%N")
			Result := res
		end -- dmColor

	dmDuplex : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDuplex;%N")
			Result := res
		end -- dmDuplex

	dmYResolution : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmYResolution;%N")
			Result := res
		end -- dmYResolution

	dmTTOption : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmTTOption;%N")
			Result := res
		end -- dmTTOption

	dmCollate : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmCollate;%N")
			Result := res
		end -- dmCollate

	dmFormName : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DEVMODE*)_ptr)->dmFormName;%N")
			Result := res
		end -- dmFormName

	dmLogPixels : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmLogPixels;%N")
			Result := res
		end -- dmLogPixels

	dmBitsPerPel : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmBitsPerPel;%N")
			Result := res
		end -- dmBitsPerPel

	dmPelsWidth : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPelsWidth;%N")
			Result := res
		end -- dmPelsWidth

	dmPelsHeight : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmPelsHeight;%N")
			Result := res
		end -- dmPelsHeight

	dmDisplayFlags : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDisplayFlags;%N")
			Result := res
		end -- dmDisplayFlags

	dmDisplayFrequency : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDisplayFrequency;%N")
			Result := res
		end -- dmDisplayFrequency

	dmICMMethod : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmICMMethod;%N")
			Result := res
		end -- dmICMMethod

	dmICMIntent : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmICMIntent;%N")
			Result := res
		end -- dmICMIntent

	dmMediaType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmMediaType;%N")
			Result := res
		end -- dmMediaType

	dmDitherType : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmDitherType;%N")
			Result := res
		end -- dmDitherType

	dmReserved1 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmReserved1;%N")
			Result := res
		end -- dmReserved1

	dmReserved2 : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DEVMODE*)_ptr)->dmReserved2;%N")
			Result := res
		end -- dmReserved2

end -- class WIN32_DEVMODE 

