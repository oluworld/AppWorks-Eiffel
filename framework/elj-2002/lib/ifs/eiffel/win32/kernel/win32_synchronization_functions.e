class WIN32_SYNCHRONIZATION_FUNCTIONS

inherit
	WIN32_SYNCHRONIZATION_CONSTANTS

feature {NONE}

	-- CancelWaitableTimer

	CancelWaitableTimer (a_hTimer : POINTER) : BOOLEAN is
			--  The CancelWaitableTimer function sets the specified
			-- "waitable" timer to the inactive state. [New - Windows
			-- NT]
		external "C use <windows.h>"
		end -- CancelWaitableTimer

	-- CreateEvent

	CreateEvent (a_EventAttributes : POINTER;
				a_bManualReset : BOOLEAN;
				a_bInitialState : BOOLEAN;
				a_Name : POINTER) : POINTER is
--	CreateEvent (a_EventAttributes : WIN32_SECURITY_ATTRIBUTES;
--				a_bManualReset : BOOLEAN;
--				a_bInitialState : BOOLEAN;
--				a_Name : STRING) : INTEGER is
			--  The CreateEvent function creates a named or unnamed
			-- event object. 
		external "C use <windows.h>"
		end -- CreateEvent

	-- CreateMutex

	CreateMutex (a_MutexAttributes : POINTER;
				a_bInitialOwner : BOOLEAN;
				a_Name : POINTER) : POINTER is
--	CreateMutex (a_MutexAttributes : WIN32_SECURITY_ATTRIBUTES;
--				a_bInitialOwner : BOOLEAN;
--				a_Name : STRING) : INTEGER is
			--  The CreateMutex function creates a named or unnamed
			-- mutex object. 
		external "C use <windows.h>"
		end -- CreateMutex

	-- CreateSemaphore

	CreateSemaphore (a_SemaphoreAttributes : POINTER;
				a_lInitialCount : INTEGER;
				a_lMaximumCount : INTEGER;
				a_Name : POINTER) : POINTER is
--	CreateSemaphore (a_SemaphoreAttributes : WIN32_SECURITY_ATTRIBUTES;
--				a_lInitialCount : INTEGER;
--				a_lMaximumCount : INTEGER;
--				a_Name : STRING) : INTEGER is
			--  The CreateSemaphore function creates a named or unnamed
			-- semaphore object. 
		external "C use <windows.h>"
		end -- CreateSemaphore

	-- CreateWaitableTimer

	CreateWaitableTimer (a_TimerAttributes : POINTER;
				a_bManualReset : BOOLEAN;
				a_TimerName : POINTER) : POINTER is
--	CreateWaitableTimer (a_TimerAttributes : WIN32_SECURITY_ATTRIBUTES;
--				a_bManualReset : BOOLEAN;
--				a_TimerName : STRING) : INTEGER is
			--  The CreateWaitableTimer function creates a "waitable"
			-- timer object. [New - Windows NT]
		external "C use <windows.h>"
		end -- CreateWaitableTimer

	-- DeleteCriticalSection

	DeleteCriticalSection (a_CriticalSection : POINTER) is
--	DeleteCriticalSection (a_CriticalSection : WIN32_CRITICAL_SECTION) is
			--  The DeleteCriticalSection function releases all resources
			-- used by an unowned critical section object. 
		external "C use <windows.h>"
		end -- DeleteCriticalSection

	-- EnterCriticalSection

	EnterCriticalSection (a_CriticalSection : POINTER) is
--	EnterCriticalSection (a_CriticalSection : WIN32_CRITICAL_SECTION) is
			--  The EnterCriticalSection function waits for ownership
			-- of the specified critical section object. The function
			-- returns when the calling thread is granted ownership.
			-- 
		external "C use <windows.h>"
		end -- EnterCriticalSection

	-- GetOverlappedResult

	GetOverlappedResult (a_hFile : POINTER;
				a_Overlapped : POINTER;
				a_NumberOfBytesTransferred : POINTER;
				a_bWait : BOOLEAN) : BOOLEAN is
--	GetOverlappedResult (a_hFile : INTEGER;
--				a_Overlapped : WIN32_OVERLAPPED;
--				a_NumberOfBytesTransferred : INTEGER_REF;
--				a_bWait : BOOLEAN) : BOOLEAN is
			--  The GetOverlappedResult function returns the results
			-- of an overlapped operation on the specified file, named
			-- pipe, or communications device. Windows 95: This function
			-- works only on serial devices or on files opened by
			-- using the DeviceIoControl function.
		external "C use <windows.h>"
		end -- GetOverlappedResult

	-- InitializeCriticalSection

	InitializeCriticalSection (a_CriticalSection : POINTER) is
