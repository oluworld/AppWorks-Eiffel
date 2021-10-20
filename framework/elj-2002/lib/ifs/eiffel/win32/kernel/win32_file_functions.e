class WIN32_FILE_FUNCTIONS

inherit
	WIN32_FILE_CONSTANTS

feature {NONE}

	-- _hread

	hread_ (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_lBytes : INTEGER) : INTEGER is
			-- The _hread function reads data from the specified
			-- file. This function is provided for compatibility with
			-- 16-bit versions of Windows. Win32-based applications
			-- should use the ReadFile function. 
		external "C use <windows.h>"
		end -- hread_

	-- _hwrite

	hwrite_ (a_hFile : POINTER;
		a_pBuffer : POINTER;
		a_lBytes : INTEGER) : INTEGER is
			-- The _hwrite function writes data to the specified
			-- file. This function is provided for compatibility with
			-- 16-bit versions of Windows. Win32-based applications
			-- should use the WriteFile function. 
		external "C use <windows.h>"
		end -- hwrite_

	-- _lclose

	lclose_ (a_hFile : POINTER) : INTEGER is
			-- The _lclose function closes the specified file so
			-- that it is no longer available for reading or writing.
			-- This function is provided for compatibility with 16-bit
			-- versions of Windows. Win32-based applications should
			-- use the CloseHandle function. 
		external "C use <windows.h>"
		end -- lclose_

	-- _lcreat

	lcreat_ (a_pPathName : POINTER;
		a_iAttribute : INTEGER) : INTEGER is
			-- The _lcreat function creates or opens a specified
			-- file. This function is provided for compatibility with
			-- 16-bit versions of Windows. Win32-based applications
			-- should use the CreateFile function. 
		external "C use <windows.h>"
		end -- lcreat_

	-- _llseek

	llseek_ (a_hFile : POINTER;
		a_lOffset : INTEGER;
		a_iOrigin : INTEGER) : INTEGER is
			-- The _llseek function repositions the file pointer
			-- in a previously opened file. This function is provided
			-- for compatibility with 16-bit versions of Windows.
			-- Win32-based applications should use the SetFilePointer
			-- function. 
		external "C use <windows.h>"
		end -- llseek_

	-- _lopen

	lopen_ (a_pPathName : POINTER;
		a_iReadWrite : INTEGER) : INTEGER is
			-- The _lopen function opens an existing file and sets
			-- the file pointer to the beginning of the file. This
			-- function is provided for compatibility with 16-bit
			-- versions of Windows. Win32-based applications should
			-- use the CreateFile function. 
		external "C use <windows.h>"
		end -- lopen_

	-- _lread

	lread_ (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_uBytes : INTEGER) : INTEGER is
			-- The _lread function reads data from the specified
			-- file. This function is provided for compatibility with
			-- 16-bit versions of Windows. Win32-based applications
			-- should use the ReadFile function. 
		external "C use <windows.h>"
		end -- lread_

	-- _lwrite

	lwrite_ (a_hFile : POINTER;
		a_pBuffer : POINTER;
		a_uBytes : INTEGER) : INTEGER is
			-- The _lwrite function writes data to the specified
			-- file. This function is provided for compatibility with
			-- 16-bit versions of Windows. Win32-based applications
			-- should use the WriteFile function. 
		external "C use <windows.h>"
		end -- lwrite_

	-- AreFileApisANSI

	AreFileApisANSI : BOOLEAN is
			-- The AreFileApisANSI function determines whether a
			-- set of Win32 file functions is using the ANSI or OEM
			-- character set code page. This function is useful for
			-- 8-bit console input and output operations.
		external "C use <windows.h>"
		end -- AreFileApisANSI

	-- CopyFile

	CopyFile (a_pExistingFileName : POINTER;
		a_pNewFileName : POINTER;
		a_bFailIfExists : BOOLEAN) : BOOLEAN is
--	CopyFile (a_pExistingFileName : STRING;
--		a_pNewFileName : STRING;
--		a_bFailIfExists : BOOLEAN) : BOOLEAN is
			-- The CopyFile function copies an existing file to a
			-- new file. 
		external "C use <windows.h>"
		end -- CopyFile

	-- CreateDirectory

	CreateDirectory (a_pPathName : POINTER;
		a_pSecurityAttributes : POINTER) : BOOLEAN is
