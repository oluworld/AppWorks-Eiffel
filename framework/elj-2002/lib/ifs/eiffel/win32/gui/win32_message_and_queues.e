indexing
	contents: "WIN32 message and queue functions"
	author: "Uwe Sander, usander@online.de"
	completed: yes
	tested: yes
	
class WIN32_MESSAGE_AND_QUEUES

--	------------------------------------------------------------------------
--	Following are the functions used with messages and message queues. 
--	
--	BroadcastSystemMessage
--	DefWindowProc
--	DispatchMessage
--	GetInputState
--	GetMessage
--	GetMessageExtraInfo
--	GetMessagePos
--	GetMessageTime
--	GetQueueStatus
--	InSendMessage
--	PeekMessage
--	PostMessage
--	PostQuitMessage
--	PostThreadMessage
--	RegisterWindowMessage
--	ReplyMessage
--	SendAsyncProc
--	SendMessage
--	SendMessageCallback
--	SendMessageTimeout
--	SendNotifyMessage
--	SetMessageExtraInfo
--	TranslateMessage
--	WaitMessage
--	------------------------------------------------------------------------

feature {NONE}

	BroadcastSystemMessage (a_flags:	INTEGER;
							a_info:		POINTER;
							a_msg:		INTEGER;
							a_wparam:	INTEGER;
							a_lparam:	INTEGER): INTEGER is
			--	The BroadcastSystemMessage function sends a message to
			-- the specified	recipients. The recipients can be applications,
			-- installable drivers, Windows-based network drivers,
			-- system-level device drivers, or any combination of these
			-- system components. 
		external "C use <windows.h>"
		end -- BroadcastSystemMessage
		
	DefWindowProc (	a_window:	POINTER;
					a_msg:		INTEGER;
					a_wparam:	INTEGER;
					a_lparam:	INTEGER): INTEGER is
			--	The DefWindowProc function calls the default window procedure to 
			--	provide default processing for any window messages that an application 
			--	does not process. This function ensures that every message is 
			--	processed. DefWindowProc is called with the same parameters received by 
			--	the window procedure. 
		external "C use <windows.h>"
		end -- DefWindowProc
		
	DispatchMessage (a_msg: POINTER) : INTEGER is
			--	DispatchMessage (a_msg: WIN32_MSG) : INTEGER is
			--	The DispatchMessage function dispatches a message
			-- to a window procedure. It is typically used to
			-- dispatch a message retrieved by the GetMessage fn.
		external "C use <windows.h>"
		end -- DispatchMessage
		
	GetInputState: BOOLEAN is
			--	The GetInputState function determines whether there are
			-- mouse-button or keyboard messages in the calling thread's
			-- message queue. 
		external "C use <windows.h>"
		end -- GetInputState
		
	GetMessage (a_msg:		POINTER;
				a_window:	POINTER;
				a_min_msg:	INTEGER;
				a_max_msg:	INTEGER): BOOLEAN is
			--	The GetMessage function retrieves a message from the
			-- calling thread's message queue and places it in the
			-- specified structure. This function can retrieve both
			-- messages associated with a specified window and thread
			--	messages posted via the PostThreadMessage function.
			-- The function retrieves messages that lie within a
			-- specified range of message values. GetMessage does
			-- not retrieve messages for windows that belong to other
			--	threads or applications. 
		external "C use <windows.h>"
		end -- GetMessage
		
	GetMessageExtraInfo: INTEGER is
			--	The GetMessageExtraInfo function retrieves extra
			-- information associated with the last message retrieved
			-- by the GetMessage or PeekMessage function. This
			-- information may be added to a message by the driver
			--	for a pointing device or keyboard. 
		external "C use <windows.h>"
		end -- GetMessageExtraInfo

	GetMessagePos: INTEGER is
			--	The GetMessagePos function returns a long value that gives
			-- the cursor position in screen coordinates. This position is
			-- the point occupied by the cursor when the last message
			-- retrieved by the GetMessage function occurred. 
		external "C use <windows.h>"
		end -- GetMessagePos

	GetMessageTime: INTEGER is
			--	The GetMessageTime function returns the message time for
			-- the last message retrieved by the GetMessage function from
			-- the current thread's message queue. The time is a long
			-- integer that specifies the elapsed time, in milliseconds,
			-- from the time the system was started to the time the message
			-- was created (that is, placed in the thread's message queue). 
		external "C use <windows.h>"
		end -- GetMessageTime

	GetQueueStatus (a_flags: INTEGER): INTEGER is
			--	The GetQueueStatus function returns flags that indicate the
			-- type of messages found in the calling thread's message queue. 
		external "C use <windows.h>"
		end -- GetQueueStatus
	
	InSendMessage: BOOLEAN is
			--	The InSendMessage function specifies whether the current
			-- window procedure is processing a message that was sent from
			-- another thread by a call to the SendMessage function. 
		external "C use <windows.h>"
		end -- InSendMessage
		
	PeekMessage (	a_msg:		POINTER;
					a_window:	POINTER;
					a_min_msg:	INTEGER;
					a_max_msg:	INTEGER;
					do_remove:	INTEGER): BOOLEAN is
			--	PeekMessage (	a_msg:		WIN32_MSG;
			--					a_window:	POINTER;
			--					a_min_msg:	INTEGER;
			--					a_max_msg:	INTEGER;
			--					do_remove:	INTEGER): BOOLEAN is
			--	The PeekMessage function checks a thread message queue for
			-- a message and places the message (if any) in the specified
			-- structure. 
		external "C use <windows.h>"
		end -- PeekMessage
		
	PostMessage (	a_window:	POINTER;
					a_msg:		INTEGER;
					a_wparam:	INTEGER;
					a_lparam:	INTEGER): BOOLEAN is
			--	The PostMessage function places (posts) a message in the
			-- message queue associated with the thread that created the
			-- specified window and then returns without waiting for the
			-- thread to process the message. Messages in a message queue
			-- are retrieved by calls to the GetMessage or PeekMessage
			-- function. 
		external "C use <windows.h>"
		end -- PostMessage

	PostQuitMessage (a_exit_code: INTEGER) is
			--	The PostQuitMessage function indicates to Windows that
			-- a thread has made a request to terminate (quit). It is
			-- typically used in response to a WM_DESTROY message. 
		external "C use <windows.h>"
		end -- PostQuitMessage
		
	PostThreadMessage (	a_thread:	INTEGER;
						a_msg:		INTEGER;
						a_wparam:	INTEGER;
						a_lparam:	INTEGER): BOOLEAN is
			--	The PostThreadMessage function places (posts) a message
			-- in the message queue of the specified thread and then
			-- returns without waiting for the thread to process the message. 
		external "C use <windows.h>"
		end -- PostThreadMessage
		
	RegisterWindowMessage (a_ident: POINTER): INTEGER is
			--	RegisterWindowMessage (a_ident: STRING): INTEGER is
			--	The RegisterWindowMessage function defines a new window
			-- message that is guaranteed to be unique throughout the
			-- system. The returned message value can be used when
			-- calling the SendMessage or PostMessage function. 
		external "C use <windows.h>"
		end -- RegisterWindowMessage
		
	ReplyMessage (a_result: INTEGER): BOOLEAN is
			--	The ReplyMessage function is used to reply to a message
			-- sent through the SendMessage function without returning
			-- control to the function that called SendMessage. 
		external "C use <windows.h>"
		end -- ReplyMessage
		
	SendMessage (	a_window:	POINTER;
					a_msg:		INTEGER;
					a_wparam:	INTEGER;
					a_lparam:	INTEGER): INTEGER is
			--	The SendMessage function sends the specified message to
			-- a window or windows. The function calls the window
			-- procedure for the specified window and does not return
			-- until the window procedure has processed the message.
			-- The PostMessage function, in contrast, posts a message
			-- to a thread's message queue and returns immediately. 
		external "C use <windows.h>"
		end -- SendMessage
		
	SendMessageCallback (	a_window:	POINTER;
							a_msg:		INTEGER;
							a_wparam:	INTEGER;
							a_lparam:	INTEGER;
							a_callback:	POINTER;
							a_data:		INTEGER): BOOLEAN is
			--	The SendMessageCallback function sends the specified message to
			-- a window or windows. The function calls the window procedure
			-- for the specified window and returns immediately. After the
			-- window procedure processes the message, the system calls the
			-- specified callback function, passing the result of the message
			-- processing and an application-defined value to the callback
			-- function. 
		do
			Result := c_SendMessageCallback (	a_window,
												a_msg,
												a_wparam,
												a_lparam,
												Current.to_pointer,
												a_callback,
												a_data)
		end -- SendMessageCallback
		
	SendMessageTimeout (a_window:	POINTER;
						a_msg:		INTEGER;
						a_wparam:	INTEGER;
						a_lparam:	INTEGER;
						a_flags:	BIT 32;
						a_timeout:	INTEGER;
						a_result:	POINTER): INTEGER is
			--	The SendMessageTimeout function sends the specified message
			-- to a window or windows. The function calls the window procedure
			-- for the specified window and, if the specified window belongs
			-- to a different thread, does not return until the window
			-- procedure has processed the message or the specified time-out
			-- period has elapsed. If the window receiving the message belongs
			-- to the same queue as the current thread, the window procedure
			-- is called directly the time-out value is ignored.
		external "C use <windows.h>"
		end -- SendMessageTimeout
		
	SendNotifyMessage (	a_window:	POINTER;
						a_msg:		INTEGER;
						a_wparam:	INTEGER;
						a_lparam:	INTEGER): BOOLEAN is
			--	The SendNotifyMessage function sends the specified message
			-- to a window. If the window was created by the calling thread,
			-- SendNotifyMessage calls the window procedure for the window
			-- and does not return until the window procedure has processed
			-- the message. If the window was created by a different thread,
			-- SendNotifyMessage passes the message to the window procedure
			-- and returns immediately; it does not wait for the window
			-- procedure to finish processing the message. 
		external "C use <windows.h>"
		end -- SendNotifyMessage
		
	SetMessageExtraInfo (a_info: INTEGER): INTEGER is
			--	The SetMessageExtraInfo function sets the extra message
			-- information for the current thread. Extra message information
			-- is an application- or driver-defined 32-bit value associated
			-- with the current thread's message queue. An application can
			-- use the GetMessageExtraInfo function to retrieve a thread's
			-- extra message information.
		external "C use <windows.h>"
		end -- SetMessageExtraInfo

	TranslateMessage (a_msg: POINTER) : BOOLEAN is
	--	TranslateMessage (a_msg: WIN32_MSG) : BOOLEAN is
			--	The TranslateMessage function translates virtual-key
			-- messages into character messages. The character messages are
			-- posted to the calling thread's message queue, to be read the
			-- next time the thread calls the GetMessage or PeekMessage function. 
		external "C use <windows.h>"
		end -- TranslateMessage
		
	WaitMessage: BOOLEAN is
			--	The WaitMessage function yields control to other threads
			-- when a threadhas no other messages in its message queue.
			-- The WaitMessage function suspends the thread and does not
			-- return until a new message is placed in the thread's
			-- message queue. 
		external "C use <windows.h>"
		end -- WaitMessage
		
feature {NONE}

	c_SendMessageCallback (	a_window:	POINTER;
							a_msg:		INTEGER;
							a_wparam:	INTEGER;
							a_lparam:	INTEGER;
							a_object:	POINTER;
							a_callback:	POINTER;
							a_data:		INTEGER): BOOLEAN is
		external "C"
		end -- c_SendMessageCallback
							
end -- class WIN32_MESSAGE_AND_QUEUES