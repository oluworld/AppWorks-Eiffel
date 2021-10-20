#include "windows.h"

#include "eiffel_glue.h"
#include "e2c_eiffelproc_global.h"	

EIF_INTEGER cw_usedefault()
{
	return (EIF_INTEGER)CW_USEDEFAULT;
}

/*
	------------------------------------------------------------------------
	SendMessageCallback

	The SendMessageCallback function sends the specified message to a window
	or windows. The function calls the window procedure for the specified
	window and returns immediately. After the window procedure processes
	the message, the system calls the specified callback function, passing
	the result of the message processing and an application-defined value
	to the callback function. 

	BOOL SendMessageCallback(
		HWND hWnd,	// handle of destination window
		UINT Msg,	// message to send
		WPARAM wParam,	// first message parameter
		LPARAM lParam,	// second message parameter
		SENDASYNCPROC lpResultCallBack,	// function to receive message value
		DWORD dwData 	// value to pass to callback function
	);	
 

	Parameters

	* hWnd

	  Identifies the window whose window procedure will receive the message.
	  If this parameter is HWND_BROADCAST, the message is sent to all
	  top-level windows in the system, including disabled or invisible
	  unowned windows, overlapped windows, and pop-up windows; but the
	  message is not sent to child windows. 

	* Msg

	  Specifies the message to be sent. 

	* wParam

	  Specifies additional message-specific information. 

	* lParam

	  Specifies additional message-specific information. 

	* lpResultCallBack

	  Points to a callback function that the system calls after the window
	  procedure processes the message. See SendAsyncProc for information
	  on suitable callback functions. 

	  If hWnd is HWND_BROADCAST, the operating system calls the
	  SendAsyncProc callback function once for each top-level window.

	* dwData

	  Specifies an application-defined value to be sent to the callback
	  function pointed to by the lpfnResultCallBack parameter. 


	Return Values

	If the function succeeds, the return value is nonzero.
	If the function fails, the return value is zero. To get extended
	error information, call GetLastError. 

	Remarks

	If you send a message in the range below WM_USER to the asynchronous
	message functions (PostMessage, SendNotifyMessage, and
	SendMessageCallback), make sure that the message parameters do not
	include pointers. Otherwise, the functions will return before the
	receiving thread has had a chance to process the message and the
	sender will free the memory before it is used.
	Applications that need to communicate using HWND_BROADCAST should
	use the RegisterWindowMessage function to obtain a unique message
	for inter-application communication.

	The callback function is called only when the thread that called
	SendMessageCallback also calls GetMessage, PeekMessage, or WaitMessage.
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_SendMessageCallback (	EIF_INTEGER hWnd,
									EIF_INTEGER Msg,
									EIF_INTEGER wParam,
									EIF_INTEGER lParam,
									EIF_POINTER lpCurrent,
									EIF_POINTER lpResultCallBack,
									EIF_INTEGER dwData)
{
	SendAsyncObj[0] = lpCurrent;
	SendAsyncObj[1] = lpResultCallBack;
	
	return (EIF_BOOLEAN) SendMessageCallback (	(HWND)			hWnd,
												(UINT)			Msg,
												(WPARAM)		wParam,
												(LPARAM)		lParam,
												(SENDASYNCPROC)	c_send_async_proc,
												(DWORD)			dwData);
}
