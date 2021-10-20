class WIN32_PIPE_FUNCTIONS


feature {NONE}

	-- CallNamedPipe

	CallNamedPipe (a_pNamedPipeName : POINTER;
		a_lpInBuffer : POINTER;
		a_nInBufferSize : INTEGER;
		a_lpOutBuffer : POINTER;
		a_nOutBufferSize : INTEGER;
		a_pBytesRead : POINTER;
		a_nTimeOut : INTEGER) : BOOLEAN is
--	CallNamedPipe (a_pNamedPipeName : STRING;
--		a_lpInBuffer : POINTER;
--		a_nInBufferSize : INTEGER;
--		a_lpOutBuffer : POINTER;
--		a_nOutBufferSize : INTEGER;
--		a_pBytesRead : INTEGER_REF;
--		a_nTimeOut : INTEGER) : BOOLEAN is
			-- The CallNamedPipe function connects to a message-type
			-- pipe (and waits if an instance of the pipe is not available),
			-- writes to and reads from the pipe, and then closes
			-- the pipe. 
		external "C use <windows.h>"
		end -- CallNamedPipe

feature {NONE}

	-- ConnectNamedPipe

	ConnectNamedPipe (a_hNamedPipe : POINTER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	ConnectNamedPipe (a_hNamedPipe : POINTER;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN is
			-- The ConnectNamedPipe function enables a named pipe
			-- server process to wait for a client process to connect
			-- to an instance of a named pipe. A client process connects
			-- by calling either the CreateFile or CallNamedPipe function.
		external "C use <windows.h>"
		end -- ConnectNamedPipe

	-- CreateNamedPipe

	CreateNamedPipe (a_pName : POINTER;
		a_dwOpenMode : INTEGER;
		a_dwPipeMode : INTEGER;
		a_nMaxInstances : INTEGER;
		a_nOutBufferSize : INTEGER;
		a_nInBufferSize : INTEGER;
		a_nDefaultTimeOut : INTEGER;
		a_pSecurityAttributes : POINTER) : POINTER is
--	CreateNamedPipe (a_pName : STRING;
--		a_dwOpenMode : INTEGER;
--		a_dwPipeMode : INTEGER;
--		a_nMaxInstances : INTEGER;
--		a_nOutBufferSize : INTEGER;
--		a_nInBufferSize : INTEGER;
--		a_nDefaultTimeOut : INTEGER;
--		a_pSecurityAttributes : WIN32_SECURITY_ATTRIBUTES) : POINTER is
			-- The CreateNamedPipe function creates an instance of
			-- a named pipe and returns a handle for subsequent pipe
			-- operations. A named pipe server process uses this function
			-- either to create the first instance of a specific named
			-- pipe and establish its basic attributes or to create
			-- a new instance of an existing named pipe. 
		external "C use <windows.h>"
		end -- CreateNamedPipe

	-- CreatePipe

	CreatePipe (a_hReadPipe : POINTER;
		a_hWritePipe : POINTER;
		a_pPipeAttributes : POINTER;
		a_nSize : INTEGER) : BOOLEAN is
--	CreatePipe (a_hReadPipe : POINTER;
--		a_hWritePipe : POINTER;
--		a_pPipeAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_nSize : INTEGER) : BOOLEAN is
			-- The CreatePipe function creates an anonymous pipe, and
			-- returns handles to the read and write ends of the pipe. 
		external "C use <windows.h>"
		end -- CreatePipe

	-- DisconnectNamedPipe

	DisconnectNamedPipe (a_hNamedPipe : POINTER) : BOOLEAN is
			-- The DisconnectNamedPipe function disconnects the server
			-- end of a named pipe instance from a client process.
		external "C use <windows.h>"
		end -- DisconnectNamedPipe

	-- GetNamedPipeHandleState

	GetNamedPipeHandleState (a_hNamedPipe : POINTER;
		a_pState : POINTER;
		a_pCurInstances : POINTER;
		a_pMaxCollectionCount : POINTER;
		a_pCollectDataTimeout : POINTER;
		a_pUserName : POINTER;
		a_nMaxUserNameSize : INTEGER) : BOOLEAN is
--	GetNamedPipeHandleState (a_hNamedPipe : POINTER;
--		a_pState : INTEGER_REF;
--		a_pCurInstances : INTEGER_REF;
--		a_pMaxCollectionCount : INTEGER_REF;
--		a_pCollectDataTimeout : INTEGER_REF;
--		a_pUserName : STRING;
--		a_nMaxUserNameSize : INTEGER) : BOOLEAN is
			-- The GetNamedPipeHandleState function retrieves information
			-- about a specified named pipe. The information returned
			-- can vary during the lifetime of an instance of the
			-- named pipe. 
		external "C use <windows.h>"
		end -- GetNamedPipeHandleState

	-- GetNamedPipeInfo

	GetNamedPipeInfo (a_hNamedPipe : POINTER;
		a_pFlags : POINTER;
		a_pOutBufferSize : POINTER;
		a_pInBufferSize : POINTER;
		a_pMaxInstances : POINTER) : BOOLEAN is
--	GetNamedPipeInfo (a_hNamedPipe : POINTER;
--		a_pFlags : INTEGER_REF;
--		a_pOutBufferSize : INTEGER_REF;
--		a_pInBufferSize : INTEGER_REF;
--		a_pMaxInstances : INTEGER_REF) : BOOLEAN is
			-- The GetNamedPipeInfo function retrieves information
			-- about the specified named pipe. 
		external "C use <windows.h>"
		end -- GetNamedPipeInfo

	-- PeekNamedPipe

	PeekNamedPipe (a_hPipe : POINTER;
		a_lpvBuffer : POINTER;
		a_cbBuffer : INTEGER;
		a_pcbRead : POINTER;
		a_pcbAvail : POINTER;
		a_pcbMessage : POINTER) : BOOLEAN is
--	PeekNamedPipe (a_hPipe : POINTER;
--		a_lpvBuffer : POINTER;
--		a_cbBuffer : INTEGER;
--		a_pcbRead : INTEGER_REF;
--		a_pcbAvail : INTEGER_REF;
--		a_pcbMessage : INTEGER_REF) : BOOLEAN is
			-- The PeekNamedPipe function copies data from a named
			-- or anonymous pipe into a buffer without removing it
			-- from the pipe. It also returns information about data
			-- in the pipe. 
		external "C use <windows.h>"
		end -- PeekNamedPipe

	-- SetNamedPipeHandleState

	SetNamedPipeHandleState (a_hNamedPipe : POINTER;
		a_pdwMode : POINTER;
		a_pcbMaxCollect : POINTER;
		a_pdwCollectDataTimeout : POINTER) : BOOLEAN is
--	SetNamedPipeHandleState (a_hNamedPipe : POINTER;
--		a_pdwMode : INTEGER_REF;
--		a_pcbMaxCollect : INTEGER_REF;
--		a_pdwCollectDataTimeout : INTEGER_REF) : BOOLEAN is
			-- The SetNamedPipeHandleState function sets the read
			-- mode and the blocking mode of the specified named pipe.
			-- If the specified handle is to the client end of a named
			-- pipe and if the named pipe server process is on a remote
			-- computer, the function can also be used to control
			-- local buffering. 
		external "C use <windows.h>"
		end -- SetNamedPipeHandleState

	-- TransactNamedPipe

	TransactNamedPipe (a_hNamedPipe : POINTER;
		a_lpvWriteBuf : POINTER;
		a_cbWriteBuf : INTEGER;
		a_lpvReadBuf : POINTER;
		a_cbReadBuf : INTEGER;
		a_pcbRead : POINTER;
		a_po : POINTER) : BOOLEAN is
--	TransactNamedPipe (a_hNamedPipe : POINTER;
--		a_lpvWriteBuf : POINTER;
--		a_cbWriteBuf : INTEGER;
--		a_lpvReadBuf : POINTER;
--		a_cbReadBuf : INTEGER;
--		a_pcbRead : INTEGER_REF;
--		a_po : WIN32_OVERLAPPED) : BOOLEAN is
			-- The TransactNamedPipe function combines into a single
			-- network operation the functions that write a message
			-- to and read a message from the specified named pipe.
		external "C use <windows.h>"
		end -- TransactNamedPipe

	-- WaitNamedPipe

	WaitNamedPipe (a_pszPipeName : POINTER;
		a_dwTimeout : INTEGER) : BOOLEAN is
--	WaitNamedPipe (a_pszPipeName : STRING;
--		a_dwTimeout : INTEGER) : BOOLEAN is
			-- The WaitNamedPipe function waits until either a time-out
			-- interval elapses or an instance of the specified named
			-- pipe is available to be connected to (that is, the
			-- pipe's server process has a pending ConnectNamedPipe
			-- operation on the pipe). 
		external "C use <windows.h>"
		end -- WaitNamedPipe

end -- class WIN32_PIPE_FUNCTIONS
