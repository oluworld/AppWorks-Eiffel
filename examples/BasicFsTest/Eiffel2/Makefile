CC        := lcc #gcc -mwindows #lcc
OBJ       := .obj

ROOTCLASS := ROOT
OBJS      := "e:\_local\src\lang\eiffel\AppWorks\Runtime\apw.lib" apw_start$(OBJ)
EXTRAC    := 
CECIL     := -cecil "e:\_local\src\lang\eiffel\AppWorks\Runtime\cecil.se"
EFLAGS    := -no_main -no_style_warning -no_strip -DSE_WEDIT #-no_split #-verbose
LDFLAGS   := -g#4

all: #$(OBJS) 
	compile $(EFLAGS) $(LDFLAGS) $(CECIL) $(ROOTCLASS) make $(EXTRAC) $(OBJS)
#apw_start$(OBJ): e:\_local\src\lang\eiffel\AppWorks\Runtime\apw_start.c
apw_start.obj: e:\_local\src\lang\eiffel\AppWorks\Runtime\apw_start.c
	$(CC) $(LDFLAGS) "e:\_local\src\lang\eiffel\AppWorks\Runtime\apw_start.c"
debug:
	wedit $(ROOTCLASS).exe &
test:
	.\$(ROOTCLASS).exe
clean:
	clean $(ROOTCLASS)
