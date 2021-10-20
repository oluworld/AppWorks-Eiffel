indexing
	contents:    "AppWorks Action Class"
	description: "An abstract class that defines an action"
	library:     "AppWorks-Base"
	author:      "Mysterious Committer <oluoluolu@protonmail.com>"
	copyright:   "Copyright (c) 1999-2001, OluWorld SoftWorks!"
--	license:     ""
	completed:   no
	tested:      no
	date:        "$Date: 2001/03/23 14:27:16 $"
	revision:    "$Revision: 1.1 $"

class APPWORKS_BASE_ACTION

-- enum { actShellCmd, actSendMsg } ActionType;


feature -- actors

	exec : APPWORKS_BASE_EVENT is
		deferred
		end -- exec

	exec_and_wait : APPWORKS_BASE_EVENT is
		deferred
		end -- exec

feature -- accessors

	get_assoc_obj : APPWORKS_BASE_MESSAGE_TARGET is
		do
			Result := my_target
		end -- get_assoc_obj

feature -- modifiers

	set_cmd (cmd: STRING) is
		do
			my_cmd := cmd
		end -- set_cmd
		
feature

	my_type   : APPWORKS_BASE_ACTION_TYPE
	my_cmd    : STRING
	my_target : APPWORKS_BASE_MESSAGE_TARGET

end -- class APPWORKS_BASE_ACTION

