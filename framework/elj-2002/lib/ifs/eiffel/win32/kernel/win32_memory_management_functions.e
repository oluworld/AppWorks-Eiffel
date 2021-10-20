class WIN32_MEMORY_MANAGEMENT_FUNCTIONS

inherit
	WIN32_MEMORY_MANAGEMENT_CONSTANTS

feature {NONE}

	-- CopyMemory

	CopyMemory (a_Destination : POINTER;
		a_Source : POINTER;
		a_Length : INTEGER) is
			-- The CopyMemory function copies a block of memory from
			-- one location to another. 
		external "C use <windows.h>"
		end -- CopyMemory

	-- FillMemory

	FillMemory (a_Destination : POINTER;
		a_Length : INTEGER;
		a_Fill : INTEGER) is
			-- The FillMemory function fills a block of memory with
			-- a specified value. 
		external "C use <windows.h>"
		end -- FillMemory

	-- GetProcessHeap

	GetProcessHeap : POINTER is
			-- The GetProcessHeap function obtains a handle to the
			-- heap of the calling process. This handle can then be
			-- used in calls to the HeapAlloc, HeapReAlloc, HeapFree,
			-- and HeapSize functions. 
		external "C use <windows.h>"
		end -- GetProcessHeap

	-- GetProcessHeaps

	GetProcessHeaps (a_NumberOfHeaps : INTEGER;
		a_ProcessHeaps : POINTER) : INTEGER is
			-- The GetProcessHeaps function obtains handles to all
			-- of the heaps that are valid for the calling process.
		external "C use <windows.h>"
		end -- GetProcessHeaps

	-- GlobalAlloc

	GlobalAlloc (a_uFlags : INTEGER;
		a_dwBytes : INTEGER) : POINTER is
			-- The GlobalAlloc function allocates the specified number
			-- of bytes from the heap. In the linear Win32 API environment,
			-- there is no difference between the local heap and the
			-- global heap. 
		external "C use <windows.h>"
		end -- GlobalAlloc

	-- GlobalDiscard

	GlobalDiscard (a_hglbMem : POINTER) : POINTER is
			-- The GlobalDiscard function discards the specified
			-- global memory block. The lock count of the memory object
			-- must be zero. 
		external "C use <windows.h>"
		end -- GlobalDiscard

	-- GlobalFlags

	GlobalFlags (a_hMem : POINTER) : INTEGER is
			-- The GlobalFlags function returns information about
			-- the specified global memory object. 
		external "C use <windows.h>"
		end -- GlobalFlags

	-- GlobalFree

	GlobalFree (a_hMem : POINTER) : POINTER is
			-- The GlobalFree function frees the specified global
			-- memory object and invalidates its handle. 
		external "C use <windows.h>"
		end -- GlobalFree

	-- GlobalHandle

	GlobalHandle (a_pMem : POINTER) : POINTER is
			-- The GlobalHandle function retrieves the handle associated
			-- with the specified pointer to a global memory block.
			-- 
		external "C use <windows.h>"
		end -- GlobalHandle

	-- GlobalLock

	GlobalLock (a_hMem : POINTER) : POINTER is
			-- The GlobalLock function locks a global memory object
			-- and returns a pointer to the first byte of the object's
			-- memory block. The memory block associated with a locked
			-- memory object cannot be moved or discarded. For memory
			-- objects allocated with the GMEM_MOVEABLE flag, the
			-- function increments the lock count associated with
			-- the memory object. 
		external "C use <windows.h>"
		end -- GlobalLock

	-- GlobalMemoryStatus

	GlobalMemoryStatus (a_pBuffer : POINTER) is
