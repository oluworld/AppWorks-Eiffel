#include "e2c_common.h"

void append_to_list (void** List, void* Element)
{
	((GENERIC*) Element)->next = *((GENERIC**) List);
	*List = Element;
}

int is_in_list (void** List, void* Element)
{
	GENERIC* ptr;
	for (ptr = *((GENERIC**)List); ptr != NULL; ptr = ((GENERIC*)ptr)->next)
		if (ptr == Element)
			return 1;

	return 0;
}

void remove_from_list (void** List, void* Element)
{
   GENERIC* ptr;

	if (Element == NULL)
		return;

	if (*List == Element)
	{
		*List = ((GENERIC*) Element)->next;
		((GENERIC*) Element)->next = NULL;
	}
	else
	{
		for (ptr = *((GENERIC**)List); ptr != NULL; ptr = ((GENERIC*)ptr)->next)
		{
			if (ptr->next == Element)
			{
				ptr->next = ((GENERIC*) Element)->next;
				((GENERIC*) Element)->next = NULL;
         		return;
			}
		}
	}
}
