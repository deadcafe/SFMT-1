include $(SFMT_ROOT)/mk/sfmt.var.mk

TARGET = test-xxx-M19937
SRCS = test.c

CPPFLAGS += -I$(SFMT_LIB_DIR) -DSFMT_MEXP=19937 -DNDEBUG
LIBS = -L$(SFMT_LIB_DIR) -lsfmt

OBJS = ${SRCS:.c=.o}
DEPENDS = .depend
.PHONY: all clean depend

all:	test

.c.o    :
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $<

test:	$(TARGET)
	-@ ./check.sh 32 test-xxx

$(TARGET):	$(OBJS)
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

$(OBJS):	Makefile depend

clean:
	-@ $(RM) -f $(OBJS) *~ $(TARGET) $(DEPENDS)

depend: $(SRCS) Makefile
	-@ $(CC) $(CPPFLAGS) -MM -MG $(SRCS) > $(DEPENDS)

-include $(DEPENDS)