--	GlobalMemoryStatus (a_pBuffer : WIN32_MEMORYSTATUS) is
			-- The GlobalMemoryStatus function retrieves information
			-- about current available memory. The function returns
			-- information about both physical and virtual memory.
			-- This function supersedes the GetFreeSpace function.
			-- 
		external "C use <windows.h>"
		end -- GlobalMemoryStatus

	-- GlobalReAlloc

	GlobalReAlloc (a_hMem : POINTER;
		a_dwBytes : INTEGER;
		a_uFlags : INTEGER) : POINTER is
			-- The GlobalReAlloc function changes the size or attributes
			-- of a specified global memory object. The size can increase
			-- or decrease. 
		external "C use <windows.h>"
		end -- GlobalReAlloc

	-- GlobalSize

	GlobalSize (a_hMem : POINTER) : INTEGER is
			-- The GlobalSize function retrieves the current size,
			-- in bytes, of the specified global memory object. 
		external "C use <windows.h>"
		end -- GlobalSize

	-- GlobalUnlock

	GlobalUnlock (a_hMem : POINTER) : BOOLEAN is
			-- The GlobalUnlock function decrements the lock count
			-- associated with a memory object that was allocated
			-- with the GMEM_MOVEABLE flag. This function has no effect
			-- on memory objects allocated with the GMEM_FIXED flag.
			-- 
		external "C use <windows.h>"
		end -- GlobalUnlock

	-- HeapAlloc

	HeapAlloc (a_hHeap : POINTER;
		a_dwFlags : INTEGER;
		a_dwBytes : INTEGER) : POINTER is
			-- The HeapAlloc function allocates a block of memory
			-- from a heap. The allocated memory is not movable. 
		external "C use <windows.h>"
		end -- HeapAlloc

	-- HeapCompact

	HeapCompact (a_hHeap : POINTER;
		a_dwFlags : INTEGER) : INTEGER is
			-- The HeapCompact function attempts to compact a specified
			-- heap. It compacts the heap by coalescing adjacent free
			-- blocks of memory and decommitting large free blocks
			-- of memory.
		external "C use <windows.h>"
		end -- HeapCompact

	-- HeapCreate

	HeapCreate (a_flOptions : INTEGER;
		a_dwInitialSize : INTEGER;
		a_dwMaximumSize : INTEGER) : POINTER is
			-- The HeapCreate function creates a heap object that
			-- can be used by the calling process. The function reserves
			-- a contiguous block in the virtual address space of
			-- the process and allocates physical storage for a specified
			-- initial portion of this block. 
		external "C use <windows.h>"
		end -- HeapCreate

	-- HeapDestroy

	HeapDestroy (a_hHeap : POINTER) : BOOLEAN is
			-- The HeapDestroy function destroys the specified heap
			-- object. HeapDestroy decommits and releases all the
			-- pages of a private heap object, and it invalidates
			-- the handle of the heap. 
		external "C use <windows.h>"
		end -- HeapDestroy

	-- HeapFree

	HeapFree (a_hHeap : POINTER;
		a_dwFlags : INTEGER;
		a_lpMem : POINTER) : BOOLEAN is
			-- The HeapFree function frees a memory block allocated
			-- from a heap by the HeapAlloc or HeapReAlloc function.
			-- 
		external "C use <windows.h>"
		end -- HeapFree

	-- HeapLock

	HeapLock (a_hHeap : POINTER) : BOOLEAN is
			-- The HeapLock function attempts to acquire the critical
			-- section object, or lock, that is associated with a
			-- specified heap. If the function succeeds, the calling
			-- thread owns the heap lock. Only the calling thread
			-- will be able to allocate or release memory from the
			-- heap. The execution of any other thread of the calling
			-- process will be blocked if that thread attempts to
			-- allocate or release memory from the heap. Such threads
			-- will remain blocked until the thread that owns the
			-- heap lock calls the HeapUnlock function.
		external "C use <windows.h>"
		end -- HeapLock

	-- HeapReAlloc

	HeapReAlloc (a_hHeap : POINTER;
		a_dwFlags : INTEGER;
		a_lpMem : POINTER;
		a_dwBytes : INTEGER) : POINTER is
			-- The HeapReAlloc function reallocates a block of memory
			-- from a heap. This function enables you to resize a
			-- memory block and change other memory block properties.
			-- The allocated memory is not movable. 
		external "C use <windows.h>"
		end -- HeapReAlloc

	-- HeapSize

	HeapSize (a_hHeap : POINTER;
		a_dwFlags : INTEGER;
		a_lpMem : POINTER) : INTEGER is
			-- The HeapSize function returns the size, in bytes,
			-- of a memory block allocated from a heap by the HeapAlloc
			-- or HeapReAlloc function. 
		external "C use <windows.h>"
		end -- HeapSize

	-- HeapUnlock

	HeapUnlock (a_hHeap : POINTER) : BOOLEAN is
			-- The HeapUnlock function releases ownership of the
			-- critical section object, or lock, that is associated
			-- with a specified heap. The HeapUnlock function reverses
			-- the action of the HeapLock function.
		external "C use <windows.h>"
		end -- HeapUnlock

	-- HeapValidate

	HeapValidate (a_hHeap : POINTER;
		a_dwFlags : INTEGER;
		a_lpMem : POINTER) : BOOLEAN is
			-- The HeapValidate function attempts to validate a specified
			-- heap. The function scans all the memory blocks in the
			-- heap, and verifies that the heap control structures
			-- maintained by the operating system's heap manager are
			-- in a consistent state. You can also use the HeapValidate
			-- function to validate a single memory block within a
			-- specified heap, without checking the validity of the
			-- entire heap.
		external "C use <windows.h>"
		end -- HeapValidate

	-- IsBadCodePtr

	IsBadCodePtr (a_lpfn : POINTER) : BOOLEAN is
			-- The IsBadCodePtr function determines whether the calling
			-- process has read access to the memory at the specified
			-- address. 
		external "C use <windows.h>"
		end -- IsBadCodePtr

	-- IsBadHugeReadPtr

	IsBadHugeReadPtr (a_lp : POINTER;
		a_ucb : INTEGER) : BOOLEAN is
			-- The IsBadHugeReadPtr function verifies that the calling
			-- process has read access to the specified range of memory.
			-- 
		external "C use <windows.h>"
		end -- IsBadHugeReadPtr

	-- IsBadHugeWritePtr

	IsBadHugeWritePtr (a_lp : POINTER;
		a_ucb : INTEGER) : BOOLEAN is
			-- The IsBadHugeWritePtr function verifies that the calling
			-- process has write access to the specified range of
			-- memory. 
		external "C use <windows.h>"
		end -- IsBadHugeWritePtr

	-- IsBadReadPtr

	IsBadReadPtr (a_lp : POINTER;
		a_ucb : INTEGER) : BOOLEAN is
			-- The IsBadReadPtr function verifies that the calling
			-- process has read access to the specified range of memory.
			-- 
		external "C use <windows.h>"
		end -- IsBadReadPtr

	-- IsBadStringPtr

	IsBadStringPtr (a_psz : POINTER;
		a_ucchMax : INTEGER) : BOOLEAN is
			-- The IsBadStringPtr function verifies that the calling
			-- process has read access to a range of memory pointed
			-- to by a string pointer. 
		external "C use <windows.h>"
		end -- IsBadStringPtr

	-- IsBadWritePtr

	IsBadWritePtr (a_lp : POINTER;
		a_ucb : INTEGER) : BOOLEAN is
			-- The IsBadWritePtr function verifies that the calling
			-- process has write access to the specified range of
			-- memory. 
		external "C use <windows.h>"
		end -- IsBadWritePtr

	-- LocalAlloc

	LocalAlloc (a_uFlags : INTEGER;
		a_uBytes : INTEGER) : POINTER is
			-- The LocalAlloc function allocates the specified number
			-- of bytes from the heap. In the linear Win32 API environment,
			-- there is no difference between the local heap and the
			-- global heap. 
		external "C use <windows.h>"
		end -- LocalAlloc

	-- LocalDiscard

	LocalDiscard (a_hlocMem : POINTER) : POINTER is
			-- The LocalDiscard function discards the specified local
			-- memory object. The lock count of the memory object
			-- must be zero. 
		external "C use <windows.h>"
		end -- LocalDiscard

	-- LocalFlags

	LocalFlags (a_hMem : POINTER) : INTEGER is
			-- The LocalFlags function returns information about
			-- the specified local memory object. 
		external "C use <windows.h>"
		end -- LocalFlags

	-- LocalFree

	LocalFree (a_hMem : POINTER) : POINTER is
			-- The LocalFree function frees the specified local memory
			-- object and invalidates its handle. 
		external "C use <windows.h>"
		end -- LocalFree

	-- LocalHandle

	LocalHandle (a_pMem : POINTER) : POINTER is
			-- The LocalHandle function retrieves the handle associated
			-- with the specified pointer to a local memory object.
		external "C use <windows.h>"
		end -- LocalHandle

	-- LocalLock

	LocalLock (a_hMem : POINTER) : POINTER is
			-- The LocalLock function locks a local memory object
			-- and returns a pointer to the first byte of the object's
			-- memory block. The memory block associated with a locked
			-- memory object cannot be moved or discarded. For memory
			-- objects allocated with the LMEM_MOVEABLE flag, the
			-- function increments the object's lock count. 
		external "C use <windows.h>"
		end -- LocalLock

	-- LocalReAlloc

	LocalReAlloc (a_hMem : POINTER;
		a_uBytes : INTEGER;
		a_uFlags : INTEGER) : POINTER is
			-- The LocalReAlloc function changes the size or the
			-- attributes of a specified local memory object. The
			-- size can increase or decrease. 
		external "C use <windows.h>"
		end -- LocalReAlloc

	-- LocalSize

	LocalSize (a_hMem : POINTER) : INTEGER is
			-- The LocalSize function returns the current size, in
			-- bytes, of the specified local memory object. 
		external "C use <windows.h>"
		end -- LocalSize

	-- LocalUnlock

	LocalUnlock (a_hMem : POINTER) : BOOLEAN is
			-- The LocalUnlock function decrements the lock count
			-- associated with a memory object that was allocated
			-- with the LMEM_MOVEABLE flag. This function has no effect
			-- on memory objects allocated with the LMEM_FIXED flag.
			-- 
		external "C use <windows.h>"
		end -- LocalUnlock

	-- MoveMemory

	MoveMemory (a_Destination : POINTER;
		a_Source : POINTER;
		a_Length : INTEGER) is
			-- The MoveMemory function moves a block of memory from
			-- one location to another. 
		external "C use <windows.h>"
		end -- MoveMemory

	-- VirtualAlloc

	VirtualAlloc (a_lpvAddress : POINTER;
		a_cbSize : INTEGER;
		a_fdwAllocationType : INTEGER;
		a_fdwProtect : INTEGER) : POINTER is
			-- The VirtualAlloc function reserves or commits a region
			-- of pages in the virtual address space of the calling
			-- process. Memory allocated by this function is automatically
			-- initialized to zero. 
		external "C use <windows.h>"
		end -- VirtualAlloc

	-- VirtualFree

	VirtualFree (a_lpvAddress : POINTER;
		a_cbSize : INTEGER;
		a_fdwFreeType : INTEGER) : BOOLEAN is
			-- The VirtualFree function releases or decommits (or
			-- both) a region of pages within the virtual address
			-- space of the calling process. 
		external "C use <windows.h>"
		end -- VirtualFree

	-- VirtualLock

	VirtualLock (a_lpvAddress : POINTER;
		a_cbSize : INTEGER) : BOOLEAN is
			-- The VirtualLock function locks the specified region
			-- of the process's virtual address space into memory,
			-- ensuring that subsequent access to the region will
			-- not incur a page fault. 
		external "C use <windows.h>"
		end -- VirtualLock

	-- VirtualProtect

	VirtualProtect (a_lpvAddress : POINTER;
		a_cbSize : INTEGER;
		a_fdwNewProtect : INTEGER;
		a_fdwOldProtect : POINTER) : BOOLEAN is