--	CreateDirectory (a_pPathName : STRING;
--		a_pSecurityAttributes : WIN32_SECURITY_ATTRIBUTES) : BOOLEAN is
			-- The CreateDirectory function creates a new directory.
			-- If the underlying file system supports security on
			-- files and directories, the function applies a specified
			-- security descriptor to the new directory. Note that
			-- CreateDirectory does not have a template parameter,
			-- while CreateDirectoryEx does.
		external "C use <windows.h>"
		end -- CreateDirectory

	-- CreateDirectoryEx

	CreateDirectoryEx (a_pTemplateDirectory : POINTER;
		a_pNewDirectory : POINTER;
		a_pSecurityAttributes : POINTER) : BOOLEAN is
--	CreateDirectoryEx (a_pTemplateDirectory : STRING;
--		a_pNewDirectory : STRING;
--		a_pSecurityAttributes : WIN32_SECURITY_ATTRIBUTES) : BOOLEAN is
			-- The CreateDirectoryEx function creates a new directory
			-- with a specified path that retains the attributes of
			-- a specified template directory. If the underlying file
			-- system supports security on files and directories,
			-- the function applies a specified security descriptor
			-- to the new directory. The new directory retains the
			-- other attributes of the specified template directory.
			-- Note that CreateDirectoryEx has a template parameter,
			-- while CreateDirectory does not.
		external "C use <windows.h>"
		end -- CreateDirectoryEx

	-- CreateFile

	CreateFile (a_pFileName : POINTER;
		a_dwDesiredAccess : BIT 32;
		a_dwShareMode : BIT 32;
		a_pSecurityAttributes : POINTER;
		a_dwCreationDistribution : INTEGER;
		a_dwFlagsAndAttributes : BIT 32;
		a_hTemplateFile : POINTER) : POINTER is
--	CreateFile (a_pFileName : STRING;
--		a_dwDesiredAccess : BIT 32;
--		a_dwShareMode : BIT 32;
--		a_pSecurityAttributes : WIN32_SECURITY_ATTRIBUTES;
--		a_dwCreationDistribution : INTEGER;
--		a_dwFlagsAndAttributes : BIT 32;
--		a_hTemplateFile : POINTER) : POINTER is
			-- The CreateFile function creates, opens, or truncates
			-- a file, pipe, communications resource, disk device,
			-- or console. It returns a handle that can be used to
			-- access the object. It can also open and return a handle
			-- to a directory.
		external "C use <windows.h>"
		end -- CreateFile

	-- CreateIoCompletionPort

	CreateIoCompletionPort (a_FileHandle : POINTER;
		a_ExistingCompletionPort : POINTER;
		a_CompletionKey : INTEGER;
		a_NumberOfConcurrentThreads : INTEGER) : POINTER is
			-- The CreateIoCompletionPort function associates an
			-- instance of an opened file with a newly created or
			-- an existing input/output completion port. Associating
			-- an instance of an opened file with an input/output
			-- completion port lets an application receive notification
			-- of the completion of asynchronous input/output operations
			-- involving that file. (Windows NT only: CreateIoCompletionPort
			-- can create an input/output completion port without
			-- associating it with a file.)
		external "C use <windows.h>"
		end -- CreateIoCompletionPort

	-- DefineDosDevice

	DefineDosDevice (a_dwFlags : INTEGER;
		a_pDeviceName : POINTER;
		a_pTargetPath : POINTER) : BOOLEAN is
--	DefineDosDevice (a_dwFlags : INTEGER;
--		a_pDeviceName : STRING;
--		a_pTargetPath : STRING) : BOOLEAN is
			-- The DefineDosDevice function lets an application define,
			-- redefine, or delete MS-DOS device names. MS-DOS device
			-- names are stored as symbolic links in the object name
			-- space in 32-bit versions of Windows. The code that
			-- converts an MS-DOS path into a corresponding path in
			-- 32-bit versions of Windows uses these symbolic links
			-- to map MS-DOS devices and drive letters. The DefineDosDevice
			-- function provides a mechanism whereby a Win32-based
			-- application can modify the symbolic links used to implement
			-- the MS-DOS device name space. 
		external "C use <windows.h>"
		end -- DefineDosDevice

	-- DeleteFile

	DeleteFile (a_pFileName : POINTER) : BOOLEAN is
