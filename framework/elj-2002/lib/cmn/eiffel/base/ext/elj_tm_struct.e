indexing

    description:

        "standard C tm struct"

    library:    "ELJ/base"
    author:     "Uwe Sander"
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:28 $"
    revision:   "$Revision: 1.1 $"
    last:       "$Author: usander $"
	status:     "Tested"
	complete:   "yes"

class ELJ_TM_STRUCT

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
			c_inline_h ("#include <time.h>%N")
			c_inline_c ("_res = sizeof(struct tm);%N")
			Result := res
		end -- external_size
	
feature
		--Setters
	clear is
		local
			sze: INTEGER
			ptr: POINTER
		do
			sze := external_size
			ptr := pointer
			c_inline_c ("memset (_ptr, 0, _sze);%N")
		end -- clear

	set_tm_sec (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_sec = _val;%N")
		ensure
			value_set: tm_sec = a_val
		end -- set_tm_sec
		
	set_tm_min (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_min = _val;%N")
		ensure
			value_set: tm_min = a_val
		end -- set_tm_min
		
	set_tm_hour (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_hour = _val;%N")
		ensure
			value_set: tm_hour = a_val
		end -- set_tm_hour
		
	set_tm_mday (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_mday = _val;%N")
		ensure
			value_set: tm_mday = a_val
		end -- set_tm_mday
		
	set_tm_mon (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_mon = _val;%N")
		ensure
			value_set: tm_mon = a_val
		end -- set_tm_mon
		
	set_tm_year (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_year = _val;%N")
		ensure
			value_set: tm_year = a_val
		end -- set_tm_year
		
	set_tm_wday (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_wday = _val;%N")
		ensure
			value_set: tm_wday = a_val
		end -- set_tm_wday
		
	set_tm_yday (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_yday = _val;%N")
		ensure
			value_set: tm_yday = a_val
		end -- set_tm_yday
		
	set_tm_isdst (a_val: INTEGER) is
		local
			val: INTEGER
			ptr: POINTER
		do
			val := a_val
			ptr := pointer
			c_inline_c ("((struct tm*)_ptr)->tm_isdst = _val;%N")
		ensure
			value_set: tm_isdst = a_val
		end -- set_tm_isdst
		
feature
		--Getters

	tm_sec: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_sec;%N")
			Result := res
		end -- set_tm_sec
		
	tm_min: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_min;%N")
			Result := res
		end -- set_tm_min
		
	tm_hour: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_hour;%N")
			Result := res
		end -- set_tm_hour
		
	tm_mday: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_mday;%N")
			Result := res
		end -- set_tm_mday
		
	tm_mon: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_mon;%N")
			Result := res
		end -- set_tm_mon
		
	tm_year: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_year;%N")
			Result := res
		end -- set_tm_year
		
	tm_wday: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_wday;%N")
			Result := res
		end -- set_tm_wday
		
	tm_yday: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_yday;%N")
			Result := res
		end -- set_tm_yday
		
	tm_isdst: INTEGER is
		local
			res: INTEGER
			ptr: POINTER
		do
			ptr := pointer
			c_inline_c ("_res = ((struct tm*)_ptr)->tm_isdst;%N")
			Result := res
		end -- set_tm_isdst
		
end -- class ELJ_TM_STRUCT
