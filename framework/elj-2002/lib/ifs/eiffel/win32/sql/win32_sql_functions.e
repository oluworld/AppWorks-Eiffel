class WIN32_SQL_FUNCTIONS

feature {NONE}

	SQLAllocHandle (a_HandleType : INTEGER;
		a_InputHandle : POINTER;
		a_OutputHandlePtr : POINTER) : INTEGER  is
			-- SQLAllocHandle allocates an environment, connection,
			-- statement, or descriptor handle.
		external "C use %"sqlext.h%""
		alias "SQLAllocHandle"
		end -- SQLAllocHandle

	SQLBindCol (a_StatementHandle : POINTER;
		a_ColumnNumber : INTEGER;
		a_TargetType : INTEGER;
		a_TargetValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StrLen_or_Ind_deref : POINTER) : INTEGER  is
			-- SQLBindCol binds application data buffers to columns
			-- in the result set.
		external "C use %"sqlext.h%""
		alias "SQLBindCol"
		end -- SQLBindCol

	SQLBindParameter (a_StatementHandle : POINTER;
		a_ParameterNumber : INTEGER;
		a_InputOutputType : INTEGER;
		a_ValueType : INTEGER;
		a_ParameterType : INTEGER;
		a_ColumnSize : INTEGER;
		a_DecimalDigits : INTEGER;
		a_ParameterValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StrLen_or_IndPtr : POINTER) : INTEGER  is
			-- SQLBindParameter binds a buffer to a parameter marker
			-- in an SQL statement. SQLBindParameter supports binding
			-- to a Unicode C data type, even if the underlying driver
			-- does not support Unicode data.
		external "C use %"sqlext.h%""
		alias "SQLBindParameter"
		end -- SQLBindParameter

	SQLBrowseConnect (a_ConnectionHandle : POINTER;
		a_InConnectionString_deref : POINTER;
		a_StringLength1 : INTEGER;
		a_OutConnectionString_deref : POINTER;
		a_BufferLength : INTEGER;
		a_StringLength2Ptr_deref : POINTER) : INTEGER  is
			-- SQLBrowseConnect supports an iterative method of discovering
			-- and enumerating the attributes and attribute values
			-- required to connect to a data source. Each call to
			-- SQLBrowseConnect returns successive levels of attributes
			-- and attribute values. When all levels have been enumerated,
			-- a connection to the data source is completed and a
			-- complete connection string is returned by SQLBrowseConnect.
			-- A return code of SQL_SUCCESS or SQL_SUCCESS_WITH_INFO
			-- indicates that all connection information has been
			-- specified and the application is now connected to the
			-- data source.
		external "C use %"sqlext.h%""
		alias "SQLBrowseConnect"
		end -- SQLBrowseConnect

	SQLBulkOperations (a_StatementHandle : POINTER;
		a_Operation : INTEGER) : INTEGER  is
			-- SQLBulkOperations performs bulk insertions and bulk
			-- bookmark operations, including update, delete, and
			-- fetch by bookmark.
		external "C use %"sqlext.h%""
		alias "SQLBulkOperations"
		end -- SQLBulkOperations

	SQLCancel (a_StatementHandle : POINTER) : INTEGER  is
			-- SQLCancel cancels the processing on a statement.
		external "C use %"sqlext.h%""
		alias "SQLCancel"
		end -- SQLCancel

	SQLCloseCursor (a_StatementHandle : POINTER) : INTEGER  is
			-- SQLCloseCursor closes a cursor that has been opened
			-- on a statement and discards pending results.
		external "C use %"sqlext.h%""
		alias "SQLCloseCursor"
		end -- SQLCloseCursor

	SQLColAttribute (a_StatementHandle : POINTER;
		a_ColumnNumber : INTEGER;
		a_FieldIdentifier : INTEGER;
		a_CharacterAttributePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr_deref : POINTER;
		a_NumericAttributePtr : POINTER) : INTEGER  is
			-- SQLColAttribute returns descriptor information for
			-- a column in a result set. Descriptor information is
			-- returned as a character string, a 32-bit descriptor-dependent
			-- value, or an integer value. 
		external "C use %"sqlext.h%""
		alias "SQLColAttribute"
		end -- SQLColAttribute

	SQLColumnPrivileges (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER;
		a_ColumnName_deref : POINTER;
		a_NameLength4 : INTEGER) : INTEGER  is
			-- SQLColumnPrivileges returns a list of columns and
			-- associated privileges for the specified table. The
			-- driver returns the information as a result set on the
			-- specified StatementHandle.
		external "C use %"sqlext.h%""
		alias "SQLColumnPrivileges"
		end -- SQLColumnPrivileges

	SQLColumns (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER;
		a_ColumnName_deref : POINTER;
		a_NameLength4 : INTEGER) : INTEGER  is
			-- SQLColumns returns the list of column names in specified
			-- tables. The driver returns this information as a result
			-- set on the specified StatementHandle.
		external "C use %"sqlext.h%""
		alias "SQLColumns"
		end -- SQLColumns

	SQLConnect (a_ConnectionHandle : POINTER;
		a_ServerName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_UserName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_Authentication_deref : POINTER;
		a_NameLength3 : INTEGER) : INTEGER  is
			-- SQLConnect establishes connections to a driver and
			-- a data source. The connection handle references storage
			-- of all information about the connection to the data
			-- source, including status, transaction state, and error
			-- information.
		external "C use %"sqlext.h%""
		alias "SQLConnect"
		end -- SQLConnect

	SQLCopyDesc (a_SourceDescHandle : POINTER;
		a_TargetDescHandle : POINTER) : INTEGER  is
			-- SQLCopyDesc copies descriptor information from one
			-- descriptor handle to another.
		external "C use %"sqlext.h%""
		alias "SQLCopyDesc"
		end -- SQLCopyDesc

	SQLDataSources (a_EnvironmentHandle : POINTER;
		a_Direction : INTEGER;
		a_ServerName_deref : POINTER;
		a_BufferLength1 : INTEGER;
		a_NameLength1Ptr_deref : POINTER;
		a_Description_deref : POINTER;
		a_BufferLength2 : INTEGER;
		a_NameLength2Ptr_deref : POINTER) : INTEGER  is
			-- SQLDataSources returns information about a data source.
			-- This function is implemented solely by the Driver Manager.
		external "C use %"sqlext.h%""
		alias "SQLDataSources"
		end -- SQLDataSources

	SQLDescribeCol (a_StatementHandle : POINTER;
		a_ColumnNumber : INTEGER;
		a_ColumnName_deref : POINTER;
		a_BufferLength : INTEGER;
		a_NameLengthPtr_deref : POINTER;
		a_DataTypePtr_deref : POINTER;
		a_ColumnSizePtr_deref : POINTER;
		a_DecimalDigitsPtr_deref : POINTER;
		a_NullablePtr_deref : POINTER) : INTEGER  is
			-- SQLDescribeCol returns the result descriptor column
			-- name, type, column size, decimal digits, and nullability
			-- for one column in the result set. This information
			-- also is available in the fields of the IRD.
		external "C use %"sqlext.h%""
		alias "SQLDescribeCol"
		end -- SQLDescribeCol

	SQLDescribeParam (a_StatementHandle : POINTER;
		a_ParameterNumber : INTEGER;
		a_DataTypePtr_deref : POINTER;
		a_arameterSizePtr : POINTER;
		a_DecimalDigitsPtr_deref : POINTER;
		a_NullablePtr_deref : POINTER) : INTEGER  is
			-- SQLDescribeParam returns the description of a parameter
			-- marker associated with a prepared SQL statement. This
			-- information is also available in the fields of the
			-- IPD.
		external "C use %"sqlext.h%""
		alias "SQLDescribeParam"
		end -- SQLDescribeParam

	SQLDisconnect (a_ConnectionHandle : POINTER) : INTEGER  is
			-- SQLDisconnect closes the connection associated with
			-- a specific connection handle.
		external "C use %"sqlext.h%""
		alias "SQLDisconnect"
		end -- SQLDisconnect

	SQLDriverConnect (a_ConnectionHandle : POINTER;
		a_WindowHandle : POINTER;
		a_InConnectionString_deref : POINTER;
		a_StringLength1 : INTEGER;
		a_OutConnectionString_deref : POINTER;
		a_BufferLength : INTEGER;
		a_StringLength2Ptr_deref : POINTER;
		a_DriverCompletion : INTEGER) : INTEGER  is
			-- SQLDriverConnect is an alternative to SQLConnect.
			-- It supports data sources that require more connection
			-- information than the three arguments in SQLConnect,
			-- dialog boxes to prompt the user for all connection
			-- information, and data sources that are not defined
			-- in the system information.
		external "C use %"sqlext.h%""
		alias "SQLDriverConnect"
		end -- SQLDriverConnect

	SQLDrivers (a_EnvironmentHandle : POINTER;
		a_Direction : INTEGER;
		a_DriverDescription_deref : POINTER;
		a_BufferLength1 : INTEGER;
		a_DescriptionLengthPtr_deref : POINTER;
		a_DriverAttributes_deref : POINTER;
		a_BufferLength2 : INTEGER;
		a_AttributesLengthPtr_deref : POINTER) : INTEGER  is
			-- SQLDrivers lists driver descriptions and driver attribute
			-- keywords. This function is implemented solely by the
			-- Driver Manager.
		external "C use %"sqlext.h%""
		alias "SQLDrivers"
		end -- SQLDrivers

	SQLEndTran (a_HandleType : INTEGER;
		a_Handle : POINTER;
		a_CompletionType : INTEGER) : INTEGER  is
			-- SQLEndTran requests a commit or rollback operation
			-- for all active operations on all statements associated
			-- with a connection. SQLEndTran can also request that
			-- a commit or rollback operation be performed for all
			-- connections associated with an environment.
		external "C use %"sqlext.h%""
		alias "SQLEndTran"
		end -- SQLEndTran

	SQLExecDirect (a_StatementHandle : POINTER;
		a_StatementText_deref : POINTER;
		a_TextLength : INTEGER) : INTEGER  is
			-- SQLExecDirect executes a preparable statement, using
			-- the current values of the parameter marker variables
			-- if any parameters exist in the statement. SQLExecDirect
			-- is the fastest way to submit an SQL statement for one-time
			-- execution.
		external "C use %"sqlext.h%""
		alias "SQLExecDirect"
		end -- SQLExecDirect

	SQLExecute (a_StatementHandle : POINTER) : INTEGER  is
			-- SQLExecute executes a prepared statement, using the
			-- current values of the parameter marker variables if
			-- any parameter markers exist in the statement.
		external "C use %"sqlext.h%""
		alias "SQLExecute"
		end -- SQLExecute

	SQLExtendedFetch (a_StatementHandle : POINTER;
		a_FetchOrientation : INTEGER;
		a_FetchOffset : INTEGER;
		a_RowCountPtr_deref : POINTER;
		a_RowStatusArray_deref : POINTER) : INTEGER  is
			-- SQLExtendedFetch fetches the specified rowset of data
			-- from the result set and returns data for all bound
			-- columns. Rowsets can be specified at an absolute or
			-- relative position or by bookmark.
		external "C use %"sqlext.h%""
		alias "SQLExtendedFetch"
		end -- SQLExtendedFetch

	SQLFetch (a_StatementHandle : POINTER) : INTEGER  is
			-- SQLFetch fetches the next rowset of data from the
			-- result set and returns data for all bound columns.
		external "C use %"sqlext.h%""
		alias "SQLFetch"
		end -- SQLFetch

	SQLFetchScroll (a_StatementHandle : POINTER;
		a_FetchOrientation : INTEGER;
		a_FetchOffset : INTEGER) : INTEGER  is
			-- SQLFetchScroll fetches the specified rowset of data
			-- from the result set and returns data for all bound
			-- columns. Rowsets can be specified at an absolute or
			-- relative position or by bookmark.
		external "C use %"sqlext.h%""
		alias "SQLFetchScroll"
		end -- SQLFetchScroll

	SQLForeignKeys (a_StatementHandle : POINTER;
		a_KCatalogName : POINTER;
		a_NameLength1 : INTEGER;
		a_KSchemaName : POINTER;
		a_NameLength2 : INTEGER;
		a_KTableName : POINTER;
		a_NameLength3 : INTEGER;
		a_FKCatalogName_deref : POINTER;
		a_NameLength4 : INTEGER;
		a_FKSchemaName_deref : POINTER;
		a_NameLength5 : INTEGER;
		a_FKTableName_deref : POINTER;
		a_NameLength6 : INTEGER) : INTEGER  is
			-- SQLForeignKeys can return: A list of foreign keys
			-- in the specified table (columns in the specified table
			-- that refer to primary keys in other tables). -OR- A
			-- list of foreign keys in other tables that refer to
			-- the primary key in the specified table. The driver
			-- returns each list as a result set on the specified
			-- statement.
		external "C use %"sqlext.h%""
		alias "SQLForeignKeys"
		end -- SQLForeignKeys

	SQLFreeHandle (a_HandleType : INTEGER;
		a_Handle : POINTER) : INTEGER  is
			-- SQLFreeHandle frees resources associated with a specific
			-- environment, connection, statement, or descriptor handle
		external "C use %"sqlext.h%""
		alias "SQLFreeHandle"
		end -- SQLFreeHandle

	SQLFreeStmt (a_StatementHandle : POINTER;
		a_Option : INTEGER) : INTEGER  is
			-- SQLFreeStmt stops processing associated with a specific
			-- statement, closes any open cursors associated with
			-- the statement, discards pending results, or, optionally,
			-- frees all resources associated with the statement handle.
		external "C use %"sqlext.h%""
		alias "SQLFreeStmt"
		end -- SQLFreeStmt

	SQLGetConnectAttr (a_ConnectionHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr : POINTER) : INTEGER  is
			-- SQLGetConnectAttr returns the current setting of a
			-- connection attribute.
		external "C use %"sqlext.h%""
		alias "SQLGetConnectAttr"
		end -- SQLGetConnectAttr

	SQLGetCursorName (a_StatementHandle : POINTER;
		a_CursorName_deref : POINTER;
		a_BufferLength : INTEGER;
		a_NameLengthPtr_deref : POINTER) : INTEGER  is
			-- SQLGetCursorName returns the cursor name associated
			-- with a specified statement. 
		external "C use %"sqlext.h%""
		alias "SQLGetCursorName"
		end -- SQLGetCursorName

	SQLGetData (a_StatementHandle : POINTER;
		a_ColumnNumber : INTEGER;
		a_TargetType : INTEGER;
		a_TargetValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StrLen_or_IndPtr : POINTER) : INTEGER  is
			-- SQLGetData retrieves data for a single column in the
			-- result set. It can be called multiple times to retrieve
			-- variable-length data in parts.
		external "C use %"sqlext.h%""
		alias "SQLGetData"
		end -- SQLGetData

	SQLGetDescField (a_DescriptorHandle : POINTER;
		a_RecNumber : INTEGER;
		a_FieldIdentifier : INTEGER;
		a_ValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr : POINTER) : INTEGER  is
			-- SQLGetDescField returns the current setting or value
			-- of a single field of a descriptor record.
		external "C use %"sqlext.h%""
		alias "SQLGetDescField"
		end -- SQLGetDescField

	SQLGetDescRec (a_DescriptorHandle : POINTER;
		a_RecNumber : INTEGER;
		a_Name_deref : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr_deref : POINTER;
		a_TypePtr_deref : POINTER;
		a_SubTypePtr_deref : POINTER;
		a_LengthPtr : POINTER;
		a_recisionPtr : POINTER;
		a_ScalePtr_deref : POINTER;
		a_NullablePtr_deref : POINTER) : INTEGER  is
			-- SQLGetDescRec returns the current settings or values
			-- of multiple fields of a descriptor record. The fields
			-- returned describe the name, data type, and storage
			-- of column or parameter data.
		external "C use %"sqlext.h%""
		alias "SQLGetDescRec"
		end -- SQLGetDescRec

	SQLGetDiagField (a_HandleType : INTEGER;
		a_Handle : POINTER;
		a_RecNumber : INTEGER;
		a_DiagIdentifier : INTEGER;
		a_DiagInfoPtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr_deref : POINTER) : INTEGER  is
			-- SQLGetDiagField returns the current value of a field
			-- of a record of the diagnostic data structure (associated
			-- with a specified handle) that contains error, warning,
			-- and status information.
		external "C use %"sqlext.h%""
		alias "SQLGetDiagField"
		end -- SQLGetDiagField

	SQLGetDiagRec (a_HandleType : INTEGER;
		a_Handle : POINTER;
		a_RecNumber : INTEGER;
		a_Sqlstate_deref : POINTER;
		a_NativeErrorPtr : POINTER;
		a_MessageText_deref : POINTER;
		a_BufferLength : INTEGER;
		a_TextLengthPtr_deref : POINTER) : INTEGER  is
			-- SQLGetDiagRec returns the current values of multiple
			-- fields of a diagnostic record that contains error,
			-- warning, and status information. Unlike SQLGetDiagField,
			-- which returns one diagnostic field per call, SQLGetDiagRec
			-- returns several commonly used fields of a diagnostic
			-- record, including the SQLSTATE, the native error code,
			-- and the diagnostic message text.
		external "C use %"sqlext.h%""
		alias "SQLGetDiagRec"
		end -- SQLGetDiagRec

	SQLGetEnvAttr (a_EnvironmentHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr : POINTER) : INTEGER  is
			-- SQLGetEnvAttr returns the current setting of an environment
			-- attribute.
		external "C use %"sqlext.h%""
		alias "SQLGetEnvAttr"
		end -- SQLGetEnvAttr

	SQLGetFunctions (a_ConnectionHandle : POINTER;
		a_FunctionId : INTEGER;
		a_SupportedPtr_deref : POINTER) : INTEGER  is
			-- SQLGetFunctions returns information about whether
			-- a driver supports a specific ODBC function. This function
			-- is implemented in the Driver Manager; it can also be
			-- implemented in drivers. If a driver implements SQLGetFunctions,
			-- the Driver Manager calls the function in the driver.
			-- Otherwise, it executes the function itself.
		external "C use %"sqlext.h%""
		alias "SQLGetFunctions"
		end -- SQLGetFunctions

	SQLGetInfo (a_ConnectionHandle : POINTER;
		a_InfoType : INTEGER;
		a_InfoValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr_deref : POINTER) : INTEGER  is
			-- SQLGetInfo returns general information about the driver
			-- and data source associated with a connection.
		external "C use %"sqlext.h%""
		alias "SQLGetInfo"
		end -- SQLGetInfo

	SQLGetStmtAttr (a_StatementHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_BufferLength : INTEGER;
		a_StringLengthPtr : POINTER) : INTEGER  is
			-- SQLGetStmtAttr returns the current setting of a statement
			-- attribute.
		external "C use %"sqlext.h%""
		alias "SQLGetStmtAttr"
		end -- SQLGetStmtAttr

	SQLGetTypeInfo (a_StatementHandle : POINTER;
		a_DataType : INTEGER) : INTEGER  is
			-- SQLGetTypeInfo returns information about data types
			-- supported by the data source. The driver returns the
			-- information in the form of an SQL result set. The data
			-- types are intended for use in Data Definition Language
			-- (DDL) statements.
		external "C use %"sqlext.h%""
		alias "SQLGetTypeInfo"
		end -- SQLGetTypeInfo

	SQLMoreResults (a_StatementHandle : POINTER) : INTEGER  is
			-- SQLMoreResults determines whether more results are
			-- available on a statement containing SELECT, UPDATE,
			-- INSERT, or DELETE statements and, if so, initializes
			-- processing for those results.
		external "C use %"sqlext.h%""
		alias "SQLMoreResults"
		end -- SQLMoreResults

	SQLNativeSql (a_ConnectionHandle : POINTER;
		a_InStatementText_deref : POINTER;
		a_TextLength1 : INTEGER;
		a_OutStatementText_deref : POINTER;
		a_BufferLength : INTEGER;
		a_TextLength2Ptr : POINTER) : INTEGER  is
			-- SQLNativeSql returns the SQL string as modified by
			-- the driver. SQLNativeSql does not execute the SQL statement.
		external "C use %"sqlext.h%""
		alias "SQLNativeSql"
		end -- SQLNativeSql

	SQLNumParams (a_StatementHandle : POINTER;
		a_arameterCountPtr : POINTER) : INTEGER  is
			-- SQLNumParams returns the number of parameters in an
			-- SQL statement.
		external "C use %"sqlext.h%""
		alias "SQLNumParams"
		end -- SQLNumParams

	SQLNumResultCols (a_StatementHandle : POINTER;
		a_ColumnCountPtr_deref : POINTER) : INTEGER  is
			-- SQLNumResultCols returns the number of columns in
			-- a result set.
		external "C use %"sqlext.h%""
		alias "SQLNumResultCols"
		end -- SQLNumResultCols

	SQLParamData (a_StatementHandle : POINTER;
		a_ValuePtrPtr : POINTER) : INTEGER  is
			-- SQLParamData is used in conjunction with SQLPutData
			-- to supply parameter data at statement execution time.
		external "C use %"sqlext.h%""
		alias "SQLParamData"
		end -- SQLParamData

	SQLPrepare (a_StatementHandle : POINTER;
		a_StatementText_deref : POINTER;
		a_TextLength : INTEGER) : INTEGER  is
			-- SQLPrepare prepares an SQL string for execution.
		external "C use %"sqlext.h%""
		alias "SQLPrepare"
		end -- SQLPrepare

	SQLPrimaryKeys (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER) : INTEGER  is
			-- SQLPrimaryKeys returns the column names that make
			-- up the primary key for a table. The driver returns
			-- the information as a result set. This function does
			-- not support returning primary keys from multiple tables
			-- in a single call.
		external "C use %"sqlext.h%""
		alias "SQLPrimaryKeys"
		end -- SQLPrimaryKeys

	SQLProcedureColumns (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_rocName : POINTER;
		a_NameLength3 : INTEGER;
		a_ColumnName_deref : POINTER;
		a_NameLength4 : INTEGER) : INTEGER  is
			-- SQLProcedureColumns returns the list of input and
			-- output parameters, as well as the columns that make
			-- up the result set for the specified procedures. The
			-- driver returns the information as a result set on the
			-- specified statement.
		external "C use %"sqlext.h%""
		alias "SQLProcedureColumns"
		end -- SQLProcedureColumns

	SQLProcedures (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_rocName : POINTER) : INTEGER  is
			-- SQLProcedures returns the list of procedure names
			-- stored in a specific data source. Procedure is a generic
			-- term used to describe an executable object, or a named
			-- entity that can be invoked using input and output parameters.
			-- For more information on procedures, see the "Procedures"
			-- section in Chapter 9: Executing Statements.
		external "C use %"sqlext.h%""
		alias "SQLProcedures"
		end -- SQLProcedures

	SQLPutData (a_StatementHandle : POINTER;
		a_DataPtr : POINTER;
		a_StrLen_or_Ind : INTEGER) : INTEGER  is
			-- SQLPutData allows an application to send data for
			-- a parameter or column to the driver at statement execution
			-- time. This function can be used to send character or
			-- binary data values in parts to a column with a character,
			-- binary, or data source specific data type (for example,
			-- parameters of the SQL_LONGVARBINARY or SQL_LONGVARCHAR
			-- types). SQLPutData supports binding to a Unicode C
			-- data type, even if the underlying driver does not support
			-- Unicode data.
		external "C use %"sqlext.h%""
		alias "SQLPutData"
		end -- SQLPutData

	SQLRowCount (a_StatementHandle : POINTER;
		a_RowCountPtr : POINTER) : INTEGER  is
			-- SQLRowCount returns the number of rows affected by
			-- an UPDATE, INSERT, or DELETE statement; an SQL_ADD,
			-- SQL_UPDATE_BY_BOOKMARK, or SQL_DELETE_BY_BOOKMARK operation
			-- in SQLBulkOperations; or an SQL_UPDATE or SQL_DELETE
			-- operation in SQLSetPos.
		external "C use %"sqlext.h%""
		alias "SQLRowCount"
		end -- SQLRowCount

	SQLSetConnectAttr (a_ConnectionHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_StringLength : INTEGER) : INTEGER  is
			-- SQLSetConnectAttr sets attributes that govern aspects
			-- of connections.
		external "C use %"sqlext.h%""
		alias "SQLSetConnectAttr"
		end -- SQLSetConnectAttr

	SQLSetCursorName (a_StatementHandle : POINTER;
		a_CursorName_deref : POINTER;
		a_NameLength : INTEGER) : INTEGER  is
			-- SQLSetCursorName associates a cursor name with an
			-- active statement. If an application does not call SQLSetCursorName,
			-- the driver generates cursor names as needed for SQL
			-- statement processing.
		external "C use %"sqlext.h%""
		alias "SQLSetCursorName"
		end -- SQLSetCursorName

	SQLSetDescField (a_DescriptorHandle : POINTER;
		a_RecNumber : INTEGER;
		a_FieldIdentifier : INTEGER;
		a_ValuePtr : POINTER;
		a_BufferLength : INTEGER) : INTEGER  is
			-- SQLSetDescField sets the value of a single field of
			-- a descriptor record.
		external "C use %"sqlext.h%""
		alias "SQLSetDescField"
		end -- SQLSetDescField

	SQLSetDescRec (a_DescriptorHandle : POINTER;
		a_RecNumber : INTEGER;
		a_Type : INTEGER;
		a_SubType : INTEGER;
		a_Length : INTEGER;
		a_Precision : INTEGER;
		a_Scale : INTEGER;
		a_DataPtr : POINTER;
		a_StringLengthPtr : POINTER;
		a_IndicatorPtr : POINTER) : INTEGER  is
			-- The SQLSetDescRec function sets multiple descriptor
			-- fields that affect the data type and buffer bound to
			-- a column or parameter data.
		external "C use %"sqlext.h%""
		alias "SQLSetDescRec"
		end -- SQLSetDescRec

	SQLSetEnvAttr (a_EnvironmentHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_StringLength : INTEGER) : INTEGER  is
			-- SQLSetEnvAttr sets attributes that govern aspects
			-- of environments.
		external "C use %"sqlext.h%""
		alias "SQLSetEnvAttr"
		end -- SQLSetEnvAttr

	SQLSetPos (a_StatementHandle : POINTER;
		a_RowNumber : INTEGER;
		a_Operation : INTEGER;
		a_LockType : INTEGER) : INTEGER  is
			-- SQLSetPos sets the cursor position in a rowset and
			-- allows an application to refresh data in the rowset
			-- or to update or delete data in the result set.
		external "C use %"sqlext.h%""
		alias "SQLSetPos"
		end -- SQLSetPos

	SQLSetStmtAttr (a_StatementHandle : POINTER;
		a_Attribute : INTEGER;
		a_ValuePtr : POINTER;
		a_StringLength : INTEGER) : INTEGER  is
			-- SQLSetStmtAttr sets attributes related to a statement.
		external "C use %"sqlext.h%""
		alias "SQLSetStmtAttr"
		end -- SQLSetStmtAttr

	SQLSpecialColumns (a_StatementHandle : POINTER;
		a_IdentifierType : INTEGER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER;
		a_Scope : INTEGER;
		a_Nullable : INTEGER) : INTEGER  is
			-- SQLSpecialColumns retrieves the following information
			-- about columns within a specified table: The optimal
			-- set of columns that uniquely identifies a row in the
			-- table. - OR - Columns that are automatically updated
			-- when any value in the row is updated by a transaction.
		external "C use %"sqlext.h%""
		alias "SQLSpecialColumns"
		end -- SQLSpecialColumns

	SQLStatistics (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER;
		a_Unique : INTEGER;
		a_Reserved : INTEGER) : INTEGER  is
			-- SQLStatistics retrieves a list of statistics about
			-- a single table and the indexes associated with the
			-- table. The driver returns the information as a result
			-- set.
		external "C use %"sqlext.h%""
		alias "SQLStatistics"
		end -- SQLStatistics

	SQLTablePrivileges (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER) : INTEGER  is
			-- SQLTablePrivileges returns a list of tables and the
			-- privileges associated with each table. The driver returns
			-- the information as a result set on the specified statement.
		external "C use %"sqlext.h%""
		alias "SQLTablePrivileges"
		end -- SQLTablePrivileges

	SQLTables (a_StatementHandle : POINTER;
		a_CatalogName_deref : POINTER;
		a_NameLength1 : INTEGER;
		a_SchemaName_deref : POINTER;
		a_NameLength2 : INTEGER;
		a_TableName_deref : POINTER;
		a_NameLength3 : INTEGER;
		a_TableType_deref : POINTER;
		a_NameLength4 : INTEGER) : INTEGER  is
			-- SQLTables returns the list of table, catalog, or schema
			-- names, and table types, stored in a specific data source.
			-- The driver returns the information as a result set.
		external "C use %"sqlext.h%""
		alias "SQLTables"
		end -- SQLTables

end -- class WIN32_SQL_FUNCTIONS
