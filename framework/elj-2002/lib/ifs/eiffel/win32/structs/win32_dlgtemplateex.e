class WIN32_DLGTEMPLATEEX 

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
			c_inline_c ("_res = sizeof(DLGTEMPLATEEX);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dlgVer (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->dlgVer = _val;%N")
		ensure
			value_set: dlgVer = a_var
		end -- set_dlgVer

	set_signature (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->signature = _val;%N")
		ensure
			value_set: signature = a_var
		end -- set_signature

	set_helpID (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->helpID = _val;%N")
		ensure
			value_set: helpID = a_var
		end -- set_helpID

	set_exStyle (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->exStyle = _val;%N")
		ensure
			value_set: exStyle = a_var
		end -- set_exStyle

	set_style (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->style = _val;%N")
		ensure
			value_set: style = a_var
		end -- set_style

	set_cDlgItems (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->cDlgItems = _val;%N")
		ensure
			value_set: cDlgItems = a_var
		end -- set_cDlgItems

	set_x (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->x = _val;%N")
		ensure
			value_set: x = a_var
		end -- set_x

	set_y (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->y = _val;%N")
		ensure
			value_set: y = a_var
		end -- set_y

	set_cx (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->cx = _val;%N")
		ensure
			value_set: cx = a_var
		end -- set_cx

	set_cy (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->cy = _val;%N")
		ensure
			value_set: cy = a_var
		end -- set_cy

	set_menu (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->menu = _val;%N")
		ensure
			value_set: menu = a_var
		end -- set_menu

	set_windowClass (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->windowClass = _val;%N")
		ensure
			value_set: windowClass = a_var
		end -- set_windowClass

	set_title (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->title = _val;%N")
		ensure
			value_set: title = a_var
		end -- set_title

	set_pointsize (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->pointsize = _val;%N")
		ensure
			value_set: pointsize = a_var
		end -- set_pointsize

	set_weight (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->weight = _val;%N")
		ensure
			value_set: weight = a_var
		end -- set_weight

	set_bItalic (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->bItalic = _val;%N")
		ensure
			value_set: bItalic = a_var
		end -- set_bItalic

	set_font (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGTEMPLATEEX*)_ptr)->font = _val;%N")
		ensure
			value_set: font = a_var
		end -- set_font

feature
		-- Getters

	dlgVer : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->dlgVer;%N")
			Result := res
		end -- dlgVer

	signature : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->signature;%N")
			Result := res
		end -- signature

	helpID : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->helpID;%N")
			Result := res
		end -- helpID

	exStyle : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->exStyle;%N")
			Result := res
		end -- exStyle

	style : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->style;%N")
			Result := res
		end -- style

	cDlgItems : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->cDlgItems;%N")
			Result := res
		end -- cDlgItems

	x : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->x;%N")
			Result := res
		end -- x

	y : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->y;%N")
			Result := res
		end -- y

	cx : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->cx;%N")
			Result := res
		end -- cx

	cy : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->cy;%N")
			Result := res
		end -- cy

	menu : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGTEMPLATEEX*)_ptr)->menu;%N")
			Result := res
		end -- menu

	windowClass : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGTEMPLATEEX*)_ptr)->windowClass;%N")
			Result := res
		end -- windowClass

	title : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGTEMPLATEEX*)_ptr)->title;%N")
			Result := res
		end -- title

	pointsize : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->pointsize;%N")
			Result := res
		end -- pointsize

	weight : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->weight;%N")
			Result := res
		end -- weight

	bItalic : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGTEMPLATEEX*)_ptr)->bItalic;%N")
			Result := res
		end -- bItalic

	font : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGTEMPLATEEX*)_ptr)->font;%N")
			Result := res
		end -- font

end -- class WIN32_DLGTEMPLATEEX 

