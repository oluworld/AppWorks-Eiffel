indexing
	contents: "WIN32 atom functions"
	author: "Birgit Sander, bsander@sykosch.de"
	completed: yes
	tested: yes
	
class WIN32_ATOM_FUNCTIONS

feature {NONE}

	AddAtom (a_string: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- AddAtom

	DeleteAtom (a_atom: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- DeleteAtom

	FindAtom (a_string: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- FindAtom

	GetAtomName (a_atom: INTEGER;
				a_buffer: POINTER;
				a_size: INTEGER ): INTEGER  is
		external "C use <windows.h>"
		end -- GetAtomName

	GlobalAddAtom (a_string: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GlobalAddAtom

	GlobalDeleteAtom (a_atom: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GlobalDeleteAtom

	GlobalFindAtom (a_string: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- GlobalFindAtom

	GlobalGetAtomName (	a_atom: INTEGER;
						a_buffer: POINTER;
						a_size: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- GlobalGetAtomName

	InitAtomTable (a_size: INTEGER): BOOLEAN is
		external "C use <windows.h>"
		end -- InitAtomTable

end -- class WIN32_ATOM_FUNCTIONS