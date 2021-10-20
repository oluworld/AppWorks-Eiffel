indexing

    description:

        "handles setting of options in the form option1 = 'value 1' opttion2 = 'value 2'"
        "special case is option = '', which means empty value"

    library:    "ELJ CCL/library"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"
    last:		"$Author: usander $"

class ELJ_STRING_OPTIONS

creation
	make

feature {NONE}

	make is
		do
			create storage.make
		end -- make

feature {NONE}

	storage: DICTIONARY[STRING, STRING]

feature

	set_options (a_string: STRING) is
		require
			non_void_options: a_string /= Void
			min_one_option: a_string.valid_index (a_string.first_index_of ('='))
		local
			idx: INTEGER
			val: STRING
			kvl: STRING
			tmp: STRING
		do
			!!val.make (0)
			!!kvl.make (0)
			
			from
				expression.match (a_string)
			until
				not expression.has_matched
			loop
				val.clear
				kvl.clear
				tmp := expression.matched_portion (0)
				
				from
					idx := tmp.lower
				until
					tmp.item (idx) = ' ' or else tmp.item (idx) = '%T' or else tmp.item (idx) = '='
				loop
					kvl.append_character (tmp.item (idx))
					idx := idx + 1
				end -- loop
				
				from
				until
					tmp.item (idx) = '%''
				loop
					idx := idx + 1
				end -- loop
				
				from
					idx := idx + 1
				until
					tmp.item (idx) = '%''
				loop
					val.append_character (tmp.item (idx))
					idx := idx + 1
				end -- loop
				
				kvl.to_upper
				
				storage.put (val.twin, kvl.twin)
				
				expression.next_match
			end -- loop
		end -- set_options
	
	has (a_key: STRING): BOOLEAN is
		do
			Result := storage.has (a_key)
		end -- has
	
	item, infix "@" (a_key: STRING): STRING is
		do
			Result := storage.at (a_key)
		end -- item, infix "@"

feature {NONE}

	expression: REGULAR_EXPRESSION is
		once
			create Result.make
			Result.compile ("[^\t ]+[\t ]*=[\t ]*'[^']*'")
		ensure
			prepared: Result.is_compiled
		end -- expression

end -- class ELJ_STRING_OPTIONS
