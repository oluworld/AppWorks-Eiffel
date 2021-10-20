indexing

    description:

        "buffer contents description for ELJ_BUFFER_HANDLER"

    library:    "ELJ common"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/04/06 15:59:26 $"
    revision:   "$Revision: 1.1.1.1 $"
    last:       "$Author: usander $"

class ELJ_BUFFER_FLAGS

feature {NONE}

	bf_empty:	INTEGER is 0
	bf_current:	INTEGER is 1
	bf_eos:		INTEGER is 2
	bf_bos:		INTEGER is 3
	bf_insert:	INTEGER is 4

end -- class ELJ_BUFFER_FLAGS