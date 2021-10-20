#include "e2c_common.h"
#include <malloc.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>

#define E_INVALID_HEAD			-10
#define E_UNKNOWN_BLOCK			-11
#define E_INVALID_TAIL			-12
#define E_FREE_FAILED			-13

typedef struct _MEMBLOCK
{
	struct _MEMBLOCK* 	next;
	char				magic[4];
	int					size;
}MEMBLOCK;

MEMBLOCK*	mem_list = NULL;

MEMBLOCK* valid_mem_block (void* _block)
{
	MEMBLOCK* result = (MEMBLOCK*) ((char*)_block - sizeof (MEMBLOCK));

	if (!is_in_list (&mem_list, result))                                      exit (E_UNKNOWN_BLOCK);
	if (memcmp (result->magic, "BIGG", 4))                                    exit (E_INVALID_HEAD);
	if (memcmp ((char*)result + sizeof (MEMBLOCK) + result->size, "UWES", 4)) exit (E_INVALID_TAIL);

	return result;
}

void* elj_malloc (int _size)
{
	MEMBLOCK* new_block = malloc (sizeof (MEMBLOCK) + sizeof (int) + _size);

	memcpy (new_block->magic, "BIGG", 4);
	memcpy ((char*)new_block + (sizeof (MEMBLOCK) + _size), "UWES", 4);
	new_block->size = _size;

	append_to_list (&mem_list, new_block);

	return (char*)new_block + sizeof (MEMBLOCK);
}

void elj_free (void* _block)
{
	MEMBLOCK* free_block;

	free_block = valid_mem_block (_block);

	remove_from_list (&mem_list, free_block);

	memset (free_block, 0, free_block->size + sizeof (MEMBLOCK) + sizeof (int));

	free (free_block);
/*
	free_block = GlobalFree (free_block);
	if (free_block) exit (E_FREE_FAILED);
*/
}

void* elj_realloc (void* _block, int _size)
{
	MEMBLOCK* new_block;

	new_block = valid_mem_block (_block);

	if (new_block->size != _size)
	{
		remove_from_list (&mem_list, new_block);

//		new_block = GlobalReAlloc (new_block, _size + sizeof (MEMBLOCK) + sizeof (int), 0);
		new_block = realloc (new_block, _size + sizeof (MEMBLOCK) + sizeof (int));

		new_block->size = _size;
		memcpy ((char*)new_block + (sizeof (MEMBLOCK) + _size), "UWES", 4);

		append_to_list (&mem_list, new_block);
	}
	return (char*)new_block + sizeof (MEMBLOCK);
}
