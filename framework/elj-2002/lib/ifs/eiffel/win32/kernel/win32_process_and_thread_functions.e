class WIN32_PROCESS_AND_THREAD_FUNCTIONS


feature {NONE}

	-- AttachThreadInput

	AttachThreadInput (a_idAttach : INTEGER;
		a_idAttachTo : INTEGER;
		a_fAttach : BOOLEAN) : BOOLEAN is
			-- The AttachThreadInput function attaches the input
			-- processing mechanism of one thread to that of another
			-- thread. 
		external "C use <windows.h>"
		end -- AttachThreadInput

	-- CommandLineToArgvW

	-- CreateProcess

	CreateProcess (a_pApplicationName : POINTER;
		a_pCommandLine : POINTER;
		a_pProcessAttributes : POINTER;
		a_pThreadAttributes : POINTER;
		a_bInheritHandles : BOOLEAN;
		a_dwCreationFlags : INTEGER;
		a_lpEnvironment : POINTER;
		a_pCurrentDirectory : POINTER;
		a_pStartupInfo : POINTER;
		a_pProcessInformation : POINTER) : BOOLEAN is
--	CreateProcess (a_pApplicationName : POINTER;
--		a_pCommandLine : POINTER;
--		a_pProcessAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_pThreadAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_bInheritHandles : BOOLEAN;
--		a_dwCreationFlags : INTEGER;
--		a_lpEnvironment : POINTER;
--		a_pCurrentDirectory : POINTER;
--		a_pStartupInfo : WIN32_STARTUPINFO;
--		a_pProcessInformation : WIN32_PROCESS_INFORMATION) : BOOLEAN is
			-- The CreateProcess function creates a new process and
			-- its primary thread. The new process executes the specified
			-- executable file.
		external "C use <windows.h>"
		end -- CreateProcess

	-- CreateThread

	CreateThread (a_pThreadAttributes : POINTER;
		a_dwStackSize : INTEGER;
		a_lpStartAddress : POINTER;
		a_lpParameter : POINTER;
		a_dwCreationFlags : INTEGER;
		a_pThreadId : POINTER) : POINTER is
--	CreateThread (a_pThreadAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_dwStackSize : INTEGER;
--		a_lpStartAddress : POINTER;
--		a_lpParameter : POINTER;
--		a_dwCreationFlags : INTEGER;
--		a_pThreadId : INTEGER_REF) : POINTER is
			-- The CreateThread function creates a thread to execute
			-- within the address space of the calling process.
		external "C use <windows.h>"
		end -- CreateThread

	-- ExitProcess

	ExitProcess (a_uExitCode : INTEGER) is
			-- The ExitProcess function ends a process and all its
			-- threads. 
		external "C use <windows.h>"
		end -- ExitProcess

	-- ExitThread

	ExitThread (a_dwExitCode : INTEGER) is
			-- The ExitThread function ends a thread. 
		external "C use <windows.h>"
		end -- ExitThread

	-- FreeEnvironmentStrings

	FreeEnvironmentStrings (a_pszEnvironmentBlock : POINTER) : BOOLEAN is
--	FreeEnvironmentStrings (a_pszEnvironmentBlock : STRING) : BOOLEAN is
			-- The FreeEnvironmentStrings function frees a block
			-- of environment strings.
		external "C use <windows.h>"
		end -- FreeEnvironmentStrings

	-- GetCommandLine

	GetCommandLine : POINTER is
			-- The GetCommandLine function returns a pointer to the
			-- command-line string for the current process. 
		external "C use <windows.h>"
		end -- GetCommandLine

	-- GetCurrentProcess

	GetCurrentProcess : POINTER is
			-- The GetCurrentProcess function returns a pseudohandle
			-- for the current process.
		external "C use <windows.h>"
		end -- GetCurrentProcess

	-- GetCurrentProcessId

	GetCurrentProcessId : INTEGER is
			-- The GetCurrentProcessId function returns the process
			-- identifier of the calling process.
		external "C use <windows.h>"
		end -- GetCurrentProcessId

	-- GetCurrentThread

	GetCurrentThread : POINTER is
			-- The GetCurrentThread function returns a pseudohandle
			-- for the current thread.
		external "C use <windows.h>"
		end -- GetCurrentThread

	-- GetCurrentThreadId

	GetCurrentThreadId : INTEGER is
			-- The GetCurrentThreadId function returns the thread
			-- identifier of the calling thread.
		external "C use <windows.h>"
		end -- GetCurrentThreadId

	-- GetEnvironmentStrings

	GetEnvironmentStrings is
			-- The GetEnvironmentStrings function returns the address
			-- of the environment block for the current process. This
			-- function replaces the GetDOSEnvironment function.
		external "C use <windows.h>"
		end -- GetEnvironmentStrings

	-- GetEnvironmentVariable

	GetEnvironmentVariable (a_pName : POINTER;
		a_pBuffer : POINTER;
		a_nSize : INTEGER) : INTEGER is
