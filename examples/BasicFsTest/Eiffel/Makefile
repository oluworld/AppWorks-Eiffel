CC        := gcc #gcc -mwindows #lcc
OBJ       := .o
LIB       := .a

ROOTCLASS := ROOT
OBJS      := "../../../framework/apw$(LIB)" apw_start$(OBJ)
EXTRAC    := 
CECIL     := -cecil "../../../framework/cecil.se"
EFLAGS    := -no_main -no_style_warning -no_strip -DSE_WEDIT #-no_split #-verbose
LDFLAGS   := -g#4

all: apwlib apwstart
	compile $(EFLAGS) $(LDFLAGS) $(CECIL) $(ROOTCLASS) make $(EXTRAC) $(OBJS)

apwstart: apw_start$(OBJ)

apw_start$(OBJ): ../../../framework/apw_start.c
	$(CC) $(LDFLAGS) "../../../framework/apw_start.c"

apwlib:
	true

debug:
	wedit $(ROOTCLASS).exe &

test:
	.\$(ROOTCLASS).exe

clean:
	clean $(ROOTCLASS)

.PHONY: debug test clean all apwlib apwstart
