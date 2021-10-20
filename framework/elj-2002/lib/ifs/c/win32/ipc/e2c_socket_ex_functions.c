#include <windows.h>
#include <winsock2.h>

#include "eiffel_glue.h"

/*
	------------------------------------------------------------------------
	The Windows Sockets specification provides a number of extensions to the 
	standard set of Berkeley Sockets routines. Principally, these extended 
	functions allow message or function-based, asynchronous access to 
	network events, as well as enable overlapped I/O. While use of this 
	extended API set is not mandatory for socket-based programming (with the 
	exception of WSAStartup and WSACleanup), it is recommended for 
	conformance with the Microsoft Windows programming paradigm. For 
	features introduced in Windows Sockets 2, please see New Concepts, 
	Additions and Changes for Windows Sockets 2.
	
	WSAAccept 1                An extended version of accept which allows 
	                           for conditional acceptance and socket 
	                           grouping.
	WSAAsyncGetHostByAddr 2
	WSAAsyncGetHostByName 2
	WSAAsyncGetProtoByName 2
	WSAAsyncGetProtoByNumber 2
	WSAAsyncGetServByName 2
	WSAAsyncGetServByPort 2    A set of functions which provide asynchronous 
	                           versions of the standard Berkeley getXbyY 
	                           functions. For example, the 
	                           WSAAsyncGetHostByName function provides an 
	                           asynchronous message based implementation of 
	                           the standard Berkeley gethostbyname function.
	WSAAsyncSelect             Perform asynchronous version of select
	WSACancelAsyncRequest 2    Cancel an outstanding instance of a 
	                           WSAAsyncGetXByY function.
	WSACleanup                 Sign off from the underlying Windows Sockets 
	                           DLL.
	WSACloseEvent              Destroys an event object.
	WSAConnect 1               An extended version of connect which allows 
	                           for exchange of connect data and QOS 
	                           specification.
	WSACreateEvent             Creates an event object.
	WSADuplicateSocket         Allow an underlying socket to be shared by 
	                           creating a virtual socket.
	WSAEnumNetworkEvents       Discover occurrences of network events.
	WSAEnumProtocols           Retrieve information about each available 
	                           protocol.
	WSAEventSelect             Associate network events with an event object.
	WSAGetLastError            Obtain details of last Windows Sockets error
	WSAGetOverlappedResult     Get completion status of overlapped operation.
	WSAGetQOSByName            Supply QOS parameters based on a well-known 
	                           service name.
	WSAHtonl                   Extended version of htonl
	WSAHtons                   Extended version of htons
	WSAIoctl 1                 Overlapped-capable version of ioctl
	WSAJoinLeaf 1              Add a multipoint leaf to a multipoint session
	WSANtohl                   Extended version of ntohl
	WSANtohs                   Extended version of ntohs
	WSARecv 1                  An extended version of recv which 
	                           accommodates scatter/gather I/O, overlapped 
	                           sockets and provides the flags parameter as 
	                           IN OUT
	WSARecvFrom 1              An extended version of recvfrom which 
	                           accommodates scatter/gather I/O, overlapped 
	                           sockets and provides the flags parameter as 
	                           IN OUT
	WSAResetEvent              Resets an event object.
	WSASend 1                  An extended version of send which 
	                           accommodates scatter/gather I/O and 
	                           overlapped sockets
	WSASendTo 1                An extended version of sendto which 
	                           accommodates scatter/gather I/O and 
	                           overlapped sockets
	WSASetEvent                Sets an event object.
	WSASetLastError            Set the error to be returned by a subsequent 
	                           WSAGetLastError
	WSASocket                  An extended version of socket which takes a 
	                           WSAPROTOCOL_INFO struct as input and allows 
	                           overlapped sockets to be created. Also allows 
	                           socket groups to be formed.
	WSAStartup                 Initialize the underlying Windows Sockets DLL.
	WSAWaitForMultipleEvents 1 Blocks on multiple event objects.
	1  The routine can block if acting on a blocking socket.
	2  The routine is always realized by the name resolution provider 
	   associated with the default TCP/IP service provider, if any.	
	------------------------------------------------------------------------
*/

// ========================================================================