--	VirtualProtect (a_lpvAddress : POINTER;
--		a_cbSize : INTEGER;
--		a_fdwNewProtect : INTEGER;
--		a_fdwOldProtect : INTEGER_REF) : BOOLEAN is
			-- The VirtualProtect function changes the access protection
			-- on a region of committed pages in the virtual address
			-- space of the calling process. This function differs
			-- from VirtualProtectEx, which changes the access protection
			-- of any process.
		external "C use <windows.h>"
		end -- VirtualProtect

	-- VirtualProtectEx

	VirtualProtectEx (a_hProcess : POINTER;
		a_lpvAddress : POINTER;
		a_cbSize : INTEGER;
		a_fdwNewProtect : INTEGER;
		a_fdwOldProtect : POINTER) : BOOLEAN is
--	VirtualProtectEx (a_hProcess : POINTER;
--		a_lpvAddress : POINTER;
--		a_cbSize : INTEGER;
--		a_fdwNewProtect : INTEGER;
--		a_fdwOldProtect : INTEGER_REF) : BOOLEAN is
			-- The VirtualProtectEx function changes the access protection
			-- on a region of committed pages in the virtual address
			-- space of a specified process. Note that this function
			-- differs from VirtualProtect, which changes the access
			-- protection on the calling process only.
		external "C use <windows.h>"
		end -- VirtualProtectEx

	-- VirtualQuery

	VirtualQuery (a_lpvAddress : POINTER;
		a_mbiBuffer : POINTER;
		a_cbLength : INTEGER) : INTEGER is