--	DeleteFile (a_pFileName : STRING) : BOOLEAN is
			-- The DeleteFile function deletes an existing file.
			-- 
		external "C use <windows.h>"
		end -- DeleteFile

	-- FileIOCompletionRoutine

	FileIOCompletionRoutine (a_dwErrorCode : INTEGER;
		a_dwNumberOfBytesTransfered : INTEGER;
		a_pOverlapped : POINTER) is
--	FileIOCompletionRoutine (a_dwErrorCode : INTEGER;
--		a_dwNumberOfBytesTransfered : INTEGER;
--		a_pOverlapped : WIN32_OVERLAPPED) is
			-- The FileIOCompletionRoutine function is called when
			-- an asynchronous input and output (I/O) function ( ReadFileEx
			-- or WriteFileEx) is completed and the calling thread
			-- is in an alertable wait (using the SleepEx, WaitForSingleObjectEx,
			-- or WaitForMultipleObjectsEx function with the fAlertable
			-- flag set to TRUE). 
		external "C use <windows.h>"
		end -- FileIOCompletionRoutine

	-- FindClose

	FindClose (a_hFindFile : POINTER) : BOOLEAN is
			-- The FindClose function closes the specified search
			-- handle. The FindFirstFile and FindNextFile functions
			-- use the search handle to locate files with names that
			-- match a given name. 
		external "C use <windows.h>"
		end -- FindClose

	-- FindCloseChangeNotification

	FindCloseChangeNotification (a_hChangeHandle : POINTER) : BOOLEAN is
			-- The FindCloseChangeNotification function stops change
			-- notification handle monitoring. 
		external "C use <windows.h>"
		end -- FindCloseChangeNotification

	-- FindFirstChangeNotification

	FindFirstChangeNotification (a_pPathName : POINTER;
		a_bWatchSubtree : BOOLEAN;
		a_dwNotifyFilter : INTEGER) : POINTER is
--	FindFirstChangeNotification (a_pPathName : STRING;
--		a_bWatchSubtree : BOOLEAN;
--		a_dwNotifyFilter : INTEGER) : POINTER is
			-- The FindFirstChangeNotification function creates a
			-- change notification handle and sets up initial change
			-- notification filter conditions. A wait on a notification
			-- handle succeeds when a change matching the filter conditions
			-- occurs in the specified directory or subtree. 
		external "C use <windows.h>"
		end -- FindFirstChangeNotification

	-- FindFirstFile

	FindFirstFile (a_pFileName : POINTER;
		a_pFindFileData : POINTER) : POINTER is
--	FindFirstFile (a_pFileName : STRING;
--		a_pFindFileData : WIN32_WIN32_FIND_DATA) : POINTER is
			-- The FindFirstFile function searches a directory for
			-- a file whose name matches the specified filename. FindFirstFile
			-- examines subdirectory names as well as filenames. 
		external "C use <windows.h>"
		end -- FindFirstFile

	-- FindNextChangeNotification

	FindNextChangeNotification (a_hChangeHandle : POINTER) : BOOLEAN is
			-- The FindNextChangeNotification function requests that
			-- the operating system signal a change notification handle
			-- the next time it detects an appropriate change. 
		external "C use <windows.h>"
		end -- FindNextChangeNotification

	-- FindNextFile

	FindNextFile (a_hFindFile : POINTER;
		a_pFindFileData : POINTER) : BOOLEAN is
--	FindNextFile (a_hFindFile : POINTER;
--		a_pFindFileData : WIN32_WIN32_FIND_DATA) : BOOLEAN is
			-- The FindNextFile function continues a file search from
			-- a previous call to the FindFirstFile function. 
		external "C use <windows.h>"
		end -- FindNextFile

	-- FlushFileBuffers

	FlushFileBuffers (a_hFile : POINTER) : BOOLEAN is
			-- The FlushFileBuffers function clears the buffers for
			-- the specified file and causes all buffered data to
			-- be written to the file. 
		external "C use <windows.h>"
		end -- FlushFileBuffers

	-- GetBinaryType

	GetBinaryType (a_pApplicationName : POINTER;
		a_pBinaryType : POINTER) : BOOLEAN is
--	GetBinaryType (a_pApplicationName : STRING;
--		a_pBinaryType : INTEGER_REF) : BOOLEAN is
			-- The GetBinaryType function determines whether a file
			-- is executable, and if so, what type of executable file
			-- it is. That last property determines which subsystem
			-- an executable file runs under.
		external "C use <windows.h>"
		end -- GetBinaryType

	-- GetCurrentDirectory

	GetCurrentDirectory (a_nBufferLength : INTEGER;
		a_pBuffer : POINTER) : INTEGER is
