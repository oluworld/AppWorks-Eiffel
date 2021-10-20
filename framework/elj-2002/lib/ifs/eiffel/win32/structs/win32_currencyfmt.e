class WIN32_CURRENCYFMT 

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
			c_inline_c ("_res = sizeof(CURRENCYFMT);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_NumDigits (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->NumDigits = _val;%N")
		ensure
			value_set: NumDigits = a_var
		end -- set_NumDigits

	set_LeadingZero (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->LeadingZero = _val;%N")
		ensure
			value_set: LeadingZero = a_var
		end -- set_LeadingZero

	set_Grouping (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->Grouping = _val;%N")
		ensure
			value_set: Grouping = a_var
		end -- set_Grouping

	set_lpDecimalSep (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->lpDecimalSep = _val;%N")
		ensure
			value_set: lpDecimalSep = a_var
		end -- set_lpDecimalSep

	set_lpThousandSep (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->lpThousandSep = _val;%N")
		ensure
			value_set: lpThousandSep = a_var
		end -- set_lpThousandSep

	set_NegativeOrder (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->NegativeOrder = _val;%N")
		ensure
			value_set: NegativeOrder = a_var
		end -- set_NegativeOrder

	set_PositiveOrder (a_var : INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->PositiveOrder = _val;%N")
		ensure
			value_set: PositiveOrder = a_var
		end -- set_PositiveOrder

	set_lpCurrencySymbol (a_var : POINTER) is
		local
			val: POINTER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((CURRENCYFMT*)_ptr)->lpCurrencySymbol = _val;%N")
		ensure
			value_set: lpCurrencySymbol = a_var
		end -- set_lpCurrencySymbol

feature
		-- Getters

	NumDigits : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CURRENCYFMT*)_ptr)->NumDigits;%N")
			Result := res
		end -- NumDigits

	LeadingZero : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CURRENCYFMT*)_ptr)->LeadingZero;%N")
			Result := res
		end -- LeadingZero

	Grouping : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CURRENCYFMT*)_ptr)->Grouping;%N")
			Result := res
		end -- Grouping

	lpDecimalSep : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CURRENCYFMT*)_ptr)->lpDecimalSep;%N")
			Result := res
		end -- lpDecimalSep

	lpThousandSep : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CURRENCYFMT*)_ptr)->lpThousandSep;%N")
			Result := res
		end -- lpThousandSep

	NegativeOrder : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CURRENCYFMT*)_ptr)->NegativeOrder;%N")
			Result := res
		end -- NegativeOrder

	PositiveOrder : INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((CURRENCYFMT*)_ptr)->PositiveOrder;%N")
			Result := res
		end -- PositiveOrder

	lpCurrencySymbol : POINTER is
		local
			res: POINTER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_POINTER)((CURRENCYFMT*)_ptr)->lpCurrencySymbol;%N")
			Result := res
		end -- lpCurrencySymbol

end -- class WIN32_CURRENCYFMT 

