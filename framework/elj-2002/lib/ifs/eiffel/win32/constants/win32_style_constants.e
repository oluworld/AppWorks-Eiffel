indexing
	contents: "WIN32 style constants"
	author: "Geoff Eldridge, geoff@elj.com"
	completed: no
	tested: no
	
class WIN32_STYLE_CONSTANTS

feature {NONE}

	CS_BYTEALIGNCLIENT : INTEGER is  4096
	CS_BYTEALIGNWINDOW : INTEGER is  8192
	CS_KEYCVTWINDOW    : INTEGER is     4
	CS_NOKEYCVT        : INTEGER is   256
	CS_CLASSDC         : INTEGER is    64
	CS_DBLCLKS         : INTEGER is     8
	CS_GLOBALCLASS     : INTEGER is 16384
	CS_HREDRAW         : INTEGER is     2
	CS_NOCLOSE         : INTEGER is   512
	CS_OWNDC           : INTEGER is    32
	CS_PARENTDC        : INTEGER is   128
	CS_SAVEBITS        : INTEGER is  2048
	CS_VREDRAW         : INTEGER is     1

end -- class WIN32_STYLE_CONSTANTS