--	GetCurrentDirectory (a_nBufferLength : INTEGER;
--		a_pBuffer : STRING) : INTEGER is
			-- The GetCurrentDirectory function retrieves the current
			-- directory for the current process. 
		external "C use <windows.h>"
		end -- GetCurrentDirectory

	-- GetDiskFreeSpace

	GetDiskFreeSpace (a_pRootPathName : POINTER;
		a_pSectorsPerCluster : POINTER;
		a_pBytesPerSector : POINTER;
		a_pNumberOfFreeClusters : POINTER;
		a_pTotalNumberOfClusters : POINTER) : BOOLEAN is
--	GetDiskFreeSpace (a_pRootPathName : STRING;
--		a_pSectorsPerCluster : INTEGER_REF;
--		a_pBytesPerSector : INTEGER_REF;
--		a_pNumberOfFreeClusters : INTEGER_REF;
--		a_pTotalNumberOfClusters : INTEGER_REF) : BOOLEAN is
			-- The GetDiskFreeSpace function retrieves information
			-- about the specified disk, including the amount of free
			-- space on the disk. 
		external "C use <windows.h>"
		end -- GetDiskFreeSpace

	-- GetDriveType

	GetDriveType (a_pRootPathName : POINTER) : INTEGER is
--	GetDriveType (a_pRootPathName : STRING) : INTEGER is
			-- The GetDriveType function determines whether a disk
			-- drive is a removable, fixed, CD-ROM, RAM disk, or network
			-- drive. 
		external "C use <windows.h>"
		end -- GetDriveType

	-- GetFileAttributes

	GetFileAttributes (a_pFileName : POINTER) : INTEGER is
--	GetFileAttributes (a_pFileName : STRING) : INTEGER is
			-- The GetFileAttributes function returns attributes
			-- for a specified file or directory. 
		external "C use <windows.h>"
		end -- GetFileAttributes

	-- GetFileInformationByHandle

	GetFileInformationByHandle (a_hFile : POINTER;
		a_pFileInformation : POINTER) : BOOLEAN is
--	GetFileInformationByHandle (a_hFile : POINTER;
--		a_pFileInformation : WIN32_BY_HANDLE_FILE_INFORMATION) : BOOLEAN is
			-- The GetFileInformationByHandle function retrieves
			-- information about the specified file. 
		external "C use <windows.h>"
		end -- GetFileInformationByHandle

	-- GetFileSize

	GetFileSize (a_hFile : POINTER;
		a_pFileSizeHigh : POINTER) : INTEGER is
--	GetFileSize (a_hFile : POINTER;
--		a_pFileSizeHigh : INTEGER_REF) : INTEGER is
			-- The GetFileSize function retrieves the size, in bytes,
			-- of the specified file. 
		external "C use <windows.h>"
		end -- GetFileSize

	-- GetFileType

	GetFileType (a_hFile : POINTER) : INTEGER is
			-- The GetFileType function returns the type of the specified
			-- file. 
		external "C use <windows.h>"
		end -- GetFileType

	-- GetFullPathName

	GetFullPathName (a_pFileName : POINTER;
		a_nBufferLength : INTEGER;
		a_pBuffer : POINTER;
		a_lpFilePart : POINTER) : INTEGER is
--	GetFullPathName (a_pFileName : STRING;
--		a_nBufferLength : INTEGER;
--		a_pBuffer : STRING;
--		a_lpFilePart : POINTER) : INTEGER is
			-- The GetFullPathName function retrieves the full path
			-- and filename of a specified file. 
		external "C use <windows.h>"
		end -- GetFullPathName

	-- GetLogicalDrives

	GetLogicalDrives : INTEGER is
			-- The GetLogicalDrives function returns a bitmask representing
			-- the currently available disk drives. 
		external "C use <windows.h>"
		end -- GetLogicalDrives

	-- GetLogicalDriveStrings

	GetLogicalDriveStrings (a_nBufferLength : INTEGER;
		a_pBuffer : POINTER) : INTEGER is
