class ELJ_MEMORY

inherit
	MEMORY

creation
	make

feature {NONE}

	make is
		do
		end -- make

feature {NONE}

	frozen finalize (a_pointer: POINTER) is
		do
			dispose
		end -- finalize

end -- class ELJ_MEMORY
