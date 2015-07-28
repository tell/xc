include ../common.mk
include config.mk

LIBGMP_LDFLAGS += -avoid-version
LIBGMPXX_LDFLAGS += -avoid-version

ifeq (,$(findstring -avoid-version,$(LIBGMP_LDFLAGS)))
  $(error An option -avoid-version should be set in a variable LIBGMP_LDFLAGS)
endif
ifeq (,$(findstring -avoid-version,$(LIBGMPXX_LDFLAGS)))
  $(error An option -avoid-version should be set in a variable LIBGMPXX_LDFLAGS)
endif

export LIBGMP_LDFLAGS
export LIBGMPXX_LDFLAGS

MARKING_FILES = check_pre_req configured built

.PHONY: all clean install
all: check_pre_req built

clean:
	-$(MAKE) -C $(GMP_BUILD) clean
	-$(MAKE) -C $(GMP_BUILD) distclean
	-$(RM) $(GMP_BUILD) $(MARKING_FILES)

install:
	$(MAKE) -C $(GMP_BUILD) install

built: configured
	$(MAKE) -C $(GMP_BUILD) -j $(NUM_PARALLEL_BUILD)
	touch $@

configured:
	$(MKDIR) $(GMP_BUILD)
	cd $(GMP_BUILD) && $(GMP_DIR_PATH)/configure --prefix=$(GMP_PREFIX) --host=$(GMP_HOST) --enable-cxx
	touch $@

$(GMP_PREFIX):
	$(MKDIR) $@

check_pre_req: $(GMP_DIR_PATH)
	touch $@

$(GMP_DIR_PATH):
	$(MAKE) -C $(GMP_DIR_PREFIX)