--	GetLogicalDriveStrings (a_nBufferLength : INTEGER;
--		a_pBuffer : STRING) : INTEGER is
			-- The GetLogicalDriveStrings function fills a buffer
			-- with strings that specify valid drives in the system.
			-- 
		external "C use <windows.h>"
		end -- GetLogicalDriveStrings

	-- GetQueuedCompletionStatus

	GetQueuedCompletionStatus (a_CompletionPort : POINTER;
		a_pNumberOfBytesTransferred : POINTER;
		a_pCompletionKey : POINTER;
		a_lpOverlapped : POINTER;
		a_dwMilliseconds : INTEGER) : BOOLEAN is
--	GetQueuedCompletionStatus (a_CompletionPort : POINTER;
--		a_pNumberOfBytesTransferred : INTEGER_REF;
--		a_pCompletionKey : INTEGER_REF;
--		a_lpOverlapped : POINTER;
--		a_dwMilliseconds : INTEGER) : BOOLEAN is
			-- The GetQueuedCompletionStatus function attempts to
			-- dequeue an I/O completion packet from a specified input/output
			-- completion port. If there is no completion packet queued,
			-- the function waits for a pending input/output operation
			-- associated with the completion port to complete. The
			-- function returns when it can dequeue a completion packet,
			-- or optionally when the function times out. If the function
			-- returns because of an I/O operation completion, it
			-- sets several variables that provide information about
			-- the operation.
		external "C use <windows.h>"
		end -- GetQueuedCompletionStatus

	-- GetShortPathName

	GetShortPathName (a_pszLongPath : POINTER;
		a_pszShortPath : POINTER;
		a_cchBuffer : INTEGER) : INTEGER is
--	GetShortPathName (a_pszLongPath : STRING;
--		a_pszShortPath : STRING;
--		a_cchBuffer : INTEGER) : INTEGER is
			-- The GetShortPathName function obtains the short path
			-- form of a specified input path. 
		external "C use <windows.h>"
		end -- GetShortPathName

	-- GetTempFileName

	GetTempFileName (a_pPathName : POINTER;
		a_pPrefixString : POINTER;
		a_uUnique : INTEGER;
		a_pTempFileName : POINTER) : INTEGER is
--	GetTempFileName (a_pPathName : STRING;
--		a_pPrefixString : STRING;
--		a_uUnique : INTEGER;
--		a_pTempFileName : STRING) : INTEGER is
			-- The GetTempFileName function creates a name for a
			-- temporary file. The filename is the concatenation of
			-- specified path and prefix strings, a hexadecimal string
			-- formed from a specified integer, and the .TMP extension.
			-- (The specified integer can be nonzero, in which case,
			-- the function creates the filename but does not create
			-- the file. If you specify zero for the integer, the
			-- function creates a unique filename and creates the
			-- file in the specified directory.)
		external "C use <windows.h>"
		end -- GetTempFileName

	-- GetTempPath

	GetTempPath (a_nBufferLength : INTEGER;
		a_pBuffer : POINTER) : INTEGER is
--	GetTempPath (a_nBufferLength : INTEGER;
--		a_pBuffer : STRING) : INTEGER is
			-- The GetTempPath function retrieves the path of the
			-- directory designated for temporary files. This function
			-- supersedes the GetTempDrive function. 
		external "C use <windows.h>"
		end -- GetTempPath

	-- GetVolumeInformation

	GetVolumeInformation (a_pRootPathName : POINTER;
		a_pVolumeNameBuffer : POINTER;
		a_nVolumeNameSize : INTEGER;
		a_pVolumeSerialNumber : POINTER;
		a_pMaximumComponentLength : POINTER;
		a_pFileSystemFlags : POINTER;
		a_pFileSystemNameBuffer : POINTER;
		a_nFileSystemNameSize : INTEGER) : BOOLEAN is
