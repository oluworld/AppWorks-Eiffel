class WIN32_MODEMSETTINGS 

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
			c_inline_c ("_res = sizeof(MODEMSETTINGS);%N")
			Result := res
		end -- external_size
	
feature
		--Setters

	set_dwActualSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwActualSize = _val;%N")
		ensure
			value_set: dwActualSize = a_var
		end -- set_dwActualSize

	set_dwRequiredSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwRequiredSize = _val;%N")
		ensure
			value_set: dwRequiredSize = a_var
		end -- set_dwRequiredSize

	set_dwDevSpecificOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwDevSpecificOffset = _val;%N")
		ensure
			value_set: dwDevSpecificOffset = a_var
		end -- set_dwDevSpecificOffset

	set_dwDevSpecificSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwDevSpecificSize = _val;%N")
		ensure
			value_set: dwDevSpecificSize = a_var
		end -- set_dwDevSpecificSize

	set_dwCallSetupFailTimer (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwCallSetupFailTimer = _val;%N")
		ensure
			value_set: dwCallSetupFailTimer = a_var
		end -- set_dwCallSetupFailTimer

	set_dwInactivityTimeout (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwInactivityTimeout = _val;%N")
		ensure
			value_set: dwInactivityTimeout = a_var
		end -- set_dwInactivityTimeout

	set_dwSpeakerVolume (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwSpeakerVolume = _val;%N")
		ensure
			value_set: dwSpeakerVolume = a_var
		end -- set_dwSpeakerVolume

	set_dwSpeakerMode (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwSpeakerMode = _val;%N")
		ensure
			value_set: dwSpeakerMode = a_var
		end -- set_dwSpeakerMode

	set_dwPreferredModemOptions (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwPreferredModemOptions = _val;%N")
		ensure
			value_set: dwPreferredModemOptions = a_var
		end -- set_dwPreferredModemOptions

	set_dwNegotiatedModemOptions (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwNegotiatedModemOptions = _val;%N")
		ensure
			value_set: dwNegotiatedModemOptions = a_var
		end -- set_dwNegotiatedModemOptions

	set_dwNegotiatedDCERate (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->dwNegotiatedDCERate = _val;%N")
		ensure
			value_set: dwNegotiatedDCERate = a_var
		end -- set_dwNegotiatedDCERate

	set_abVariablePortion (a_index: INTEGER; a_var : CHARACTER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: CHARACTER
			idx: INTEGER
			ptr: POINTER
		do
			val := a_var
			idx := a_index
			ptr := pointer
			c_inline_c ("((MODEMSETTINGS*)_ptr)->abVariablePortion[_idx] = _val;%N")
		ensure
			value_set: abVariablePortion (a_index) = a_var
		end -- set_abVariablePortion

feature
		-- Getters

	dwActualSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwActualSize;%N")
			Result := res
		end -- dwActualSize

	dwRequiredSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwRequiredSize;%N")
			Result := res
		end -- dwRequiredSize

	dwDevSpecificOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwDevSpecificOffset;%N")
			Result := res
		end -- dwDevSpecificOffset

	dwDevSpecificSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwDevSpecificSize;%N")
			Result := res
		end -- dwDevSpecificSize

	dwCallSetupFailTimer : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwCallSetupFailTimer;%N")
			Result := res
		end -- dwCallSetupFailTimer

	dwInactivityTimeout : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwInactivityTimeout;%N")
			Result := res
		end -- dwInactivityTimeout

	dwSpeakerVolume : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwSpeakerVolume;%N")
			Result := res
		end -- dwSpeakerVolume

	dwSpeakerMode : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwSpeakerMode;%N")
			Result := res
		end -- dwSpeakerMode

	dwPreferredModemOptions : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwPreferredModemOptions;%N")
			Result := res
		end -- dwPreferredModemOptions

	dwNegotiatedModemOptions : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwNegotiatedModemOptions;%N")
			Result := res
		end -- dwNegotiatedModemOptions

	dwNegotiatedDCERate : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwNegotiatedDCERate;%N")
			Result := res
		end -- dwNegotiatedDCERate

	abVariablePortion (a_index: INTEGER) : CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: CHARACTER
			idx: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			idx := a_index
			c_inline_c ("_res=(EIF_INTEGER)((MODEMSETTINGS*)_ptr)->dwNegotiatedDCERate[_idx];%N")
			Result := res
		end -- abVariablePortion

end -- class WIN32_MODEMSETTINGS 

