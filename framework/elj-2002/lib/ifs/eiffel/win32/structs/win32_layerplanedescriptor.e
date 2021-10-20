class WIN32_LAYERPLANEDESCRIPTOR 

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
			c_inline_c ("_res = sizeof(LAYERPLANEDESCRIPTOR);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_nSize (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->nSize = _val;%N")
		ensure
			value_set: nSize = a_var
		end -- set_nSize

	set_nVersion (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->nVersion = _val;%N")
		ensure
			value_set: nVersion = a_var
		end -- set_nVersion

	set_dwFlags (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->dwFlags = _val;%N")
		ensure
			value_set: dwFlags = a_var
		end -- set_dwFlags

	set_iPixelType (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->iPixelType = _val;%N")
		ensure
			value_set: iPixelType = a_var
		end -- set_iPixelType

	set_cColorBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cColorBits = _val;%N")
		ensure
			value_set: cColorBits = a_var
		end -- set_cColorBits

	set_cRedBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cRedBits = _val;%N")
		ensure
			value_set: cRedBits = a_var
		end -- set_cRedBits

	set_cRedShift (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cRedShift = _val;%N")
		ensure
			value_set: cRedShift = a_var
		end -- set_cRedShift

	set_cGreenBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cGreenBits = _val;%N")
		ensure
			value_set: cGreenBits = a_var
		end -- set_cGreenBits

	set_cGreenShift (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cGreenShift = _val;%N")
		ensure
			value_set: cGreenShift = a_var
		end -- set_cGreenShift

	set_cBlueBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cBlueBits = _val;%N")
		ensure
			value_set: cBlueBits = a_var
		end -- set_cBlueBits

	set_cBlueShift (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cBlueShift = _val;%N")
		ensure
			value_set: cBlueShift = a_var
		end -- set_cBlueShift

	set_cAlphaBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAlphaBits = _val;%N")
		ensure
			value_set: cAlphaBits = a_var
		end -- set_cAlphaBits

	set_cAlphaShift (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAlphaShift = _val;%N")
		ensure
			value_set: cAlphaShift = a_var
		end -- set_cAlphaShift

	set_cAccumBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumBits = _val;%N")
		ensure
			value_set: cAccumBits = a_var
		end -- set_cAccumBits

	set_cAccumRedBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumRedBits = _val;%N")
		ensure
			value_set: cAccumRedBits = a_var
		end -- set_cAccumRedBits

	set_cAccumGreenBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumGreenBits = _val;%N")
		ensure
			value_set: cAccumGreenBits = a_var
		end -- set_cAccumGreenBits

	set_cAccumBlueBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumBlueBits = _val;%N")
		ensure
			value_set: cAccumBlueBits = a_var
		end -- set_cAccumBlueBits

	set_cAccumAlphaBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumAlphaBits = _val;%N")
		ensure
			value_set: cAccumAlphaBits = a_var
		end -- set_cAccumAlphaBits

	set_cDepthBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cDepthBits = _val;%N")
		ensure
			value_set: cDepthBits = a_var
		end -- set_cDepthBits

	set_cStencilBits (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cStencilBits = _val;%N")
		ensure
			value_set: cStencilBits = a_var
		end -- set_cStencilBits

	set_cAuxBuffers (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->cAuxBuffers = _val;%N")
		ensure
			value_set: cAuxBuffers = a_var
		end -- set_cAuxBuffers

	set_iLayerPlane (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->iLayerPlane = _val;%N")
		ensure
			value_set: iLayerPlane = a_var
		end -- set_iLayerPlane

	set_bReserved (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->bReserved = _val;%N")
		ensure
			value_set: bReserved = a_var
		end -- set_bReserved

	set_crTransparent (a_var : INTEGER) is
		local
			ptr : POINTER
			val : INTEGER
		do
			ptr := pointer
			val := a_var
			c_inline_c("((LAYERPLANEDESCRIPTOR*)_ptr)->crTransparent = _val;%N")
		ensure
			value_set: crTransparent = a_var
		end -- set_crTransparent

feature
		-- Getters

	nSize : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->nSize;%N")
			Result := res
		end -- nSize

	nVersion : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->nVersion;%N")
			Result := res
		end -- nVersion

	dwFlags : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->dwFlags;%N")
			Result := res
		end -- dwFlags

	iPixelType : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->iPixelType;%N")
			Result := res
		end -- iPixelType

	cColorBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cColorBits;%N")
			Result := res
		end -- cColorBits

	cRedBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cRedBits;%N")
			Result := res
		end -- cRedBits

	cRedShift : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cRedShift;%N")
			Result := res
		end -- cRedShift

	cGreenBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cGreenBits;%N")
			Result := res
		end -- cGreenBits

	cGreenShift : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cGreenShift;%N")
			Result := res
		end -- cGreenShift

	cBlueBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cBlueBits;%N")
			Result := res
		end -- cBlueBits

	cBlueShift : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cBlueShift;%N")
			Result := res
		end -- cBlueShift

	cAlphaBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAlphaBits;%N")
			Result := res
		end -- cAlphaBits

	cAlphaShift : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAlphaShift;%N")
			Result := res
		end -- cAlphaShift

	cAccumBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumBits;%N")
			Result := res
		end -- cAccumBits

	cAccumRedBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumRedBits;%N")
			Result := res
		end -- cAccumRedBits

	cAccumGreenBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumGreenBits;%N")
			Result := res
		end -- cAccumGreenBits

	cAccumBlueBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumBlueBits;%N")
			Result := res
		end -- cAccumBlueBits

	cAccumAlphaBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAccumAlphaBits;%N")
			Result := res
		end -- cAccumAlphaBits

	cDepthBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cDepthBits;%N")
			Result := res
		end -- cDepthBits

	cStencilBits : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cStencilBits;%N")
			Result := res
		end -- cStencilBits

	cAuxBuffers : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->cAuxBuffers;%N")
			Result := res
		end -- cAuxBuffers

	iLayerPlane : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->iLayerPlane;%N")
			Result := res
		end -- iLayerPlane

	bReserved : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->bReserved;%N")
			Result := res
		end -- bReserved

	crTransparent : INTEGER is
		local
			ptr : POINTER
			res : INTEGER
		do
			ptr := pointer
			c_inline_c("_res = (EIF_INTEGER) ((LAYERPLANEDESCRIPTOR*)_ptr)->crTransparent;%N")
			Result := res
		end -- crTransparent

end -- class WIN32_LAYERPLANEDESCRIPTOR 

