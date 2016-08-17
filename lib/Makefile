include $(SFMT_ROOT)/mk/sfmt.var.mk

TARGET = libsfmt.a
SRCS = SFMT.c

CPPFLAGS += -I./ -DSFMT_MEXP=19937 -DNDEBUG

OBJ_DIR = $(SFMT_ROOT)/build
LIB_DIR = $(SFMT_ROOT)/lib
LIB_OBJS = ${SRCS:.c=.o}
OBJS = $(LIB_OBJS:%=$(OBJ_DIR)/%) 

DEPENDS = .depend
.PHONY: all clean depend

all:	$(TARGET)

$(OBJ_DIR)/%.o:$(LIB_DIR)/%.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

$(TARGET):	$(OBJS)
	$(AR) -qcs $@ $^

$(OBJS):	Makefile depend

clean:
	-@ $(RM) -f $(OBJS) *~ $(TARGET) $(DEPENDS)

depend: $(SRCS) Makefile
	-@ $(CC) $(CPPFLAGS) -MM -MG $(SRCS) > $(DEPENDS)

-include $(DEPENDS)
