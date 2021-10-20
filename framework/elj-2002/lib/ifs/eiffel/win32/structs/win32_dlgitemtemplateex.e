class WIN32_DLGITEMTEMPLATEEX 

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
			c_inline_c ("_res = sizeof(DLGITEMTEMPLATEEX);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_helpID (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->helpID = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->exStyle = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->style = _val;%N")
		ensure
			value_set: style = a_var
		end -- set_style

	set_x (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->x = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->y = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->cx = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->cy = _val;%N")
		ensure
			value_set: cy = a_var
		end -- set_cy

	set_id (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->id = _val;%N")
		ensure
			value_set: id = a_var
		end -- set_id

	set_windowClass (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->windowClass = _val;%N")
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
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->title = _val;%N")
		ensure
			value_set: title = a_var
		end -- set_title

	set_extraCount (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((DLGITEMTEMPLATEEX*)_ptr)->extraCount = _val;%N")
		ensure
			value_set: extraCount = a_var
		end -- set_extraCount

feature
		-- Getters

	helpID : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->helpID;%N")
			Result := res
		end -- helpID

	exStyle : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->exStyle;%N")
			Result := res
		end -- exStyle

	style : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->style;%N")
			Result := res
		end -- style

	x : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->x;%N")
			Result := res
		end -- x

	y : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->y;%N")
			Result := res
		end -- y

	cx : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->cx;%N")
			Result := res
		end -- cx

	cy : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->cy;%N")
			Result := res
		end -- cy

	id : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->id;%N")
			Result := res
		end -- id

	windowClass : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGITEMTEMPLATEEX*)_ptr)->windowClass;%N")
			Result := res
		end -- windowClass

	title : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((DLGITEMTEMPLATEEX*)_ptr)->title;%N")
			Result := res
		end -- title

	extraCount : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((DLGITEMTEMPLATEEX*)_ptr)->extraCount;%N")
			Result := res
		end -- extraCount

end -- class WIN32_DLGITEMTEMPLATEEX 