/*
	------------------------------------------------------------------------
	WSAAccept
	
	The Windows Sockets WSAAccept function conditionally accepts a 
	connection based on the return value of a condition function, and 
	optionally creates and/or joins a socket group.
	
	SOCKET WSAAccept (
		SOCKET s,	
		struct sockaddr FAR * addr,	
		LPINT addrlen,	
		LPCONDITIONPROC lpfnCondition,	
		DWORD dwCallbackData	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a socket which is listening for 
	  connections after a listen.
	
	* addr
	
	  [out] An optional pointer to a buffer which receives the address of 
	  the connecting entity, as known to the communications layer. The exact 
	  format of the addr argument is determined by the address family 
	  established when the socket was created.
	
	* addrlen
	
	  [in/out] An optional pointer to an integer which contains the length 
	  of the address addr.
	
	* lpfnCondition
	
	  [in] The procedure instance address of the optional, application-
	  supplied condition function which will make an accept/reject decision 
	  based on the caller information passed in as parameters, and 
	  optionally create and/or join a socket group by assigning an 
	  appropriate value to the result parameter g of this function.
	
	* dwCallbackData
	
	  [in] The callback data passed back to the application as a condition 
	  function parameter. This parameter is not interpreted by Windows 
	  Sockets.
	
	
	Remarks
	
	This routine extracts the first connection on the queue of pending 
	connections on s, and checks it against the condition function, provided 
	the condition function is specified (that is, not NULL). If the 
	condition function returns CF_ACCEPT, this routine creates a new socket 
	and performs any socket grouping as indicated by the result parameter g 
	in the condition function. The newly created socket has the same 
	properties as s including asynchronous events registered with 
	WSAAsyncSelect or with WSAEventSelect, but not including the listening 
	socket's group ID, if any. If the condition function returns CF_REJECT, 
	this routine rejects the connection request. The condition function runs 
	in the same thread as this routine does, and should return as soon as 
	possible. If the decision cannot be made immediately, the condition 
	function should return CF_DEFER to indicate that no decision has been 
	made, and no action about this connection request should be taken by the 
	service provider. When the application is ready to take action on the 
	connection request, it will invoke WSAAccept again and return either 
	CF_ACCEPT or CF_REJECT as a return value from the condition function.
	
	For sockets which remain in the (default) blocking mode, if no pending 
	connections are present on the queue, WSAAccept blocks the caller until 
	a connection is present. For sockets in a nonblocking mode, if this 
	function is called when no pending connections are present on the queue, 
	WSAAccept returns an error as described below. The accepted socket 
	cannot be used to accept more connections. The original socket remains 
	open.
	The argument addr is a result parameter that is filled in with the 
	address of the connecting entity, as known to the communications layer. 
	The exact format of the addr parameter is determined by the address 
	family in which the communication is occurring. The addrlen is a value-
	result parameter; it should initially contain the amount of space 
	pointed to by addr. On return, it will contain the actual length (in 
	bytes) of the address returned. This call is used with connection-
	oriented socket types such as SOCK_STREAM. If addr and/or addrlen are 
	equal to NULL, then no information about the remote address of the 
	accepted socket is returned. Otherwise, these two parameters will be 
	filled in regardless of whether the condition function is specified or 
	what it returns.
	
	The prototype of the condition function is as follows:
	
	int CALLBACK ConditionFunc(
		IN LPWSABUF lpCallerId,
		IN LPWSABUF lpCallerData,
		IN OUT LPQOS lpSQOS,
		IN OUT LPQOS lpGQOS,
		IN LPWSABUF lpCalleeId,
		OUT LPWSABUF lpCalleeData,
		OUT GROUP FAR * g,
		IN DWORD dwCallbackData
	);
	
	ConditionFunc is a placeholder for the application-supplied function 
	name. In 16-bit Windows environments, it is invoked in the same thread 
	as WSAAccept, thus no other Windows Sockets functions can be called 
	except WSAIsBlocking and WSACancelBlockingCall. The actual condition 
	function must reside in a DLL or application module and be exported in 
	the module definition file. You must use MakeProcInstance to get a 
	procedure-instance address for the callback function.
	
	The lpCallerId and lpCallerData are value parameters which contain the 
	address of the connecting entity and any user data that was sent along 
	with the connection request, respectively. If no caller ID or caller 
	data is available, the corresponding parameters will be NULL.
	lpSQOS references the flow specifications for socket s specified by the 
	caller, one for each direction, followed by any additional provider-
	specific parameters. The sending or receiving flow specification values 
	will be ignored as appropriate for any unidirectional sockets. A NULL 
	value for lpSQOS indicates no caller supplied QOS. QOS information can 
	be returned if a QOS negotiation is to occur.
	
	lpGQOS references the flow specifications for the socket group the 
	caller is to create, one for each direction, followed by any additional 
	provider-specific parameters. A NULL value for lpGQOS indicates no 
	caller-supplied group QOS. QOS information can be returned if a QOS 
	negotiation is to occur.
	The lpCalleeId is a value parameter which contains the local address of 
	the connected entity. The lpCalleeData is a result parameter used by the 
	condition function to supply user data back to the connecting entity. 
	lpCalleeData->len initially contains the length of the buffer allocated 
	by the service provider and pointed to by lpCalleeData->buf. A value of 
	zero means passing user data back to the caller is not supported. The 
	condition function should copy up to lpCalleeData->len bytes of data 
	into lpCalleeData->buf, and then update lpCalleeData->len to indicate 
	the actual number of bytes transferred. If no user data is to be passed 
	back to the caller, the condition function should set lpCalleeData->len 
	to zero. The format of all address and user data is specific to the 
	address family to which the socket belongs.
	
	The result parameter g is assigned within the condition function to 
	indicate the following actions:
	
	1. if &g is an existing socket group ID, add s to this group, provided 
	   all the requirements set by this group are met; or
	2. if &g = SG_UNCONSTRAINED_GROUP, create an unconstrained socket group 
	   and have s as the first member; or
	3. if &g = SG_CONSTRAINED_GROUP, create a constrained socket group and 
	   have s as the first member; or
	4. if &g = zero, no group operation is performed.
	
	 
	
	For unconstrained groups, any set of sockets can be grouped together as 
	long as they are supported by a single service provider. A constrained 
	socket group can consist only of connection-oriented sockets, and 
	requires that connections on all grouped sockets be to the same address 
	on the same host. For newly created socket groups, the new group ID can 
	be retrieved by using getsockopt with option SO_GROUP_ID, if this 
	operation completes successfully. A socket group and its associated ID 
	remain valid until the last socket belonging to this socket group is 
	closed. Socket group IDs are unique across all processes for a given 
	service provider.
	
	Return Values
	
	If no error occurs, WSAAccept returns a value of type SOCKET which is a 
	descriptor for the accepted socket. Otherwise, a value of INVALID_SOCKET 
	is returned, and a specific error code can be retrieved by calling 
	WSAGetLastError.
	The integer referred to by addrlen initially contains the amount of 
	space pointed to by addr. On return it will contain the actual length in 
	bytes of the address returned.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAECONNREFUSED    The connection request was forcefully rejected as 
	                   indicated in the return value of the condition 
	                   function (CF_REJECT).
	WSAENETDOWN        The network subsystem has failed.
	WSAEFAULT          The addrlen argument is too small or the 
	                   lpfnCondition is not part of the user address space.
	WSAEINTR           The (blocking) call was canceled through 
	                   WSACancelBlockingCall.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress.
	WSAEINVAL          listen was not invoked prior to WSAAccept, parameter 
	                   g specified in the condition function is not a valid 
	                   value, the source address of the incoming connection 
	                   request is not consistent with that of the 
	                   constrained group the parameter g is referring to, 
	                   the return value of the condition function is not a 
	                   valid one, or any case where the specified socket is 
	                   in an invalid state.
	WSAEMFILE          The queue is nonempty upon entry to WSAAccept and 
	                   there are no socket descriptors available.
	WSAENOBUFS         No buffer space is available.
	WSAENOTSOCK        The descriptor is not a socket.
	WSAEOPNOTSUPP      The referenced socket is not a type that supports 
	                   connection-oriented service.
	WSATRY_AGAIN       The acceptance of the connection request was deferred 
	                   as indicated in the return value of the condition 
	                   function (CF_DEFER).
	WSAEWOULDBLOCK     The socket is marked as nonblocking and no 
	                   connections are present to be accepted.
	WSAEACCES          The connection request that was offered has timed out 
	                   or been withdrawn.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAccept (	EIF_INTEGER s,
							EIF_POINTER addr,
							EIF_POINTER addrlen,
							EIF_POINTER lpfnCondition,
							EIF_INTEGER dwCallbackData)
{
	return (EIF_INTEGER) WSAAccept ((SOCKET)			s,
									(struct sockaddr*)	addr,
									(LPINT)				addrlen,
									(LPCONDITIONPROC)	lpfnCondition,
									(DWORD)				dwCallbackData);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetHostByAddr
	
	The Windows Sockets WSAAsyncGetHostByAddr function gets host information 
	corresponding to an address¾asynchronous version.
	
	HANDLE WSAAsyncGetHostByAddr (
		HWND hWnd,	
		unsigned int wMsg,	
		const char FAR * addr,	
		int len,	
		int type,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the asynchronous request completes.
	
	* wMsg
	
	  [in] The message to be received when the asynchronous request completes.
	
	* addr
	
	  [in] A pointer to the network address for the host. Host addresses are stored in network byte order.
	
	* len
	
	  [in] The length of the address.
	
	* type
	
	  [in] The type of the address.
	
	* buf
	
	  [out] A pointer to the data area to receive the hostent data. Note that this must be larger than the size of a hostent structure. This is because the data area supplied is used by Windows Sockets to contain not only a hostent structure but any and all of the data which is referenced by members of the hostent structure. It is recommended that you supply a buffer of MAXGETHOSTSTRUCT bytes.
	
	* buflen
	
	  [in] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of gethostbyaddr, and is used 
	to retrieve host name and address information corresponding to a network 
	address. Windows Sockets initiates the operation and returns to the 
	caller immediately, passing back an opaque "asynchronous task handle" 
	which the application can use to identify the operation. When the 
	operation is completed, the results (if any) are copied into the buffer 
	provided by the caller and a message is sent to the application's 
	window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	hostent structure. To access the elements of this structure, the 
	original buffer address should be cast to a hostent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetHostByAddr function call with 
	a buffer large enough to receive all the desired information (that is, 
	no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetHostByAddr 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle (not to be confused with a Windows HTASK) for the request. This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, 
	WSAAsyncGetHostByAddr returns a zero value, and a specific error number 
	can be retrieved by calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a structure together with the contents of data areas 
	referenced by members of the same hostent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          addr or buf is not in a valid part of the process 
	                   address space.
	WSAHOST_NOT_FOUND  Authoritative Answer Host not found.
	WSATRY_AGAIN       Non-Authoritative Host not found, or SERVERFAIL.
	WSANO_RECOVERY     Nonrecoverable errors, FORMERR, REFUSED, NOTIMP.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetHostByAddr (	EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_POINTER addr,
										EIF_INTEGER len,
										EIF_INTEGER type,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetHostByAddr ((HWND)			hWnd,
												(unsigned int)	wMsg,
												(const char*)	addr,
												(int)			len,
												(int)			type,
												(char*)			buf,
												(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetHostByName

	The Windows Sockets WSAAsyncGetHostByName function gets host information 
	corresponding to a hostname

	asynchronous version.
	
	HANDLE WSAAsyncGetHostByName (
		HWND hWnd,	
		unsigned int wMsg,	
		const char FAR * name,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the 
	  asynchronous request completes.

	* wMsg

	  [in] The message to be received when the asynchronous request 
	  completes.

	* name

	  [in] A pointer to the null terminated name of the host.

	* buf

	  [out] A pointer to the data area to receive the hostent data. Note 
	  that this must be larger than the size of a hostent structure. This is 
	  because the data area supplied is used by Windows Sockets to contain 
	  not only a hostent structure but any and all of the data which is 
	  referenced by members of the hostent structure. It is recommended that 
	  you supply a buffer of MAXGETHOSTSTRUCT bytes.
	
	* buflen
	
	  [in] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of gethostbyname, and is used 
	to retrieve host name and address information corresponding to a 
	hostname. Windows Sockets initiates the operation and returns to the 
	caller immediately, passing back an opaque "asynchronous task handle" 
	which the application can use to identify the operation. When the 
	operation is completed, the results (if any) are copied into the buffer 
	provided by the caller and a message is sent to the application's 
	window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	hostent structure. To access the elements of this structure, the 
	original buffer address should be cast to a hostent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetHostByName function call with 
	a buffer large enough to receive all the desired information (that is, 
	no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	WSAAsyncGetHostByName is guaranteed to resolve the string returned by a 
	successful call to gethostname.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetHostByName 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle (not to be confused with a Windows HTASK) for the request. This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, 
	WSAAsyncGetHostByName returns a zero value, and a specific error number 
	can be retrieved by calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a hostent structure together with the contents of data areas 
	referenced by members of the same hostent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          name or buf is not in a valid part of the process 
	                   address space.
	WSAHOST_NOT_FOUND  Authoritative Answer Host not found.
	WSATRY_AGAIN       Non-Authoritative Host not found, or SERVERFAIL.
	WSANO_RECOVERY     Nonrecoverable errors, FORMERR, REFUSED, NOTIMP.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetHostByName (	EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_POINTER name,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetHostByName ((HWND)			hWnd,
												(unsigned int)	wMsg,
												(const char*)	name,
												(char*)			buf,
												(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetProtoByName
	
	The Windows Sockets WSAAsyncGetProtoByName function gets protocol 
	information corresponding to a protocol name

	asynchronous version.
	
	HANDLE WSAAsyncGetProtoByName (
		HWND hWnd,	
		unsigned int wMsg,	
		const char FAR * name,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the asynchronous request completes.
	
	* wMsg
	
	  [in] The message to be received when the asynchronous request completes.
	
	* name
	
	  [in] A pointer to the null terminated protocol name to be resolved.
	
	* buf
	
	  [out] A pointer to the data area to receive the protoent data. Note that this must be larger than the size of a protoent structure. This is because the data area supplied is used by Windows Sockets to contain not only a protoent structure but any and all of the data which is referenced by members of the protoent structure. It is recommended that you supply a buffer of MAXGETHOSTSTRUCT bytes.
	
	* buflen
	
	  [out] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of getprotobyname, and is used 
	to retrieve the protocol name and number corresponding to a protocol 
	name. Windows Sockets initiates the operation and returns to the caller 
	immediately, passing back an opaque "asynchronous task handle" which the 
	application can use to identify the operation. When the operation is 
	completed, the results (if any) are copied into the buffer provided by 
	the caller and a message is sent to the application's window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	protoent structure. To access the elements of this structure, the 
	original buffer address should be cast to a protoent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetProtoByName function call with 
	a buffer large enough to receive all the desired information (that is, 
	no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetProtoByName 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle for the request (not to be confused with a Windows HTASK). This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, 
	WSAAsyncGetProtoByName returns a zero value, and a specific error number 
	can be retrieved by calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a protoent structure together with the contents of data areas 
	referenced by members of the same protoent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          name or buf is not in a valid part of the process 
	                   address space.
	WSAHOST_NOT_FOUND  Authoritative Answer Protocol not found.
	WSATRY_AGAIN       Non-Authoritative Protocol not found, or server 
	                   failure.
	WSANO_RECOVERY     Nonrecoverable errors, the protocols database is not 
	                   accessible.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetProtoByName (	EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_POINTER name,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetProtoByName (	(HWND)			hWnd,
													(unsigned int)	wMsg,
													(const char*)	name,
													(char*)			buf,
													(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetProtoByNumber
	
	The Windows Sockets WSAAsyncGetProtoByNumber function gets protocol 
	information corresponding to a protocol number

	asynchronous version.
	
	HANDLE WSAAsyncGetProtoByNumber (
		HWND hWnd,	
		unsigned int wMsg,	
		int number,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the 
	  asynchronous request completes.

	* wMsg

	  [in] The message to be received when the asynchronous request 
	  completes.

	* number

	  [in] The protocol number to be resolved, in host byte order.

	* buf

	  [out] A pointer to the data area to receive the protoent data. Note 
	  that this must be larger than the size of a protoent structure. This 
	  is because the data area supplied is used by Windows Sockets to 
	  contain not only a protoent structure but any and all of the data 
	  which is referenced by members of the protoent structure. It is 
	  recommended that you supply a buffer of MAXGETHOSTSTRUCT bytes.

	* buflen

	  [in] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of getprotobynumber, and is 
	used to retrieve the protocol name and number corresponding to a 
	protocol number. Windows Sockets initiates the operation and returns to 
	the caller immediately, passing back an opaque "asynchronous task 
	handle" which the application can use to identify the operation. When 
	the operation is completed, the results (if any) are copied into the 
	buffer provided by the caller and a message is sent to the application's 
	window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	protoent structure. To access the elements of this structure, the 
	original buffer address should be cast to a protoent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetProtoByNumber function call 
	with a buffer large enough to receive all the desired information (that 
	is, no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetProtoByNumber 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle for the request (not to be confused with a Windows HTASK). This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, 
	WSAAsyncGetProtoByNumber returns a zero value, and a specific error 
	number can be retrieved by calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a protoent structure together with the contents of data areas 
	referenced by members of the same protoent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          buf is not in a valid part of the process address 
	                   space.
	WSAHOST_NOT_FOUND  Authoritative Answer Protocol not found.
	WSATRY_AGAIN       Non-Authoritative Protocol not found, or server 
	                   failure.
	WSANO_RECOVERY     Nonrecoverable errors, the protocols database is not 
	                   accessible.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetProtoByNumber (EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_INTEGER number,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetProtoByNumber (	(HWND)			hWnd,
													(unsigned int)	wMsg,
													(int)			number,
													(char*)			buf,
													(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetServByName
	
	The Windows Sockets WSAAsyncGetServByName function gets service 
	information corresponding to a service name and port

	asynchronous version.
	
	HANDLE WSAAsyncGetServByName (
		HWND hWnd,	
		unsigned int wMsg,	
		const char FAR * name,	
		const char FAR * proto,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the 
	  asynchronous request completes.

	* wMsg

	  [in] The message to be received when the asynchronous request 
	  completes.

	* name

	  [in] A pointer to a null terminated service name.

	* proto

	  [in] A pointer to a protocol name. This can be NULL, in which case 
	  WSAAsyncGetServByName will search for the first service entry for 
	  which s_name or one of the s_aliases matches the given name. 
	  Otherwise, WSAAsyncGetServByName matches both name and proto.

	* buf

	  [out] A pointer to the data area to receive the servent data. Note 
	  that this must be larger than the size of a servent structure. This is 
	  because the data area supplied is used by Windows Sockets to contain 
	  not only a servent structure but any and all of the data which is 
	  referenced by members of the servent structure. It is recommended that 
	  you supply a buffer of MAXGETHOSTSTRUCT bytes.
	
	* buflen
	
	  [in] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of getservbyname, and is used 
	to retrieve service information corresponding to a service name. Windows 
	Sockets initiates the operation and returns to the caller immediately, 
	passing back an opaque "asynchronous task handle" which the application 
	can use to identify the operation. When the operation is completed, the 
	results (if any) are copied into the buffer provided by the caller and a 
	message is sent to the application's window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	servent structure. To access the elements of this structure, the 
	original buffer address should be cast to a servent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetServByName function call with 
	a buffer large enough to receive all the desired information (that is, 
	no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetServByName 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle for the request (not to be confused with a Windows HTASK). This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, WSAAsyncServByName 
	returns a zero value, and a specific error number can be retrieved by 
	calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a servent structure together with the contents of data areas 
	referenced by members of the same servent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          buf is not in a valid part of the process address 
	                   space.
	WSAHOST_NOT_FOUND  Authoritative Answer Host not found.
	WSATRY_AGAIN       Non-Authoritative Service not found, or server 
	                   failure.
	WSANO_RECOVERY     Nonrecoverable errors, the services database is not 
	                   accessible.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetServByName (	EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_POINTER name,
										EIF_POINTER proto,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetServByName ((HWND)			hWnd,
												(unsigned int)	wMsg,
												(const char*)	name,
												(const char*)	proto,
												(char*)			buf,
												(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncGetServByPort
	
	The Windows Sockets WSAAsyncGetServByPort function gets service 
	information corresponding to a port and protocol

	asynchronous version.
	
	HANDLE WSAAsyncGetServByPort (
		HWND hWnd,	
		unsigned int wMsg,	
		int port,	
		const char FAR * proto,	
		char FAR * buf,	
		int buflen	
	);	
	 
	
	Parameters
	
	* hWnd
	
	  [in] The handle of the window which should receive a message when the 
	  asynchronous request completes.

	* wMsg

	  [in] The message to be received when the asynchronous request 
	  completes.

	* port

	  [in] The port for the service, in network byte order.

	* proto

	  [in] A pointer to a protocol name. This can be NULL, in which case 
	  WSAAsyncGetServByPort will search for the first service entry for 
	  which s_port match the given port. Otherwise, WSAAsyncGetServByPort 
	  matches both port and proto.

	* buf

	  [out] A pointer to the data area to receive the servent data. Note 
	  that this must be larger than the size of a servent structure. This is 
	  because the data area supplied is used by Windows Sockets to contain 
	  not only a servent structure but any and all of the data which is 
	  referenced by members of the servent structure. It is recommended that 
	  you supply a buffer of MAXGETHOSTSTRUCT bytes.
	
	* buflen
	
	  [in] The size of data area buf above.
	
	
	Remarks
	
	This function is an asynchronous version of getservbyport, and is used 
	to retrieve service information corresponding to a port number. Windows 
	Sockets initiates the operation and returns to the caller immediately, 
	passing back an opaque "asynchronous task handle" which the application 
	can use to identify the operation. When the operation is completed, the 
	results (if any) are copied into the buffer provided by the caller and a 
	message is sent to the application's window.
	
	When the asynchronous operation is complete the application's window 
	hWnd receives message wMsg. The wParam argument contains the 
	asynchronous task handle as returned by the original function call. The 
	high 16 bits of lParam contain any error code. The error code can be any 
	error as defined in WINSOCK2.H. An error code of zero indicates 
	successful completion of the asynchronous operation. On successful 
	completion, the buffer supplied to the original function call contains a 
	servent structure. To access the elements of this structure, the 
	original buffer address should be cast to a servent structure pointer 
	and accessed as appropriate.
	
	Note that if the error code is WSAENOBUFS, it indicates that the size of 
	the buffer specified by buflen in the original call was too small to 
	contain all the resultant information. In this case, the low 16 bits of 
	lParam contain the size of buffer required to supply ALL the requisite 
	information. If the application decides that the partial data is 
	inadequate, it can reissue the WSAAsyncGetServByPort function call with 
	a buffer large enough to receive all the desired information (that is, 
	no smaller than the low 16 bits of lParam).
	
	The error code and buffer length should be extracted from the lParam 
	using the macros WSAGETASYNCERROR and WSAGETASYNCBUFLEN, defined in 
	WINSOCK2.H as:
	
	#define WSAGETASYNCERROR(lParam)            HIWORD(lParam)
	#define WSAGETASYNCBUFLEN(lParam)           LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	
	Return Values
	
	The return value specifies whether or not the asynchronous operation was 
	successfully initiated. Note that it does not imply success or failure 
	of the operation itself.
	If the operation was successfully initiated, WSAAsyncGetServByPort 
	returns a nonzero value of type HANDLE which is the asynchronous task 
	handle for the request (not to be confused with a Windows HTASK). This 
	value can be used in two ways. It can be used to cancel the operation 
	using WSACancelAsyncRequest. It can also be used to match up 
	asynchronous operations and completion messages, by examining the wParam 
	message argument.
	
	If the asynchronous operation could not be initiated, 
	WSAAsyncGetServByPort returns a zero value, and a specific error number 
	can be retrieved by calling WSAGetLastError.
	
	Comments
	
	The buffer supplied to this function is used by Windows Sockets to 
	construct a servent structure together with the contents of data areas 
	referenced by members of the same servent structure. To avoid the 
	WSAENOBUFS error noted above, the application should provide a buffer of 
	at least MAXGETHOSTSTRUCT bytes (as defined in WINSOCK2.H).
	
	Error Codes
	
	The following error codes can be set when an application window receives 
	a message. As described above, they can be extracted from the lParam in 
	the reply message using the WSAGETASYNCERROR macro.
	
	WSAENETDOWN        The network subsystem has failed.
	WSAENOBUFS         Insufficient buffer space is available.
	WSAEFAULT          proto or buf is not in a valid part of the process 
	                   address space.
	WSAHOST_NOT_FOUND  Authoritative Answer Port not found.
	WSATRY_AGAIN       Non-Authoritative Port not found, or server failure.
	WSANO_RECOVERY     Nonrecoverable errors, the services database is not 
	                   accessible.
	WSANO_DATA         Valid name, no data record of requested type.
	 
	
	The following errors can occur at the time of the function call, and 
	indicate that the asynchronous operation could not be initiated.
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEWOULDBLOCK     The asynchronous operation cannot be scheduled at 
	                   this time due to resource or other constraints within 
	                   the Windows Sockets implementation.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncGetServByPort (	EIF_INTEGER hWnd,
										EIF_INTEGER wMsg,
										EIF_INTEGER port,
										EIF_POINTER proto,
										EIF_POINTER buf,
										EIF_INTEGER buflen)
{
	return (EIF_INTEGER) WSAAsyncGetServByPort ((HWND )			hWnd,
												(unsigned int)	wMsg,
												(int)			port,
												(const char*)	proto,
												(char*)			buf,
												(int)			buflen);
}

/*
	------------------------------------------------------------------------
	WSAAsyncSelect
	
	The Windows Sockets WSAAsyncSelect function requests Windows message-
	based notification of network events for a socket.
	
	int WSAAsyncSelect (
		SOCKET s,	
		HWND hWnd,	
		unsigned int wMsg,	
		long lEvent	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying the socket for which event notification 
	  is required.

	* hWnd

	  [in] A handle identifying the window which should receive a message 
	  when a network event occurs.

	* wMsg

	  [in] The message to be received when a network event occurs.

	* lEvent

	  [in] A bitmask which specifies a combination of network events in 
	  which the application is interested.
	
	 
	
	Remarks
	
	This function is used to request that the Windows Sockets DLL should 
	send a message to the window hWnd whenever it detects any of the network 
	events specified by the lEvent parameter. The message which should be 
	sent is specified by the wMsg parameter. The socket for which 
	notification is required is identified by s.
	This function automatically sets socket s to nonblocking mode, 
	regardless of the value of lEvent. See ioctlsocket about how to set the 
	nonoverlapped socket back to blocking mode.
	
	The lEvent parameter is constructed by or'ing any of the values 
	specified in the following list.
	
	Value	Meaning
	FD_READ       Want to receive notification of readiness for reading
	FD_WRITE      Want to receive notification of readiness for writing
	FD_OOB        Want to receive notification of the arrival of out-of-band 
	              data
	FD_ACCEPT     Want to receive notification of incoming connections
	FD_CONNECT    Want to receive notification of completed connection
	FD_CLOSE      Want to receive notification of socket closure
	FD_QOS        Want to receive notification of socket Quality of Service 
	              (QOS) changes
	FD_GROUP_QOS  Want to receive notification of socket group Quality of 
	Service (QOS) changes
	
	Issuing a WSAAsyncSelect for a socket cancels any previous 
	WSAAsyncSelect or WSAEventSelect for the same socket. For example, to 
	receive notification for both reading and writing, the application must 
	call WSAAsyncSelect with both FD_READ and FD_WRITE, as follows:
	
	rc = WSAAsyncSelect(s, hWnd, wMsg, FD_READ|FD_WRITE);
	  
	It is not possible to specify different messages for different events. 
	The following code will not work; the second call will cancel the 
	effects of the first, and only FD_WRITE events will be reported with 
	message wMsg2:
	
	rc = WSAAsyncSelect(s, hWnd, wMsg1, FD_READ);
	rc = WSAAsyncSelect(s, hWnd, wMsg2, FD_WRITE);
	  
	To cancel all notification (that is, to indicate that Windows Sockets 
	should send no further messages related to network events on the socket) 
	lEvent should be set to zero.
	
	rc = WSAAsyncSelect(s, hWnd, 0, 0);
	  
	Although in this instance WSAAsyncSelect immediately disables event 
	message posting for the socket, it is possible that messages can be 
	waiting in the application's message queue. The application must 
	therefore be prepared to receive network event messages even after 
	cancellation. Closing a socket with closesocket also cancels 
	WSAAsyncSelect message sending, but the same caveat about messages in 
	the queue prior to the closesocket still applies.
	
	Since an accept'ed socket has the same properties as the listening 
	socket used to accept it, any WSAAsyncSelect events set for the 
	listening socket apply to the accepted socket. For example, if a 
	listening socket has WSAAsyncSelect events FD_ACCEPT, FD_READ, and 
	FD_WRITE, then any socket accepted on that listening socket will also 
	have FD_ACCEPT, FD_READ, and FD_WRITE events with the same wMsg value 
	used for messages. If a different wMsg or events are desired, the 
	application should call WSAAsyncSelect, passing the accepted socket and 
	the desired new information.
	
	When one of the nominated network events occurs on the specified socket 
	s, the application's window hWnd receives message wMsg. The wParam 
	argument identifies the socket on which a network event has occurred. 
	The low word of lParam specifies the network event that has occurred. 
	The high word of lParam contains any error code. The error code be any 
	error as defined in WINSOCK2.H.
	
	Note:  Upon receipt of an event notification message the WSAGetLastError 
	function cannot be used to check the error value, because the error 
	value returned can differ from the value in the high word of lParam.
	
	The error and event codes can be extracted from the lParam using the 
	macros WSAGETSELECTERROR and WSAGETSELECTEVENT, defined in WINSOCK2.H 
	as:
	
	#define WSAGETSELECTERROR(lParam)       HIWORD(lParam)
	#define WSAGETSELECTEVENT(lParam)       LOWORD(lParam)
	  
	
	The use of these macros will maximize the portability of the source code 
	for the application.
	The possible network event codes which can be returned are as follows:
	
	Value         Meaning
	FD_READ       Socket s ready for reading
	FD_WRITE      Socket s ready for writing
	FD_OOB        Out-of-band data ready for reading on socket s
	FD_ACCEPT     Socket s ready for accepting a new incoming connection
	FD_CONNECT    Connection initiated on socket s completed
	FD_CLOSE      Connection identified by socket s has been closed
	FD_QOS        Quality of Service associated with socket s has changed
	FD_GROUP_QOS  Quality of Service associated with the socket group to 
	              which s belongs has changed
	
	Return Values
	
	The return value is zero if the application's declaration of interest in 
	the network event set was successful. Otherwise, the value SOCKET_ERROR 
	is returned, and a specific error number can be retrieved by calling 
	WSAGetLastError.
	
	Comments
	
	Although WSAAsyncSelect can be called with interest in multiple events, 
	the application window will receive a single message for each network 
	event.
	As in the case of the select function, WSAAsyncSelect will frequently be 
	used to determine when a data transfer operation (send or recv) can be 
	issued with the expectation of immediate success. Nevertheless, a robust 
	application must be prepared for the possibility that it can receive a 
	message and issue a Windows Sockets 2 call which returns WSAEWOULDBLOCK 
	immediately. For example, the following sequence of events is possible:
	
	1. data arrives on socket s; Windows Sockets 2 posts WSAAsyncSelect 
	   message
	2. application processes some other message
	3. while processing, application issues an ioctlsocket(s, FIONREAD...) 
	   and notices that there is data ready to be read
	4. application issues a recv(s,...) to read the data
	5. application loops to process next message, eventually reaching the 
	   WSAAsyncSelect message indicating that data is ready to read
	6. application issues recv(s,...), which fails with the error 
	   WSAEWOULDBLOCK.
	
	Other sequences are possible.
	The Windows Sockets DLL will not continually flood an application with 
	messages for a particular network event. Having successfully posted 
	notification of a particular event to an application window, no further 
	message(s) for that network event will be posted to the application 
	window until the application makes the function call which implicitly 
	re-enables notification of that network event.
	
	Event         Re-enabling function
	FD_READ       recv, recvfrom, WSARecv, or WSARecvFrom
	FD_WRITE      send, sendto, WSASend, or WSASendTo
	FD_OOB        recv, recvfrom, WSARecv, or WSARecvFrom
	FD_ACCEPT     accept or WSAAccept unless the error code is WSATRY_AGAIN 
	              indicating that the condition function returned CF_DEFER
	FD_CONNECT    NONE
	FD_CLOSE      NONE
	FD_QOS        WSAIoctl with command SIO_GET_QOS
	FD_GROUP_QOS  WSAIoctl with command SIO_GET_GROUP_QOS
	 
	
	Any call to the re-enabling routine, even one which fails, results in 
	re-enabling of message posting for the relevant event.
	For FD_READ, FD_OOB, and FD_ACCEPT events, message posting is "level-
	triggered." This means that if the re-enabling routine is called and the 
	relevant condition is still met after the call, a WSAAsyncSelect message 
	is posted to the application. This allows an application to be event-
	driven and not be concerned with the amount of data that arrives at any 
	one time. Consider the following sequence:
	
	1. Network transport stack receives 100 bytes of data on socket s and 
	   causes Windows Sockets 2 to post an FD_READ message.
	2. The application issues recv( s, buffptr, 50, 0) to read 50 bytes.
	3. Another FD_READ message is posted since there is still data to be 
	   read.
	
	With these semantics, an application need not read all available data in 
	response to an FD_READ message¾a single recv in response to each FD_READ 
	message is appropriate. If an application issues multiple recv calls in 
	response to a single FD_READ, it can receive multiple FD_READ messages. 
	Such an application may need to disable FD_READ messages before starting 
	the recv calls by calling WSAAsyncSelect with the FD_READ event not set.
	
	The FD_QOS and FD_GROUP_QOS events are considered edge triggered. A 
	message will be posted exactly once when a QOS change occurs. Further 
	messages will not be forthcoming until either the provider detects a 
	further change in QOS or the application renegotiates the QOS for the 
	socket.
	If any event has already happened when the application calls 
	WSAAsyncSelect or when the re-enabling function is called, then a 
	message is posted as appropriate. For example, consider the following 
	sequence:
	
	1. an application calls listen,
	2. a connect request is received but not yet accepted,
	3. the application calls WSAAsyncSelect specifying that it wants to 
	   receive FD_ACCEPT messages for the socket. Due to the persistence of 
	   events, Windows Sockets 2 posts an FD_ACCEPT message immediately.
	
	The FD_WRITE event is handled slightly differently. An FD_WRITE message 
	is posted when a socket is first connected with connect/WSAConnect 
	(after FD_CONNECT, if also registered) or accepted with 
	accept/WSAAccept, and then after a send operation fails with 
	WSAEWOULDBLOCK and buffer space becomes available. Therefore, an 
	application can assume that sends are possible starting from the first 
	FD_WRITE message and lasting until a send returns WSAEWOULDBLOCK. After 
	such a failure the application will be notified that sends are again 
	possible with an FD_WRITE message.
	
	The FD_OOB event is used only when a socket is configured to receive 
	out-of-band data separately. (See section Out-Of-Band data for a 
	discussion of this topic.) If the socket is configured to receive out-
	of-band data in-line, the out-of-band (expedited) data is treated as 
	normal data and the application should register an interest in, and will 
	receive, FD_READ events, not FD_OOB events. An application may set or 
	inspect the way in which out-of-band data is to be handled by using 
	setsockopt or getsockopt for the SO_OOBINLINE option.
	
	The error code in an FD_CLOSE message indicates whether the socket close 
	was graceful or abortive. If the error code is zero, then the close was 
	graceful; if the error code is WSAECONNRESET, then the socket's virtual 
	circuit was reset. This only applies to connection-oriented sockets such 
	as SOCK_STREAM.
	The FD_CLOSE message is posted when a close indication is received for 
	the virtual circuit corresponding to the socket. In TCP terms, this 
	means that the FD_CLOSE is posted when the connection goes into the TIME 
	WAIT or CLOSE WAIT states. This results from the remote end performing a 
	shutdown on the send side or a closesocket. FD_CLOSE should only be 
	posted after all data is read from a socket, but an application should 
	check for remaining data upon receipt of FD_CLOSE to avoid any 
	possibility of losing data.
	
	Please note your application will receive ONLY an FD_CLOSE message to 
	indicate closure of a virtual circuit, and only when all the received 
	data has been read if this is a graceful close. It will not receive an 
	FD_READ message to indicate this condition.
	The FD_QOS or FD_GROUP_QOS message is posted when any field in the flow 
	specification associated with socket s or the socket group that s 
	belongs to has changed, respectively. Applications should use WSAIoctl 
	with command SIO_GET_QOS or SIO_GET_GROUP_QOS to get the current QOS for 
	socket s or for the socket group s belongs to, respectively.
	
	Here is a summary of events and conditions for each asynchronous 
	notification message:
	
	·	FD_READ:
	
	1. when WSAAsyncSelect called, if there is data currently available to 
	   receive, 
	2. when data arrives, if FD_READ not already posted, 
	3. after recv or recvfrom called (with or without MSG_PEEK), if data is 
	   still available to receive.
	
	Note: when setsockopt SO_OOBINLINE is enabled "data" includes both 
	normal data and out-of-band (OOB) data in the instances noted above.
	
	·	FD_WRITE:
	
	1. when WSAAsyncSelect called, if a send or sendto is possible
	2. after connect or accept called, when connection established
	3. after send or sendto fail with WSAEWOULDBLOCK, when send or sendto 
	   are likely to succeed, 
	4. after bind on a datagram socket.
	
	·	FD_OOB: Only valid when setsockopt SO_OOBINLINE is disabled (default).
	
	1. when WSAAsyncSelect called, if there is OOB data currently available 
	   to receive with the MSG_OOB flag, 
	2. when OOB data arrives, if FD_OOB not already posted, 
	3. after recv or recvfrom called with or without MSG_OOB flag, if OOB 
	   data is still available to receive.
	
	·	FD_ACCEPT:
	
	1. when WSAAsyncSelect called, if there is currently a connection 
	   request available to accept, 
	2. when a connection request arrives, if FD_ACCEPT not already posted, 
	3. after accept called, if there is another connection request available 
	   to accept.
	
	·	FD_CONNECT:
	
	1. when WSAAsyncSelect called, if there is currently a connection 
	   established, 
	2. after connect called, when connection is established (even when 
	   connect succeeds immediately, as is typical with a datagram socket)
	
	·	FD_CLOSE: Only valid on connection-oriented sockets (for example, 
	    SOCK_STREAM) 
	
	1. when WSAAsyncSelect called, if socket connection has been closed,
	2. after remote system initiated graceful close, when no data currently 
	   available to receive (note: if data has been received and is waiting 
	   to be read when the remote system initiates a graceful close, the 
	   FD_CLOSE is not delivered until all pending data has been read),
	3. after local system initiates graceful close with shutdown and remote 
	   system has responded with "End of Data" notification (for example, TCP 
	   FIN), when no data currently available to receive, 
	4. when remote system terminates connection (for example, sent TCP RST), 
	   and lParam will contain WSAECONNRESET error value.
	
	 
	
	Note:  FD_CLOSE is not posted after closesocket is called.
	
	 
	
	·	FD_QOS:
	
	1. when WSAAsyncSelect called, if the QOS associated with the socket has 
	   been changed, 
	2. after WSAIoctl with SIO_GET_QOS called, when the QOS is changed.
	
	·	FD_GROUP_QOS:
	
	1. when WSAAsyncSelect called, if the group QOS associated with the 
	   socket has been changed, 
	2. after WSAIoctl with SIO_GET_GROUP_QOS called, when the group QOS is 
	   changed.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINVAL          Indicates that one of the specified parameters was 
	                   invalid such as the window handle not referring to an 
	                   existing window, or the specified socket is in an 
	                   invalid state.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAENOTSOCK        The descriptor is not a socket.
	 
	
	Additional error codes may be set when an application window receives a 
	message. This error code is extracted from the lParam in the reply 
	message using the WSAGETSELECTERROR macro. Possible error codes for each 
	network event are:

	Event: FD_CONNECT
	
	Error Code        Meaning
	WSAEADDRINUSE     The specified address is already in use.
	WSAEADDRNOTAVAIL  The specified address is not available from the local 
	                  machine.
	WSAEAFNOSUPPORT   Addresses in the specified family cannot be used with 
	                  this socket.
	WSAECONNREFUSED   The attempt to connect was forcefully rejected.
	WSAENETUNREACH    The network cannot be reached from this host at this 
	                  time.
	WSAEFAULT         The namelen argument is incorrect.
	WSAEINVAL         The socket is already bound to an address.
	WSAEISCONN        The socket is already connected.
	WSAEMFILE         No more file descriptors are available.
	WSAENOBUFS        No buffer space is available. The socket cannot be 
	                  connected.
	WSAENOTCONN       The socket is not connected.
	WSAETIMEDOUT      Attempt to connect timed out without establishing a 
	                  connection.
	Event: FD_CLOSE
	
	Error Code       Meaning
	WSAENETDOWN      The network subsystem has failed.
	WSAECONNRESET    The connection was reset by the remote side.
	WSAECONNABORTED  The connection was terminated due to a time-out or 
	                 other failure.
	
	Event: FD_READ
	Event: FD_WRITE
	Event: FD_OOB
	Event: FD_ACCEPT
	Event: FD_QOS
	Event: FD_GROUP_QOS
	
	Error Code   Meaning
	WSAENETDOWN  The network subsystem has failed.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAAsyncSelect (	EIF_INTEGER s,
								EIF_INTEGER hWnd,
								EIF_INTEGER wMsg,
								EIF_INTEGER lEvent)
{
	return (EIF_INTEGER) WSAAsyncSelect (	(SOCKET)		s,
											(HWND)			hWnd,
											(unsigned int)	wMsg,
											(long)			lEvent);
}

/*
	------------------------------------------------------------------------
	WSACancelAsyncRequest
	
	The Windows Sockets WSACancelAsyncRequest function cancels an incomplete 
	asynchronous operation.
	
	int WSACancelAsyncRequest (
		HANDLE hAsyncTaskHandle	
	);	
	 
	
	Parameters
	
	* hAsyncTaskHandle
	
	  [in] Specifies the asynchronous operation to be canceled.
	
	Remarks
	
	The WSACancelAsyncRequest function is used to cancel an asynchronous 
	operation which was initiated by one of the WSAAsyncGetXByY functions 
	such as WSAAsyncGetHostByName. The operation to be canceled is 
	identified by the hAsyncTaskHandle parameter, which should be set to the 
	asynchronous task handle as returned by the initiating WSAAsyncGetXByY 
	function.
	
	Return Values
	
	The value returned by WSACancelAsyncRequest is zero if the operation was 
	successfully canceled. Otherwise, the value SOCKET_ERROR is returned, 
	and a specific error number may be retrieved by calling WSAGetLastError.
	
	Comments
	
	An attempt to cancel an existing asynchronous WSAAsyncGetXByY operation 
	can fail with an error code of WSAEALREADY for two reasons. First, the 
	original operation has already completed and the application has dealt 
	with the resultant message. Second, the original operation has already 
	completed but the resultant message is still waiting in the application 
	window queue.
	
	Note: It is unclear whether the application can usefully distinguish 
	between WSAEINVAL and WSAEALREADY, since in both cases the error 
	indicates that there is no asynchronous operation in progress with the 
	indicated handle. [Trivial exception: zero is always an invalid 
	asynchronous task handle.] The Windows Sockets specification does not 
	prescribe how a conformant Windows Sockets provider should distinguish 
	between the two cases. For maximum portability, a Windows Sockets 
	application should treat the two errors as equivalent.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINVAL          Indicates that the specified asynchronous task handle 
	                   was invalid
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEALREADY        The asynchronous routine being canceled has already 
	                   completed.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSACancelAsyncRequest (EIF_INTEGER hAsyncTaskHandle)
{
	return (EIF_INTEGER) WSACancelAsyncRequest ((HANDLE) hAsyncTaskHandle);
}

/*
	------------------------------------------------------------------------
	WSACleanup
	
	The Windows Sockets WSACleanup function terminates use of the Windows 
	Sockets DLL.
	
	int  WSACleanup (void);
	
	Remarks
	
	An application or DLL is required to perform a successful WSAStartup 
	call before it can use Windows Sockets services. When it has completed 
	the use of Windows Sockets, the application or DLL must call WSACleanup 
	to deregister itself from a Windows Sockets implementation and allow the 
	implementation to free any resources allocated on behalf of the 
	application or DLL. Any pending blocking or asynchronous calls issued by 
	any thread in this process are canceled without posting any notification 
	messages, or signaling any event objects. Any pending overlapped send 
	and receive operations (WSASend/WSASendTo/
	WSARecv/WSARecvFrom with an overlapped socket) issued by any thread in 
	this process are also canceled without setting the event object or 
	invoking the completion routine, if specified. In this case, the pending 
	overlapped operations fail with the error status WSA_OPERATION_ABORTED. 
	Any sockets open when WSACleanup is called are reset and automatically 
	deallocated as if closesocket was called; sockets which have been closed 
	with closesocket but which still have pending data to be sent may be 
	affected¾the pending data may be lost if the Windows Sockets DLL is 
	unloaded from memory as the application exits. To insure that all 
	pending data is sent an application should use shutdown to close the 
	connection, then wait until the close completes before calling 
	closesocket and WSACleanup. All resources and internal state, such as 
	queued un-posted messages, must be deallocated so as to be available to 
	the next user.
	
	There must be a call to WSACleanup for every successful call to 
	WSAStartup made by a task. Only the final WSACleanup for that task does 
	the actual cleanup; the preceding calls simply decrement an internal 
	reference count in the Windows Sockets DLL.
	
	Return Values
	
	The return value is zero if the operation was successful. Otherwise, the 
	value SOCKET_ERROR is returned, and a specific error number may be 
	retrieved by calling WSAGetLastError.
	
	Comments
	
	Attempting to call WSACleanup from within a blocking hook and then 
	failing to check the return code is a common Windows Sockets programming 
	error. If an application needs to quit while a blocking call is 
	outstanding, the application must first cancel the blocking call with 
	WSACancelBlockingCall then issue the WSACleanup call once control has 
	been returned to the application.
	In a multithreaded environment, WSACleanup terminates Windows Sockets 
	operations for all threads.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.	
	------------------------------------------------------------------------
*/