--	GetEnvironmentVariable (a_pName : STRING;
--		a_pBuffer : STRING;
--		a_nSize : INTEGER) : INTEGER is
			-- The GetEnvironmentVariable function retrieves the
			-- value of the specified variable from the environment
			-- block of the calling process. The value is in the form
			-- of a null-terminated string of characters.
		external "C use <windows.h>"
		end -- GetEnvironmentVariable

	-- GetExitCodeProcess

	GetExitCodeProcess (a_hProcess : POINTER;
		a_pExitCode : POINTER) : BOOLEAN is
--	GetExitCodeProcess (a_hProcess : POINTER;
--		a_pExitCode : INTEGER_REF) : BOOLEAN is
			-- The GetExitCodeProcess function retrieves the termination
			-- status of the specified process.
		external "C use <windows.h>"
		end -- GetExitCodeProcess

	-- GetExitCodeThread

	GetExitCodeThread (a_hThread : POINTER;
		a_pExitCode : POINTER) : BOOLEAN is
--	GetExitCodeThread (a_hThread : POINTER;
--		a_pExitCode : INTEGER_REF) : BOOLEAN is
			-- The GetExitCodeThread function retrieves the termination
			-- status of the specified thread.
		external "C use <windows.h>"
		end -- GetExitCodeThread

	-- GetPriorityClass

	GetPriorityClass (a_hProcess : POINTER) : INTEGER is
			-- The GetPriorityClass function returns the priority
			-- class for the specified process. This value, together
			-- with the priority value of each thread of the process,
			-- determines each thread's base priority level. 
		external "C use <windows.h>"
		end -- GetPriorityClass

	-- GetProcessAffinityMask

	GetProcessAffinityMask (a_hProcess : POINTER;
		a_pProcessAffinityMask : POINTER;
		a_pSystemAffinityMask : POINTER) : BOOLEAN is
--	GetProcessAffinityMask (a_hProcess : POINTER;
--		a_pProcessAffinityMask : INTEGER_REF;
--		a_pSystemAffinityMask : INTEGER_REF) : BOOLEAN is
			-- The GetProcessAffinityMask function obtains a process
			-- affinity mask for the specified process and the system
			-- affinity mask for the system. - A process affinity
			-- mask is a bit vector in which each bit represents the
			-- processors that a process is allowed to run on. A system
			-- affinity mask is a bit vector in which each bit represents
			-- the processors that are configured into a system. -
			-- A process affinity mask is a proper subset of a system
			-- affinity mask. A process is only allowed to run on
			-- the processors configured into a system.
		external "C use <windows.h>"
		end -- GetProcessAffinityMask

	-- GetProcessShutdownParameters

	GetProcessShutdownParameters (a_pdwLevel : POINTER;
		a_pdwFlags : POINTER) : BOOLEAN is
--	GetProcessShutdownParameters (a_pdwLevel : INTEGER_REF;
--		a_pdwFlags : INTEGER_REF) : BOOLEAN is
			-- The GetProcessShutdownParameters function retrieves
			-- shutdown parameters for the currently calling process.
		external "C use <windows.h>"
		end -- GetProcessShutdownParameters

	-- GetProcessTimes

	GetProcessTimes (a_hProcess : POINTER;
		a_pCreationTime : POINTER;
		a_pExitTime : POINTER;
		a_pKernelTime : POINTER;
		a_pUserTime : POINTER) : BOOLEAN is
--	GetProcessTimes (a_hProcess : POINTER;
--		a_pCreationTime : WIN32_FILETIME;
--		a_pExitTime : WIN32_FILETIME;
--		a_pKernelTime : WIN32_FILETIME;
--		a_pUserTime : WIN32_FILETIME) : BOOLEAN is
			-- The GetProcessTimes function obtains timing information
			-- about a specified process. 
		external "C use <windows.h>"
		end -- GetProcessTimes

	-- GetProcessVersion

	GetProcessVersion (a_ProcessId : INTEGER) : INTEGER is
			-- The GetProcessVersion function obtains the major and
			-- minor version numbers of the Windows version on which
			-- a specified process expects to run. [New - Windows
			-- NT] 
		external "C use <windows.h>"
		end -- GetProcessVersion

	-- GetProcessWorkingSetSize

	GetProcessWorkingSetSize (a_hProcess : POINTER;
		a_pMinimumWorkingSetSize : POINTER;
		a_pMaximumWorkingSetSize : POINTER) : BOOLEAN is
