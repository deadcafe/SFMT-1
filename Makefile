SFMT_ROOT = $(CURDIR)
SFMT_LIB_DIR = $(SFMT_ROOT)/lib
export SFMT_ROOT SFMT_LIB_DIR

all:	sfmt-lib sfmt-test sfmt-sample

clean:	lib-clean test-clean sample-clean

sfmt-sample:	sfmt-test
	$(MAKE) -C sample all

sfmt-test:	sfmt-lib
	$(MAKE) -C test all

sfmt-lib:
	$(MAKE) -C lib all

lib-clean:
	$(MAKE) -C lib clean

test-clean:
	$(MAKE) -C test clean

sample-clean:
	$(MAKE) -C sample clean