EIF_INTEGER  c_WSACleanup (void)
{
	return (EIF_INTEGER) WSACleanup();
}

/*
	------------------------------------------------------------------------
	WSACloseEvent
	
	The Windows Sockets WSACloseEvent function closes an open event object 
	handle.
	
	BOOL WSACloseEvent(
		WSAEVENT hEvent 	
	);	
	 
	
	Parameters
	
	* hEvent
	
	  [in] Identifies an open event object handle.
	
	Remarks
	
	The handle to the event object is closed so that further references to 
	this handle will fail with the error WSA_INVALID_HANDLE.
	
	Return Values
	
	If the function succeeds, the return value is TRUE.
	If the function fails, the return value is FALSE. To get extended error 
	information, call WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED   A successful WSAStartup must occur before using this 
	                    function.
	WSAENETDOWN         The network subsystem has failed.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 call is in progress, 
	                    or the service provider is still processing a 
	                    callback function.
	WSA_INVALID_HANDLE  hEvent is not a valid event object handle.	
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_WSACloseEvent (EIF_INTEGER hEvent)
{
	return (EIF_BOOLEAN) WSACloseEvent((WSAEVENT) hEvent);
}

/*
	------------------------------------------------------------------------
	WSAConnect
	
	The Windows Sockets WSAConnect function establishes a connection to a 
	peer, exchanges connect data, and specifies needed quality of service 
	based on the supplied flow specification.
	
	int  WSAConnect (
		SOCKET s,	
		const struct sockaddr FAR * name,	
		int namelen,	
		LPWSABUF lpCallerData,	
		LPWSABUF lpCalleeData,	
		LPQOS lpSQOS,	
		LPQOS lpGQOS	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying an unconnected socket.
	
	* name
	
	  [in] The name of the peer to which the socket is to be connected.
	
	* namelen
	
	  [in] The length of the name.
	
	* lpCallerData
	
	  [in] A pointer to the user data that is to be transferred to the peer 
	  during connection establishment.

	* lpCalleeData

	  [out] A pointer to the user data that is to be transferred back from 
	  the peer during connection establishment.

	* lpSQOS

	  [in] A pointer to the flow specifications for socket s, one for each 
	  direction.

	* lpGQOS

	  [in] A pointer to the flow specifications for the socket group (if 
	  applicable).
	
	Remarks
	
	This function is used to create a connection to the specified 
	destination, and to perform a number of other ancillary operations that 
	occur at connect time as well. If the socket, s, is unbound, unique 
	values are assigned to the local association by the system, and the 
	socket is marked as bound.
	For connection-oriented sockets (for example, type SOCK_STREAM), an 
	active connection is initiated to the foreign host using name (an 
	address in the name space of the socket; for a detailed description, 
	please see bind). When this call completes successfully, the socket is 
	ready to send/receive data. If the address field of the name structure 
	is all zeroes, WSAConnect will return the error WSAEADDRNOTAVAIL. Any 
	attempt to reconnect an active connection will fail with the error code 
	WSAEISCONN.
	
	For a connectionless socket (for example, type SOCK_DGRAM), the 
	operation erformed by WSAConnect is merely to establish a default 
	destination address so that the socket may be used on subsequent 
	connection-oriented send and receive operations (send, WSASend, recv, 
	WSARecv). Any datagrams received from an address other than the 
	destination address specified will be discarded. If the address field of 
	the name structure is all zeroes, the socket will be "dis-connected." 
	Then, the default remote address will be indeterminate, so send/WSASend 
	and recv/WSARecv calls will return the error code WSAENOTCONN. However, 
	sendto/WSASendTo and recvfrom/WSARecvFrom can still be used. The default 
	destination may be changed by simply calling WSAConnect again, even if 
	the socket is already "connected". Any datagrams queued for receipt are 
	discarded if name is different from the previous WSAConnect.
	
	For connectionless sockets, name may indicate any valid address, 
	including a broadcast address. However, to connect to a broadcast 
	address, a socket must have setsockopt SO_BROADCAST enabled. Otherwise, 
	WSAConnect will fail with the error code WSAEACCES.
	On connectionless sockets, exchange of user to user data is not possible 
	and the corresponding parameters will be silently ignored.
	The application is responsible for allocating any memory space pointed 
	to directly or indirectly by any of the parameters it specifies.
	
	The lpCallerData is a value parameter which contains any user data that 
	is to be sent along with the connection request. If lpCallerData is 
	NULL, no user data will be passed to the peer. The lpCalleeData is a 
	result parameter which will contain any user data passed back from the 
	peer as part of the connection establishment. lpCalleeData->len 
	initially contains the length of the buffer allocated by the application 
	and pointed to by lpCalleeData->buf. lpCalleeData->len will be set to 
	zero if no user data has been passed back. The lpCalleeData information 
	will be valid when the connection operation is complete. For blocking 
	sockets, this will be when the WSAConnect function returns. For 
	nonblocking sockets, this will be after the FD_CONNECT notification has 
	occurred. If lpCalleeData is NULL, no user data will be passed back. The 
	exact format of the user data is specific to the address family to which 
	the socket belongs.
	
	At connect time, an application may use the lpSQOS and/or lpGQOS 
	parameters to override any previous QOS specification made for the 
	socket through WSAIoctl with either the SIO_SET_QOS or SIO_SET_GROUP_QOS 
	opcodes.
	lpSQOS specifies the flow specifications for socket s, one for each 
	direction, followed by any additional provider-specific parameters. If 
	either the associated transport provider in general or the specific type 
	of socket in particular cannot honor the QOS request, an error will be 
	returned as indicated below. The sending or receiving flow specification 
	values will be ignored, respectively, for any unidirectional sockets. If 
	no provider-specific parameters are supplied, the buf and len fields of 
	lpSQOS->ProviderSpecific should be set to NULL and zero, respectively. A 
	NULL value for lpSQOS indicates no application supplied QOS.
	
	lpGQOS specifies the flow specifications for the socket group (if 
	applicable), one for each direction, followed by any additional 
	provider-specific parameters. If no provider-specific parameters are 
	supplied, the buf and len fields of lpSQOS->ProviderSpecific should be 
	set to NULL and zero, respectively. A NULL value for lpGQOS indicates no 
	application-supplied group QOS. This parameter will be ignored if s is 
	not the creator of the socket group.
	
	Comments
	
	When connected sockets break (that is, become closed for whatever 
	reason), they should be discarded and recreated. It is safest to assume 
	that when things go awry for any reason on a connected socket, the 
	application must discard and recreate the needed sockets in order to 
	return to a stable point.
	
	Return Values
	
	If no error occurs, WSAConnect returns zero. Otherwise, it returns 
	SOCKET_ERROR, and a specific error code may be retrieved by calling 
	WSAGetLastError. On a blocking socket, the return value indicates 
	success or failure of the connection attempt.
	With a nonblocking socket, the connection attempt may not be completed 
	immediately. In this case, WSAConnect will return SOCKET_ERROR, and 
	WSAGetLastError will return WSAEWOULDBLOCK. In this case, the 
	application may:
	
	1. Use select to determine the completion of the connection request by 
	   checking if the socket is writeable, or
	2. If your application is using WSAAsyncSelect to indicate interest in 
	   connection events, then your application will receive an FD_CONNECT 
	   notification when the connect operation is complete, or
	3. If your application is using WSAEventSelect to indicate interest in 
	   connection events, then the associated event object will be signaled 
	   when the connect operation is complete.
	
	For a nonblocking socket, until the connection attempt completes all 
	subsequent calls to WSAConnect on the same socket will fail with the 
	error code WSAEALREADY.
	If the return error code indicates the connection attempt failed (that 
	is, WSAECONNREFUSED, WSAENETUNREACH, WSAETIMEDOUT) the application may 
	call WSAConnect again for the same socket.
	
	Error Codes
	
	WSANOTINITIALISED   A successful WSAStartup must occur before using this 
	                    function.
	WSAENETDOWN         The network subsystem has failed.
	WSAEADDRINUSE       The specified address is already in use.
	WSAEINTR            The (blocking) call was canceled through 
	                    WSACancelBlockingCall.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 call is in progress, 
	                    or the service provider is still processing a 
	                    callback function.
	WSAEALREADY         A nonblocking connect/WSAConnect call is in progress 
	                    on the specified socket.
	WSAEADDRNOTAVAIL    The specified address is not available from the 
	                    local machine.
	WSAEAFNOSUPPORT     Addresses in the specified family cannot be used 
	                    with this socket.
	WSAECONNREFUSED     The attempt to connect was rejected.
	WSAEFAULT           The name or the namelen argument is not a valid part 
	                    of the user address space, the namelen argument is 
	                    too small, the buffer length for lpCalleeData, 
	                    lpSQOS, and lpGQOS are too small, or the buffer 
	                    length for lpCallerData is too large.
	WSAEINVAL           The parameter s is a listening socket, or the 
	                    destination address specified is not consistent with 
	                    that of the constrained group the socket belongs to.
	WSAEISCONN          The socket is already connected (connection-oriented 
	                    sockets only).
	WSAENETUNREACH      The network cannot be reached from this host at this 
	                    time.
	WSAENOBUFS          No buffer space is available. The socket cannot be 
	                    connected.
	WSAENOTSOCK         The descriptor is not a socket.
	WSAEOPNOTSUPP       The flow specifications specified in lpSQOS and 
	                    lpGQOS cannot be satisfied.
	WSAEPROTONOSUPPORT  The lpCallerData augment is not supported by the 
	                    service provider.
	WSAETIMEDOUT        Attempt to connect timed out without establishing a 
	                    connection.
	WSAEWOULDBLOCK      The socket is marked as nonblocking and the 
	                    connection cannot be completed immediately. It is 
	                    possible to select the socket while it is connecting 
	                    by selecting it for writing.
	WSAEACCES           Attempt to connect datagram socket to broadcast 
	                    address failed because setsockopt SO_BROADCAST is 
	                    not enabled.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAConnect (	EIF_INTEGER s,
							EIF_POINTER name,
							EIF_INTEGER namelen,
							EIF_POINTER lpCallerData,
							EIF_POINTER lpCalleeData,
							EIF_POINTER lpSQOS,
							EIF_POINTER lpGQOS)
{
	return (EIF_INTEGER) WSAConnect (	(SOCKET)					s,
										(const struct sockaddr*)	name,
										(int)						namelen,
										(LPWSABUF)					lpCallerData,
										(LPWSABUF)					lpCalleeData,
										(LPQOS)						lpSQOS,
										(LPQOS)						lpGQOS);
}

/*
	------------------------------------------------------------------------
	WSACreateEvent
	
	The Windows Sockets connect function creates a new event object.
	
	WSAEVENT  WSACreateEvent(void);
	
	Remarks
	
	The event object created by this function is manual reset, with an 
	initial state of nonsignaled. Windows Sockets 2 event objects are system 
	objects in Win32 environments. Therefore, if a Win32 application desires 
	auto reset events, it may call the native CreateEvent Win32 function 
	directly. The scope of an event object is limited to the process in 
	which it is created.
	
	Return Values
	
	If the function succeeds, the return value is the handle of the event 
	object.
	If the function fails, the return value is WSA_INVALID_EVENT. To get 
	extended error information, call WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAEINPROGRESS         A blocking Windows Sockets 1.1 call is in 
	                       progress, or the service provider is still 
	                       processing a callback function.
	WSA_NOT_ENOUGH_MEMORY  Not enough free memory available to create the 
	                       event object.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSACreateEvent(void)
{
	return (EIF_INTEGER) WSACreateEvent();
}

/*
	------------------------------------------------------------------------
	WSADuplicateSocket
	
	The Windows Sockets WSADuplicateSocket function returns a 
	WSAPROTOCOL_INFO structure that can be used to create a new socket 
	descriptor for a shared socket.
	
	int WSADuplicateSocket (
		SOCKET s,	
		DWORD dwProcessId,	
		LPWSAPROTOCOL_INFO lpProtocolInfo	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] Specifies the local socket descriptor.
	
	* dwProcessId
	
	  [in] Specifies the ID of the target process for which the shared 
	  socket will be used.
	
	* lpProtocolInfo
	
	  [out] A pointer to a buffer allocated by the client that is large 
	  enough to contain a WSAPROTOCOL_INFO structure. The service provider 
	  copies the protocol info structure contents to this buffer.
	
	Remarks
	
	This function is used to enable socket sharing between processes. A 
	source process calls WSADuplicateSocket to obtain a special 
	WSAPROTOCOL_INFO structure. It uses some interprocess communications 
	(IPC) mechanism to pass the contents of this structure to a target 
	process, which in turn uses it in a call to WSASocket to obtain a 
	descriptor for the duplicated socket. Note that the special 
	WSAPROTOCOL_INFO structure may only be used once by the target process.
	
	Sockets can be shared among threads in a given process without using the 
	WSADuplicateSocket function, since a socket descriptor is valid in all 
	of a process's threads.
	One possible scenario for establishing and using a shared socket in a 
	handoff mode is illustrated below:
	
	Source Process                 IPC	    Destination Process
	1) WSASocket, WSAConnect		
	2) Request target process ID
                                   =>
	                                        3) Receive process ID request 
	                                           and respond
	                               <=
	4) Receive process ID
	5) Call WSADuplicateSocket to
	   get a special
	   WSAPROTOCOL_INFO structure		
	6) Send WSAPROTOCOL_INFO
	   structure to target
	                               =>
	                                        7) Receive WSAPROTOCOL_INFO 
	                                           structure
	                                        8) Call WSASocket to create 
	                                           shared socket descriptor.
	                                        9) Use shared socket for data 
	                                           exchange
	10) closesocket
	 
	
	Return Values
	
	If no error occurs, WSADuplicateSocket returns zero. Otherwise, a value 
	of SOCKET_ERROR is returned, and a specific error code may be retrieved 
	by calling WSAGetLastError.
	
	Comments
	
	The descriptors that reference a shared socket may be used independently 
	as far as I/O is concerned. However, the Windows Sockets interface does 
	not implement any type of access control, so it is up to the processes 
	involved to coordinate their operations on a shared socket. A typical 
	use for shared sockets is to have one process that is responsible for 
	creating sockets and establishing connections, hand off sockets to other 
	processes which are responsible for information exchange.
	
	Since what is duplicated are the socket descriptors and not the 
	underlying socket, all of the state associated with a socket is held in 
	common across all the descriptors. For example a setsockopt operation 
	performed using one descriptor is subsequently visible using a 
	getsockopt from any or all descriptors. A process may call closesocket 
	on a duplicated socket and the descriptor will become deallocated. The 
	underlying socket, however, will remain open until closesocket is called 
	by the last remaining descriptor.
	
	Notification on shared sockets is subject to the usual constraints of 
	WSAAsyncSelect and WSAEventSelect. Issuing either of these calls using 
	any of the shared descriptors cancels any previous event registration 
	for the socket, regardless of which descriptor was used to make that 
	registration. Thus, for example, a shared socket cannot deliver FD_READ 
	events to process A and FD_WRITE events to process B. For situations 
	when such tight coordination is required, it is suggested that 
	developers use threads instead of separate processes.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINVAL          Indicates that one of the specified parameters was 
	                   invalid.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAEMFILE          No more socket descriptors are available.
	WSAENOBUFS         No buffer space is available. The socket cannot be 
	                   created.
	WSAENOTSOCK        The descriptor is not a socket.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSADuplicateSocket (	EIF_INTEGER s,	
									EIF_INTEGER dwProcessId,	
									EIF_POINTER lpProtocolInfo)
{
	return (EIF_INTEGER) WSADuplicateSocket (	(SOCKET)				s,
												(DWORD)					dwProcessId,
												(LPWSAPROTOCOL_INFO)	lpProtocolInfo);
}

/*
	------------------------------------------------------------------------
	WSAEnumNetworkEvents
	
	The Windows Sockets WSAEnumNetworkEvents function discovers occurrences 
	of network events for the indicated socket.
	
	int WSAEnumNetworkEvents (
		SOCKET s,	
		WSAEVENT hEventObject,	
		LPWSANETWORKEVENTS lpNetworkEvents	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying the socket.
	
	* hEventObject
	
	  [in] An optional handle identifying an associated event object to be 
	  reset.
	
	* lpNetworkEvents
	
	  [out] A pointer to a WSANETWORKEVENTS structure which is filled with a 
	  record of occurred network events and any associated error codes.
	
	Remarks
	
	This function is used to discover which network events have occurred for 
	the indicated socket since the last invocation of this function. It is 
	intended for use in conjunction with WSAEventSelect, which associates an 
	event object with one or more network events. Recording of network 
	events commences when WSAEventSelect is called with a nonzero 
	lNetworkEvents parameter and remains in effect until another call is 
	made to WSAEventSelect with the lNetworkEvents parameter set to zero, or 
	until a call is made to WSAAsyncSelect.
	
	The socket's internal record of network events is copied to the 
	structure referenced by lpNetworkEvents, whereafter the internal network 
	events record is cleared. If hEventObject is non-null, the indicated 
	event object is also reset. The Windows Sockets provider guarantees that 
	the operations of copying the network event record, clearing it and 
	resetting any associated event object are atomic, such that the next 
	occurrence of a nominated network event will cause the event object to 
	become set. In the case of this function returning SOCKET_ERROR, the 
	associated event object is not reset and the record of network events is 
	not cleared.
	
	The WSANETWORKEVENTS structure is defined as follows:
	
	typedef struct _WSANETWORKEVENTS {
		long lNetworkEvents;
		int iErrorCodes[FD_MAX_EVENTS];
	} WSANETWORKEVENTS, FAR * LPWSANETWORKEVENTS;
	  
	
	The lNetworkEvents field of the structure indicates which of the FD_XXX 
	network events have occurred. The iErrorCodes array is used to contain 
	any associated error codes, with array index corresponding to the 
	position of event bits in lNetworkEvents. The identifiers such as 
	FD_READ_BIT and FD_WRITE_BIT can be used to index the iErrorCodes array.
	The following error codes may be returned along with the respective 
	network event:

	Event: FD_CONNECT
	
	Error Code        Meaning
	WSAEADDRINUSE     The specified address is already in use.
	WSAEADDRNOTAVAIL  The specified address is not available from the local 
	                  machine.
	WSAEAFNOSUPPORT   Addresses in the specified family cannot be used with 
	                  this socket.
	WSAECONNREFUSED   The attempt to connect was forcefully rejected.
	WSAENETUNREACH    The network cannot be reached from this host at this 
	                  time.
	WSAENOBUFS        No buffer space is available. The socket cannot be 
	                  connected.
	WSAETIMEDOUT      Attempt to connect timed out without establishing a 
	                  connection
	 
	Event: FD_CLOSE
	
	Error Code       Meaning
	WSAENETDOWN      The network subsystem has failed.
	WSAECONNRESET    The connection was reset by the remote side.
	WSAECONNABORTED  The connection was terminated due to a time-out or 
	                 other failure.
	
	Event: FD_READ
	Event: FD_WRITE
	Event: FD_OOB
	Event: FD_ACCEPT
	Event: FD_QOS
	Event: FD_GROUP_QOS
	
	Error Code   Meaning
	WSAENETDOWN  The network subsystem has failed.
	 
	Return Values
	
	The return value is zero if the operation was successful. Otherwise, the 
	value SOCKET_ERROR is returned, and a specific error number may be 
	retrieved by calling WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINVAL          Indicates that one of the specified parameters was 
	                   invalid.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAENOTSOCK        The descriptor is not a socket.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAEnumNetworkEvents (EIF_INTEGER s,
									EIF_INTEGER hEventObject,
									EIF_POINTER lpNetworkEvents)
{
	return (EIF_INTEGER) WSAEnumNetworkEvents (	(SOCKET)				s,
												(WSAEVENT)				hEventObject,
												(LPWSANETWORKEVENTS)	lpNetworkEvents);
}

/*
	------------------------------------------------------------------------
	WSAEnumProtocols
	
	The Windows Sockets WSAEnumProtocols function retrieves information 
	about available transport protocols.
	
	int WSAEnumProtocols (
		LPINT lpiProtocols,	
		LPWSAPROTOCOL_INFO lpProtocolBuffer,	
		ILPDWORD lpdwBufferLength	
	);	
	 
	
	Parameters
	
	* lpiProtocols
	
	  [in] A NULL-terminated array of iProtocol values. This parameter is 
	  optional; if lpiProtocols is NULL, information on all available 
	  protocols is returned. Otherwise, information is retrieved only for 
	  those protocols listed in the array.

	* lpProtocolBuffer

	  [out] A buffer which is filled with WSAPROTOCOL_INFO structures. See 
	  below for a detailed description of the contents of the 
	  WSAPROTOCOL_INFO structure.

	* lpdwBufferLength

	  [in/out] On input, the count of bytes in the lpProtocolBuffer buffer 
	  passed to WSAEnumProtocols. On output, the minimum buffer size that 
	  can be passed to WSAEnumProtocols to retrieve all the requested 
	  information. This routine has no ability to enumerate over multiple 
	  calls; the passed-in buffer must be large enough to hold all entries 
	  in order for the routine to succeed. This reduces the complexity of 
	  the API and should not pose a problem because the number of protocols 
	  loaded on a machine is typically small.
	
	Remarks
	
	This function is used to discover information about the collection of 
	transport protocols and protocol chains installed on the local machine. 
	Since layered protocols are only usable by applications when installed 
	in protocol chains, information on layered protocols is not included in 
	lpProtocolBuffer. The lpiProtocols parameter can be used as a filter to 
	constrain the amount of information provided. Normally it will be 
	supplied as a NULL pointer which will cause the routine to return 
	information on all available transport protocols and protocol chains.
	
	A WSAPROTOCOL_INFO structure is provided in the buffer pointed to by 
	lpProtocolBuffer for each requested protocol. If the supplied buffer is 
	not large enough (as indicated by the input value of lpdwBufferLength ), 
	the value pointed to by lpdwBufferLength will be updated to indicate the 
	required buffer size. The application should then obtain a large enough 
	buffer and call this function again.
	The order in which the WSAPROTOCOL_INFO structures appear in the buffer 
	coincides with the order in which the protocol entries were registered 
	by the service provider with the Windows Sockets DLL, or with any 
	subsequent re-ordering that may have occurred through the Windows 
	Sockets applet supplied for establishing default TCP/IP providers.
	
	Return Values
	
	If no error occurs, WSAEnumProtocols returns the number of protocols to 
	be reported on. Otherwise, a value of SOCKET_ERROR is returned and a 
	specific error code may be retrieved by calling WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress.
	WSAEINVAL          Indicates that one of the specified parameters was 
	                   invalid.
	WSAENOBUFS         The buffer length was too small to receive all the 
	                   relevant WSAPROTOCOL_INFO structures and associated 
	                   information. Pass in a buffer at least as large as 
	                   the value returned in lpdwBufferLength.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAEnumProtocols (EIF_POINTER lpiProtocols,
								EIF_POINTER lpProtocolBuffer,
								EIF_POINTER lpdwBufferLength)
{
	return (EIF_INTEGER) WSAEnumProtocols (	(LPINT)					lpiProtocols,
											(LPWSAPROTOCOL_INFO)	lpProtocolBuffer,
											(LPDWORD)				lpdwBufferLength);
}

/*
	------------------------------------------------------------------------
	WSAEventSelect
	
	The Windows Sockets WSAEventSelect function specifies an event object to 
	be associated with the supplied set of FD_XXX network events.
	
	int WSAEventSelect (
		SOCKET s,	
		WSAEVENT hEventObject,	
		long lNetworkEvents	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying the socket.
	
	* hEventObject
	
	  [in] A handle identifying the event object to be associated with the 
	  supplied set of FD_XXX network events.
	
	* lNetworkEvents
	
	  [in] A bitmask which specifies the combination of FD_XXX network 
	  events in which the application has interest.
	
	Remarks
	
	This function is used to specify an event object, hEventObject, to be 
	associated with the selected FD_XXX network events, lNetworkEvents. The 
	socket for which an event object is specified is identified by s. The 
	event object is set when any of the nominated network events occur.
	WSAEventSelect operates very similarly to WSAAsyncSelect, the difference 
	being in the actions taken when a nominated network event occurs. 
	Whereas WSAAsyncSelect causes an application-specified Windows message 
	to be posted, WSAEventSelect sets the associated event object and 
	records the occurrence of this event in an internal network event 
	record. An application can use WSAWaitForMultipleEvents to wait or poll 
	on the event object, and use WSAEnumNetworkEvents to retrieve the 
	contents of the internal network event record and thus determine which 
	of the nominated network events have occurred.
	
	This function automatically sets socket s to nonblocking mode, 
	regardless of the value of lNetworkEvents. See ioctlsocket/WSAIoctl 
	about how to set the socket back to blocking mode.
	The lNetworkEvents parameter is constructed by or'ing any of the values 
	specified in the following list.
	
	Value         Meaning
	FD_READ       Want to receive notification of readiness for reading
	FD_WRITE      Want to receive notification of readiness for writing
	FD_OOB        Want to receive notification of the arrival of out-of-band 
	              data
	FD_ACCEPT     Want to receive notification of incoming connections
	FD_CONNECT    Want to receive notification of completed connection
	FD_CLOSE      Want to receive notification of socket closure
	FD_QOS        Want to receive notification of socket Quality of Service 
	              (QOS) changes
	FD_GROUP_QOS  Want to receive notification of socket group Quality of 
	              Service (QOS) changes
	 
	Issuing a WSAEventSelect for a socket cancels any previous 
	WSAAsyncSelect or WSAEventSelect for the same socket and clears the 
	internal network event record. For example, to associate an event object 
	with both reading and writing network events, the application must call 
	WSAEventSelect with both FD_READ and FD_WRITE, as follows:
	
	rc = WSAEventSelect(s, hEventObject, FD_READ|FD_WRITE);
	
	It is not possible to specify different event objects for different 
	network events. The following code will not work; the second call will 
	cancel the effects of the first, and only FD_WRITE network event will be 
	associated with hEventObject2:
	
	rc = WSAEventSelect(s, hEventObject1, FD_READ);
	rc = WSAEventSelect(s, hEventObject2, FD_WRITE); //bad
	  
	To cancel the association and selection of network events on a socket, 
	lNetworkEvents should be set to zero, in which case the hEventObject 
	parameter will be ignored.
	
	rc = WSAEventSelect(s, hEventObject, 0);
	
	Closing a socket with closesocket also cancels the association and 
	selection of network events specified in WSAEventSelect for the socket. 
	The application, however, still must call WSACloseEvent to explicitly 
	close the event object and free any resources.
	Since an accept'ed socket has the same properties as the listening 
	socket used to accept it, any WSAEventSelect association and network 
	events selection set for the listening socket apply to the accepted 
	socket. For example, if a listening socket has WSAEventSelect 
	association of hEventOject with FD_ACCEPT, FD_READ, and FD_WRITE, then 
	any socket accepted on that listening socket will also have FD_ACCEPT, 
	FD_READ, and FD_WRITE network events associated with the same 
	hEventObject. If a different hEventObject or network events are desired, 
	the application should call WSAEventSelect, passing the accepted socket 
	and the desired new information.
	
	Return Values
	
	The return value is zero if the application's specification of the 
	network events and the associated event object was successful. 
	Otherwise, the value SOCKET_ERROR is returned, and a specific error 
	number may be retrieved by calling WSAGetLastError.
	As in the case of the select and WSAAsyncSelect functions, 
	WSAEventSelect will frequently be used to determine when a data transfer 
	operation (send or recv) can be issued with the expectation of immediate 
	success. Nevertheless, a robust application must be prepared for the 
	possibility that the event object is set and it issues a Windows Sockets 
	call which returns WSAEWOULDBLOCK immediately. For example, the 
	following sequence of operations is possible:
	
	1. data arrives on socket s; Windows Sockets sets the WSAEventSelect 
	   event object
	2. application does some other processing
	3. while processing, application issues an ioctlsocket(s, FIONREAD...) 
	   and notices that there is data ready to be read
	4. application issues a recv(s,...) to read the data
	5. application eventually waits on event object specified in 
	   WSAEventSelect, which returns immediately indicating that data is 
	   ready to read
	6. application issues recv(s,...), which fails with the error 
	   WSAEWOULDBLOCK.
	
	Other sequences are possible.
	Having successfully recorded the occurrence of the network event (by 
	setting the corresponding bit in the internal network event record) and 
	signaled the associated event object, no further actions are taken for 
	that network event until the application makes the function call which 
	implicitly re-enables the setting of that network event and signaling of 
	the associated event object.
	
	Network Event    Re-enabling function
	FD_READ          recv, recvfrom, WSARecv, or WSARecvFrom
	FD_WRITE         send, sendto, WSASend, or WSASendTo
	FD_OOB           recv, recvfrom, WSARecv, or WSARecvFrom
	FD_ACCEPT        accept or WSAAccept unless the error code returned is 
	                 WSATRY_AGAIN indicating that the condition function 
	                 returned CF_DEFER
	FD_CONNECT       NONE
	FD_CLOSE         NONE
	FD_QOS           WSAIoctl with command SIO_GET_QOS 
	FD_GROUP_QOS     WSAIoctl with command SIO_GET_GROUP_QOS
	 
	Any call to the re-enabling routine, even one which fails, results in 
	re-enabling of recording and signaling for the relevant network event 
	and event object, respectively.
	For FD_READ, FD_OOB, and FD_ACCEPT network events, network event 
	recording and event object signaling are "level-triggered." This means 
	that if the re-enabling routine is called and the relevant network 
	condition is still valid after the call, the network event is recorded 
	and the associated event object is set. This allows an application to be 
	event-driven and not be concerned with the amount of data that arrives 
	at any one time. Consider the following sequence:
	
	1. Transport provider receives 100 bytes of data on socket s and causes 
	   Windows Sockets DLL to record the FD_READ network event and set the 
	   associated event object.
	2. The application issues recv( s, buffptr, 50, 0) to read 50 bytes.
	3. The transport provider causes Windows Sockets DLL to record the 
	   FD_READ network event and sets the associated event object again 
	   since there is still data to be read.
	
	With these semantics, an application need not read all available data in 
	response to an FD_READ network event¾a single recv in response to each 
	FD_READ network event is appropriate.
	The FD_QOS and FD_GROUP_QOS events are considered edge triggered. A 
	message will be posted exactly once when a QOS change occurs. Further 
	messages will not be forthcoming until either the provider detects a 
	further change in QOS or the application renegotiates the QOS for the 
	socket.
	
	If a network event has already happened when the application calls 
	WSAEventSelect or when the re-enabling function is called, then a 
	network event is recorded and the associated event object is set as 
	appropriate. For example, consider the following sequence:
	
	1. an application calls listen,
	2. a connect request is received but not yet accepted,
	3. the application calls WSAEventSelect specifying that it is interested 
	   in the FD_ACCEPT network event for the socket. Due to the persistence 
	   of network events, Windows Sockets records the FD_ACCEPT network 
	   event and sets the associated event object immediately.
	
	The FD_WRITE network event is handled slightly differently. An FD_WRITE 
	network event is recorded when a socket is first connected with 
	connect/WSAConnect or accepted with accept/WSAAccept, and then after a 
	send fails with WSAEWOULDBLOCK and buffer space becomes available. 
	Therefore, an application can assume that sends are possible starting 
	from the first FD_WRITE network event setting and lasting until a send 
	returns WSAEWOULDBLOCK. After such a failure the application will find 
	out that sends are again possible when an FD_WRITE network event is 
	recorded and the associated event object is set.
	
	The FD_OOB network event is used only when a socket is configured to 
	receive out-of-band data separately. If the socket is configured to 
	receive out-of-band data in-line, the out-of-band (expedited) data is 
	treated as normal data and the application should register an interest 
	in, and will get, FD_READ network event, not FD_OOB network event. An 
	application may set or inspect the way in which out-of-band data is to 
	be handled by using setsockopt or getsockopt for the SO_OOBINLINE 
	option.
	
	The error code in an FD_CLOSE network event indicates whether the socket 
	close was graceful or abortive. If the error code is zero, then the 
	close was graceful; if the error code is WSAECONNRESET, then the 
	socket's virtual circuit was reset. This only applies to connection-
	oriented sockets such as SOCK_STREAM.
	The FD_CLOSE network event is recorded when a close indication is 
	received for the virtual circuit corresponding to the socket. In TCP 
	terms, this means that the FD_CLOSE is recorded when the connection goes 
	into the FIN WAIT or CLOSE WAIT states. This results from the remote end 
	performing a shutdown on the send side or a closesocket.
	
	Please note Windows Sockets will record ONLY an FD_CLOSE network event 
	to indicate closure of a virtual circuit. It will not record an FD_READ 
	network event to indicate this condition.
	The FD_QOS or FD_GROUP_QOS network event is recorded when any field in 
	the flow specification associated with socket s or the socket group that 
	s belongs to has changed, respectively. Applications should use WSAIoctl 
	with command SIO_GET_QOS or SIO_GET_GROUP_QOS to get the current QOS for 
	socket s or for the socket group s belongs to, respectively.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAEINVAL          Indicates that one of the specified parameters was 
	                   invalid, or the specified socket is in an invalid 
	                   state.
	WSAEINPROGRESS     A blocking Windows Sockets 1.1 call is in progress, 
	                   or the service provider is still processing a 
	                   callback function.
	WSAENOTSOCK        The descriptor is not a socket.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAEventSelect (	EIF_INTEGER s,
								EIF_INTEGER hEventObject,
								EIF_INTEGER lNetworkEvents)
{
	return (EIF_INTEGER) WSAEventSelect (	(SOCKET)	s,
											(WSAEVENT)	hEventObject,
											(long)		lNetworkEvents);
}

/*
	------------------------------------------------------------------------
	WSAGetLastError
	
	The Windows Sockets WSAGetLastError function gets the error status for 
	the last operation which failed.
	
	int  WSAGetLastError (void);
	
	Remarks
	
	This function returns the last network error that occurred. When a 
	particular Windows Sockets function indicates that an error has 
	occurred, this function should be called to retrieve the appropriate 
	error code. This error code may be different from the error code 
	obtained from getsockopt SO_ERROR.
	A successful function call, or a call to WSAGetLastError, does not reset 
	the error code. To reset the error code, use the WSASetLastError 
	function call with iError set to zero.
	
	This function should not be used to check for an error value on receipt 
	of an asynchronous message. In this case, the error value is passed in 
	the lParam field of the message, and this may differ from the value 
	returned by WSAGetLastError.
	
	Return Values
	
	The return value indicates the error code for this thread's last Windows 
	Sockets operation that failed.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAGetLastError (void)
{
	return (EIF_INTEGER) WSAGetLastError();
}

/*
	------------------------------------------------------------------------
	WSAGetOverlappedResult
	
	The Windows Sockets WSAGetOverlappedResult function returns the results 
	of an overlapped operation on the specified socket.
	
	BOOL WSAGetOverlappedResult (
		SOCKET s,	
		LPWSAOVERLAPPED lpOverlapped,	
		LPDWORD lpcbTransfer,	
		BOOL fWait,	
		LPDWORD lpdwFlags	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] Identifies the socket. This is the same socket that was specified 
	  when the overlapped operation was started by a call to WSARecv, 
	  WSARecvFrom, WSASend, WSASendTo, or WSAIoctl.

	* lpOverlapped

	  [in] Points to a WSAOVERLAPPED structure that was specified when the 
	  overlapped operation was started.

	* pcbTransfer

	  [out] Points to a 32-bit variable that receives the number of bytes 
	  that were actually transferred by a send or receive operation, or by 
	  WSAIoctl.

	* fWait

	  [in] Specifies whether the function should wait for the pending 
	  overlapped operation to complete. If TRUE, the function does not 
	  return until the operation has been completed. If FALSE and the 
	  operation is still pending, the function returns FALSE and the 
	  WSAGetLastError function returns WSA_IO_INCOMPLETE.

	* lpdwFlags

	  [out] Points to a 32-bit variable that will receive one or more flags 
	  that supplement the completion status. If the overlapped operation was 
	  initiated through WSARecv or WSARecvFrom, this parameter will contain 
	  the results value for lpFlags parameter.
	
	Remarks
	
	The results reported by the WSAGetOverlappedResult function are those of 
	the specified socket's last overlapped operation to which the specified 
	WSAOVERLAPPED structure was provided, and for which the operation's 
	results were pending. A pending operation is indicated when the function 
	that started the operation returns FALSE, and the WSAGetLastError 
	function returns WSA_IO_PENDING. When an I/O operation is pending, the 
	function that started the operation resets the hEvent member of the 
	WSAOVERLAPPED structure to the nonsignaled state. Then when the pending 
	operation has been completed, the system sets the event object to the 
	signaled state.
	
	If the fWait parameter is TRUE, WSAGetOverlappedResult determines 
	whether the pending operation has been completed by waiting for the 
	event object to be in the signaled state.
	
	Return Values
	
	If WSAGetOverlappedResult succeeds, the return value is TRUE. This means 
	that the overlapped operation has completed successfully and that the 
	value pointed to by lpcbTransfer has been updated. If 
	WSAGetOverlappedResult returns FALSE, this means that either the 
	overlapped operation has not completed or the overlapped operation 
	completed but with errors, or that completion status could not be 
	determined due to errors in one or more parameters to 
	WSAGetOverlappedResult. On failure, the value pointed to by lpcbTransfer 
	will not be updated. Use WSAGetLastError to determine the cause of the 
	failure (either of WSAGetOverlappedResult or of the associated 
	overlapped operation).
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAENOTSOCK            The descriptor is not a socket.
	WSA_INVALID_HANDLE     The hEvent field of the WSAOVERLAPPED structure 
	                       does not contain a valid event object handle.
	WSA_INVALID_PARAMETER  One of the parameters is unacceptable.
	WSA_IO_INCOMPLETE      fWait is FALSE and the I/O operation has not yet 
	                       completed.
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_WSAGetOverlappedResult (	EIF_INTEGER s,
										EIF_POINTER lpOverlapped,
										EIF_POINTER lpcbTransfer,
										EIF_BOOLEAN fWait,
										EIF_POINTER lpdwFlags)
{
	return (EIF_BOOLEAN) WSAGetOverlappedResult (	(SOCKET)			s,
													(LPWSAOVERLAPPED)	lpOverlapped,
													(LPDWORD)			lpcbTransfer,
													(BOOL)				fWait,
													(LPDWORD)			lpdwFlags);
}

/*
	------------------------------------------------------------------------
	WSAGetQOSByName
	
	The Windows Sockets WSAGetQOSByName function initializes a QOS structure 
	based on a named template.
	
	BOOL WSAGetQOSByName(
		SOCKET s,	
		LPWSABUF lpQOSName,	
		LPQOS lpQOS	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a socket.
	
	* lpQOSName
	
	  [in] Specifies the QOS template name.
	
	* lpQOS
	
	  [out] A pointer to the QOS structure to be filled.
	
	Remarks
	
	Applications may use this function to initalize a QOS structure to a set 
	of known values appropriate for a particular service class or media 
	type. These values are stored in a template which is referenced by a 
	well-known name.
	
	Return Values
	
	If the function succeeds, the return value is TRUE. If the function 
	fails, the return value is FALSE. To get extended error information, 
	call WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAENOTSOCK        The descriptor is not a socket.
	WSAEFAULT          The lpQOS argument is not a valid part of the user 
	                   address space, or the buffer length for lpQOS is too 
	                   small.
	WSA_INVAL          The specified QOS template name is invalid.	
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_WSAGetQOSByName(	EIF_INTEGER	s,
								EIF_POINTER	lpQOSName,
								EIF_POINTER	lpQOS)
{
	return (EIF_BOOLEAN) WSAGetQOSByName(	(SOCKET)	s,
											(LPWSABUF)	lpQOSName,
											(LPQOS)		lpQOS);
}

/*
	------------------------------------------------------------------------
	WSAHtonl
	
	The Windows Sockets WSAHtonl function converts a u_long from host byte 
	order to network byte order.
	
	int WSAHtonl (
		SOCKET s,	
		u_long hostlong,	
		u_long FAR * lpnetlong	
	);	
	 
	Parameters
	
	* s
	
	  [in] A descriptor identifying a socket.
	
	* hostlong
	
	  [in] A 32-bit number in host byte order.
	
	* lpnetlong
	
	  [out] A pointer to a 32-bit number in network byte order.
	
	Remarks
	
	This routine takes a 32-bit number in host byte order and returns a 32-
	bit number pointed to by the lpnetlong parameter in the network byte 
	order associated with socket s.
	
	Return Values
	
	If no error occurs, WSAHtonl returns zero. Otherwise, a value of 
	SOCKET_ERROR is returned, and a specific error code may be retrieved by 
	calling WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAENOTSOCK        The descriptor is not a socket.
	WSAEFAULT          The lpnetlong argument is not totally contained in a 
	                   valid part of the user 
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAHtonl (EIF_INTEGER s,
						EIF_INTEGER hostlong,
						EIF_POINTER lpnetlong)
{
	return (EIF_INTEGER) WSAHtonl (	(SOCKET)	s,
									(u_long)	hostlong,
									(u_long*)	lpnetlong);
}

/*
	------------------------------------------------------------------------
	WSAHtons
	
	The Windows Sockets WSAHtons function converts a u_short from host byte 
	order to network byte order.
	
	int WSAHtons (
		SOCKET s,	
		u_short hostshort,	
		u_short FAR * lpnetshort	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a socket.
	
	* hostshort
	
	  [in] A 16-bit number in host byte order.
	
	* lpnetshort
	
	  [out] A pointer to a 16-bit number in network byte order.
	
	Remarks
	
	This routine takes a 16-bit number in host byte order and returns a 16-
	bit number pointed to by the lpnetshort parameter in the network byte 
	order associated with socket s.
	
	Return Values
	
	If no error occurs, WSAHtons returns zero. Otherwise, a value of 
	SOCKET_ERROR is returned, and a specific error code may be retrieved by 
	calling WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	WSAENETDOWN        The network subsystem has failed.
	WSAENOTSOCK        The descriptor is not a socket.
	WSAEFAULT          The lpnetshort argument is not totally contained in a 
	                   valid part of the user address space.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAHtons (EIF_INTEGER s,
						EIF_INTEGER hostshort,
						EIF_POINTER lpnetshort)
{
	return (EIF_INTEGER) WSAHtons (	(SOCKET)	s,
									(u_short)	hostshort,
									(u_short*)	lpnetshort);
}

/*
	------------------------------------------------------------------------
	WSARecv
	
	The Windows Sockets WSARecv function receives data from a socket.
	
	int WSARecv (
		SOCKET s,	
		LPWSABUF lpBuffers,	
		DWORD dwBufferCount,	
		LPDWORD lpNumberOfBytesRecvd,	
		LPDWORD lpFlags,	
		LPWSAOVERLAPPED lpOverlapped,	
		LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionROUTINE	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a connected socket.
	
	* lpBuffers
	
	  [in/out] A pointer to an array of WSABUF structures. Each WSABUF 
	  structure contains a pointer to a buffer and the length of the buffer.

	* dwBufferCount

	  [in] The number of WSABUF structures in the lpBuffers array.

	* lpNumberOfBytesRecvd

	  [out] A pointer to the number of bytes received by this call if the 
	  receive operation completes immediately.

	* lpFlags

	  [in/out] A pointer to flags.

	* lpOverlapped

	  [in] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped 
	  sockets).

	* lpCompletionRoutine

	  [in] A pointer to the completion routine called when the receive 
	  operation has been completed (ignored for nonoverlapped sockets).
	
	Remarks
	
	This function provides functionality over and above the standard recv 
	function in three important areas:
	
	1. It can be used in conjunction with overlapped sockets to perform 
	   overlapped receive operations.
	2. It allows multiple receive buffers to be specified making it 
	   applicable to the scatter/gather type of I/O.
	3. The lpFlags parameter is both an INPUT and an OUTPUT parameter, 
	   allowing applications to sense the output state of the MSG_PARTIAL 
	   flag bit. Note however, that the MSG_PARTIAL flag bit is not 
	   supported by all protocols.
	
	WSARecv is used on connected sockets or bound connectionless sockets 
	specified by the s parameter and is used to read incoming data.
	For overlapped sockets WSARecv is used to post one or more buffers into 
	which incoming data will be placed as it becomes available, after which 
	the application-specified completion indication (invocation of the 
	completion routine or setting of an event object) occurs. If the 
	operation does not complete immediately, the final completion status is 
	retrieved through the completion routine or WSAGetOverlappedResult.
	
	If both lpOverlapped and lpCompletionRoutine are NULL, the socket in 
	this function will be treated as a nonoverlapped socket.
	For nonoverlapped sockets, the blocking semantics are identical to that 
	of the standard recv function and the lpOverlapped and 
	lpCompletionRoutine parameters are ignored. Any data which has already 
	been received and buffered by the transport will be copied into the 
	supplied user buffers. For the case of a blocking socket with no data 
	currently having been received and buffered by the transport, the call 
	will block until data is received.
	
	The supplied buffers are filled in the order in which they appear in the 
	array pointed to by lpBuffers, and the buffers are packed so that no 
	holes are created.
	The array of WSABUF structures pointed to by the lpBuffers parameter is 
	transient. If this operation completes in an overlapped manner, it is 
	the service provider's responsibility to capture these WSABUF structures 
	before returning from this call. This enables applications to build 
	stack-based WSABUF arrays.
	
	For byte stream style sockets (for example, type SOCK_STREAM), incoming 
	data is placed into the buffers until the buffers are filled, the 
	connection is closed, or internally buffered data is exhausted. 
	Regardless of whether or not the incoming data fills all the buffers, 
	the completion indication occurs for overlapped sockets. For message-
	oriented sockets (for example, type SOCK_DGRAM), an incoming message is 
	placed into the supplied buffers, up to the total size of the buffers 
	supplied, and the completion indication occurs for overlapped sockets. 
	If the message is larger than the buffers supplied, the buffers are 
	filled with the first part of the message. If the MSG_PARTIAL feature is 
	supported by the underlying service provider, the MSG_PARTIAL flag is 
	set in lpFlags and subsequent receive operations will retrieve the rest 
	of the message. If MSG_PARTIAL is not supported but the protocol is 
	reliable, WSARecv generates the error WSAEMSGSIZE and a subsequent 
	receive operation with a larger buffer can be used to retrieve the 
	entire message. Otherwise, (that is, the protocol is unreliable and does 
	not support MSG_PARTIAL), the excess data is lost, and WSARecv generates 
	the error WSAEMSGSIZE.
	
	For connection-oriented sockets, WSARecv can indicate the graceful 
	termination of the virtual circuit in one of two ways, depending on 
	whether the socket is a byte stream or message oriented. For byte 
	streams, zero bytes having been read indicates graceful closure and that 
	no more bytes will ever be read. For message-oriented sockets, where a 
	zero byte message is often allowable, a return error code of WSAEDISCON 
	is used to indicate graceful closure. In any case a return error code of 
	WSAECONNRESET indicates an abortive close has occurred.
	
	lpFlags may be used to influence the behavior of the function invocation 
	beyond the options specified for the associated socket. That is, the 
	semantics of this function are determined by the socket options and the 
	lpFlags parameter. The latter is constructed by or-ing any of the 
	following values:
	
	Value        Meaning
	MSG_PEEK     Peek at the incoming data. The data is copied into the 
	             buffer but is not removed from the input queue. This flag 
	             is valid only for nonoverlapped sockets. 
	MSG_OOB      Process out-of-band data. (See section Out-Of-Band data for 
	             a discussion of this topic.)
	MSG_PARTIAL  This flag is for message-oriented sockets only. On output, 
	             indicates that the data supplied is a portion of the 
	             message transmitted by the sender. Remaining portions of 
	             the message will be supplied in subsequent receive 
	             operations. A subsequent receive operation with MSG_PARTIAL 
	             flag cleared indicates end of sender's message.As an input 
	             parameter, this flag indicates that the receive operation 
	             should complete even if only part of a message has been 
	             received by the service provider.
	
	For message-oriented sockets, the MSG_PARTIAL bit is set in the lpFlags 
	parameter if a partial message is received. If a complete message is 
	received, MSG_PARTIAL is cleared in lpFlags. In the case of delayed 
	completion, the value pointed to by lpFlags is not updated. When 
	completion has been indicated the application should call 
	WSAGetOverlappedResult and examine the flags pointed to by the lpdwFlags 
	parameter.
	Overlapped socket I/O:
	
	If an overlapped operation completes immediately, WSARecv returns a 
	value of zero and the lpNumberOfBytesRecvd parameter is updated with the 
	number of bytes received and the flag bits pointed by the lpFlags 
	parameter are also updated. If the overlapped operation is successfully 
	initiated and will complete later, WSARecv returns SOCKET_ERROR and 
	indicates error code WSA_IO_PENDING. In this case, lpNumberOfBytesRecvd 
	and lpFlags are not updated. When the overlapped operation completes the 
	amount of data transferred is indicated either through the cbTransferred 
	parameter in the completion routine (if specified), or through the 
	lpcbTransfer parameter in WSAGetOverlappedResult. Flag values are 
	obtained by examining the lpdwFlags parameter of WSAGetOverlappedResult.
	
	This function may be called from within the completion routine of a 
	previous WSARecv, WSARecvFrom, WSASend or WSASendTo function. For a 
	given socket, I/O completion routines will not be nested. This permits 
	time-sensitive data transmissions to occur entirely within a preemptive 
	context.
	The lpOverlapped parameter must be valid for the duration of the 
	overlapped operation. If multiple I/O operations are simultaneously 
	outstanding, each must reference a separate overlapped structure. The 
	WSAOVERLAPPED structure has the following form:
	
	typedef struct _WSAOVERLAPPED {
		DWORD        Internal;        // reserved
		DWORD        InternalHigh;    // reserved
		DWORD        Offset;          // reserved
		DWORD        OffsetHigh;      // reserved
		WSAEVENT     hEvent;
	} WSAOVERLAPPED, FAR * LPWSAOVERLAPPED;
	  
	If the lpCompletionRoutine parameter is NULL, the hEvent field of 
	lpOverlapped is signaled when the overlapped operation completes if it 
	contains a valid event object handle. An application can use 
	WSAWaitForMultipleEvents or WSAGetOverlappedResult to wait or poll on 
	the event object.
	If lpCompletionRoutine is not NULL, the hEvent field is ignored and can 
	be used by the application to pass context information to the completion 
	routine.
	
	The completion routine follows the same rules as stipulated for Win32 
	file I/O completion routines. The completion routine will not be invoked 
	until the thread is in an alertable wait state such as can occur when 
	the function WSAWaitForMultipleEvents with the fAlertable parameter set 
	to TRUE is invoked.
	The transport providers allow an application to invoke send and receive 
	operations from within the context of the socket I/O completion routine, 
	and guarantee that, for a given socket, I/O completion routines will not 
	be nested. This permits time-sensitive data transmissions to occur 
	entirely within a preemptive context.
	
	The prototype of the completion routine is as follows:
	
	void CALLBACK CompletionROUTINE(
		IN DWORD dwError,
		IN DWORD cbTransferred,
		IN LPWSAOVERLAPPEDlpOverlapped,
		IN DWORD dwFlags
	);
	
	CompletionRoutine is a placeholder for an application-defined or 
	library-defined function name. dwError specifies the completion status 
	for the overlapped operation as indicated by lpOverlapped. cbTransferred 
	specifies the number of bytes received. dwFlags contains information 
	that would have appeared in lpFlags if the receive operation had 
	completed immediately. This function does not return a value.
	Returning from this function allows invocation of another pending 
	completion routine for this socket. When using WSAWaitForMultipleEvents, 
	all waiting completion routines are called before the alertable thread's 
	wait is satisfied with a return code of WSA_IO_COMPLETION. The 
	completion routines may be called in any order, not necessarily in the 
	same order the overlapped operations are completed. However, the posted 
	buffers are guaranteed to be filled in the same order they are supplied.
	
	Return Values
	
	If no error occurs and the receive operation has completed immediately, 
	WSARecv returns zero. Note that in this case, the completion routine 
	will have already been scheduled, and to be called once the calling 
	thread is in the alertable state. Otherwise, a value of SOCKET_ERROR is 
	returned, and a specific error code may be retrieved by calling 
	WSAGetLastError. The error code WSA_IO_PENDING indicates that the 
	overlapped operation has been successfully initiated and that completion 
	will be indicated at a later time. Any other error code indicates that 
	the overlapped operation was not successfully initiated and no 
	completion indication will occur.
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAENOTCONN            The socket is not connected.
	WSAEINTR               The (blocking) call was canceled through 
	                       WSACancelBlockingCall.
	WSAEINPROGRESS         A blocking Windows Sockets 1.1 call is in 
	                       progress, or the service provider is still 
	                       processing a callback function.
	WSAENETRESET           The connection has been broken due to the remote 
	                       host resetting.
	WSAENOTSOCK            The descriptor is not a socket.
	WSAEFAULT              The lpBuffers argument is not totally contained 
	                       in a valid part of the user address space.
	WSAEOPNOTSUPP          MSG_OOB was specified, but the socket is not 
	                       stream style such as type SOCK_STREAM, out-of-
	                       band data is not supported in the communication 
	                       domain associated with this socket, or the socket 
	                       is unidirectional and supports only send 
	                       operations.
	WSAESHUTDOWN           The socket has been shut down; it is not possible 
	                       to WSARecv on a socket after shutdown has been 
	                       invoked with how set to SD_RECEIVE or SD_BOTH.
	WSAEWOULDBLOCK         Overlapped sockets: There are too many 
	                       outstanding overlapped I/O requests. 
	                       Nonoverlapped sockets: The socket is marked as 
	                       nonblocking and the receive operation cannot be 
	                       completed immediately.
	WSAEMSGSIZE            The message was too large to fit into the 
	                       specified buffer and (for unreliable protocols 
	                       only) any trailing portion of the message that 
	                       did not fit into the buffer has been discarded.
	WSAEINVAL              The socket has not been bound with bind, or the 
	                       socket is not created with the overlapped flag.
	WSAECONNABORTED        The virtual circuit was terminated due to a time-
	                       out or other failure.
	WSAECONNRESET          The virtual circuit was reset by the remote side.
	WSAEDISCON             Socket s is message oriented and the virtual 
	                       circuit was gracefully closed by the remote side.
	WSA_IO_PENDING         An overlapped operation was successfully 
	                       initiated and completion will be indicated at a 
	                       later time.
	WSA_OPERATION_ABORTED  The overlapped operation has been canceled due to 
	                       the closure of the socket.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSARecv (	EIF_INTEGER s,
						EIF_POINTER lpBuffers,
						EIF_INTEGER dwBufferCount,
						EIF_POINTER lpNumberOfBytesRecvd,
						EIF_POINTER lpFlags,
						EIF_POINTER lpOverlapped,
						EIF_POINTER lpCompletionROUTINE)
{
	return (EIF_INTEGER) WSARecv (	(SOCKET)							s,
									(LPWSABUF)							lpBuffers,
									(DWORD)								dwBufferCount,
									(LPDWORD)							lpNumberOfBytesRecvd,
									(LPDWORD)							lpFlags,
									(LPWSAOVERLAPPED)					lpOverlapped,
									(LPWSAOVERLAPPED_COMPLETION_ROUTINE)lpCompletionROUTINE);
}

/*
	------------------------------------------------------------------------
	WSARecvFrom
	
	The Windows Sockets WSARecvFrom function receives a datagram and stores 
	the source address.
	
	int WSARecvFrom (
		SOCKET s,	
		LPWSABUF lpBuffers,	
		DWORD dwBufferCount,	
		LPDWORD lpNumberOfBytesRecvd,	
		LPDWORD lpFlags,	
		struct sockaddr FAR * lpFrom,	
		LPINT lpFromlen,	
		LPWSAOVERLAPPED lpOverlapped,	
		LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionROUTINE	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a socket
	
	* lpBuffers
	
	  [in/out] A pointer to an array of WSABUF structures. Each WSABUF 
	  structure contains a pointer to a buffer and the length of the buffer.

	* dwBufferCount

	  [in] The number of WSABUF structures in the lpBuffers array.

	* lpNumberOfBytesRecvd

	  [out] A pointer to the number of bytes received by this call if the 
	  receive operation completes immediately.

	* lpFlags

	  [in/out] A pointer to flags.

	* lpFrom

	  [out] An optional pointer to a buffer which will hold the source 
	  address upon the completion of the overlapped operation.

	* lpFromlen

	  [in/out] A pointer to the size of the from buffer, required only if 
	  lpFrom is specified.

	* lpOverlapped

	  [in] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped 
	  sockets).

	* lpCompletionRoutine

	  [in] A pointer to the completion routine called when the receive 
	  operation has been completed (ignored for nonoverlapped sockets).
	
	Remarks
	
	This function provides functionality over and above the standard 
	recvfrom function in three important areas:
	
	1. It can be used in conjunction with overlapped sockets to perform 
	   overlapped receive operations.
	2. It allows multiple receive buffers to be specified making it 
	   applicable to the scatter/gather type of I/O.
	3. The lpFlags parameter is both an INPUT and an OUTPUT parameter, 
	   allowing applications to sense the output state of the MSG_PARTIAL 
	   flag bit. Note however, that the MSG_PARTIAL flag bit is not 
	   supported by all protocols.
	
	WSARecvFrom is used primarily on a connectionless socket specified by s.
	For overlapped sockets, this function is used to post one or more 
	buffers into which incoming data will be placed as it becomes available 
	on a (possibly connected) socket, after which the application-specified 
	completion indication (invocation of the completion routine or setting 
	of an event object) occurs. If the operation does not complete 
	immediately, the final completion status is retrieved through the 
	completion routine or WSAGetOverlappedResult. Also note that the values 
	pointed to by lpFrom and lpFromlen are not updated until completion is 
	indicated. Applications must not use or disturb these values until they 
	have been updated, therefore the application must not use automatic 
	(that is, stack-based) variables for these parameters.
	
	If both lpOverlapped and lpCompletionRoutine are NULL, the socket in 
	this function will be treated as a nonoverlapped socket.
	For nonoverlapped sockets, the blocking semantics are identical to that 
	of the standard recvfrom function and the lpOverlapped and 
	lpCompletionRoutine parameters are ignored. Any data which has already 
	been received and buffered by the transport will be copied into the 
	supplied user buffers. For the case of a blocking socket with no data 
	currently having been received and buffered by the transport, the call 
	will block until data is received.
	
	The supplied buffers are filled in the order in which they appear in the 
	array pointed to by lpBuffers, and the buffers are packed so that no 
	holes are created.
	The array of WSABUF structures pointed to by the lpBuffers parameter is 
	transient. If this operation completes in an overlapped manner, it is 
	the service provider's responsibility to capture these WSABUF structures 
	before returning from this call. This enables applications to build 
	stack-based WSABUF arrays.
	
	For connectionless socket types, the address from which the data 
	originated is copied to the buffer pointed by lpFrom. The value pointed 
	to by lpFromlen is initialized to the size of this buffer, and is 
	modified on completion to indicate the actual size of the address stored 
	there. As noted previously for overlapped sockets, the lpFrom and 
	lpFromlen parameters are not updated until after the overlapped I/O has 
	completed. The memory pointed to by these parameters must, therefore, 
	remain available to the service provider and cannot be allocated on the 
	application's stack frame. The lpFrom and lpFromlen parameters are 
	ignored for connection-oriented sockets.
	
	For byte stream style sockets (for example, type SOCK_STREAM), incoming 
	data is placed into the buffers until the buffers are filled, the 
	connection is closed, or internally buffered data is exhausted. 
	Regardless of whether or not the incoming data fills all the buffers, 
	the completion indication occurs for overlapped sockets. For message-
	oriented sockets, an incoming message is placed into the supplied 
	buffers, up to the total size of the buffers supplied, and the 
	completion indication occurs for overlapped sockets. If the message is 
	larger than the buffers supplied, the buffers are filled with the first 
	part of the message. If the MSG_PARTIAL feature is supported by the 
	underlying service provider, the MSG_PARTIAL flag is set in lpFlags and 
	subsequent receive operation(s) will retrieve the rest of the message. 
	If MSG_PARTIAL is not supported but the protocol is reliable, 
	WSARecvFrom generates the error WSAEMSGSIZE and a subsequent receive 
	operation with a larger buffer can be used to retrieve the entire 
	message. Otherwise, (that is, the protocol is unreliable and does not 
	support MSG_PARTIAL), the excess data is lost, and WSARecvFrom generates 
	the error WSAEMSGSIZE.
	
	For connection-oriented sockets, WSARecvFrom can indicate the graceful 
	termination of the virtual circuit in one of two ways, depending on 
	whether the socket is a byte stream or message oriented. For byte 
	streams, zero bytes read indicates graceful closure and that no more 
	bytes will ever be read. For message-oriented sockets, where a zero byte 
	message is often allowable, a return error code of WSAEDISCONN is used 
	to indicate graceful closure. In any case, a return error code of 
	WSAECONNRESET indicates an abortive close has occurred.
	
	lpFlags may be used to influence the behavior of the function invocation 
	beyond the options specified for the associated socket. That is, the 
	semantics of this function are determined by the socket options and the 
	lpFlags parameter. The latter is constructed by or-ing any of the 
	following values:
	
	Value        Meaning
	MSG_PEEK     Peek at the incoming data. The data is copied into the 
	             buffer but is not removed from the input queue. This flag 
	             is valid only for nonoverlapped sockets.
	MSG_OOB      Process out-of-band data. (See section Out-Of-Band data for 
	             a discussion of this topic.)
	MSG_PARTIAL  This flag is for message-oriented sockets only. On output, 
	             indicates that the data supplied is a portion of the 
	             message transmitted by the sender. Remaining portions of 
	             the message will be supplied in subsequent receive 
	             operations. A subsequent receive operation with MSG_PARTIAL 
	             flag cleared indicates end of sender's message.As an input 
	             parameter indicates that the receive operation should 
	             complete even if only part of a message has been received 
	             by the service provider.
	 
	For message-oriented sockets, the MSG_PARTIAL bit is set in the lpFlags 
	parameter if a partial message is received. If a complete message is 
	received, MSG_PARTIAL is cleared in lpFlags. In the case of delayed 
	completion, the value pointed to by lpFlags is not updated. When 
	completion has been indicated the application should call 
	WSAGetOverlappedResult and examine the flags pointed to by the lpdwFlags 
	parameter.
	Overlapped socket I/O:
	
	If an overlapped operation completes immediately, WSARecv returns a 
	value of zero and the lpNumberOfBytesRecvd parameter is updated with the 
	number of bytes received and the flag bits pointed by the lpFlags 
	parameter are also updated. If the overlapped operation is successfully 
	initiated and will complete later, WSARecv returns SOCKET_ERROR and 
	indicates error code WSA_IO_PENDING. In this case, lpNumberOfBytesRecvd 
	and lpFlags is not updated. When the overlapped operation completes the 
	amount of data transferred is indicated either through the cbTransferred 
	parameter in the completion routine (if specified), or through the 
	lpcbTransfer parameter in WSAGetOverlappedResult. Flag values are 
	obtained either through the dwFlags parameter of the completion routine, 
	or by examining the lpdwFlags parameter of WSAGetOverlappedResult.
	
	This function may be called from within the completion routine of a 
	previous WSARecv, WSARecvFrom, WSASend or WSASendTo function. For a 
	given socket, I/O completion routines will not be nested. This permits 
	time-sensitive data transmissions to occur entirely within a preemptive 
	context.
	The lpOverlapped parameter must be valid for the duration of the 
	overlapped operation. If multiple I/O operations are simultaneously 
	outstanding, each must reference a separate overlapped structure. The 
	WSAOVERLAPPED structure has the following form:
	
	typedef struct _WSAOVERLAPPED {
		DWORD        Internal;        // reserved
		DWORD        InternalHigh;    // reserved
		DWORD        Offset;          // reserved
		DWORD        OffsetHigh;      // reserved
		WSAEVENT     hEvent;
	} WSAOVERLAPPED, FAR * LPWSAOVERLAPPED;
	  
	
	If the lpCompletionRoutine parameter is NULL, the hEvent field of 
	lpOverlapped is signaled when the overlapped operation completes if it 
	contains a valid event object handle. An application can use 
	WSAWaitForMultipleEvents or WSAGetOverlappedResult to wait or poll on 
	the event object.
	If lpCompletionRoutine is not NULL, the hEvent field is ignored and can 
	be used by the application to pass context information to the completion 
	routine.
	
	The completion routine follows the same rules as stipulated for Win32 
	file I/O completion routines. The completion routine will not be invoked 
	until the thread is in an alertable wait state such as can occur when 
	the function WSAWaitForMultipleEvents with the fAlertable parameter set 
	to TRUE is invoked.
	The transport providers allow an application to invoke send and receive 
	operations from within the context of the socket I/O completion routine, 
	and guarantee that, for a given socket, I/O completion routines will not 
	be nested. This permits time-sensitive data transmissions to occur 
	entirely within a preemptive context.
	
	The prototype of the completion routine is as follows:
	
	void CALLBACK CompletionROUTINE(
		IN DWORD dwError,
		IN DWORD cbTransferred,
		IN LPWSAOVERLAPPED lpOverlapped,
		IN DWORD dwFlags
	);
	
	CompletionRoutine is a placeholder for an application-defined or 
	library-defined function name. dwError specifies the completion status 
	for the overlapped operation as indicated by lpOverlapped. cbTransferred 
	specifies the number of bytes received. dwFlags contains information 
	that would have appeared in lpFlags if the receive operation had 
	completed immediately. This function does not return a value.
	Returning from this function allows invocation of another pending 
	completion routine for this socket. When using WSAWaitForMultipleEvents, 
	all waiting completion routines are called before the alertable thread's 
	wait is satisfied with a return code of WSA_IO_COMPLETION. The 
	completion routines may be called in any order, not necessarily in the 
	same order the overlapped operations are completed. However, the posted 
	buffers are guaranteed to be filled in the same order they are supplied.
	
	Return Values
	
	If no error occurs and the receive operation has completed immediately, 
	WSARecvFrom returns zero. Note that in this case, the completion routine 
	will have already been scheduled, and to be called once the calling 
	thread is in the alertable state. Otherwise, a value of SOCKET_ERROR is 
	returned, and a specific error code may be retrieved by calling 
	WSAGetLastError. The error code WSA_IO_PENDING indicates that the 
	overlapped operation has been successfully initiated and that completion 
	will be indicated at a later time. Any other error code indicates that 
	the overlapped operation was not successfully initiated and no 
	completion indication will occur.
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAEFAULT              The lpFromlen argument was invalid: the lpFrom 
	                       buffer was too small to accommodate the peer 
	                       address, or the lpBuffers argument is not totally 
	                       contained in a valid part of the user address 
	                       space.
	WSAEINTR               The (blocking) call was canceled through 
	                       WSACancelBlockingCall.
	WSAEINPROGRESS         A blocking Windows Sockets 1.1 call is in 
	                       progress, or the service provider is still 
	                       processing a callback function.
	WSAEINVAL              The socket has not been bound with bind, or the 
	                       socket is not created with the overlapped flag.
	WSAENETRESET           The connection has been broken due to the remote 
	                       host resetting..
	WSAENOTCONN            The socket is not connected (connection-oriented 
	                       sockets only).
	WSAENOTSOCK            The descriptor is not a socket.
	WSAEOPNOTSUPP          MSG_OOB was specified, but the socket is not 
	                       stream style such as type SOCK_STREAM, out-of-
	                       band data is not supported in the communication 
	                       domain associated with this socket, or the socket 
	                       is unidirectional and supports only send 
	                       operations.
	WSAESHUTDOWN           The socket has been shut down; it is not possible 
	                       to WSARecvFrom on a socket after shutdown has 
	                       been invoked with how set to SD_RECEIVE or 
	                       SD_BOTH.
	WSAEWOULDBLOCK         Overlapped sockets: There are too many 
	                       outstanding overlapped I/O requests. 
	                       Nonoverlapped sockets: The socket is marked as 
	                       nonblocking and the receive operation cannot be 
	                       completed immediately.
	WSAEMSGSIZE            The message was too large to fit into the 
	                       specified buffer and (for unreliable protocols 
	                       only) any trailing portion of the message that 
	                       did not fit into the buffer has been discarded.
	WSAECONNABORTED        The virtual circuit was terminated due to a time-
	                       out or other failure.
	WSAECONNRESET          The virtual circuit was reset by the remote side.
	WSAEDISCON             Socket s is message oriented and the virtual 
	                       circuit was gracefully closed by the remote side.
	WSA_IO_PENDING         An overlapped operation was successfully 
	                       initiated and completion will be indicated at a 
	                       later time.
	WSA_OPERATION_ABORTED  The overlapped operation has been canceled due to 
	                       the closure of the socket.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSARecvFrom (	EIF_INTEGER s,
							EIF_POINTER lpBuffers,
							EIF_INTEGER dwBufferCount,
							EIF_POINTER lpNumberOfBytesRecvd,
							EIF_POINTER lpFlags,
							EIF_POINTER lpFrom,
							EIF_POINTER lpFromlen,
							EIF_POINTER lpOverlapped,
							EIF_POINTER lpCompletionROUTINE)
{
	return (EIF_INTEGER) WSARecvFrom (	(SOCKET)							s,
										(LPWSABUF)							lpBuffers,
										(DWORD)								dwBufferCount,
										(LPDWORD)							lpNumberOfBytesRecvd,
										(LPDWORD)							lpFlags,
										(struct sockaddr*)					lpFrom,
										(LPINT)								lpFromlen,
										(LPWSAOVERLAPPED)					lpOverlapped,
										(LPWSAOVERLAPPED_COMPLETION_ROUTINE)lpCompletionROUTINE);
}

/*
	------------------------------------------------------------------------
	WSAResetEvent
	
	The Windows Sockets WSAResetEvent function resets the state of the 
	specified event object to nonsignaled.
	
	BOOL WSAResetEvent(
		WSAEVENT hEvent	
	);	
	 
	
	Parameters
	
	* hEvent
	
	  [in] Identifies an open event object handle.
	
	Remarks
	
	The state of the event object is set to be nonsignaled.
	
	Return Values
	
	If the function succeeds, the return value is TRUE. If the function 
	fails, the return value is FALSE. To get extended error information, 
	call WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED   A successful WSAStartup must occur before using this 
	                    function.
	WSAENETDOWN         The network subsystem has failed.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 call is in progress, 
	                    or the service provider is still processing a 
	                    callback function.
	WSA_INVALID_HANDLE  hEvent is not a valid event object handle.	
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_WSAResetEvent(EIF_INTEGER hEvent)
{
	return (EIF_BOOLEAN) WSAResetEvent ((WSAEVENT) hEvent);
}

/*
	------------------------------------------------------------------------
	WSASendTo
	
	The Windows Sockets WSASendTo function sends data to a specific 
	destination, using overlapped I/O where applicable.
	
	int WSASendTo (
		SOCKET s,	
		LPWSABUF lpBuffers,	
		DWORD dwBufferCount,	
		LPDWORD lpNumberOfBytesSent,	
		DWORD dwFlags,	
		const struct sockaddr FAR * lpTo,	
		int iToLen,	
		LPWSAOVERLAPPED lpOverlapped,	
		LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionROUTINE	
	);	
	 
	
	Parameters
	
	* s
	
	  [in] A descriptor identifying a connected socket which was created 
	  using WSASocket with flag WSA_FLAG_OVERLAPPED.

	* lpBuffers

	  [in] A pointer to an array of WSABUF structures. Each WSABUF structure 
	  contains a pointer to a buffer and the length of the buffer. This 
	  array must remain valid for the duration of the send operation.

	* dwBufferCount

	  [in] The number of WSABUF structures in the lpBuffers array.

	* lpNumberOfBytesSent

	  [out] A pointer to the number of bytes sent by this call if the I/O 
	  operation completes immediately.

	* dwFlags

	  [in] Specifies the way in which the call is made.

	* lpTo

	  [in] An optional pointer to the address of the target socket.

	* iToLen

	  [in] The size of the address in lpTo.

	* lpOverlapped

	  [in] A pointer to a WSAOVERLAPPED structure (ignored for nonoverlapped 
	  sockets).

	* lpCompletionRoutine

	  [in] A pointer to the completion routine called when the send 
	  operation has been completed (ignored for nonoverlapped sockets).
	
	Remarks
	
	This function provides functionality over and above the standard sendto 
	function in two important areas:
	
	1. It can be used in conjunction with overlapped sockets to perform 
	   overlapped send operations.
	2. It allows multiple send buffers to be specified making it applicable 
	   to the scatter/gather type of I/O.
	
	WSASendTo is normally used on a connectionless socket specified by s to 
	send a datagram contained in one or more buffers to a specific peer 
	socket identified by the lpTo parameter. On a connection-oriented 
	socket, the lpTo and iToLen parameters are ignored; in this case, the 
	WSASendTo is equivalent to WSASend.
	For overlapped sockets (created using WSASocket with flag 
	WSA_FLAG_OVERLAPPED) this will occur using overlapped I/O, unless both 
	lpOverlapped and lpCompletionRoutine are NULL in which case the socket 
	is treated as a nonoverlapped socket. A completion indication will occur 
	(invocation of the completion routine or setting of an event object) 
	when the supplied buffer(s) have been consumed by the transport. If the 
	operation does not complete immediately, the final completion status is 
	retrieved through the completion routine or WSAGetOverlappedResult.
	
	For nonoverlapped sockets, the last two parameters (lpOverlapped, 
	lpCompletionRoutine) are ignored and WSASendTo adopts the same blocking 
	semantics as send. Data is copied from the supplied buffer(s) into the 
	transport's buffer. If the socket is nonblocking and stream oriented, 
	and there is not sufficient space in the transport's buffer, WSASendTo 
	will return with only part of the application's buffers having been 
	consumed. Given the same buffer situation and a blocking socket, 
	WSASendTo will block until all of the application's buffer contents have 
	been consumed.
	
	The array of WSABUF structures pointed to by the lpBuffers parameter is 
	transient. If this operation is completed in an overlapped manner, it is 
	the sercvice provider's responsibility to capture these WSABUF 
	structures before returning from this call. This enables applications to 
	build stack-based WSABUF arrays.
	For message-oriented sockets, care must be taken not to exceed the 
	maximum message size of the underlying transport, which can be obtained 
	by getting the value of socket option SO_MAX_MSG_SIZE. If the data is 
	too long to pass atomically through the underlying protocol the error 
	WSAEMSGSIZE is returned, and no data is transmitted.
	
	Note that the successful completion of a WSASendTo does not indicate 
	that the data was successfully delivered.
	dwFlags may be used to influence the behavior of the function invocation 
	beyond the options specified for the associated socket. That is, the 
	semantics of this function are determined by the socket options and the 
	dwFlags parameter. The latter is constructed by or-ing any of the 
	following values:
	
	Value          Meaning
	MSG_DONTROUTE  Specifies that the data should not be subject to routing. 
	               A Windows Sockets service provider can choose to ignore 
	               this flag.
	MSG_OOB        Send out-of-band data (stream-style socket such as 
	               SOCK_STREAM only).
	MSG_PARTIAL    Specifies that lpBuffers only contains a partial message. 
	               Note that the error code WSAEOPNOTSUPP will be returned 
	               by transports which do not support partial message 
	               transmissions.
	 
	
	Overlapped socket I/O:
	If an overlapped operation completes immediately, WSASendTo returns a 
	value of zero and the lpNumberOfBytesSent parameter is updated with the 
	number of bytes sent. If the overlapped operation is successfully 
	initiated and will complete later, WSASendTo returns SOCKET_ERROR and 
	indicates error code WSA_IO_PENDING. In this case, lpNumberOfBytesSent 
	is not updated. When the overlapped operation completes the amount of 
	data transferred is indicated either through the cbTransferred parameter 
	in the completion routine (if specified), or through the lpcbTransfer 
	parameter in WSAGetOverlappedResult.
	
	This function may be called from within the completion routine of a 
	previous WSARecv, WSARecvFrom, WSASend or WSASendTo function. This 
	permits time-sensitive data transmissions to occur entirely within a 
	preemptive context.
	The lpOverlapped parameter must be valid for the duration of the 
	overlapped operation. If multiple I/O operations are simultaneously 
	outstanding, each must reference a separate overlapped structure. The 
	WSAOVERLAPPED structure has the following form:
	
	typedef struct _WSAOVERLAPPED {
		DWORD        Internal;        // reserved
		DWORD        InternalHigh;    // reserved
		DWORD        Offset;          // reserved
		DWORD        OffsetHigh;      // reserved
		WSAEVENT     hEvent;
	) WSAOVERLAPPED, FAR * LPWSAOVERLAPPED;
	  
	
	If the lpCompletionRoutine parameter is NULL, the hEvent field of 
	lpOverlapped is signaled when the overlapped operation completes if it 
	contains a valid event object handle. An application can use 
	WSAWaitForMultipleEvents or WSAGetOverlappedResult to wait or poll on 
	the event object.
	If lpCompletionRoutine is not NULL, the hEvent field is ignored and can 
	be used by the application to pass context information to the completion 
	routine.
	
	The completion routine follows the same rules as stipulated for Win32 
	file I/O completion routines. The completion routine will not be invoked 
	until the thread is in an alertable wait state such as can occur when 
	the function WSAWaitForMultipleEvents with the fAlertable parameter set 
	to TRUE is invoked.
	Transport providers allow an application to invoke send and receive 
	operations from within the context of the socket I/O completion routine, 
	and guarantee that, for a given socket, I/O completion routines will not 
	be nested. This permits time-sensitive data transmissions to occur 
	entirely within a preemptive context.
	
	The prototype of the completion routine is as follows:
	
	void CALLBACK CompletionROUTINE(
		IN DWORD dwError,
		IN DWORD cbTransferred,
		IN LPWSAOVERLAPPED lpOverlapped,
		IN DWORD dwFlags
	);
	
	CompletionRoutine is a placeholder for an application-defined or 
	library-defined function name. dwError specifies the completion status 
	for the overlapped operation as indicated by lpOverlapped. cbTransferred 
	specifies the number of bytes sent. Currently there are no flag values 
	defined and dwFlags will be zero. This function does not return a value.
	Returning from this function allows invocation of another pending 
	completion routine for this socket. All waiting completion routines are 
	called before the alertable thread's wait is satisfied with a return 
	code of WSA_IO_COMPLETION. The completion routines may be called in any 
	order, not necessarily in the same order the overlapped operations are 
	completed. However, the posted buffers are guaranteed to be sent in the 
	same order they are supplied.
	
	Return Values
	
	If no error occurs and the send operation has completed immediately, 
	WSASendTo returns zero. Note that in this case, the completion routine 
	will have already been scheduled, and to be called once the calling 
	thread is in the alertable state. Otherwise, a value of SOCKET_ERROR is 
	returned, and a specific error code may be retrieved by calling 
	WSAGetLastError. The error code WSA_IO_PENDING indicates that the 
	overlapped operation has been successfully initiated and that completion 
	will be indicated at a later time. Any other error code indicates that 
	the overlapped operation was not successfully initiated and no 
	completion indication will occur.
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAEACCES              The requested address is a broadcast address, but 
	                       the appropriate flag was not set.
	WSAEINTR               The (blocking) call was canceled through 
	                       WSACancelBlockingCall.
	WSAEINPROGRESS         A blocking Windows Sockets 1.1 call is in 
	                       progress, or the service provider is still 
	                       processing a callback function.
	WSAEFAULT              The lpBuffers or lpTo parameters are not part of 
	                       the user address space, or the lpTo argument is 
	                       too small.
	WSAENETRESET           The connection has been broken due to the remote 
	                       host resetting.
	WSAENOBUFS             The Windows Sockets provider reports a buffer 
	                       deadlock.
	WSAENOTCONN            The socket is not connected (connection-oriented 
	                       sockets only)
	WSAENOTSOCK            The descriptor is not a socket.
	WSAEOPNOTSUPP          MSG_OOB was specified, but the socket is not 
	                       stream style such as type SOCK_STREAM, out-of-
	                       band data is not supported in the communication 
	                       domain associated with this socket, MSG_PARTIAL 
	                       is not supported, or the socket is unidirectional 
	                       and supports only receive operations.
	WSAESHUTDOWN           The socket has been shut down; it is not possible 
	                       to WSASendTo on a socket after shutdown has been 
	                       invoked with how set to SD_SEND or SD_BOTH.
	WSAEWOULDBLOCK         Overlapped sockets: There are too many 
	                       outstanding overlapped I/O requests. 
	                       Nonoverlapped sockets: The socket is marked as 
	                       nonblocking and the send operation cannot be 
	                       completed immediately.
	WSAEMSGSIZE            The socket is message oriented, and the message 
	                       is larger than the maximum supported by the 
	                       underlying transport.
	WSAEINVAL              The socket has not been bound with bind, or the 
	                       socket is not created with the overlapped flag.
	WSAECONNABORTED        The virtual circuit was terminated due to a time-
	                       out or other failure.
	WSAECONNRESET          The virtual circuit was reset by the remote side.
	WSAEADDRNOTAVAIL       The specified address is not available from the 
	                       local machine.
	WSAEAFNOSUPPORT        Addresses in the specified family cannot be used 
	                       with this socket.
	WSAEDESTADDRREQ        A destination address is required.
	WSAENETUNREACH         The network cannot be reached from this host at 
	                       this time.
	WSA_IO_PENDING         An overlapped operation was successfully 
	                       initiated and completion will be indicated at a 
	                       later time.
	WSA_OPERATION_ABORTED  The overlapped operation has been canceled due to 
	                       the closure of the socket, or the execution of 
	                       the SIO_FLUSH command in WSAIoctl.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSASendTo (	EIF_INTEGER s,
							EIF_POINTER lpBuffers,
							EIF_INTEGER dwBufferCount,
							EIF_POINTER lpNumberOfBytesSent,
							EIF_INTEGER dwFlags,
							EIF_POINTER lpTo,
							EIF_INTEGER iToLen,
							EIF_POINTER lpOverlapped,
							EIF_POINTER lpCompletionROUTINE)
{
	return (EIF_INTEGER) WSASendTo ((SOCKET)							s,
									(LPWSABUF)							lpBuffers,
									(DWORD)								dwBufferCount,
									(LPDWORD)							lpNumberOfBytesSent,
									(DWORD)								dwFlags,
									(const struct sockaddr*)			lpTo,
									(int)								iToLen,
									(LPWSAOVERLAPPED)					lpOverlapped,
									(LPWSAOVERLAPPED_COMPLETION_ROUTINE)lpCompletionROUTINE);
}

/*
	------------------------------------------------------------------------
	WSASetEvent
	
	The Windows Sockets WSASetEvent function sets the state of the specified 
	event object to signaled.
	
	BOOL WSASetEvent(
		WSAEVENT hEvent	
	);	
	 
	
	Paramters
	
	* hEvent
	
	  [in] Identifies an open event object handle.
	
	Remarks
	
	The state of the event object is set to be signaled.
	
	Return Values
	
	If the function succeeds, the return value is TRUE.
	If the function fails, the return value is FALSE. To get extended error 
	information, call WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED   A successful WSAStartup must occur before using this 
	                    function.
	WSAENETDOWN         The network subsystem has failed.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 call is in progress, 
	                    or the service provider is still processing a 
	                    callback function.
	WSA_INVALID_HANDLE  hEvent is not a valid event object handle.
	------------------------------------------------------------------------
*/

