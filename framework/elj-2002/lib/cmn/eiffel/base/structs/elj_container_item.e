indexing

    description:

        "an item in a container"

    library:    "ELJ CCL/library/base"
    author:     "Uwe Sander"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date: 2002/07/20 04:14:29 $"
    revision:   "$Revision: 1.1 $"

deferred class ELJ_CONTAINER_ITEM

feature

	carrier: ELJ_CONTAINER[ELJ_CONTAINER_ITEM] is
		deferred
		end -- carrier

feature

	index: INTEGER is
		-- returns index of Current in carrier
		require
			adjusted: carrier /= Void
		do
			Result := carrier.index_of (Current)
		ensure
			valid_index: Result > 0
		end -- index
		
	delete is
		-- removes the current item in carrier
		require
			valid_index : index > 0
		do
			carrier.internal_remove (index)
		ensure
			removed: not carrier.has (Current)
		end -- delete


	attach_object (a_object: ANY) is
		-- attaches an object
		-- at the moment it's of type any which
		-- causes some inconvenience in usage
		-- maybe we find a better solution
		require
			valid_data	: a_object /= void

		do

			attached_object := a_object

		ensure
			attached	: attached_object = a_object

		end


	attached_object	: ANY
		
feature {ELJ_CONTAINER}

	update is
		do
			do_nothing
		end -- update

end -- deferred class ELJ_CONTAINER_ITEM
