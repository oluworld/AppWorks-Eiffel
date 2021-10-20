class GLU_FUNCTIONS

feature {NONE}

	-- gluBuild2DMipmaps

	gluBuild2DMipmaps (a_target : INTEGER;
				a_component : INTEGER;
				a_width  : INTEGER;
				a_height : INTEGER;
				a_format : INTEGER;
				a_type   : INTEGER;
				a_data   : POINTER ) : INTEGER is
		external "C_InlineWithoutCurrent"
		alias "gluBuild2DMipmaps"
		end -- gluBuild2DMipmaps

	-- gluPerspective

	gluPerspective (a_fovy   : DOUBLE;
	              a_aspect : DOUBLE;
	              a_zNear  : DOUBLE;
	              a_zFar   : DOUBLE) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "gluPerspective"
		end -- gluPerspective

end -- class GLU_FUNCTIONS
