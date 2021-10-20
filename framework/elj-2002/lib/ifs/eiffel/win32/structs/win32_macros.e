indexing
	contents: "WIN32 macro collection"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: yes
	
class WIN32_MACROS

feature {NONE}

	MAKEINTRESOURCE (a_val: INTEGER): POINTER is
		local
			val : INTEGER
			res : POINTER
		do
			val := a_val
			c_inline_c("_res = MAKEINTRESOURCE(_val);%N")
			Result := res
		end -- MAKEINTRESOURCE

	MAKEINTATOM (a_val: INTEGER): POINTER is
		local
			val : INTEGER
			res : POINTER
		do
			val := a_val
			c_inline_c("_res = MAKEINTATOM(_val);%N")
			Result := res
		end -- MAKEINTATOM

	LOWORD (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = LOWORD(_val);%N")
			Result := res
		end -- LOWORD

	HIWORD (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := HISHORT (a_val)
			c_inline_c("_res = (int)((unsigned short)_val);%N")
			Result := res
		end -- HIWORD

	LOSHORT (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = (EIF_INTEGER) ((SHORT) (_val));%N")
			Result := res
		end -- LOSHORT

	HISHORT (a_val: INTEGER): INTEGER is
		do
			Result := (a_val.to_bit @>> 16).to_integer
		end -- HISHORT

	LANGIDFROMLCID (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = LANGIDFROMLCID(_val);%N")
			Result := res
		end -- LANGIDFROMLCID

	MAKELANGID (a_prim_lang: INTEGER; a_sub_lang: INTEGER): INTEGER is
		local
			pri : INTEGER
			sub : INTEGER
			res : INTEGER
		do
			pri := a_prim_lang
			sub := a_sub_lang
			c_inline_c("_res = MAKELANGID(_pri, _sub);%N")
			Result := res
		end -- MAKELANGID

	MAKELCID (a_lang_id: INTEGER; a_sort_id: INTEGER): INTEGER is
		local
			pri : INTEGER
			sub : INTEGER
			res : INTEGER
		do
			pri := a_lang_id
			sub := a_sort_id
			c_inline_c("_res = MAKELCID(_pri, _sub);%N")
			Result := res
		end -- MAKELCID

	PRIMARYLANGID (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = PRIMARYLANGID(_val);%N")
			Result := res
		end -- PRIMARYLANGID

	SORTIDFROMLCID (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = SORTIDFROMLCID(_val);%N")
			Result := res
		end -- SORTIDFROMLCID

	SUBLANGID (a_val: INTEGER): INTEGER is
		local
			val : INTEGER
			res : INTEGER
		do
			val := a_val
			c_inline_c("_res = SUBLANGID(_val);%N")
			Result := res
		end -- SUBLANGID

	MAKELPARAM (a_low_int, a_high_int: INTEGER): INTEGER is
		local
			pri : INTEGER
			sub : INTEGER
			res : INTEGER
		do
			pri := a_low_int
			sub := a_high_int
			c_inline_c("_res = MAKELPARAM(_pri, _sub);%N")
			Result := res
		end -- MAKELPARAM

	MAKEWPARAM (a_low_int, a_high_int: INTEGER): INTEGER is
		local
			pri : INTEGER
			sub : INTEGER
			res : INTEGER
		do
			pri := a_low_int
			sub := a_high_int
			c_inline_c("_res = MAKEWPARAM(_pri, _sub);%N")
			Result := res
		end -- MAKEWPARAM

	MAKELONG (a_low_int, a_high_int: INTEGER): INTEGER is
		local
			pri : INTEGER
			sub : INTEGER
			res : INTEGER
		do
			pri := a_low_int
			sub := a_high_int
			c_inline_c("_res = MAKELPARAM(_pri, _sub);%N")
			Result := res
		end -- MAKELPARAM

end -- class WIN32_MACROS