--	GetProcessWorkingSetSize (a_hProcess : POINTER;
--		a_pMinimumWorkingSetSize : INTEGER_REF;
--		a_pMaximumWorkingSetSize : INTEGER_REF) : BOOLEAN is
			-- The GetProcessWorkingSetSize function obtains the
			-- minimum and maximum working set sizes of a specified
			-- process. The "working set" of a process is the set
			-- of memory pages currently visible to the process in
			-- physical RAM memory. These pages are resident and available
			-- for an application to use without triggering a page
			-- fault. The size of a process' working set is specified
			-- in bytes. The minimum and maximum working set sizes
			-- affect the virtual memory paging behavior of a process.
		external "C use <windows.h>"
		end -- GetProcessWorkingSetSize

	-- GetStartupInfo

	GetStartupInfo (a_pStartupInfo : POINTER) is
--	GetStartupInfo (a_pStartupInfo : WIN32_STARTUPINFO) is
			-- The GetStartupInfo function retrieves the contents
			-- of the STARTUPINFO structure that was specified when
			-- the calling process was created.
		external "C use <windows.h>"
		end -- GetStartupInfo

	-- GetThreadPriority

	GetThreadPriority (a_hThread : POINTER) : INTEGER is
			-- The GetThreadPriority function returns the priority
			-- value for the specified thread. This value, together
			-- with the priority class of the thread's process, determines
			-- the thread's base-priority level.
		external "C use <windows.h>"
		end -- GetThreadPriority

	-- GetThreadTimes

	GetThreadTimes (a_hThread : POINTER;
		a_pCreationTime : POINTER;
		a_pExitTime : POINTER;
		a_pKernelTime : POINTER;
		a_pUserTime : POINTER) : BOOLEAN is
--	GetThreadTimes (a_hThread : POINTER;
--		a_pCreationTime : WIN32_FILETIME;
--		a_pExitTime : WIN32_FILETIME;
--		a_pKernelTime : WIN32_FILETIME;
--		a_pUserTime : WIN32_FILETIME) : BOOLEAN is
			-- The GetThreadTimes function obtains timing information
			-- about a specified thread.
		external "C use <windows.h>"
		end -- GetThreadTimes

	-- OpenProcess

	OpenProcess (a_fdwAccess : INTEGER;
		a_fInherit : BOOLEAN;
		a_IDProcess : INTEGER) : POINTER is
			-- The OpenProcess function returns a handle of an existing
			-- process object.
		external "C use <windows.h>"
		end -- OpenProcess

	-- ResumeThread

	ResumeThread (a_hThread : POINTER) : INTEGER is
			-- The ResumeThread function decrements a thread's suspend
			-- count. When the suspend count is decremented to zero,
			-- the execution of the thread is resumed.
		external "C use <windows.h>"
		end -- ResumeThread

	-- SetEnvironmentVariable

	SetEnvironmentVariable (a_pszName : POINTER;
		a_pszValue : POINTER) : BOOLEAN is
