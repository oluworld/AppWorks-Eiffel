#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include "e2c_eiffelproc_global.h"

#pragma pack(push, 1)
unsigned char OpCodes[] = { 0x55,                      /* push     EBP */
                  			0x89,0xe5,                 /* movl     ESP,EBP */
							0xff,0x75,0x14,            /* push     0x14    (lParam) */
							0xff,0x75,0x10,            /* push     0x10    (wParam) */
							0xff,0x75,0x0c,            /* push     0xC     (uMsg) */
							0xff,0x75,0x08,            /* push     0x8     (hWnd) */
							0x68,0x00,0x00,0x00,0x00,  /* push     0x...   (additional, maybe current pointer) */
							0xe8,0x00,0x00,0x00,0x00,  /* call     0x...   (a cdecl with 5 params, maybe eiffel WndProc) */
							0x83,0xc4,0x14,            /* addl     0x14    (adjust stack) */
							0x5d,                      /* pop      EBP */
							0xc2,0x10,0x00};           /* ret      0x10    (stdcall return) */

typedef struct _INSTANCEBLOCK
{
	char					code[sizeof(OpCodes)];
	struct _INSTANCEBLOCK*	next;
} INSTANCEBLOCK;

#pragma pack(pop)

void*			SendAsyncObj[2]		= {NULL, NULL};
void*			EnumGeneral [2]		= {NULL, NULL};
INSTANCEBLOCK*	InstanceFreeList	= NULL;
EIF_POINTER		CreateObject		= NULL;
int				BlkCount			= 0;