--	InitializeCriticalSection (a_CriticalSection : WIN32_CRITICAL_SECTION) is
			--  The InitializeCriticalSection function initializes
			-- a critical section object. 
		external "C use <windows.h>"
		end -- InitializeCriticalSection

	-- InterlockedCompareExchange

	InterlockedCompareExchange (a_Destination : POINTER;
				a_Exchange : POINTER;
				a_Comperand : POINTER) is
			--  The InterlockedCompareExchange function performs an
			-- atomic comparison of the values specified in the Destination
			-- and Comperand parameters and exchange of the values,
			-- based on the outcome of the comparison. The function
			-- prevents more than one thread from using the same variable
			-- simultaneously. [New - Windows NT]
		external "C use <windows.h>"
		end -- InterlockedCompareExchange

	-- InterlockedDecrement

	InterlockedDecrement (a_Addend : POINTER) : INTEGER is
--	InterlockedDecrement (a_Addend : INTEGER_REF) : INTEGER is
			--  The InterlockedDecrement function both decrements
			-- (decreases by one) the value of the specified 32-bit
			-- variable and checks the resulting value. The function
			-- prevents more than one thread from using the same variable
			-- simultaneously.
		external "C use <windows.h>"
		end -- InterlockedDecrement

	-- InterlockedExchange

	InterlockedExchange (a_Target_deref : POINTER;
				a_Value : INTEGER) : INTEGER is
--	InterlockedExchange (a_Target_deref : INTEGER_REF;
--				a_Value : INTEGER) : INTEGER is
			--  The InterlockedExchange function atomically exchanges
			-- a pair of 32-bit values. The function prevents more
			-- than one thread from using the same variable simultaneously.
		external "C use <windows.h>"
		end -- InterlockedExchange

	-- InterlockedExchangeAdd

	InterlockedExchangeAdd (a_Addend_deref : POINTER;
				a_Increment : INTEGER) : INTEGER is
--	InterlockedExchangeAdd (a_Addend_deref : INTEGER_REF;
--				a_Increment : INTEGER) : INTEGER is
			--  The InterlockExchangeAdd function performs an atomic
			-- addition of an increment value to an addend variable.
			-- The function prevents more than one thread from using
			-- the same variable simultaneously. [New - Windows NT]
		external "C use <windows.h>"
		end -- InterlockedExchangeAdd

	-- InterlockedIncrement

	InterlockedIncrement (a_Addend : POINTER) : INTEGER is
--	InterlockedIncrement (a_Addend : INTEGER_REF) : INTEGER is
			--  The InterlockedIncrement function both increments
			-- (increases by one) the value of the specified 32-bit
			-- variable and checks the resulting value. The function
			-- prevents more than one thread from using the same variable
			-- simultaneously. 
		external "C use <windows.h>"
		end -- InterlockedIncrement

	-- LeaveCriticalSection

	LeaveCriticalSection (a_CriticalSection : POINTER) is
--	LeaveCriticalSection (a_CriticalSection : WIN32_CRITICAL_SECTION) is
			--  The LeaveCriticalSection function releases ownership
			-- of the specified critical section object. 
		external "C use <windows.h>"
		end -- LeaveCriticalSection

	-- MsgWaitForMultipleObjects

	MsgWaitForMultipleObjects (a_nCount : INTEGER;
				a_Handles : POINTER;
				a_fWaitAll : BOOLEAN;
				a_dwMilliseconds : INTEGER;
				a_dwWakeMask : INTEGER) : INTEGER is
--	MsgWaitForMultipleObjects (a_nCount : INTEGER;
--				a_Handles : ARRAY[INTEGER];
--				a_fWaitAll : BOOLEAN;
--				a_dwMilliseconds : INTEGER;
--				a_dwWakeMask : INTEGER) : INTEGER is
			--  The MsgWaitForMultipleObjects function returns when
			-- one of the following occurs: 1) Either any one or all
			-- of the specified objects are in the signaled state.
			-- The objects can include input event objects, which
			-- you specify using the dwWakeMask parameter. 2) The
			-- time-out interval elapses. NOTE: that MsgWaitForMultipleObjects
			-- doesn't return if there was previously unread input
			-- of the specified type in the queue. It only wakes up
			-- when input arrives. 
		external "C use <windows.h>"
		end -- MsgWaitForMultipleObjects

	-- MsgWaitForMultipleObjectsEx

	MsgWaitForMultipleObjectsEx (a_nCount : INTEGER;
				a_Handles : POINTER;
				a_dwMilliseconds : INTEGER;
				a_dwWakeMask : INTEGER;
				a_dwFlags : INTEGER) : INTEGER is
