
AUTO_CPUFLAGS := $(shell $(CC) $(MACHINE_CFLAGS) $(WERROR_FLAGS) $(EXTRA_CFLAGS) -dM -E - < /dev/null)

ifneq ($(filter $(AUTO_CPUFLAGS),__SSE__),)
CPUFLAGS += SSE
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__SSE2__),)
CPUFLAGS += SSE2
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__SSE3__),)
CPUFLAGS += SSE3
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__SSSE3__),)
CPUFLAGS += SSSE3
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__SSE4_1__),)
CPUFLAGS += SSE4_1
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__SSE4_2__),)
CPUFLAGS += SSE4_2
endif

#ifneq ($(filter $(AUTO_CPUFLAGS),__AES__),)
#CPUFLAGS += AES
#endif

#ifneq ($(filter $(AUTO_CPUFLAGS),__PCLMUL__),)
#CPUFLAGS += PCLMULQDQ
#endif

ifneq ($(filter $(AUTO_CPUFLAGS),__AVX__),)
CPUFLAGS += AVX
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__RDRND__),)
CPUFLAGS += RDRAND
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__FSGSBASE__),)
CPUFLAGS += FSGSBASE
endif

#ifneq ($(filter $(AUTO_CPUFLAGS),__F16C__),)
#CPUFLAGS += F16C
#endif

ifneq ($(filter $(AUTO_CPUFLAGS),__AVX2__),)
CPUFLAGS += AVX2
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__AVX512F__),)
CPUFLAGS += AVX512F
endif

# IBM Power CPU flags
ifneq ($(filter $(AUTO_CPUFLAGS),__PPC64__),)
CPUFLAGS += PPC64
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__PPC32__),)
CPUFLAGS += PPC32
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__vector),)
CPUFLAGS += ALTIVEC
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__builtin_vsx_xvnmaddadp),)
CPUFLAGS += VSX
endif

# ARM flags
ifneq ($(filter $(AUTO_CPUFLAGS),__ARM_NEON),)
CPUFLAGS += NEON
endif

ifneq ($(filter $(AUTO_CPUFLAGS),__ARM_FEATURE_CRC32),)
CPUFLAGS += CRC32
endif

CPPFLAGS += $(addprefix -DHAVE_,$(CPUFLAGS))