void* c_make_instance (void* a_current, void* a_method)
{
	char* Result;
	INSTANCEBLOCK* Instance;
	INSTANCEBLOCK* LastInstance;

	if (InstanceFreeList == NULL)
	{
		InstanceFreeList = (INSTANCEBLOCK*)VirtualAlloc (NULL, 4096, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
		memset (InstanceFreeList, 0, 4096);
		Instance = InstanceFreeList;
		do
		{
			Instance->next = (INSTANCEBLOCK*) ((int)Instance + sizeof(INSTANCEBLOCK));
			/* copy opcodes to page */
			memcpy (Instance->code, OpCodes, sizeof(OpCodes));
			LastInstance = Instance;
			Instance = Instance->next;
		} while ((int)Instance + sizeof(INSTANCEBLOCK) < (int)InstanceFreeList + 4096 - sizeof(INSTANCEBLOCK));
		LastInstance->next = NULL;
	}

	Result = (char*) InstanceFreeList;
/* calculate call distance */
	unsigned long jump_distance = (unsigned long) a_method - (unsigned long) ((char*) Result) - 25;

/* copy extra param into first hole */
	*((long*) (Result + 16)) = (long)a_current;
/* copy calculated call distance to second hole */
	*((long*) (Result + 21)) = (long)jump_distance;

	InstanceFreeList = InstanceFreeList->next;

	return Result;
}

void c_free_instance (void* a_instance)
{
	((INSTANCEBLOCK*) a_instance)->next = InstanceFreeList;
	InstanceFreeList = a_instance;
}

void _stdcall c_send_async_proc (HWND hWnd, UINT uMsg, DWORD dwData, LRESULT lResult)
{
	((EIFFEL_SENDASYNCPROC)SendAsyncObj[1])(SendAsyncObj[0],
											(EIF_INTEGER) hWnd,
											(EIF_INTEGER) uMsg,
											(EIF_INTEGER) dwData,
											(EIF_INTEGER) lResult);
}

BOOL _stdcall c_enum_res_lang_proc (HANDLE hModule,	LPCTSTR lpszType, LPCTSTR lpszName, WORD wIDLanguage, LONG lParam)
{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (BOOL) ((EIFFEL_ENUMRESLANGPROC) param->eif_enum) (	param->eif_object,
																(EIF_INTEGER) hModule,
																(EIF_POINTER) lpszType,
																(EIF_POINTER) lpszName,
																(EIF_INTEGER) wIDLanguage,
																param->lparam);
}

BOOL _stdcall c_enum_res_name_proc (HANDLE hModule,	LPCTSTR lpszType, LPTSTR lpszName, LONG lParam)
{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (BOOL) ((EIFFEL_ENUMRESNAMEPROC) param->eif_enum) (	param->eif_object,
																(EIF_INTEGER) hModule,
																(EIF_POINTER) lpszType,
																(EIF_POINTER) lpszName,
																param->lparam);
}

BOOL _stdcall c_enum_res_type_proc (HANDLE hModule,	LPTSTR lpszType, LONG lParam)
{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (BOOL) ((EIFFEL_ENUMRESTYPEPROC) param->eif_enum) (	param->eif_object,
																(EIF_INTEGER) hModule,
																(EIF_POINTER) lpszType,
																param->lparam);
}

int CALLBACK c_enum_font_family (ENUMLOGFONT FAR *lpelf, NEWTEXTMETRIC FAR *lpntm, int FontType, LPARAM lParam)
{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (int) ((EIFFEL_ENUMFONTFAMPROC) param->eif_enum) (	param->eif_object,
																(EIF_POINTER) lpelf,
																(EIF_POINTER) lpntm,
																(EIF_INTEGER) FontType,
																param->lparam);
}

BOOL CALLBACK c_enum_window_proc (HWND hWnd, LPARAM lParam)
{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (BOOL) ((EIFFEL_ENUMWNDPROC)param->eif_enum) (	param->eif_object,
															(EIF_INTEGER)hWnd,
															param->lparam);
}

BOOL _stdcall c_draw_state_proc (HDC hdc, LPARAM lData, WPARAM wData, int cx, int cy)
{
	ENUMPARAM* param = (ENUMPARAM*) lData;

	return (BOOL) ((EIFFEL_DRAWSTATEPROC) param->eif_enum) (	param->eif_object,
																(EIF_INTEGER) hdc,
																param->lparam,
																(EIF_INTEGER) wData,
																(EIF_INTEGER) cx,
																(EIF_INTEGER) cy);
}

BOOL _stdcall c_output_proc (HDC hdc, LPARAM lData, int cchData)
{
	ENUMPARAM* param = (ENUMPARAM*) lData;

	return (BOOL) ((EIFFEL_OUTPUTPROC) param->eif_enum) (	param->eif_object,
															(EIF_INTEGER) hdc,
															param->lparam,
															(EIF_INTEGER) cchData);
}

BOOL CALLBACK c_enum_string_proc (LPTSTR lpString)
{
	return (BOOL) ((EIFFEL_ENUMSTRINGPROC)EnumGeneral[1])(	EnumGeneral[0],
															(EIF_POINTER)lpString);
}

VOID CALLBACK c_line_dda_Proc (int  X, int  Y, LPARAM  lpData)
{
	ENUMPARAM* param = (ENUMPARAM*) lpData;

	((EIFFEL_LINEDDAPROC) param->eif_enum) (	param->eif_object,
												(EIF_INTEGER) X,
												(EIF_INTEGER) Y,
												param->lparam);
}

int CALLBACK c_obj_enum_proc (LPVOID ptr, LPARAM lData)
{
	ENUMPARAM* param = (ENUMPARAM*) lData;

	return (int)((EIFFEL_ENUMOBJECTPROC) param->eif_enum) (	param->eif_object,
															(EIF_POINTER) ptr,
															(EIF_INTEGER) param->lparam);
}

int CALLBACK c_enh_meta_file_proc(HDC hDC, HANDLETABLE *lpHTable, ENHMETARECORD *lpEMFR, int nObj, LPARAM lpData)
{
	ENUMPARAM* param = (ENUMPARAM*) lpData;

	return (int) ((EIFFEL_ENHMETAFILEPROC) param->eif_enum) (	param->eif_object,
																(EIF_INTEGER) hDC,
																(EIF_POINTER) lpHTable,
																(EIF_POINTER) lpEMFR,
																(EIF_INTEGER) nObj,
																(EIF_INTEGER) param->lparam);
}

BOOL _stdcall c_DialogProc (HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)

{
	ENUMPARAM* param = (ENUMPARAM*) lParam;

	return (BOOL) ((EIFFEL_DIALOGPROC) param->eif_enum) (	param->eif_object,
	                                             			(EIF_INTEGER) hwndDlg,
															(EIF_INTEGER) uMsg,
															(EIF_INTEGER) wParam,
															param->lparam);
}

/*
char* getNextArgument(char* a_string, char* a_end, char** a_next)
{
	char* pstart = a_string;
	char* ptr = a_string;


	if (a_string >= a_end)
	{
		*a_next = 0;
		return a_end;
	}

	while ((*ptr == 0) && ptr < a_end)
	{
		ptr++;
		if (ptr >= a_end)
		{
			*a_next = 0;
			return a_end;
		}
	}


	while (isspace(*ptr) && ptr < a_end)
    {
		ptr++;
		if (ptr < a_end)
			continue;
		*a_next = 0;
		return a_end;
	}

	pstart = ptr;
	while (!isspace(*ptr) && (*ptr != '"' ) && (ptr < a_end))
	{
		ptr++;
		if (ptr < a_end)
			continue;

		*a_next = a_end;
		return pstart;
	}
	if (ptr > pstart)
	{
		*ptr = 0;
		ptr++;
		*a_next = ptr;
		return pstart;
	}

	ptr++;
	pstart = ptr;
	while ((*ptr != '"') && (ptr < a_end))
	{
		ptr++;
	}
	if (ptr >= a_end)
	{
		*a_next = 0;
		return a_end;
	}

	*ptr = 0;
	ptr++;
	*a_next = ptr;
	return pstart;
}


int _stdcall WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmdLine, int CmdShow)
{
  FILE* old_err;
  FILE* old_out;
  
  char* e_argv[256] = {NULL};
  char* ptr = (char*)GetCommandLine();
  char* end = ptr + strlen (ptr) + 1;
  int   e_argc = -1;
	char* s;
	char*	next;

	s = ptr;
	next = ptr;
	while (next != 0)
	{
		s = getNextArgument(ptr, end, &next);
		if (next == 0)
			break;

		e_argc++;
		e_argv[e_argc] = s;

		
		ptr = next;
	}

	e_argc++;
	
	_iob[2] = *(fopen ("eiffel.err", "a+"));
	_iob[1] = *(fopen ("eiffel.out", "a+"));

	initialize_eiffel_runtime(e_argc, e_argv);

	ELJ_GLOBAL_APPLICATION_create_application (eiffel_root_object, hInstance);
	
	return 0;
}
*/
EIF_POINTER c_GetLastErrorMessage ()
{
	LPTSTR lpMsgBuf;

	FormatMessage(
      FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
	   NULL,
	   GetLastError(),
	   MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
	   (LPTSTR) &lpMsgBuf,
	   0,
	   NULL);

	return ((EIF_POINTER) lpMsgBuf);
}

void c_FreeMsgBuffer (EIF_POINTER a_ptr)
{
	LocalFree ((LPVOID) a_ptr);
}