--	MsgWaitForMultipleObjectsEx (a_nCount : INTEGER;
--				a_Handles : ARRAY[INTEGER];
--				a_dwMilliseconds : INTEGER;
--				a_dwWakeMask : INTEGER;
--				a_dwFlags : INTEGER) : INTEGER is
			--  The MsgWaitForMultipleObjectsEx function returns when
			-- one of the following occurs: [New - Windows NT] 1)
			-- Either any one or all of the specified objects are
			-- in the signaled state. The array of objects can include
			-- input event objects, which you specify using the dwWakeMask
			-- parameter. 2) An I/O completion routine or asynchronous
			-- procedure call (APC) is queued to the thread. 3) The
			-- time-out interval elapses. - The MsgWaitForMultipleObjectsEx
			-- function does not return if there is unread input of
			-- the specified type in the queue. It returns only when
			-- new input arrives. 
		external "C use <windows.h>"
		end -- MsgWaitForMultipleObjectsEx

	-- OpenEvent

	OpenEvent (a_dwDesiredAccess : BIT 32;
				a_bInheritHandle : BOOLEAN;
				a_Name : POINTER) : POINTER is
--	OpenEvent (a_dwDesiredAccess : INTEGER;
--				a_bInheritHandle : BOOLEAN;
--				a_Name : STRING) : INTEGER is
			--  The OpenEvent function returns a handle of an existing
			-- named event object. 
		external "C use <windows.h>"
		end -- OpenEvent

	-- OpenMutex

	OpenMutex (a_dwDesiredAccess : BIT 32;
				a_bInheritHandle : BOOLEAN;
				a_Name : POINTER) : POINTER is
--	OpenMutex (a_dwDesiredAccess : INTEGER;
--				a_bInheritHandle : BOOLEAN;
--				a_Name : STRING) : INTEGER is
			--  The OpenMutex function returns a handle of an existing
			-- named mutex object. 
		external "C use <windows.h>"
		end -- OpenMutex

	-- OpenSemaphore

	OpenSemaphore (a_dwDesiredAccess : BIT 32;
				a_bInheritHandle : BOOLEAN;
				a_Name : POINTER) : POINTER is
--	OpenSemaphore (a_dwDesiredAccess : INTEGER;
--				a_bInheritHandle : BOOLEAN;
--				a_Name : STRING) : INTEGER is
			--  The OpenSemaphore function returns a handle of an
			-- existing named semaphore object. 
		external "C use <windows.h>"
		end -- OpenSemaphore

	-- OpenWaitableTimer

	OpenWaitableTimer (a_dwDesiredAccess : INTEGER;
				a_bInheritHandle : BOOLEAN;
				a_TimerName : POINTER) : POINTER is