--	GetVolumeInformation (a_pRootPathName : STRING;
--		a_pVolumeNameBuffer : STRING;
--		a_nVolumeNameSize : INTEGER;
--		a_pVolumeSerialNumber : INTEGER_REF;
--		a_pMaximumComponentLength : INTEGER_REF;
--		a_pFileSystemFlags : INTEGER_REF;
--		a_pFileSystemNameBuffer : STRING;
--		a_nFileSystemNameSize : INTEGER) : BOOLEAN is
			-- The GetVolumeInformation function returns information
			-- about a file system and volume whose root directory
			-- is specified. 
		external "C use <windows.h>"
		end -- GetVolumeInformation

	-- LockFile

	LockFile (a_hFile : POINTER;
		a_dwFileOffsetLow : INTEGER;
		a_dwFileOffsetHigh : INTEGER;
		a_nNumberOfBytesToLockLow : INTEGER;
		a_nNumberOfBytesToLockHigh : INTEGER) : BOOLEAN is
			-- The LockFile function locks a region in an open file.
			-- Locking a region prevents other processes from accessing
			-- the region. 
		external "C use <windows.h>"
		end -- LockFile

	-- LockFileEx

	LockFileEx (a_hFile : POINTER;
		a_dwFlags : INTEGER;
		a_dwReserved : INTEGER;
		a_nNumberOfBytesToLockLow : INTEGER;
		a_nNumberOfBytesToLockHigh : INTEGER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	LockFileEx (a_hFile : POINTER;
--		a_dwFlags : INTEGER;
--		a_dwReserved : INTEGER;
--		a_nNumberOfBytesToLockLow : INTEGER;
--		a_nNumberOfBytesToLockHigh : INTEGER;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN is
			-- The LockFileEx function locks a byte range within
			-- an open file for shared or exclusive access. 
		external "C use <windows.h>"
		end -- LockFileEx

	-- MoveFile

	MoveFile (a_pExistingFileName : POINTER;
		a_pNewFileName : POINTER) : BOOLEAN is
--	MoveFile (a_pExistingFileName : STRING;
--		a_pNewFileName : STRING) : BOOLEAN is
			-- The MoveFile function renames an existing file or
			-- a directory (including all its children). 
		external "C use <windows.h>"
		end -- MoveFile

	-- MoveFileEx

	MoveFileEx (a_pExistingFileName : POINTER;
		a_pNewFileName : POINTER;
		a_dwFlags : INTEGER) : BOOLEAN is
--	MoveFileEx (a_pExistingFileName : STRING;
--		a_pNewFileName : STRING;
--		a_dwFlags : INTEGER) : BOOLEAN is
			-- The MoveFileEx function renames an existing file.
			-- 
		external "C use <windows.h>"
		end -- MoveFileEx

	-- OpenFile

	OpenFile (a_pszFile : POINTER;
		a_pOpenBuff : POINTER;
		a_fuMode : INTEGER) : INTEGER is
--	OpenFile (a_pszFile : STRING;
--		a_pOpenBuff : WIN32_OFSTRUCT;
--		a_fuMode : INTEGER) : INTEGER is
			-- The OpenFile function creates, opens, reopens, or
			-- deletes a file. This function is provided for compatibility
			-- with 16-bit versions of Windows. In particular, the
			-- OpenFile function cannot open a named pipe. Win32-based
			-- applications should use the CreateFile function. 
		external "C use <windows.h>"
		end -- OpenFile

	-- QueryDosDevice

	QueryDosDevice (a_pDeviceName : POINTER;
		a_pTargetPath : POINTER;
		a_ucchMax : INTEGER) : INTEGER is
--	QueryDosDevice (a_pDeviceName : STRING;
--		a_pTargetPath : STRING;
--		a_ucchMax : INTEGER) : INTEGER is
			-- The QueryDosDevice function lets an application obtain
			-- information about MS-DOS device names. The function
			-- can obtain the current mapping for a particular MS-DOS
			-- device name. The function can also obtain a list of
			-- all existing MS-DOS device names. (MS-DOS device names
			-- are stored as symbolic links in the Windows NT object
			-- name space. The code that converts an MS-DOS path into
			-- a corresponding Windows NT path uses these symbolic
			-- links to map MS-DOS devices and drive letters. The
			-- QueryDosDevice function provides a mechanism whereby
			-- a Win32-based application can query the names of the
			-- symbolic links used to implement the MS-DOS device
			-- namespace as well as the value of each specific symbolic
			-- link.)
		external "C use <windows.h>"
		end -- QueryDosDevice

	-- ReadFile

	ReadFile (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_nNumberOfBytesToRead : INTEGER;
		a_pNumberOfBytesRead : POINTER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	ReadFile (a_hFile : POINTER;
--		a_lpBuffer : POINTER;
--		a_nNumberOfBytesToRead : INTEGER;
--		a_pNumberOfBytesRead : INTEGER_REF;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN is
			-- The ReadFile function reads data from a file, starting
			-- at the position indicated by the file pointer. After
			-- the read operation has been completed, the file pointer
			-- is adjusted by the number of bytes actually read, unless
			-- the file handle is created with the overlapped attribute.
			-- If the file handle is created for overlapped input
			-- and output (I/O), the application must adjust the position
			-- of the file pointer after the read operation. 
		external "C use <windows.h>"
		end -- ReadFile

	-- ReadFileEx

	ReadFileEx (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_nNumberOfBytesToRead : INTEGER;
		a_pOverlapped : POINTER;
		a_lpCompletionRoutine : POINTER) : BOOLEAN is
--	ReadFileEx (a_hFile : POINTER;
--		a_lpBuffer : POINTER;
--		a_nNumberOfBytesToRead : INTEGER;
--		a_pOverlapped : WIN32_OVERLAPPED;
--		a_lpCompletionRoutine : POINTER) : BOOLEAN is
			-- The ReadFileEx function reads data from a file asynchronously.
			-- It is designed solely for asynchronous operation, unlike
			-- the ReadFile function, which is designed for both synchronous
			-- and asynchronous operation. ReadFileEx lets an application
			-- perform other processing during a file read operation.
			-- (The ReadFileEx function reports its completion status
			-- asynchronously, calling a specified completion routine
			-- when reading is completed and the calling thread is
			-- in an alertable wait state.)
		external "C use <windows.h>"
		end -- ReadFileEx

	-- RemoveDirectory

	RemoveDirectory (a_pszDir : POINTER) : BOOLEAN is
--	RemoveDirectory (a_pszDir : STRING) : BOOLEAN is
			-- The RemoveDirectory function deletes an existing empty
			-- directory. 
		external "C use <windows.h>"
		end -- RemoveDirectory

	-- SearchPath

	SearchPath (a_pszPath : POINTER;
		a_pszFile : POINTER;
		a_pszExtension : POINTER;
		a_cchReturnBuffer : INTEGER;
		a_pszReturnBuffer : POINTER;
		a_plpszFilePart : POINTER) : INTEGER is
--	SearchPath (a_pszPath : STRING;
--		a_pszFile : STRING;
--		a_pszExtension : STRING;
--		a_cchReturnBuffer : INTEGER;
--		a_pszReturnBuffer : STRING;
--		a_plpszFilePart : POINTER) : INTEGER is
			-- The SearchPath function searches for the specified
			-- file. 
		external "C use <windows.h>"
		end -- SearchPath

	-- SetCurrentDirectory

	SetCurrentDirectory (a_pszCurDir : POINTER) : BOOLEAN is
--	SetCurrentDirectory (a_pszCurDir : STRING) : BOOLEAN is
			-- The SetCurrentDirectory function changes the current
			-- directory for the current process. 
		external "C use <windows.h>"
		end -- SetCurrentDirectory

	-- SetEndOfFile

	SetEndOfFile (a_hFile : POINTER) : BOOLEAN is
			-- The SetEndOfFile function moves the end-of-file (EOF)
			-- position for the specified file to the current position
			-- of the file pointer. 
		external "C use <windows.h>"
		end -- SetEndOfFile

	-- SetFileApisToANSI

	SetFileApisToANSI is
			-- The SetFileApisToANSI function causes a set of Win32
			-- file functions to use the ANSI character set code page.
			-- This function is useful for 8-bit console input and
			-- output operations.
		external "C use <windows.h>"
		end -- SetFileApisToANSI

	-- SetFileApisToOEM

	SetFileApisToOEM is
			-- The SetFileApisToOEM function causes a set of Win32
			-- file functions to use the OEM character set code page.
			-- This function is useful for 8-bit console input and
			-- output operations.
		external "C use <windows.h>"
		end -- SetFileApisToOEM

	-- SetFileAttributes

	SetFileAttributes (a_pFileName : POINTER;
		a_dwFileAttributes : INTEGER) : BOOLEAN is
--	SetFileAttributes (a_pFileName : STRING;
--		a_dwFileAttributes : INTEGER) : BOOLEAN is
			-- The SetFileAttributes function sets a file's attributes.
			-- 
		external "C use <windows.h>"
		end -- SetFileAttributes

	-- SetFilePointer

	SetFilePointer (a_hFile : POINTER;
		a_lDistanceToMove : INTEGER;
		a_pDistanceToMoveHigh : POINTER;
		a_dwMoveMethod : INTEGER) : INTEGER is
--	SetFilePointer (a_hFile : POINTER;
--		a_lDistanceToMove : INTEGER;
--		a_pDistanceToMoveHigh : INTEGER_REF;
--		a_dwMoveMethod : INTEGER) : INTEGER is
			-- The SetFilePointer function moves the file pointer
			-- of an open file. 
		external "C use <windows.h>"
		end -- SetFilePointer

	-- SetHandleCount

	SetHandleCount (a_cHandles : INTEGER) : INTEGER is
			-- The SetHandleCount function changes the number of
			-- file handles available to a process. The SetHandleCount
			-- function is not necessary under the Windows NT implementation
			-- of Win32; in fact, it has no effect when called under
			-- Windows NT. The SetHandleCount function may be necessary
			-- under other implementations of Win32, such as Win32s,
			-- in order to increase the default number of available
			-- file handles. Under Win32s, this default is 20. 
		external "C use <windows.h>"
		end -- SetHandleCount

	-- SetVolumeLabel

	SetVolumeLabel (a_pRootPathName : POINTER;
		a_pVolumeName : POINTER) : BOOLEAN is
--	SetVolumeLabel (a_pRootPathName : STRING;
--		a_pVolumeName : STRING) : BOOLEAN is
			-- The SetVolumeLabel function sets the label of a file
			-- system volume. 
		external "C use <windows.h>"
		end -- SetVolumeLabel

	-- UnlockFile

	UnlockFile (a_hFile : POINTER;
		a_dwFileOffsetLow : INTEGER;
		a_dwFileOffsetHigh : INTEGER;
		a_cbUnlockLow : INTEGER;
		a_cbUnlockHigh : INTEGER) : BOOLEAN is
			-- The UnlockFile function unlocks a region in an open
			-- file. Unlocking a region enables other processes to
			-- access the region. 
		external "C use <windows.h>"
		end -- UnlockFile

	-- UnlockFileEx

	UnlockFileEx (a_hFile : POINTER;
		a_dwReserved : INTEGER;
		a_nNumberOfBytesToUnlockLow : INTEGER;
		a_nNumberOfBytesToUnlockHigh : INTEGER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	UnlockFileEx (a_hFile : POINTER;
--		a_dwReserved : INTEGER;
--		a_nNumberOfBytesToUnlockLow : INTEGER;
--		a_nNumberOfBytesToUnlockHigh : INTEGER;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN is
			-- The UnlockFileEx function unlocks a previously locked
			-- byte range in an open file. 
		external "C use <windows.h>"
		end -- UnlockFileEx

	-- WriteFile

	WriteFile (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_nNumberOfBytesToWrite : INTEGER;
		a_pNumberOfBytesWritten : POINTER;
		a_pOverlapped : POINTER) : BOOLEAN is
--	WriteFile (a_hFile : POINTER;
--		a_lpBuffer : POINTER;
--		a_nNumberOfBytesToWrite : INTEGER;
--		a_pNumberOfBytesWritten : INTEGER_REF;
--		a_pOverlapped : WIN32_OVERLAPPED) : BOOLEAN is
			-- The WriteFile function writes data to a file and is
			-- designed for both synchronous and asynchronous operation.
			-- The function starts writing data to the file at the
			-- position indicated by the file pointer. After the write
			-- operation has been completed, the file pointer is adjusted
			-- by the number of bytes actually written, except when
			-- the file is opened with FILE_FLAG_OVERLAPPED. If the
			-- file handle was created for overlapped input and output
			-- (I/O), the application must adjust the position of
			-- the file pointer after the write operation is finished.
			-- 
		external "C use <windows.h>"
		end -- WriteFile

	-- WriteFileEx

	WriteFileEx (a_hFile : POINTER;
		a_lpBuffer : POINTER;
		a_nNumberOfBytesToWrite : INTEGER;
		a_pOverlapped : POINTER;
		a_lpCompletionRoutine : POINTER) : BOOLEAN is
--	WriteFileEx (a_hFile : POINTER;
--		a_lpBuffer : POINTER;
--		a_nNumberOfBytesToWrite : INTEGER;
--		a_pOverlapped : WIN32_OVERLAPPED;
--		a_lpCompletionRoutine : POINTER) : BOOLEAN is
			-- The WriteFileEx function writes data to a file. It
			-- is designed solely for asynchronous operation, unlike
			-- WriteFile, which is designed for both synchronous and
			-- asynchronous operation. WriteFileEx reports its completion
			-- status asynchronously, calling a specified completion
			-- routine when writing is completed and the calling thread
			-- is in an alertable wait state.
		external "C use <windows.h>"
		end -- WriteFileEx


end -- class WIN32_FILE_FUNCTIONS
