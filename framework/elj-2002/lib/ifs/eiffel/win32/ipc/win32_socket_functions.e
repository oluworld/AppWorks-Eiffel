indexing
	contents: "WIN32 standard socket functions"
	author: "Uwe Sander, usander@online.de"
	completed: no
	tested: no
	
class WIN32_SOCKET_FUNCTIONS

inherit
	WIN32_SOCKET_CONSTANTS

feature {NONE}

	accept (a_socket:	INTEGER;
			a_addr:		POINTER;
			a_addrlen:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- accept
		
	bind (a_socket:	INTEGER;
			a_addr:		POINTER;
			a_addrlen:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- bind
		
	closesocket (a_socket: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- closesocket
	
	connect (a_socket:	INTEGER;
				a_addr:		POINTER;
				a_addrlen:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- connect
			
	getpeername (a_socket:	INTEGER;
					a_addr:		POINTER;
					a_addrlen:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- getpeername
			
	getsockname (a_socket:	INTEGER;
					a_addr:		POINTER;
					a_addrlen:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- getsockname
		
	getsockopt (a_socket:	INTEGER;
				a_level:	INTEGER;
				a_optname:	INTEGER;
				a_buffer:	POINTER;
				a_buf_len:	POINTER): INTEGER is
		external "C use <windows.h>"
		end -- getsockopt
		
	htonl (a_int: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- htonl

	htons (a_int: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- htons

	inet_addr (a_addr: POINTER): INTEGER is
		external "C use <windows.h>"
		end -- inet_addr

	inet_ntoa (a_addr: POINTER): POINTER is
		external "C use <windows.h>"
		end -- inet_ntoa
		
	ioctlsocket (a_socket:	INTEGER;
					a_cmd:		INTEGER;
					a_arg:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- ioctlsocket
		
	listen (a_socket: INTEGER; a_backlog: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- listen

	ntohl (a_int: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- ntohl

	ntohs (a_int: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- ntohs

	recv (a_socket:	INTEGER;
			a_buffer:	POINTER;
			a_len:		INTEGER;
			a_flags:	BIT 32): INTEGER is
		external "C use <windows.h>"
		end -- recv
			
	recvfrom (a_socket:	INTEGER;
				a_buffer:	POINTER;
				a_len:		INTEGER;
				a_flags:	BIT 32;
				a_from:		POINTER;
				a_from_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- recvfrom
		
	s_select (a_count:		INTEGER;
				a_read_set:		POINTER;
				a_write_set:	POINTER;
				a_except_set:	POINTER;
				a_timeval:		POINTER): INTEGER is
		external "C use <windows.h>"
		end -- s_select
			
	send (a_socket:	INTEGER;
			a_buffer:	POINTER;
			a_len:		INTEGER;
			a_flags:	BIT 32): INTEGER is
		external "C use <windows.h>"
		end -- send
						
	sendto (a_socket:	INTEGER;
			a_buffer:	POINTER;
			a_len:		INTEGER;
			a_flags:	BIT 32;
			a_to:		POINTER;
			a_to_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- sendto
		
	setsockopt (a_socket:	INTEGER;
				a_level:	INTEGER;
				a_optname:	INTEGER;
				a_buffer:	POINTER;
				a_buf_len:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- setsockopt

	shutdown (a_socket: INTEGER; a_how: INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- shutdown

	socket (a_af:		INTEGER;
			a_type:		INTEGER;
			a_protocol:	INTEGER): INTEGER is
		external "C use <windows.h>"
		end -- socket
	
	fd_clr (a_fd:	INTEGER;
			a_set:	POINTER) is
		external "C use <windows.h>"
		end -- fd_clr
				
	fd_set (a_fd:	INTEGER;
			a_set:	POINTER) is
		external "C use <windows.h>"
		end -- fd_set
				
	fd_zero (a_set:	POINTER) is
		external "C use <windows.h>"
		end -- fd_zero
				
	fd_isset (a_fd:	INTEGER;
				a_set:	POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- fd_isset

	timerisset (a_timerval: POINTER): BOOLEAN is
		external "C use <windows.h>"
		end -- timerisset
		
	timerclear (a_timerval: POINTER) is
		external "C use <windows.h>"
		end -- timerclear
	
	FIONREAD: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=FIONREAD;%N")
			Result := res
		end -- FIONREAD
	
	FIONBIO: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=FIONBIO;%N")
			Result := res
		end -- FIONBIO
	
	FIOASYNC: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=FIOASYNC;%N")
			Result := res
		end -- FIOASYNC
	
	SIOCSHIWAT: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=SIOCSHIWAT;%N")
			Result := res
		end -- SIOCSHIWAT
	
	SIOCGHIWAT: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=SIOCGHIWAT;%N")
			Result := res
		end -- SIOCGHIWAT
	
	SIOCGLOWAT: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=SIOCGLOWAT;%N")
			Result := res
		end -- SIOCGLOWAT
	
	SIOCATMARK: INTEGER is
		local
			res: INTEGER
		do
			c_inline_c ("_res=SIOCATMARK;%N")
			Result := res
		end -- SIOCATMARK
	
	IN_CLASSA (a_addr: INTEGER): BOOLEAN is
		local
			res: BOOLEAN
			adr: INTEGER
		do
			adr := a_addr
			c_inline_c ("_res=(EIF_BOOLEAN)IN_CLASSA(_adr);%N")
			Result := res
		end -- IN_CLASSA
		
	IN_CLASSB (a_addr: INTEGER): BOOLEAN is
		local
			res: BOOLEAN
			adr: INTEGER
		do
			adr := a_addr
			c_inline_c ("_res=(EIF_BOOLEAN)IN_CLASSB(_adr);%N")
			Result := res
		end -- IN_CLASSB
		
	IN_CLASSC (a_addr: INTEGER): BOOLEAN is
		local
			res: BOOLEAN
			adr: INTEGER
		do
			adr := a_addr
			c_inline_c ("_res=(EIF_BOOLEAN)IN_CLASSC(_adr);%N")
			Result := res
		end -- IN_CLASSC

	WSAMAKEASYNCREPLY (a_val1: INTEGER; a_val2: INTEGER): INTEGER is
		local
			res: INTEGER
			va1: INTEGER
			va2: INTEGER
		do
			va1 := a_val1
			va2 := a_val2
			c_inline_c ("_res=WSAMAKEASYNCREPLY(_va1, _va2);%N")
			Result := res
		end -- WSAMAKEASYNCREPLY

	WSAMAKESELECTREPLY (a_val1: INTEGER; a_val2: INTEGER): INTEGER is
		local
			res: INTEGER
			va1: INTEGER
			va2: INTEGER
		do
			va1 := a_val1
			va2 := a_val2
			c_inline_c ("_res=WSAMAKESELECTREPLY(_va1, _va2);%N")
			Result := res
		end -- WSAMAKESELECTREPLY

	WSAGETASYNCBUFLEN (a_val: INTEGER): INTEGER is
		local
			res: INTEGER
			val: INTEGER
		do
			val := a_val
			c_inline_c ("_res=WSAGETASYNCBUFLEN(_val);%N")
			Result := res
		end -- WSAGETASYNCBUFLEN

	WSAGETASYNCERROR (a_val: INTEGER): INTEGER is
		local
			res: INTEGER
			val: INTEGER
		do
			val := a_val
			c_inline_c ("_res=WSAGETASYNCERROR(_val);%N")
			Result := res
		end -- WSAGETASYNCERROR

	WSAGETSELECTERROR (a_val: INTEGER): INTEGER is
		local
			res: INTEGER
			val: INTEGER
		do
			val := a_val
			c_inline_c ("_res=WSAGETSELECTERROR(_val);%N")
			Result := res
		end -- WSAGETSELECTERROR

end -- class WIN32_SOCKET_FUNCTIONS