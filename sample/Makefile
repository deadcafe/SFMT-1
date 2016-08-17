include $(SFMT_ROOT)/mk/sfmt.var.mk

TARGET = sample1 sample2 sample3 sample4
SRCS = sample1.c sample2.c sample3.c sample4.c

CPPFLAGS += -I$(SFMT_LIB_DIR) -DSFMT_MEXP=19937 -DNDEBUG
LIBS = -L$(SFMT_LIB_DIR) -lsfmt

OBJS = ${SRCS:.c=.o}
DEPENDS = .depend
.PHONY: all clean depend

all:	$(TARGET)

.c.o    :
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $<

sample1:	sample1.o
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

sample2:	sample2.o
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

sample3:	sample3.o
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

sample4:	sample4.o
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

$(OBJS):	Makefile depend

clean:
	-@ $(RM) -f $(OBJS) *~ $(TARGET) $(DEPENDS)

depend: $(SRCS) Makefile
	-@ $(CC) $(CPPFLAGS) -MM -MG $(SRCS) > $(DEPENDS)

-include $(DEPENDS)
