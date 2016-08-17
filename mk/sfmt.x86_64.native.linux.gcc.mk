# arch:
ARCH		= x86_64
CROSS		=
CPU_CFLAGS	= -m64
CPU_LDFLAGS	=
CPU_ASFLAGS	= -felf64
export ARCH CROSS CPU_CFLAGS CPU_LDFLAGS CPU_ASFLAGS

# machine:
MACHINE_CFLAGS	= -march=native
#MACHINE_CFLAGS = -march=corei7

# exec-env:
EXECENV_CFLAGS	= -fPIC
EXECENV_LDFLAGS =
EXECENV_LDLIBS	=
EXECENV_ASFLAGS =
LINK_USING_CC	= 1
export EXECENV_CFLAGS EXECENV_LDFLAGS EXECENV_ASFLAGS EXECENV_LDLIBS

# toolchain:
CC	= $(CROSS)gcc
CPP	= $(CROSS)cpp
AS	= nasm
AR	= $(CROSS)ar
LD	= $(CROSS)ld

TOOLCHAIN_ASFLAGS =
TOOLCHAIN_CFLAGS  =
TOOLCHAIN_LDFLAGS =

OPTIMIZE_FLAGS	= -O3 -finline-functions
OPTIMIZE_FLAGS += -fomit-frame-pointer -fno-strict-aliasing
OPTIMIZE_FLAGS += --param max-inline-insns-single=1800
OPTIMIZE_FLAGS += --param inline-unit-growth=500
OPTIMIZE_FLAGS += --param large-function-growth=900

WERROR_FLAGS  = -Wextra -Wall -Wstrict-prototypes -Wmissing-prototypes
WERROR_FLAGS += -Wmissing-declarations -Wold-style-definition -Wpointer-arith
WERROR_FLAGS += -Wcast-align -Wnested-externs -Wcast-qual
WERROR_FLAGS += -Wformat-nonliteral -Wformat-security
WERROR_FLAGS += -Wundef -Wwrite-strings
WERROR_FLAGS += -Werror

GCC_MAJOR = $(shell echo __GNUC__ | $(CC) -E -x c - | tail -n 1)
GCC_MINOR = $(shell echo __GNUC_MINOR__ | $(CC) -E -x c - | tail -n 1)
GCC_VERSION = $(GCC_MAJOR)$(GCC_MINOR)

# workaround GCC bug with warning "missing initializer" for "= {0}"
ifeq ($(shell test $(GCC_VERSION) -lt 47 && echo 1), 1)
WERROR_FLAGS += -Wno-missing-field-initializers
endif

# workaround GCC bug with warning "may be used uninitialized"
ifeq ($(shell test $(GCC_VERSION) -lt 47 && echo 1), 1)
WERROR_FLAGS += -Wno-uninitialized
endif

