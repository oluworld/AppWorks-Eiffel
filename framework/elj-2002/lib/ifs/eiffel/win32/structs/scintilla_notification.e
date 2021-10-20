class SCINTILLA_NOTIFICATION

inherit 
	C_STRUCTURE 
		redefine
			external_size
		end

feature

	external_size : INTEGER is 
		local
			res: INTEGER
		do
			scintilla_notification_describe
			c_inline_c ("_res = sizeof(SCNotification);%N")
			Result := res
		end -- external_size
	
feature
-- Getters

	hwndFrom: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: POINTER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->nmhdr.hwndFrom;%N")
			
			Result := res
		end -- hwndFrom
	
	idFrom: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->nmhdr.idFrom;%N")
			
			Result := res
		end -- idFrom
	
	code: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->nmhdr.code;%N")
			
			Result := res
		end -- code

	position: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->position;%N")
			
			Result := res
		end -- position

	ch: CHARACTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: CHARACTER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->ch;%N")
			
			Result := res
		end -- ch
		
	modifiers: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->modifiers;%N")
			
			Result := res
		end -- modifiers

	modificationType: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->modificationType;%N")
			
			Result := res
		end -- modificationType

	text: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: POINTER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=(void*)((SCNotification*)_ptr)->text;%N")
			
			Result := res
		end -- text

	text_shared: POINTER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: POINTER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=(void*)((SCNotification*)_ptr)->text;%N")
			
			Result := res
		end -- text


	length: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->length;%N")
			
			Result := res
		end -- length

	linesAdded: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->linesAdded;%N")
			
			Result := res
		end -- linesAdded

	message: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->message;%N")
			
			Result := res
		end -- message

	wParam: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->wParam;%N")
			
			Result := res
		end -- wParam

	lParam: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->lParam;%N")
			
			Result := res
		end -- lParam

	line: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->line;%N")
			
			Result := res
		end -- line

	foldLevelNow: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->foldLevelNow;%N")
			
			Result := res
		end -- foldLevelNow

	foldLevelPrev: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->foldLevelPrev;%N")
			
			Result := res
		end -- foldLevelPrev

	margin: INTEGER is
		require
			pointer_not_null: pointer.is_not_null
		local
			ptr: POINTER
			res: INTEGER
		do
			scintilla_notification_describe
			ptr := pointer
			
			c_inline_c ("_res=((SCNotification*)_ptr)->margin;%N")
			
			Result := res
		end -- margin

feature {NONE}

	scintilla_notification_describe is
		once
			c_inline_h("#include <windows.h>%N")
			c_inline_h("typedef struct _SCNotification {%N")
			c_inline_h("NMHDR nmhdr;%N")
			c_inline_h("int position;%N")
			c_inline_h("int ch;%N")
			c_inline_h("int modifiers;%N")
			c_inline_h("int modificationType;%N")
			c_inline_h("const char *text;%N")
			c_inline_h("int length;%N")
			c_inline_h("int linesAdded;%N")
			c_inline_h("int message;%N")
			c_inline_h("int wParam;%N")
			c_inline_h("int lParam;%N")
			c_inline_h("int line;%N")
			c_inline_h("int foldLevelNow;%N")
			c_inline_h("int foldLevelPrev;%N")
			c_inline_h("int margin;%N")
			c_inline_h("}SCNotification;%N")
			
			do_nothing
		end -- scintilla_notification_describe

end -- class SCINTILLA_NOTIFICATION