--	SetEnvironmentVariable (a_pszName : STRING;
--		a_pszValue : STRING) : BOOLEAN is
			-- The SetEnvironmentVariable function sets the value
			-- of an environment variable for the current process.
			-- 
		external "C use <windows.h>"
		end -- SetEnvironmentVariable

	-- SetPriorityClass

	SetPriorityClass (a_hProcess : POINTER;
		a_fdwPriority : INTEGER) : BOOLEAN is
			-- The SetPriorityClass function sets the priority class
			-- for the specified process. This value together with
			-- the priority value of each thread of the process determines
			-- each thread's base priority level.
		external "C use <windows.h>"
		end -- SetPriorityClass

	-- SetProcessShutdownParameters

	SetProcessShutdownParameters (a_dwLevel : INTEGER;
		a_dwFlags : INTEGER) : BOOLEAN is
			-- The SetProcessShutdownParameters function sets shutdown
			-- parameters for the currently calling process. This
			-- function sets a shutdown order for a process relative
			-- to the other processes in the system. 
		external "C use <windows.h>"
		end -- SetProcessShutdownParameters

	-- SetThreadAffinityMask

	SetThreadAffinityMask (a_hThread : POINTER;
		a_dwThreadAffinityMask : INTEGER) : INTEGER is
			-- The SetThreadAffinityMask function sets a processor
			-- affinity mask for a specified thread. 1 - A thread
			-- affinity mask is a bit vector in which each bit represents
			-- the processors that a thread is allowed to run on.
			-- 2 - A thread affinity mask must be a proper subset
			-- of the process affinity mask for the containing process
			-- of a thread. A thread is only allowed to run on the
			-- processors its process is allowed to run on.
		external "C use <windows.h>"
		end -- SetThreadAffinityMask

	-- SetThreadPriority

	SetThreadPriority (a_hThread : POINTER;
		a_nPriority : INTEGER) : BOOLEAN is
			-- The SetThreadPriority function sets the priority value
			-- for the specified thread. This value, together with
			-- the priority class of the thread's process, determines
			-- the thread's base priority level.
		external "C use <windows.h>"
		end -- SetThreadPriority

	-- Sleep

	Sleep (a_cMilliseconds : INTEGER) is
			-- The Sleep function suspends the execution of the current
			-- thread for a specified interval.
		external "C use <windows.h>"
		end -- Sleep

	-- SleepEx

	SleepEx (a_dwTimeout : INTEGER;
		a_fAlertable : BOOLEAN) : INTEGER is
			-- The SleepEx function causes the current thread to
			-- enter a wait state until the specified interval of
			-- time has passed, or until an I/O completion callback
			-- function is called. This function is available only
			-- in the Win32 API. 
		external "C use <windows.h>"
		end -- SleepEx

	-- SetProcessWorkingSetSize

	SetProcessWorkingSetSize (a_hProcess : POINTER;
		a_dwMinimumWorkingSetSize : INTEGER;
		a_dwMaximumWorkingSetSize : INTEGER) : BOOLEAN is
			-- The SetProcessWorkingSetSize function sets the minimum
			-- and maximum working set sizes for a specified process.
			-- - The working set of a process is the set of memory
			-- pages currently visible to the process in physical
			-- RAM memory. These pages are resident and available
			-- for an application to use without triggering a page
			-- fault. The size of the working set of a process is
			-- specified in bytes. The minimum and maximum working
			-- set sizes affect the virtual memory paging behavior
			-- of a process.
		external "C use <windows.h>"
		end -- SetProcessWorkingSetSize

	-- SuspendThread

	SuspendThread (a_hThread : POINTER) : INTEGER is
			-- The SuspendThread function suspends the specified
			-- thread.
		external "C use <windows.h>"
		end -- SuspendThread

	-- TerminateProcess

	TerminateProcess (a_hProcess : POINTER;
		a_uExitCode : INTEGER) : BOOLEAN is
			-- The TerminateProcess function terminates the specified
			-- process and all of its threads.
		external "C use <windows.h>"
		end -- TerminateProcess

	-- TerminateThread

	TerminateThread (a_hThread : POINTER;
		a_dwExitCode : INTEGER) : BOOLEAN is
			-- The TerminateThread function terminates a thread.
		external "C use <windows.h>"
		end -- TerminateThread

	-- TlsAlloc

	TlsAlloc : INTEGER is
			-- The TlsAlloc function allocates a thread local storage
			-- (TLS) index. Any thread of the process can subsequently
			-- use this index to store and retrieve values that are
			-- local to the thread. 
		external "C use <windows.h>"
		end -- TlsAlloc

	-- TlsFree

	TlsFree (a_dwTlsIndex : INTEGER) : BOOLEAN is
			-- The TlsFree function releases a thread local storage
			-- (TLS) index, making it available for reuse. 
		external "C use <windows.h>"
		end -- TlsFree

	-- TlsGetValue

	TlsGetValue (a_dwTlsIndex : INTEGER) is
			-- The TlsGetValue function retrieves the value in the
			-- calling thread's thread local storage (TLS) slot for
			-- a specified TLS index. Each thread of a process has
			-- its own slot for each TLS index. 
		external "C use <windows.h>"
		end -- TlsGetValue

	-- TlsSetValue

	TlsSetValue (a_dwTlsIndex : INTEGER;
		a_lpvTlsValue : POINTER) : BOOLEAN is
			-- The TlsSetValue function stores a value in the calling
			-- thread's thread local storage (TLS) slot for a specified
			-- TLS index. Each thread of a process has its own slot
			-- for each TLS index. 
		external "C use <windows.h>"
		end -- TlsSetValue

	-- WaitForInputIdle

	WaitForInputIdle (a_hProcess : POINTER;
		a_dwTimeout : INTEGER) : INTEGER is
			-- The WaitForInputIdle function waits until the given
			-- process is waiting for user input with no input pending,
			-- or until the time-out interval has elapsed. The WaitForInputIdle
			-- function only works with GUI applications. If a console
			-- application calls the function, it returns immediately,
			-- with no wait. 
		external "C use <windows.h>"
		end -- WaitForInputIdle

	-- WinExec

	WinExec (a_pszCmdLine : POINTER;
		a_fuCmdShow : INTEGER) : INTEGER is
--	WinExec (a_pszCmdLine : STRING;
--		a_fuCmdShow : INTEGER) : INTEGER is
			-- The WinExec function runs the specified application.
			-- This function is provided for compatibility with earlier
			-- versions of Windows. For Win32-based applications,
			-- use the CreateProcess function. 
		external "C use <windows.h>"
		end -- WinExec

end -- class WIN32_PROCESS_AND_THREAD_FUNCTIONS
