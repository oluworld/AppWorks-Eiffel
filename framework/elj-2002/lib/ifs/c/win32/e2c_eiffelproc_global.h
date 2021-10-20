#ifndef __E2C_EIFFELPROC_GLOBAL_H
#define __E2C_EIFFELPROC_GLOBAL_H

#include <windows.h>
#include <commctrl.h>
#include "eiffel_glue.h"

typedef EIF_BOOLEAN (*EIFFEL_ENUMWNDPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2);
typedef EIF_BOOLEAN (*EIFFEL_ENUMPROPPROC)		(void* C,EIF_INTEGER a1,EIF_POINTER a2,EIF_POINTER a3);
typedef EIF_BOOLEAN (*EIFFEL_ENUMPROPEXPROC)	(void* C,EIF_INTEGER a1,EIF_POINTER a2,EIF_POINTER a3,EIF_POINTER a4);
typedef void	 	(*EIFFEL_SENDASYNCPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2,EIF_INTEGER a3,EIF_INTEGER a4);
typedef EIF_BOOLEAN (*EIFFEL_ENUMRESLANGPROC)	(void* C,EIF_INTEGER a1,EIF_POINTER a2,EIF_POINTER a3,EIF_INTEGER a4,EIF_INTEGER a5);
typedef EIF_BOOLEAN (*EIFFEL_ENUMRESNAMEPROC)	(void* C,EIF_INTEGER a1,EIF_POINTER a2,EIF_POINTER a3,EIF_INTEGER a4);
typedef EIF_BOOLEAN (*EIFFEL_ENUMRESTYPEPROC)	(void* C,EIF_INTEGER a1,EIF_POINTER a2,EIF_INTEGER a3);
typedef EIF_INTEGER (*EIFFEL_ENUMFONTFAMPROC)	(void* C,EIF_POINTER a1,EIF_POINTER a2,EIF_INTEGER a3,EIF_INTEGER a4);
typedef EIF_BOOLEAN (*EIFFEL_DRAWSTATEPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2,EIF_INTEGER a3,EIF_INTEGER a4,EIF_INTEGER a5);
typedef EIF_BOOLEAN (*EIFFEL_OUTPUTPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2,EIF_INTEGER a3);
typedef EIF_BOOLEAN (*EIFFEL_ENUMSTRINGPROC)	(void* C,EIF_POINTER a1);
typedef EIF_BOOLEAN (*EIFFEL_LINEDDAPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2,EIF_INTEGER a3);
typedef EIF_INTEGER (*EIFFEL_ENUMOBJECTPROC)	(void* C,EIF_POINTER a1,EIF_INTEGER a2);
typedef EIF_INTEGER (*EIFFEL_ENHMETAFILEPROC)	(void* C,EIF_INTEGER a1,EIF_POINTER a2, EIF_POINTER a3, EIF_INTEGER a4, EIF_INTEGER a5);
typedef EIF_BOOLEAN (*EIFFEL_DIALOGPROC)		(void* C,EIF_INTEGER a1,EIF_INTEGER a2,EIF_INTEGER a3,EIF_INTEGER a4);
typedef EIF_BOOLEAN (*EIFFEL_WINDOWPROC)		(void* C,EIF_POINTER a1,EIF_INTEGER a2,EIF_INTEGER a3,EIF_INTEGER a4);

void* eiffel_create_object;
void* eiffel_window_proc;
void* eiffel_default_proc;

BOOL CALLBACK c_DialogProc (HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam);

/* creates a window proc callback that takes 5 args of 4 bytes */
void* c_make_instance (void* a_current, void* a_method);
/* frees an window proc callback previously created with c_make_instance */
void c_free_instance (void* a_instance);
/* enum resources callbacks */
BOOL _stdcall c_enum_res_lang_proc (HANDLE hModule,	LPCTSTR lpszType, LPCTSTR lpszName, WORD wIDLanguage, LONG lParam);
BOOL _stdcall c_enum_res_name_proc (HANDLE hModule,	LPCTSTR lpszType, LPTSTR lpszName, LONG lParam);
BOOL _stdcall c_enum_res_type_proc (HANDLE hModule,	LPTSTR lpszType, LONG lParam);
/*enum FONTS callbacks */
int CALLBACK c_enum_font_family (ENUMLOGFONT FAR *lpelf, NEWTEXTMETRIC FAR *lpntm, int FontType, LPARAM lParam);
/*  */
void _stdcall c_send_async_proc (HWND hWnd, UINT uMsg, DWORD dwData, LRESULT lResult);
/* drawing and painting callbacks */
BOOL _stdcall c_draw_state_proc (HDC hdc, LPARAM lData, WPARAM wData, int cx, int cy);
BOOL _stdcall c_output_proc (HDC hdc, LPARAM lData, int cchData);
/* different enum window functions use this callback */
BOOL CALLBACK c_enum_window_proc (HWND hWnd, LPARAM lParam);
/* callback for different functions in the string manipulation group */
BOOL CALLBACK c_enum_string_proc (LPTSTR lpString);
/* callback for the LineDDA function */
VOID CALLBACK c_line_dda_Proc (int  X, int  Y, LPARAM  lpData);
/* callback for the EnumObjects function */
int CALLBACK c_obj_enum_proc (LPVOID ptr, LPARAM lData);
/* callback for the EnumEnhMetaFile function */
int CALLBACK c_enh_meta_file_proc(HDC hDC, HANDLETABLE *lpHTable, ENHMETARECORD *lpEMFR, int nObj, LPARAM lpData);
 
extern void*	SendAsyncObj[2];
extern void*	EnumGeneral [2];

typedef struct _ENUMPARAM
{
	EIF_POINTER	eif_object;
	EIF_POINTER	eif_enum;
	EIF_INTEGER	lparam;
} ENUMPARAM;

typedef struct _DLGITEMTEMPLATEEX
{
	DWORD  helpID;
	DWORD  exStyle;
	DWORD  style;
	short  x;
	short  y;
	short  cx;
	short  cy;
	WORD   id;
	short* windowClass;
	short* title;
	WORD   extraCount;
} DLGITEMTEMPLATEEX;

typedef struct _DLGTEMPLATEEX
{   
	WORD   dlgVer; 
	WORD   signature; 
	DWORD  helpID; 
	DWORD  exStyle; 
	DWORD  style; 
	WORD   cDlgItems; 
	short  x; 
	short  y; 
	short  cx; 
	short  cy; 
	short* menu;
	short* windowClass;
	short* title;
	short  pointsize;
	short  weight;
	short  bItalic;
	short* font;
} DLGTEMPLATEEX;

#pragma pack(push,1)
typedef struct _EIF_MENU_TEMPLATE
{
	MENUITEMTEMPLATEHEADER	header;
	MENUITEMTEMPLATE		items[1];
}EIF_MENU_TEMPLATE;

/*
typedef struct _EIF_MENU_TEMPLATE_EX
{
	MENUEX_TEMPLATE_HEADER	header;
	MENUEX_TEMPLATE_ITEM	items[1];
}EIF_MENU_TEMPLATE_EX;
*/
#pragma pack(pop)

void initialize_eiffel_runtime(int, char**);
void ELJ_GLOBAL_APPLICATION_create_application (void*, void*);
extern void*eiffel_root_object;

#endif