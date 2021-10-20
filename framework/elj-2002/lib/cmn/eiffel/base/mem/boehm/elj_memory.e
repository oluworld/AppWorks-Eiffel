class ELJ_MEMORY

inherit
	MEMORY

creation
	make

feature {NONE}

	make is
		do
			register_finalize
		end -- make

feature {NONE}

	frozen finalize (a_pointer: POINTER) is
		do
			dispose
		end -- finalize
	
	frozen register_finalize is
		local
			old_object:   CMEM_32
			old_finalize: CMEM_32
		do
			gc_register_finalize (Current.to_pointer, $finalize, default_pointer, old_object.to_external, old_finalize.to_external)
		end -- register_finalize

feature {NONE}

	gc_register_finalize (a_object, a_callback, a_data, a_old_object, a_old_callback: POINTER) is
		external "C use %"boehm_inc.h%""
		alias "GC_register_finalizer"
		end -- gc_register_finalize

end -- class ELJ_MEMORY