EIF_BOOLEAN c_WSASetEvent (EIF_INTEGER hEvent)
{
	return (EIF_BOOLEAN) WSASetEvent ((WSAEVENT) hEvent);
}

/*
	------------------------------------------------------------------------
	WSASetLastError
	
	The Windows Sockets WSASetLastError function sets the error code which 
	can be retrieved through the WSAGetLastError function.
	
	void WSASetLastError (
		int iError	
	);	
	 
	
	Parameters
	
	* iError
	
	  [in] Specifies the error code to be returned by a subsequent 
	  WSAGetLastError call.
	
	Remarks
	
	This function allows an application to set the error code to be returned 
	by a subsequent WSAGetLastError call for the current thread. Note that 
	any subsequent Windows Sockets routine called by the application will 
	override the error code as set by this routine.
	The error code set by WSASetLastError is different from the error code 
	reset by getsockopt SO_ERROR.
	
	Return Values
	
	None.
	
	Error Codes
	
	WSANOTINITIALISED  A successful WSAStartup must occur before using this 
	                   function.
	------------------------------------------------------------------------
*/

void c_WSASetLastError (EIF_INTEGER iError)
{
	WSASetLastError ((int) iError);
}

/*
	------------------------------------------------------------------------
	WSASocket
	
	The Windows Sockets WSASocket function creates a socket which is bound 
	to a specific transport service provider, and optionally creates and/or 
	joins a socket group.
	
	SOCKET WSASocket (
		int af,	
		int type,	
		int protocol,	
		LPWSAPROTOCOL_INFO lpProtocolInfo,	
		GROUP g,	
		DWORD dwFlags	
	);	
	 
	
	Parameters
	
	* af
	
	  [in] An address family specification.
	
	* type
	
	  [in] A type specification for the new socket.
	
	* protocol
	
	  [in] A particular protocol to be used with the socket which is 
	  specific to the indicated address family.

	* lpProtocolInfo

	  [in] A pointer to a WSAPROTOCOL_INFO structure that defines the 
	  characteristics of the socket to be created.

	* g

	  [in] The identifier of the socket group.

	* dwFlags

	  [in] The socket attribute specification.
	
	Remarks
	
	This function causes a socket descriptor and any related resources to be 
	allocated and associated with a transport service provider. By default, 
	the socket will not have an overlapped attribute. If lpProtocolInfo is 
	NULL, the Windows Sockets 2 DLL uses the first three parameters (af, 
	type, protocol) to determine which service provider is used by selecting 
	the first transport provider able to support the stipulated address 
	family, socket type and protocol values. If the lpProtocolInfo is not 
	NULL, the socket will be bound to the provider associated with the 
	indicated WSAPROTOCOL_INFO structure. In this instance, the application 
	may supply the manifest constant FROM_PROTOCOL_INFO as the value for any 
	of af, type or protocol. This indicates that the corresponding values 
	from the indicated WSAPROTOCOL_INFO structure (iAddressFamily, 
	iSocketType, iProtocol) are to be assumed. In any case, the values 
	supplied for af, type and protocol are supplied unmodified to the 
	transport service provider through the corresponding parameters to the 
	WSPSocket function in the SPI.
	
	Note: The manifest constant AF_UNSPEC continues to be defined in the 
	header file but its use is strongly discouraged, as this may cause 
	ambiguity in interpreting the value of the protocol parameter.
	
	Parameter g is used to indicate the appropriate actions on socket 
	groups:
	
	1. if g is an existing socket group ID, join the new socket to this 
	   group, provided all the requirements set by this group are met; or
	2. if g = SG_UNCONSTRAINED_GROUP, create an unconstrained socket group 
	   and have the new socket be the first member; or
	3. if g = SG_CONSTRAINED_GROUP, create a constrained socket group and 
	   have the new socket be the first member; or
	4. if g = zero, no group operation is performed
	
	For unconstrained groups, any set of sockets may be grouped together as 
	long as they are supported by a single service provider. A constrained 
	socket group may consist only of connection-oriented sockets, and 
	requires that connections on all grouped sockets be to the same address 
	on the same host. For newly created socket groups, the new group ID can 
	be retrieved by using getsockopt with option SO_GROUP_ID, if this 
	operation completes successfully. A socket group and its associated ID 
	remain valid until the last socket belonging to this socket group is 
	closed. Socket group IDs are unique across all processes for a given 
	service provider.
	
	The dwFlags parameter may be used to specify the attributes of the 
	socket by or-ing any of the following Flags:
	
	Flag                        Meaning
	WSA_FLAG_OVERLAPPED         This flag causes an overlapped socket to be 
	                            created. Overlapped sockets may utilize 
	                            WSASend, WSASendTo, WSARecv, WSARecvFrom and 
	                            WSAIoctl for overlapped I/O operations, 
	                            which allows multiple these operations to be 
	                            initiated and in progress simultaneously.
	WSA_FLAG_MULTIPOINT_C_ROOT  Indicates that the socket created will be a 
	                            c_root in a multipoint session. Only allowed 
	                            if a rooted control plane is indicated in 
	                            the protocol's WSAPROTOCOL_INFO structure. 
	                            Refer to Multipoint and Multicast Semantics 
	                            for additional information.
	WSA_FLAG_MULTIPOINT_C_LEAF  Indicates that the socket created will be a 
	                            c_leaf in a multicast session. Only allowed 
	                            if XP1_SUPPORT_MULTIPOINT is indicated in 
	                            the protocol's WSAPROTOCOL_INFO structure. 
	                            Refer to Multipoint and Multicast Semantics 
	                            for additional information.
	WSA_FLAG_MULTIPOINT_D_ROOT  Indicates that the socket created will be a 
	                            d_root in a multipoint session. Only allowed 
	                            if a rooted data plane is indicated in the 
	                            protocol's WSAPROTOCOL_INFO structure. Refer 
	                            to Multipoint and Multicast Semantics for 
	                            additional information.
	WSA_FLAG_MULTIPOINT_D_LEAF  Indicates that the socket created will be a 
	                            d_leaf in a multipoint session. Only allowed 
	                            if XP1_SUPPORT_MULTIPOINT is indicated in 
	                            the protocol's WSAPROTOCOL_INFO structure. 
	                            Refer to Multipoint and Multicast Semantics 
	                            for additional information.
	
	Important: For multipoint sockets, exactly one of 
	WSA_FLAG_MULTIPOINT_C_ROOT or WSA_FLAG_MULTIPOINT_C_LEAF must be 
	specified, and exactly one of WSA_FLAG_MULTIPOINT_D_ROOT or 
	WSA_FLAG_MULTIPOINT_D_LEAF must be specified. Refer to Multipoint and 
	Multicast Semantics for additional information.
	
	Connection-oriented sockets such as SOCK_STREAM provide full-duplex 
	connections, and must be in a connected state before any data may be 
	sent or received on them. A connection to another socket is created with 
	a connect/WSAConnect call. Once connected, data may be transferred using 
	send/WSASend and recv/WSARecv calls. When a session has been completed, 
	a closesocket must be performed.
	The communications protocols used to implement a reliable, connection-
	oriented socket ensure that data is not lost or duplicated. If data for 
	which the peer protocol has buffer space cannot be successfully 
	transmitted within a reasonable length of time, the connection is 
	considered broken and subsequent calls will fail with the error code set 
	to WSAETIMEDOUT.
	
	Connectionless, message-oriented sockets allow sending and receiving of 
	datagrams to and from arbitrary peers using sendto/WSASendTo and 
	recvfrom/WSARecvFrom. If such a socket is connected to a specific peer, 
	datagrams may be sent to that peer using send/WSASend and may be 
	received from (only) this peer using recv/WSARecv.
	Support for sockets with type RAW is not required, but service providers 
	are encourages to support raw sockets whenever it makes sense to do so.
	
	Shared Sockets
	
	When a special WSAPROTOCOL_INFO structure (obtained through the 
	WSADuplicateSocket function and used to create additional descriptors 
	for a shared socket) is passed as an input parameter to WSASocket, the g 
	and dwFlags parameters are ignored.
	
	Return Values
	
	If no error occurs, WSASocket returns a descriptor referencing the new 
	socket. Otherwise, a value of INVALID_SOCKET is returned, and a specific 
	error code may be retrieved by calling WSAGetLastError.
	
	Error Codes
	
	WSANOTINITIALISED   A successful WSAStartup must occur before using this 
	                    function.
	WSAENETDOWN         The network subsystem has failed.
	WSAEAFNOSUPPORT     The specified address family is not supported.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 call is in progress, 
	                    or the service provider is still processing a 
	                    callback function.
	WSAEMFILE           No more socket descriptors are available.
	WSAENOBUFS          No buffer space is available. The socket cannot be 
	                    created.
	WSAEPROTONOSUPPORT  The specified protocol is not supported.
	WSAEPROTOTYPE       The specified protocol is the wrong type for this 
	                    socket.
	WSAESOCKTNOSUPPORT  The specified socket type is not supported in this 
	                    address family.
	WSAEINVAL           The parameter g specified is not valid.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSASocket (	EIF_INTEGER af,
							EIF_INTEGER type,
							EIF_INTEGER protocol,
							EIF_POINTER lpProtocolInfo,
							EIF_INTEGER g,
							EIF_INTEGER dwFlags)
{
	return (EIF_INTEGER) WSASocket ((int)				af,
									(int)				type,
									(int)				protocol,
									(LPWSAPROTOCOL_INFO)lpProtocolInfo,
									(GROUP)				g,
									(DWORD)				dwFlags);
}

/*
	------------------------------------------------------------------------
	WSAStartup
	
	The Windows Sockets WSAStartup function initiates use of the Windows 
	Sockets DLL by a process.
	
	int WSAStartup (
		WORD wVersionRequested,	
		LPWSADATA lpWSAData	
	);	
	 
	
	Parameters
	
	* wVersionRequested
	
	  [in] The highest version of Windows Sockets support that the caller 
	  can use. The high order byte specifies the minor version (revision) 
	  number; the low-order byte specifies the major version number.
	
	* lpWSAData
	
	  [out] A pointer to the WSADATA data structure that is to receive 
	  details of the Windows Sockets implementation.
	
	Remarks
	
	This function must be the first Windows Sockets function called by an 
	application or DLL. It allows an application or DLL to specify the 
	version of Windows Sockets required and to retrieve details of the 
	specific Windows Sockets implementation. The application or DLL may only 
	issue further Windows Sockets functions after a successful WSAStartup 
	invocation.
	In order to support future Windows Sockets implementations and 
	applications which may have functionality differences from current 
	version of Windows Sockets, a negotiation takes place in WSAStartup. The 
	caller of WSAStartup and the Windows Sockets DLL indicate to each other 
	the highest version that they can support, and each confirms that the 
	other's highest version is acceptable. Upon entry to WSAStartup, the 
	Windows Sockets DLL examines the version requested by the application. 
	If this version is equal to or higher than the lowest version supported 
	by the DLL, the call succeeds and the DLL returns in wHighVersion the 
	highest version it supports and in wVersion the minimum of its high 
	version and wVersionRequested. The Windows Sockets DLL then assumes that 
	the application will use wVersion. If the wVersion field of the WSADATA 
	structure is unacceptable to the caller, it should call WSACleanup and 
	either search for another Windows Sockets DLL or fail to initialize.
	
	This negotiation allows both a Windows Sockets DLL and a Windows Sockets 
	application to support a range of Windows Sockets versions. An 
	application can successfully utilize a Windows Sockets DLL if there is 
	any overlap in the version ranges. The following chart gives examples of 
	how WSAStartup works in conjunction with different application and 
	Windows Sockets DLL versions:
	
	
	Note that an application should ignore the iMaxsockets, iMaxUdpDg, and 
	lpVendorInfo fields in WSAData if the value in wVersion after a 
	successful call to WSAStartup is at least 2. This is because the 
	architecture of Windows Sockets has been changed in version 2 to support 
	multiple providers, and WSAData no longer applies to a single vendor's 
	stack. Two new socket options are introduced to supply provider-specific 
	information: SO_MAX_MSG_SIZE (replaces the iMaxUdpDg element) and 
	PVD_CONFIG (allows any other provider-specific configuration to occur).
	
	An application or DLL may call WSAStartup more than once if it needs to 
	obtain the WSAData structure information more than once. On each such 
	call the application may specify any version number supported by the 
	DLL.
	There must be one WSACleanup call corresponding to every successful 
	WSAStartup call to allow third-party DLLs to make use of a Windows 
	Sockets DLL on behalf of an application. This means, for example, that 
	if an application calls WSAStartup three times, it must call WSACleanup 
	three times. The first two calls to WSACleanup do nothing except 
	decrement an internal counter; the final WSACleanup call for the task 
	does all necessary resource deallocation for the task.
	
	Return Values
	
	WSAStartup returns zero if successful. Otherwise, it returns one of the 
	error codes listed below. Note that the normal mechanism whereby the 
	application calls WSAGetLastError to determine the error code cannot be 
	used, since the Windows Sockets DLL may not have established the client 
	data area where the "last error" information is stored.
	
	Error Codes
	
	WSASYSNOTREADY      Indicates that the underlying network subsystem is 
	                    not ready for network communication.
	WSAVERNOTSUPPORTED  The version of Windows Sockets support requested is 
	                    not provided by this particular Windows Sockets 
	                    implementation.
	WSAEINPROGRESS      A blocking Windows Sockets 1.1 operation is in 
	                    progress.
	WSAEPROCLIM         Limit on the number of tasks supported by the 
	                    Windows Sockets implementation has been reached.
	WSAEFAULT           The lpWSAData is not a valid pointer.	
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAStartup (	EIF_INTEGER wVersionRequested,
							EIF_POINTER lpWSAData)
{
	return (EIF_INTEGER) WSAStartup (	(WORD)		wVersionRequested,
										(LPWSADATA)	lpWSAData);
}

/*
	------------------------------------------------------------------------
	WSAWaitForMultipleEvents
	
	The Windows Sockets WSAWaitForMultipleEvents function returns either 
	when one or all of the specified event objects are in the signaled 
	state, or when the time-out interval expires.
	
	DWORD WSAWaitForMultipleEvents(
		DWORD cEvents,	
		const WSAEVENT FAR *lphEvents,	
		BOOL fWaitAll,	
		DWORD dwTimeOUT,	
		BOOL fAlertable	
	);	
	 
	
	Parameters
	
	* cEvents
	
	  [in] Specifies the number of event object handles in the array pointed 
	  to by lphEvents. The maximum number of event object handles is 
	  WSA_MAXIMUM_WAIT_EVENTS. One or more events must be specified.

	* lphEvents

	  [in] Points to an array of event object handles.

	* fWaitAll

	  [in] Specifies the wait type. If TRUE, the function returns when all 
	  event objects in the lphEvents array are signaled at the same time. If 
	  FALSE, the function returns when any one of the event objects is 
	  signaled. In the latter case, the return value indicates the event 
	  object whose state caused the function to return.

	* dwTimeout

	  [in] Specifies the time-out interval, in milliseconds. The function 
	  returns if the interval expires, even if conditions specified by the 
	  fWaitAll parameter are not satisfied. If dwTimeout is zero, the 
	  function tests the state of the specified event objects and returns 
	  immediately. If dwTimeout is WSA_INFINITE, the function's time-out 
	  interval never expires.

	* fAlertable

	  [in] Specifies whether the function returns when the system queues an 
	  I/O completion routine for execution by the calling thread. If TRUE, 
	  the completion routine is executed and the function returns. If FALSE, 
	  the completion routine is not executed when the function returns.
	
	Remarks
	
	The WSAWaitForMultipleEvents function returns either when any one or 
	when all of the specified objects are in the signaled state, or when the 
	time-out interval elapses. This function is also used to perform an 
	alertable wait by setting the parameter fAltertable to be TRUE. This 
	enables the function to return when the system queues an I/O completion 
	routine to be executed by the calling thread.
	When fWaitAll is TRUE, the function's wait condition is satisfied only 
	when the state of all objects is signaled at the same time. The function 
	does not modify the state of the specified objects until all objects are 
	simultaneously signaled.
	
	Applications that simply need to enter an alertable wait state without 
	waiting for any event objects to be signalled should use the Win32 
	sleepEx function.
	
	Return Values
	
	If the function succeeds, the return value indicates the event object 
	that caused the function to return.
	If the function fails, the return value is WSA_WAIT_FAILED. To get 
	extended error information, call WSAGetLastError.
	The return value upon success is one of the following values:
	
	Value                             Meaning
	WSA_WAIT_EVENT_0 to
	(WSA_WAIT_EVENT_0 + cEvents - 1)  If fWaitAll is TRUE, the return value 
	                                  indicates that the state of all 
	                                  specified event objects is signaled. 
	                                  If fWaitAll is FALSE, the return value 
	                                  minus WSA_WAIT_EVENT_0 indicates the 
	                                  lphEvents array index of the object 
	                                  that satisfied the wait.
	WAIT_IO_COMPLETION                One or more I/O completion routines 
	                                  are queued for execution.
	WSA_WAIT_TIMEOUT                  The time-out interval elapsed and the 
	                                  conditions specified by the fWaitAll 
	                                  parameter are not satisfied.
	
	Error Codes
	
	WSANOTINITIALISED      A successful WSAStartup must occur before using 
	                       this function.
	WSAENETDOWN            The network subsystem has failed.
	WSAEINPROGRESS         A blocking Windows Sockets 1.1 call is in 
	                       progress, or the service provider is still 
	                       processing a callback function.
	WSA_NOT_ENOUGH_MEMORY  Not enough free memory available to complete the 
	                       operation.
	WSA_INVALID_HANDLE     One or more of the values in the lphEvents array 
	                       is not a valid event object handle.
	WSA_INVALID_PARAMETER  The cEvents parameter does not contain a valid 
	                       handle count.
	------------------------------------------------------------------------
*/

EIF_INTEGER c_WSAWaitForMultipleEvents(	EIF_INTEGER cEvents,
										EIF_POINTER lphEvents,
										EIF_BOOLEAN fWaitAll,
										EIF_INTEGER dwTimeOUT,
										EIF_BOOLEAN fAlertable)
{
	return (EIF_INTEGER) WSAWaitForMultipleEvents(	(DWORD)				cEvents,
													(const WSAEVENT*)	lphEvents,
													(BOOL)				fWaitAll,
													(DWORD)				dwTimeOUT,
													(BOOL)				fAlertable);
}
