CC        := gcc #gcc -mwindows #lcc
OBJ       := .o

ROOTCLASS := ROOT
OBJS      := "../../../framework/apw.lib" apw_start$(OBJ)
EXTRAC    := 
CECIL     := -cecil "../../../framework/cecil.se"
EFLAGS    := -no_main -no_style_warning -no_strip -DSE_WEDIT #-no_split #-verbose
LDFLAGS   := -g#4

all: #$(OBJS) 
	compile $(EFLAGS) $(LDFLAGS) $(CECIL) $(ROOTCLASS) make $(EXTRAC) $(OBJS)
apw_start$(OBJ): ../../../framework/apw_start.c
	$(CC) $(LDFLAGS) "../../../framework/apw_start.c"
debug:
	wedit $(ROOTCLASS).exe &
test:
	.\$(ROOTCLASS).exe
clean:
	clean $(ROOTCLASS)
