deferred class APPWORKS_ART_WINDOW_PROPERTY_MIXIN

feature

	set_prop (a_name, a_value: STRING) is
		deferred
		end -- set_prop

	set_int_prop (a_name: STRING; a_value: INTEGER) is
		deferred
		end -- set_prop

	get_prop (a_name: STRING): STRING is
		deferred
		end -- get_prop

feature

	set_title_prop (a_title: STRING) is
		require
			valid_title: a_title /= Void
		do
			set_prop ("title", a_title)
		ensure
			definition: is_equal(get_prop("title"), a_title)
		end -- set_title

	get_title_prop : STRING is
		do
			Result := get_prop("title")
		ensure
			Result /= Void
		end -- get_title

	set_top_prop (x, y : INTEGER) is
		do
			set_int_prop("x-coord", x)
			set_int_prop("y-coord", y)
		end -- settop

feature

	get_prop_dbiroot: STRING is
		do
			Result := get_prop("DBiRoot")
		end
	set_prop_dbiroot(a_string: STRING) is
		do
			set_prop("DBiRoot", a_string)
		end

feature -- Windows Backend Accessors

	get_clazzname : STRING is
		do
			Result := get_prop("WindowClass")
			check
				Result /= Void
			end
		end -- get_clazzname

feature

	show_vis_prop is
		do
			set_prop("visibility", "true")
		end -- show

	hide_vis_prop is
		do
			set_prop("visibility", "false")
		end -- hide

end -- class APPWORKS_ART_WINDOW_PROPERTY_MIXIN
