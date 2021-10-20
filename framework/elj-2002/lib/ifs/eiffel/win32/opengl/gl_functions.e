class GL_FUNCTIONS

feature {NONE}

	-- glBegin

	glBegin (a_mode : INTEGER) is
			-- The glBegin and glEnd functions delimit the vertices
			-- of a primitive or a group of like primitives.
		external "C_InlineWithoutCurrent"
		alias "glBegin"
		end -- glBegin

	-- glBindTexture

	glBindTexture (a_target  : INTEGER;
	               a_texture : INTEGER) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glBindTexture"
		end -- glBindTexture

	-- glClearColor

	glClearColor (a_red : REAL;
				a_green : REAL;
				a_blue : REAL;
				a_alpha : REAL) is
			-- The glClearColor function specifies clear values for
			-- the color buffers.
		external "C_InlineWithoutCurrent"
		alias "glClearColor"
		end -- glClearColor

	-- glClear

	glClear (a_mask : INTEGER) is
			-- The glClear function clears buffers to preset values.
		external "C_InlineWithoutCurrent"
		alias "glClear"
		end -- glClear

	-- glColor3f

	glColor3f (a_red : REAL;
				a_green : REAL;
				a_blue : REAL) is
			--  set the current color
		external "C_InlineWithoutCurrent"
		alias "glColor3f"
		end -- glColor3f

	-- glGenTextures

	glDeleteTextures (a_n : INTEGER;
						a_texture_ptr : POINTER) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glDeleteTextures"
		end -- glDeleteTextures

	-- glEnable

	glEnable (a_cap : INTEGER) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glEnable"
		end -- glEnable

	-- glEnd

	glEnd is
			-- The glBegin and glEnd functions delimit the vertices
			-- of a primitive or a group of like primitives.
		external "C_InlineWithoutCurrent"
		alias "glEnd"
		end -- glEnd

	-- glGenTextures

	glGenTextures (a_n : INTEGER;
						a_texture_ptr : POINTER) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glGenTextures"
		end -- glGenTextures

	-- glPopMatrix

	glPopMatrix is
			-- The glPushMatrix and glPopMatrix functions push and
			-- pop the current matrix stack.
		external "C_InlineWithoutCurrent"
		alias "glPopMatrix"
		end -- glPopMatrix

	-- glPushMatrix

	glPushMatrix is
			-- The glPushMatrix and glPopMatrix functions push and
			-- pop the current matrix stack.
		external "C_InlineWithoutCurrent"
		alias "glPushMatrix"
		end -- glPushMatrix

	-- glRotatef

	glRotatef (a_angle : REAL;
				a_x : REAL;
				a_y : REAL;
				a_z : REAL) is
			-- The glRotated and glRotatef functions multiply the
			-- current matrix by a rotation matrix.
		external "C_InlineWithoutCurrent"
		alias "glRotatef"
		end -- glRotatef

	-- glTexCoord2d

	glTexCoord2d (a_s : DOUBLE;
				a_t : DOUBLE) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glTexCoord2d"
		end -- glTexCoord2d

	-- glTexEnvf

	glTexEnvf (a_target : INTEGER;
				  a_pname  : INTEGER
				  a_param : REAL) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glTexEnvf"
		end -- glTexEnvf

	-- glTexParameterf

	glTexParameterf (a_target : INTEGER;
				  a_pname  : INTEGER
				  a_param : REAL) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glTexParameterf"
		end -- glTexParameterf

	-- glVertex2f

	glVertex2f (a_x : REAL;
				a_y : REAL) is
			--  These specifies a vertex.
		external "C_InlineWithoutCurrent"
		alias "glVertex2f"
		end -- glVertex2f

	-- glTexCoord2d

	glVertex2d (a_x : DOUBLE;
				a_y : DOUBLE) is
			--  
		external "C_InlineWithoutCurrent"
		alias "glVertex2d"
		end -- glVertex2d

feature
		--

	-- glClearDepth

	glClearDepth (a_depth : DOUBLE) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glClearDepth"
		end -- glClearDepth

	-- glClearDepth

	glDepthFunc (a_func : INTEGER) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glDepthFunc"
		end -- glDepthFunc

	-- glHint

	glHint (a_target : INTEGER;
	        a_mode   : INTEGER) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glHint"
		end -- glHint

	-- glLoadIdentity

	glLoadIdentity is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glLoadIdentity"
		end -- glLoadIdentity

	-- glMatrixMode

	glMatrixMode (a_mode : INTEGER) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glMatrixMode"
		end -- glMatrixMode

	-- glShadeModel

	glShadeModel (a_mode : INTEGER) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glShadeModel"
		end -- glShadeModel

	-- gluPerspective

	gluPerspective (a_fovy   : DOUBLE;
	              a_aspect : DOUBLE;
	              a_zNear  : DOUBLE;
	              a_zFar   : DOUBLE) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "gluPerspective"
		end -- gluPerspective

	-- glViewport

	glViewport (a_x      : INTEGER;
	            a_y      : INTEGER;
	            a_width  : INTEGER;
	            a_height : INTEGER) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glViewport"
		end -- glViewport

	-- glVertex3f

	glVertex3f (a_x : REAL;
	            a_y : REAL;
	            a_z : REAL) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glVertex3f"
		end -- glVertex3f

	-- glTranslatef

	glTranslatef (a_x : REAL;
	            a_y : REAL;
	            a_z : REAL) is
			-- 
		external "C_InlineWithoutCurrent"
		alias "glTranslatef"
		end -- glTranslatef


	-- glTexImage2D - specify a two-dimensional texture image

	glTexImage2D (a_target         : INTEGER;
			        a_level          : INTEGER;
			        a_internalformat : INTEGER;
			        a_width          : INTEGER;
			        a_height         : INTEGER;
			        a_border         : INTEGER;
			        a_format         : INTEGER;
			        a_type           : INTEGER;
			        a_pixels         : POINTER) is
		external "C_InlineWithoutCurrent"
		alias "glTexImage2D"
		end -- glTexImage2D

end -- class GL_FUNCTIONS