--	VirtualQuery (a_lpvAddress : POINTER;
--		a_mbiBuffer : WIN32_MEMORY_BASIC_INFORMATION;
--		a_cbLength : INTEGER) : INTEGER is
			-- The VirtualQuery function provides information about
			-- a range of pages in the virtual address space of the
			-- calling process. 
		external "C use <windows.h>"
		end -- VirtualQuery

	-- VirtualQueryEx

	VirtualQueryEx (a_hProcess : POINTER;
		a_lpvAddress : POINTER;
		a_mbiBuffer : POINTER;
		a_cbLength : INTEGER) : INTEGER is
--	VirtualQueryEx (a_hProcess : POINTER;
--		a_lpvAddress : POINTER;
--		a_mbiBuffer : WIN32_MEMORY_BASIC_INFORMATION;
--		a_cbLength : INTEGER) : INTEGER is
			-- The VirtualQueryEx function provides information about
			-- a range of pages within the virtual address space of
			-- a specified process. 
		external "C use <windows.h>"
		end -- VirtualQueryEx

	-- VirtualUnlock

	VirtualUnlock (a_lpvAddress : POINTER;
		a_cbSize : INTEGER) : BOOLEAN is
			-- The VirtualUnlock function unlocks a specified range
			-- of pages in the virtual address space of a process,
			-- enabling the system to swap the pages out to the paging
			-- file if necessary. 
		external "C use <windows.h>"
		end -- VirtualUnlock

	-- ZeroMemory

	ZeroMemory (a_Destination : POINTER;
		a_Length : INTEGER) is
			-- The ZeroMemory function fills a block of memory with
			-- zeros. 
		external "C use <windows.h>"
		end -- ZeroMemory

end -- class WIN32_MEMORY_MANAGEMENT_FUNCTIONS