--	OpenWaitableTimer (a_dwDesiredAccess : INTEGER;
--				a_bInheritHandle : BOOLEAN;
--				a_TimerName : STRING) : INTEGER is
			--  The OpenWaitableTimer function returns a handle to
			-- an existing named "waitable" timer object. [New - Windows
			-- NT]
		external "C use <windows.h>"
		end -- OpenWaitableTimer

	-- PulseEvent

	PulseEvent (a_hEvent : POINTER) : BOOLEAN is
			--  The PulseEvent function provides a single operation
			-- that sets (to signaled) the state of the specified
			-- event object and then resets it (to nonsignaled) after
			-- releasing the appropriate number of waiting threads.
			-- 
		external "C use <windows.h>"
		end -- PulseEvent

	-- QueueUserAPC

	QueueUserAPC (a_pfnAPC : POINTER;
				a_hThread : INTEGER;
				a_dwData : INTEGER) : INTEGER is
			--  The QueueUserAPC function adds a user-mode asynchronous
			-- procedure call (APC) object to the APC queue of the
			-- specified thread. [New - Windows NT]
		external "C use <windows.h>"
		end -- QueueUserAPC

	-- ReleaseMutex

	ReleaseMutex (a_hMutex : POINTER) : BOOLEAN is
			--  The ReleaseMutex function releases ownership of the
			-- specified mutex object. 
		external "C use <windows.h>"
		alias "ReleaseMutex"
		end -- ReleaseMutex

	-- ReleaseSemaphore

	ReleaseSemaphore (a_hSemaphore : POINTER;
				a_lReleaseCount : INTEGER;
				a_PreviousCount : POINTER) : BOOLEAN is
			--  The ReleaseSemaphore function increases the count
			-- of the specified semaphore object by a specified amount.
			-- 
		external "C use <windows.h>"
		alias "ReleaseSemaphore"
		end -- ReleaseSemaphore

	-- ResetEvent

	ResetEvent (a_hEvent : POINTER) : BOOLEAN is
			--  The ResetEvent function sets the state of the specified
			-- event object to nonsignaled. 
		external "C use <windows.h>"
		alias "ResetEvent"
		end -- ResetEvent

	-- SetEvent

	SetEvent (a_hEvent : POINTER) : BOOLEAN is
			--  The SetEvent function sets the state of the specified
			-- event object to signaled. 
		external "C use <windows.h>"
		alias "SetEvent"
		end -- SetEvent

	-- SetWaitableTimer

	SetWaitableTimer (a_hTimer : INTEGER;
				a_pDueTime : INTEGER;  -- ??
				a_lPeriod : INTEGER;
				a_pfnCompletionRoutine : POINTER;
				a_lpArgToCompletionRoutine : POINTER;
				a_fResume : BOOLEAN) : BOOLEAN is
			--  The SetWaitableTimer function activates the specified
			-- "waitable" timer. When the due time arrives, the timer
			-- is signaled and the thread that set the timer calls
			-- the optional completion routine. [New - Windows NT]
		external "C use <windows.h>"
		alias "SetWaitableTimer"
		end -- SetWaitableTimer

	-- SignalObjectAndWait

	SignalObjectAndWait (a_hObjectToSignal : POINTER;
				a_hObjectToWaitOn : POINTER;
				a_dwMilliseconds : INTEGER;
				a_bAlertable : BOOLEAN) : BOOLEAN is
			--  The SignalObjectAndWait function allows the caller
			-- to atomically signal an object and wait on another
			-- object. [New - Windows NT]
		external "C use <windows.h>"
		alias "SignalObjectAndWait"
		end -- SignalObjectAndWait

	-- TryEnterCriticalSection

	TryEnterCriticalSection (a_CriticalSection : POINTER) : BOOLEAN is
			--  The TryEnterCriticalSection function attempts to enter
			-- a critical section without blocking. If the call is
			-- successful, the calling thread takes ownership of the
			-- critical section. [New - Windows NT]
		external "C use <windows.h>"
		alias "TryEnterCriticalSection"
		end -- TryEnterCriticalSection

	-- WaitForMultipleObjects

	WaitForMultipleObjects (a_nCount : INTEGER;
				a_Handles : POINTER;
				a_bWaitAll : BOOLEAN;
				a_dwMilliseconds : INTEGER) : INTEGER is
			--  The WaitForMultipleObjects function returns when one
			-- of the following occurs: 1) Either any one or all of
			-- the specified objects are in the signaled state. 2)
			-- The time-out interval elapses.
		external "C use <windows.h>"
		alias "WaitForMultipleObjects"
		end -- WaitForMultipleObjects

	-- WaitForSingleObject

	WaitForSingleObject (a_hHandle : POINTER;
				a_dwMilliseconds : INTEGER) : INTEGER is
			--  The WaitForSingleObject function returns when one
			-- of the following occurs: 1) The specified object is
			-- in the signaled state. 2) The time-out interval elapses.
		external "C use <windows.h>"
		alias "WaitForSingleObject"
		end -- WaitForSingleObject

	-- WaitForMultipleObjectsEx

	WaitForMultipleObjectsEx (a_nCount : INTEGER;
				a_Handles : POINTER;
				a_bWaitAll : BOOLEAN;
				a_dwMilliseconds : INTEGER;
				a_bAlertable : BOOLEAN) : INTEGER is
			--  The WaitForMultipleObjectsEx function returns when
			-- one of the following occurs: 1) Either any one or all
			-- of the specified objects are in the signaled state.
			-- 2) An I/O completion routine or asynchronous procedure
			-- call (APC) is queued to the thread. 3) The time-out
			-- interval elapses.
		external "C use <windows.h>"
		alias "WaitForMultipleObjectsEx"
		end -- WaitForMultipleObjectsEx

	-- WaitForSingleObjectEx      

	WaitForSingleObjectEx (a_hHandle : POINTER;
				a_dwMilliseconds : INTEGER;
				a_bAlertable : BOOLEAN) : INTEGER is
			--  The WaitForSingleObjectEx function returns when one
			-- of the following occurs: 1) The specified object is
			-- in the signaled state. 2) An I/O completion routine
			-- or asynchronous procedure call (APC) is queued to the
			-- thread. 3) The time-out interval elapses.
		external "C use <windows.h>"
		alias "WaitForSingleObjectEx"
		end -- WaitForSingleObjectEx

end -- class WIN32_SYNCHRONIZATION_FUNCTIONS