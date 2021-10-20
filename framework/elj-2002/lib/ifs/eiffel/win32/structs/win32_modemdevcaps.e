class WIN32_MODEMDEVCAPS 

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
			c_inline_c ("_res = sizeof(MODEMDEVCAPS);%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwActualSize = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwRequiredSize = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwDevSpecificOffset = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwDevSpecificSize = _val;%N")
		ensure
			value_set: dwDevSpecificSize = a_var
		end -- set_dwDevSpecificSize

	set_dwModemProviderVersion (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemProviderVersion = _val;%N")
		ensure
			value_set: dwModemProviderVersion = a_var
		end -- set_dwModemProviderVersion

	set_dwModemManufacturerOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemManufacturerOffset = _val;%N")
		ensure
			value_set: dwModemManufacturerOffset = a_var
		end -- set_dwModemManufacturerOffset

	set_dwModemManufacturerSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemManufacturerSize = _val;%N")
		ensure
			value_set: dwModemManufacturerSize = a_var
		end -- set_dwModemManufacturerSize

	set_dwModemModelOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemModelOffset = _val;%N")
		ensure
			value_set: dwModemModelOffset = a_var
		end -- set_dwModemModelOffset

	set_dwModemModelSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemModelSize = _val;%N")
		ensure
			value_set: dwModemModelSize = a_var
		end -- set_dwModemModelSize

	set_dwModemVersionOffset (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemVersionOffset = _val;%N")
		ensure
			value_set: dwModemVersionOffset = a_var
		end -- set_dwModemVersionOffset

	set_dwModemVersionSize (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemVersionSize = _val;%N")
		ensure
			value_set: dwModemVersionSize = a_var
		end -- set_dwModemVersionSize

	set_dwDialOptions (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwDialOptions = _val;%N")
		ensure
			value_set: dwDialOptions = a_var
		end -- set_dwDialOptions

	set_dwCallSetupFailTimer (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwCallSetupFailTimer = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwInactivityTimeout = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwSpeakerVolume = _val;%N")
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
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwSpeakerMode = _val;%N")
		ensure
			value_set: dwSpeakerMode = a_var
		end -- set_dwSpeakerMode

	set_dwModemOptions (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwModemOptions = _val;%N")
		ensure
			value_set: dwModemOptions = a_var
		end -- set_dwModemOptions

	set_dwMaxDTERate (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwMaxDTERate = _val;%N")
		ensure
			value_set: dwMaxDTERate = a_var
		end -- set_dwMaxDTERate

	set_dwMaxDCERate (a_var : INTEGER) is
		require
			pointer_not_null: pointer.is_not_null
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_var
			ptr := pointer
			c_inline_c ("((MODEMDEVCAPS*)_ptr)->dwMaxDCERate = _val;%N")
		ensure
			value_set: dwMaxDCERate = a_var
		end -- set_dwMaxDCERate

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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwActualSize;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwRequiredSize;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwDevSpecificOffset;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwDevSpecificSize;%N")
			Result := res
		end -- dwDevSpecificSize

	dwModemProviderVersion : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemProviderVersion;%N")
			Result := res
		end -- dwModemProviderVersion

	dwModemManufacturerOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemManufacturerOffset;%N")
			Result := res
		end -- dwModemManufacturerOffset

	dwModemManufacturerSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemManufacturerSize;%N")
			Result := res
		end -- dwModemManufacturerSize

	dwModemModelOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemModelOffset;%N")
			Result := res
		end -- dwModemModelOffset

	dwModemModelSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemModelSize;%N")
			Result := res
		end -- dwModemModelSize

	dwModemVersionOffset : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemVersionOffset;%N")
			Result := res
		end -- dwModemVersionOffset

	dwModemVersionSize : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemVersionSize;%N")
			Result := res
		end -- dwModemVersionSize

	dwDialOptions : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwDialOptions;%N")
			Result := res
		end -- dwDialOptions

	dwCallSetupFailTimer : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwCallSetupFailTimer;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwInactivityTimeout;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwSpeakerVolume;%N")
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
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwSpeakerMode;%N")
			Result := res
		end -- dwSpeakerMode

	dwModemOptions : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwModemOptions;%N")
			Result := res
		end -- dwModemOptions

	dwMaxDTERate : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwMaxDTERate;%N")
			Result := res
		end -- dwMaxDTERate

	dwMaxDCERate : INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res=(EIF_INTEGER)((MODEMDEVCAPS*)_ptr)->dwMaxDCERate;%N")
			Result := res
		end -- dwMaxDCERate

end -- class WIN32_MODEMDEVCAPS 

